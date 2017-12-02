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
        $view_data['users']=$this->Users_model->get_dropdown_list(array('first_name','last_name'));

        $this->load->view('legal/documents/modal_form',$view_data);
    }

    //returns data table ajax result
    function list_data(){
        $list_data = $this->LegalDocumentsModel->getDocuments();

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


        $doctype = $this->LegalDocumentTypesModel->get_one($datas->document_type);
        $responsible = $this->Users_model->get_one($datas->user_responsible);

        if ($this->can_delete_types()) {
            $optoins.=js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete_project'), "class" => "delete", "data-id" => $datas->id,
                "data-action-url" => get_uri("legal/delete"), "data-action" => "delete"));
        }

        return array(
           $key+1,
            $datas->name,
            $doctype->name,
            date("Y-m-d",strtotime($datas->covered_from)),
            date("Y-m-d",strtotime($datas->covered_to)),
            $responsible->first_name,
            $optoins
        );
    }

    function save(){
        $datasaved = false;
        $id = $this->input->post('id');

        validate_submitted_data(array(
            "name" => "required",
            "document_type" => "required",
            "contact_personnel" => "required",
            "covered_from" => "required",
            "covered_to" => "required",
        ));

        $data = array(
            "name" => $this->input->post('name'),
            "document_type" => $this->input->post('document_type'),
            "user_responsible" => $this->input->post('contact_personnel'),
            "covered_from" => $this->input->post('covered_from'),
            "covered_to" => $this->input->post('covered_to'),
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
                "start_date" => $this->input->post('covered_from'),
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



    //PERMISSIONS CHECKS
    function can_edit_types(){
        return true;
    }

    function can_delete_types(){
        return true;
    }


}