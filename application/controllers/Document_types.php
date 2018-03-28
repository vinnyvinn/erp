<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 01/12/2017
 * Time: 12:27
 */

if (!defined('BASEPATH'))
    exit('No direct script access allowed');
require_once("Pre_loader.php");

class Document_types extends Pre_loader
{
    public function __construct() {
        parent::__construct();
        $this->load->helper(array('form', 'url'));
    }

    function index(){
        $this->template->rander("legal/document_types/index");
    }

    //load document types modal
    function modal_form() {
        $document_type_id = $this->input->post('id');
        $view_data['model_info'] = $this->LegalDocumentTypesModel->get_one($document_type_id);


        $this->load->view('legal/document_types/modal_form',$view_data);
    }

    //saves a document type
    function save(){
        $datasaved = false;
        $id = $this->input->post('id');
        validate_submitted_data(array(
            "name" => "required",
            'can_upload'=>'required',
            'has_expiry'=>'required'
        ));
        $data = array(
            "name" => $this->input->post('name'),
            "can_upload" => $this->input->post('can_upload'),
            "has_expiry" => $this->input->post('has_expiry'),
        );
        if($this->LegalDocumentTypesModel->save($data, $id)){
            $datasaved = true;

        }
        echo json_encode(array("success" => $datasaved, 'message' => lang('record_saved')));
    }


    //returns data table ajax result
    function list_data(){
        $list_data = $this->LegalDocumentTypesModel->getTypes()->result();
        $result = [];
        foreach ($list_data as $key=>$data) {
            $result[] = $this->_make_row($data,$key);
        }
        echo json_encode(array("data" => $result));
     }

     //delete a document type
     function delete(){
         $id = $this->input->post('id');
         $deleted = false;
         if($id){
             if($this->LegalDocumentTypesModel->row_delete($id)){
                 $deleted = true;
             }
         }
         echo json_encode(array("success" => $deleted, 'message' => (!$deleted)?lang('record_cannot_be_deleted'):lang('record_deleted')));
     }


     //make table with action buttons
    private function _make_row($data,$key) {
        $optoins = "";
        if ($this->can_edit_types()) {
            $optoins.=modal_anchor(get_uri("document_types/modal_form"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => lang('edit_project'), "data-post-id" => $data->id));
        }

        if ($this->can_delete_types()) {
            $optoins.=js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete_project'), "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("document_types/delete"), "data-action" => "delete"));
        }

        return array(
            $key+1,
            $data->name,
            $optoins
        );
    }


    //PERMISSIONS CHECKS
    function can_edit_types(){
        return true;
    }

    function can_delete_types(){
        return true;
    }


}
//load document types index
