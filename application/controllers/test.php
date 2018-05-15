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
        $view_data['procedures'] = $this->LegalDocumentTypesModel->get_dropdown_list(array('name'));
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
        if ($this->can_edit_types()) {
            $optoins .= modal_anchor(get_uri("legal/form_modal"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => lang('edit_legal_document'), "data-post-id" => $datas->id));
        }

        $case_type = $this->LegalCaseTypesModel->get_one($datas->case_type);
        $procedure = $this->LegalProceduresModel->get_one($datas->procedure);

        if ($this->can_delete_types()) {
            $optoins .= js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete_project'), "class" => "delete", "data-id" => $datas->id,
                "data-action-url" => get_uri("legal/delete"), "data-action" => "delete"));
        }

        return array(
            (int)$key + 1,
            $datas->name,
            $datas->description,
            ($datas->status === 1)? 'Active': 'Closed',
            $procedure->name,
            $case_type->name,
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
        ));

        $data = array(
            "name" => "required",
            "description" => "required",
            "case_type" => "required",
        );
        if ($this->LegalDocumentsModel->save($data, $id)) {
            $doctypeid = (int)$this->input->post('document_type');
            $doc = '';
            if ($doctypeid) {
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