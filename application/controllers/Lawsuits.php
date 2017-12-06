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

class Lawsuits extends Pre_loader
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper(array('form', 'url', 'language'));
    }

    function index()
    {
        $this->template->rander("legal/lawsuits/index");
    }

    function form_modal2()
    {
        $id = $this->input->post('id');
        $view_data['model_info'] = $this->LegalDocumentsModel->get_one($id);
        $view_data['types'] = $this->LegalDocumentTypesModel->get_dropdown_list(array('name'));
        $view_data['procedures'] = $this->LegalProceduresModel->get_dropdown_list(array('name'));
        $view_data['case_types'] = $this->LegalCaseTypesModel->getAll();
        $view_data['users']=$this->Users_model->get_dropdown_list(array('first_name','last_name'));

        $this->load->view('legal/lawsuits/form_modal', $view_data);
    }

    //returns data table ajax result
    function list_data()
    {
        $list_data = $this->LegalCasesModel->getCases(0);

        $result = [];
        foreach ($list_data as $key => $data) {
            $result[] = $this->_make_row($data, $key);
        }
        echo json_encode(array("data" => $result));
    }

    //make table with action buttons
    private function _make_row($datas, $key)
    {
        $optoins = "";

        $case_type = $this->LegalCaseTypesModel->get_one($datas->case_type);
        $procedure = $this->LegalProceduresModel->get_one($datas->case_procedure);

        $name = anchor(get_uri("lawsuits/view/" . $datas->id), $datas->name);


        if ($this->can_delete_types()) {
            $optoins .= js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete_project'), "class" => "delete", "data-id" => $datas->id,
                "data-action-url" => get_uri("legal/delete"), "data-action" => "delete"));
        }

        return array(
            (int)$key + 1,
            $name,
            (empty($case_type->name))?'Not-Set':$case_type->name,
            implode(' ', array_slice(explode(' ',  $datas->description), 0, 100))."...",

            ((int)$datas->status == 0)? 'Active': 'Closed',
            $procedure->name,
            $optoins
        );
    }

    function save()
    {
       $datasaved = false;
        $id = $this->input->post('id');

        validate_submitted_data(array(
            "name" => "required",
            "description" => "required",
            "case_type" => "required",
            "procedure" => "required",
            "procedure_date" => "required",
            "assigned" => "required",
        ));

        $casedetails = array(
            "name" => $this->input->post('name'),
            "description" =>$this->input->post('description'),
            "case_type" => $this->input->post('case_type'),
            "status" => 0,//$this->input->post('case_type'),
        );

        $saved_id = $this->LegalCasesModel->save($casedetails, $id);
        if ($saved_id) {
            //create a case procedure

            $data2 = array(
                "legal_case" => $saved_id,
                "date" => $this->input->post('procedure_date'),
                "assigned" => $this->input->post('assigned'),

            );
            $assigned_user = $this->Users_model->get_details(["id"=>$this->input->post('assigned')])->row();

            $saved_proceed_id = $this->LegalCasesProceduresModel->save($data2);

            if($saved_proceed_id){
                //update case details
                $newcasedetails = array(
                    "case_procedure" =>$saved_proceed_id,
                );
                $this->LegalCasesModel->save($newcasedetails, $saved_id);
                  //send notification
               $data=array();
               $data["casename"]= $this->input->post('name');
               $data["username"]= $assigned_user->first_name;
               $data["date"]= $this->input->post('procedure_date');
               $this->sendLegalEmail($assigned_user->email,'Prokazi Cases',$data);
               $datasaved = true;
            }
        }
        echo json_encode(array("success" => $datasaved, 'message' => lang('record_saved')));
    }

    function sendLegalEmail($to, $subject, $data){
        $this->SendLegalMails->case_email($to, $subject,$data);
    }

    function delete()
    {
        $id = $this->input->post('id');

        $deleted = false;
        if ($id) {
            $this->LegalDocumentsModel->row_delete($id);
            $deleted = true;
        }
        echo json_encode(array("success" => $deleted, 'message' => (!$deleted) ? lang('record_cannot_be_deleted') : lang('record_deleted')));

    }

    function view($id){
        $viewdata["casedetails"]  = $this->LegalCasesModel->getCaseDetails($id);


        $this->template->rander("legal/lawsuits/view", $viewdata);
    }

    function add_procedures($id){
        $viewdata["case_details"]  = $this->LegalCasesModel->getCaseDetails($id);
        $viewdata['procedures'] = $this->LegalProceduresModel->get_dropdown_list(array('name'));
        $viewdata['case_types'] = $this->LegalCaseTypesModel->getAll();
        $viewdata['users']=$this->Users_model->get_dropdown_list(array('first_name','last_name'));

        $this->load->view("legal/lawsuits/modal_add_procedures", $viewdata);
    }

    function save_extra_procedures(){
        $id = $this->input->post('id');
        validate_submitted_data(array(
            "procedures" => "required",
            "assigned" => "required",
            "procedure_date" => "required",
        ));

        $sql = "INSERT INTO tbl_legal_case_procedures (legal_case, date, 	assigned,	procedure_val)
                VALUES ('".$this->input->post('id')."', '".$this->input->post('procedure_date')."', '".$this->input->post('assigned')."',
                '".(int)$this->input->post('procedures')."');";
        $done = $this->db->query($sql);

        if ($done) {
            $saved = true;
        }
        echo json_encode(array("success" => $saved, 'message' => (!$saved) ? lang('record_cannot_be_deleted') : lang('record_deleted')));
    }

    function delete_case_procedure($id){
        $procedure = $this->LegalCasesProceduresModel->getSingleCasesProcedures($id);
        $deleted= false;
        if($id){
            //delete the procedure
            $this->LegalCasesProceduresModel->row_delete($id);
            $deleted=true;
        }



        echo json_encode(array("success" => $deleted, 'message' => (!$deleted) ? lang('record_cannot_be_deleted') : lang('record_deleted')));

    }

    function back_to_cases(){
        redirect('/lawsuits');
    }





    function procedure_list_data_for_case($case){
        $list_data = $this->LegalCasesProceduresModel->getCasesProcedures($case);

        $result = [];
        foreach ($list_data as $key => $data) {
            $result[] = $this->_make_procedure_row_data_for_case($data, $key);
        }
        echo json_encode(array("data" => $result));
    }

    private function _make_procedure_row_data_for_case($datas, $key)
    {
        $optoins = "";

        $assigned_user = $this->Users_model->get_details(["id"=>$datas->assigned])->row();
        $procedure = $this->LegalProceduresModel->getProcedure($datas->procedure_val);

        if ($this->can_delete_types()) {
            $optoins .= js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete_project'), "class" => "delete", "data-id" => $datas->id,
                "data-action-url" => get_uri("lawsuits/delete_case_procedure/".$datas->id), "data-action" => "delete"));
        }

        return array(
            (int)$key + 1,
            $assigned_user->first_name." ".$assigned_user->last_name,
            $procedure->name,
            $datas->date,
            $optoins
        );
    }



    function close_case_modal($id){
        $viewdata["case_details"]  = $this->LegalCasesModel->getCaseDetails($id);
        $this->load->view("legal/lawsuits/close_case_modal", $viewdata);

    }

    function close_case_save(){
        $id = $this->input->post('id');
        validate_submitted_data(array(
            "comment" => "required",
        ));
        $closed = false;
        $casedetails = $this->LegalCasesModel->getCaseDetails($id);
        if($casedetails){
            $data = array(
                "comment" => $this->input->post('comment'),
                'status'=>1
            );
            if ($this->LegalCasesModel->save($data, $id)) {
                $saved = true;
            }

        }

        echo json_encode(array("success" => $saved, 'message' => (!$saved) ? "Case could not be closed" : "Case closed"));

    }

    //LAWSUITS
    function lawsuits()
    {
        $this->template->rander("legal/lawsuits/index");
    }

    //PROCEDURES
    function procedures()
    {
        $id = $this->input->post('id');
        $view_data['model_info'] = $this->LegalProceduresModel->get_one($id);
        $this->template->rander("legal/lawsuits/procedures", $view_data);
    }


    function procedure_modal()
    {
        $id = $this->input->post('id');
        $view_data['model_info'] = $this->LegalProceduresModel->get_one($id);
        $this->load->view("legal/lawsuits/procedures_modal", $view_data);
    }



    function procedure_list_data()
    {
        $active = $this->LegalProceduresModel->getProcedures(0)->result();

        $result = [];
        $numItems = count($active);
        $i = 0;
        foreach ($active as $key => $data) {
            $i++;

            $result[] = $this->_make_procedure_row($data, $key, ($key == 0 || ($i === $numItems)) ? true : false);

        }
        echo json_encode(array("data" => $result));

    }

    function save_procedure()
    {
        $id = $this->input->post('id');

        validate_submitted_data(array(
            "name" => "required",
        ));
        $data = array(
            "name" => $this->input->post('name'),
        );
        $saved = false;
        if ($this->LegalProceduresModel->save($data, $id)) {
            $saved = true;
        }
        echo json_encode(array("success" => $saved, 'message' => (!$saved) ? lang('record_cannot_be_deleted') : lang('record_deleted')));

    }

    function deleteprocedure()
    {
        $id = $this->input->post('id');

        $deleted = false;
        if ($id) {
            $this->LegalProceduresModel->row_delete($id);
            $deleted = true;
        }
        echo json_encode(array("success" => $deleted, 'message' => (!$deleted) ? lang('record_cannot_be_deleted') : lang('record_deleted')));

    }


    private function _make_procedure_row($datas, $key, $disabledelete = false)
    {
        $optoins = "";
        if ($this->can_edit_types()) {
            $optoins .= modal_anchor(get_uri("lawsuits/procedure_modal"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => lang('edit_legal_document'), "data-post-id" => $datas->id));
        }

        if ($this->can_delete_types() && !$disabledelete) {
            $optoins .= js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete_procedure'), "class" => "delete", "data-id" => $datas->id,
                "data-action-url" => get_uri("lawsuits/deleteprocedure"), "data-action" => "delete"));
        }

        return array(
            (int)$key + 1,
            $datas->name,
            $optoins
        );
    }


    //TYPES
    function types()
    {
        $id = $this->input->post('id');
        $view_data['model_info'] = $this->LegalTypesModel->get_one($id);
        $this->template->rander("legal/types/index", $view_data);
    }

    function types_modal()
    {
        $id = $this->input->post('id');
        $view_data['model_info'] = $this->LegalTypesModel->get_one($id);
        $this->load->view("legal/types/modal_form", $view_data);
    }

    function types_list_data()
    {
        $active = $this->LegalTypesModel->getType(0)->result();

        $result = [];
        $numItems = count($active);
        $i = 0;
        foreach ($active as $key => $data) {
            $i++;

            $result[] = $this->_make_procedure_row($data, $key, ($key == 0) ? true : false);

        }
        echo json_encode(array("data" => $result));

    }

    function save_type()
    {
        $id = $this->input->post('id');

        validate_submitted_data(array(
            "name" => "required",
        ));
        $data = array(
            "name" => $this->input->post('name'),
        );
        $saved = false;
        if ($this->LegalTypesModel->save($data, $id)) {
            $saved = true;
        }
        echo json_encode(array("success" => $saved, 'message' => (!$saved) ? lang('record_cannot_be_deleted') : lang('record_deleted')));

    }

    function delete_type()
    {
        $id = $this->input->post('id');

        $deleted = false;
        if ($id) {
            $this->LegalTypesModel->row_delete($id);
            $deleted = true;
        }
        echo json_encode(array("success" => $deleted, 'message' => (!$deleted) ? lang('record_cannot_be_deleted') : lang('record_deleted')));

    }


    private function _make_type_row($datas, $key, $disabledelete = false)
    {
        $optoins = "";
        if ($this->can_edit_types()) {
            $optoins .= modal_anchor(get_uri("lawsuits/procedure_modal"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => lang('edit_legal_document'), "data-post-id" => $datas->id));
        }

        if ($this->can_delete_types() && !$disabledelete) {
            $optoins .= js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete_procedure'), "class" => "delete", "data-id" => $datas->id,
                "data-action-url" => get_uri("lawsuits/deleteprocedure"), "data-action" => "delete"));
        }

        return array(
            (int)$key + 1,
            $datas->name,
            $optoins
        );
    }



    //PERMISSIONS CHECKS
    function can_edit_types()
    {
        return true;
    }

    function can_delete_types()
    {
        return true;
    }


}