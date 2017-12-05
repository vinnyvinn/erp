<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 01/12/2017
 * Time: 02:10
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');
require_once("Pre_loader.php");

class Legal extends Pre_loader
{
    public function __construct() {
        parent::__construct();
        $this->load->helper(array('form', 'url','language'));
    }

    function documents() {
        $this->template->rander("legal/documents/index");
    }

    function form_modal(){
        $id = $this->input->post('id');
        $view_data['model_info']=$this->LegalDocumentsModel->get_one($id);
        $view_data['doc_types']=$this->LegalDocumentTypesModel->get_dropdown_list(array('name'));
        $view_data['all_docs_types']=$this->LegalDocumentTypesModel->getTypes()->result();
        $view_data['users']=$this->Users_model->get_dropdown_list(array('first_name','last_name'));
        $view_data['reminders']=$this->LegalReminders->get_dropdown_list(array('name'));

        $this->load->view('legal/documents/modal_form',$view_data);
    }

    //returns data table ajax result
    function list_data(){
        $status = (int)$this->input->post('status');
        $list_data = $this->LegalDocumentsModel->getDocuments($status);

        $result = [];
        foreach ($list_data as $key=>$data) {
            $result[] = $this->_make_row($data, $key);
        }
        echo json_encode(array("data" => $result));
    }

    //make table with action buttons
    private function _make_row($datas, $key=0) {
        $optoins = "";
        if ($this->can_edit_types()) {
            $optoins.=modal_anchor(get_uri("legal/form_modal"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => lang('edit_legal_document'), "data-post-id" => $datas->id));
        }

        $docname = anchor(get_uri("legal/view/" . $datas->id), $datas->name);

        $doctype = $this->LegalDocumentTypesModel->get_one($datas->document_type);
        $responsible = $this->Users_model->get_one($datas->user_responsible);

        if ($this->can_delete_types()) {
            $optoins.=js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete_project'), "class" => "delete", "data-id" => $datas->id,
                "data-action-url" => get_uri("legal/delete"), "data-action" => "delete"));
        }

        $doctype_can_expire = $doctype->has_expiry;

        return array(
           $key+1,
           // $docname,
            $datas->name,
            $doctype->name,
            ($datas->covered_from != 0 || $doctype_can_expire === '' )?date("Y-m-d",strtotime($datas->covered_from)):'N/A',
            ($datas->covered_to || $doctype_can_expire === '')?date("Y-m-d",strtotime($datas->covered_to)):'N/A',
            $responsible->first_name,
            $optoins
        );
    }

    function view($id){
        if (! $id) {
            return;
        }
        $model_info = $this->LegalDocumentsModel->getOne($id);
        if ($model_info) {
            $view_data['model_info'] = $model_info;
            $this->template->rander("legal/documents/view", $view_data);
        } else {
            show_404();
        }

    }

    function save(){
        $datasaved = false;
        $id = $this->input->post('id');

        $target_path = get_setting("timeline_file_path");
        $files_data = move_files_from_temp_dir_to_permanent_dir($target_path, "legal");

        validate_submitted_data(array(
            "name" => "required",
            "document_type" => "required",
            "contact_personnel" => "required"
        ));

        $data = array(
            "name" => $this->input->post('name'),
            "document_type" => $this->input->post('document_type'),
            "user_responsible" => $this->input->post('contact_personnel'),
            "covered_from" => $this->input->post('covered_from'),
            "covered_to" => $this->input->post('covered_to'),
            "status"=>1, //active document
            "completed_escalations"=>0,
            "reminder_sent"=>0,
            "file_document" => $files_data
        );
        if($this->LegalDocumentsModel->save($data, $id)){
            $doctypeid = (int)$this->input->post('document_type');
            $doc = '';
            if($doctypeid){
                $doc = $this->LegalDocumentTypesModel->get_one($doctypeid)->name;
            }


            //save to an event
            $event = array(
                "title" => $this->input->post('name'),
                "description" => $doc,
                "start_date" => $this->input->post('covered_to'),
                "end_date" => $this->input->post('covered_to'),
                "location" => 'N/A',
                "color" => '#d43480',
                "created_by" => $this->login_user->id,
                "share_with" => $this->input->post('contact_personnel'),
            );
            $event = $this->Events_model->save($event, $id);

            $datasaved = true;

        }
        echo json_encode(array("success" => $datasaved, 'message' => lang('record_saved')));
    }

    function delete(){
        $id = $this->input->post('id');

        $deleted = false;
        if($id){
            $this->LegalDocumentsModel->row_delete($id);
                $deleted = true;
        }
        echo json_encode(array("success" => $deleted, 'message' => (!$deleted)?lang('record_cannot_be_deleted'):lang('record_deleted')));

    }

    //LAWSUITS
    function lawsuits(){
        $this->template->rander("legal/lawsuits/index");
    }


    //REMINDERS
    function reminders(){
        $this->template->rander("legal/reminders/index");
    }

    public function reminders_list_data() {

        $list_data = $this->LegalReminders->getReminders(0)->result();

        $result = [];
        foreach ($list_data as $key=>$data) {
            $result[] = $this->_make_reminders_row($data, $key);
        }

        echo json_encode(array("data" => $result));
    }

    private function _make_reminders_row($datas, $key=0) {
        $optoins = "";
        $optoins.=modal_anchor(get_uri("legal/reminders_modal_form"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => lang('edit_legal_document'), "data-post-id" => $datas->id));

       $optoins.=js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete_project'), "class" => "delete", "data-id" => $datas->id,
            "data-action-url" => get_uri("legal/delete_reminders"), "data-action" => "delete"));

        $doctype = $this->LegalDocumentTypesModel->get_one($datas->doc_type);
        $reminder_to =$this->Team_model->get_one($datas->doc_type);
        $duration_before =$this->TimeDurationModel->get_one($datas->duration_before);
        $reminder_every = $this->TimeDurationModel->get_one($datas->reminder_every);
        $reminder_for =  $this->TimeDurationModel->get_one($datas->reminder_for);

        return array(
            $key+1,
            $datas->name,
            $doctype->name,
            $reminder_to->title,
            $duration_before->name,
            $reminder_every->name,
            $reminder_for->name,
            $optoins
        );
    }

    public function reminders_modal_form() {
        $id = $this->input->post('id');
        $view_data['model_info']=$this->LegalReminders->get_one($id);
        $view_data['doc_types']=$this->LegalDocumentTypesModel->get_dropdown_list(array('name'));
        $view_data['teams']=$this->Team_model->get_dropdown_list(array('title'));
        $view_data['durations']=$this->TimeDurationModel->get_dropdown_list(array('name'));;

        $this->load->view('legal/reminders/modal_form', $view_data);
    }

    public function reminders_save() {
        $id = $this->input->post('id');
        validate_submitted_data(array(
            "doc_type" => "required",
            "reminder_to" => "required",
            "duration_before" => "required",
            "reminder_every" => "required",
            "reminder_for" => "required",
            "name" => "required",

        ));
        $data = array(
            "name" => $this->input->post('name'),
            "doc_type" => $this->input->post('doc_type'),
            "reminder_to" => $this->input->post('reminder_to'),
            "duration_before" => $this->input->post('duration_before'),
            "reminder_every" => $this->input->post('reminder_every'),
            "reminder_for" => $this->input->post('reminder_for'),

        );

        $save_id = $this->LegalReminders->save($data, $id);

        if ($save_id) {
            echo json_encode(array("success" => true, 'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    function delete_reminders(){
        $id = $this->input->post('id');

        $deleted = false;
        if($id){
            $this->LegalReminders->row_delete($id);
            $deleted = true;
        }
        echo json_encode(array("success" => $deleted, 'message' => (!$deleted)?lang('record_cannot_be_deleted'):lang('record_deleted')));

    }


    //LEGAL ESCALATION MATRIX

    function escalation_matrix(){
        $this->template->rander("legal/escalation-matrix/index");
    }

    public function escalation_matrix_list_data() {

        $list_data = $this->TblLegalEscalationMatrix->getMatrix();

        $result = [];
        foreach ($list_data as $key=>$data) {
            $result[] = $this->_make_esc_matrix_row($data, $key);
        }

        echo json_encode(array("data" => $result));
    }

    private function _make_esc_matrix_row($datas, $key=0) {
        $optoins = "";
        $optoins.=modal_anchor(get_uri("legal/escalation_matrix_modal_form"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => lang('edit_legal_document'), "data-post-id" => $datas->id));

        $optoins.=js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete_project'), "class" => "delete", "data-id" => $datas->id,
            "data-action-url" => get_uri("legal/delete_esc_matrix"), "data-action" => "delete"));

        return array(
            $key+1,
            $datas->name,
            $datas->duration,
            $optoins
        );
    }

    public function escalation_matrix_modal_form() {
        $id = $this->input->post('id');
        $view_data['model_info']=$this->TblLegalEscalationMatrix->get_one($id);


        $project_members = $this->Users_model->all_dropdown()->result();
        $collaborators_dropdown = array();
        foreach ($project_members as $member) {
            $collaborators_dropdown[] = array("id" => $member->user_id, "text" => $member->member_name);
        }
        $view_data['collaborators_dropdown'] = $collaborators_dropdown;

        $this->load->view('legal/escalation-matrix/modal_form', $view_data);
    }

    public function escalation_matrix_save() {
        $id = $this->input->post('id');

        $data = array(
            "name" => $this->input->post('name'),
            "users" => $this->input->post('users'),
            "duration" => $this->input->post('duration')
        );

        $save_id = $this->TblLegalEscalationMatrix->save($data, $id);

        if ($save_id) {
            echo json_encode(array("success" => true, 'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    function delete_esc_matrix(){
        $id = $this->input->post('id');

        $deleted = false;
        if($id){
            $this->TblLegalEscalationMatrix->row_delete($id);
            $deleted = true;
        }
        echo json_encode(array("success" => $deleted, 'message' => (!$deleted)?lang('record_cannot_be_deleted'):lang('record_deleted')));
    }


    //uploads
        public function upload_file ()
        {
            upload_file_to_temp();
        }

        /* check valid file for ticket */

        public function validate_file ()
        {
            return validate_post_file($this->input->post("file_name"));
        }


    //PERMISSIONS CHECKS
    function can_edit_types(){
        return true;
    }

    function can_delete_types(){
        return true;
    }


}