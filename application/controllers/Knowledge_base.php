<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');
require_once("Pre_loader.php");

class Knowledge_base extends Pre_loader
{

    function index()
    {
        $viewdata = [];
        $types = $this->TblKnowledgeBaseTypesModel->getall()->result();
        foreach ($types as $type) {
            $type->knowledges = $this->TblKnowledgeBaseModel->getTypeKNowledges($type->id)->result();
        }

        $viewdata['types'] = $types;
        $this->template->rander("knowledgebase/index2", $viewdata);
    }


    function search()
    {
        $term = $_GET['term'];
        /* if (!$term) {
             redirect('/knowledge_base', 'location');
         }*/
        $sql = "SELECT * FROM tbl_knowledge_base WHERE tbl_knowledge_base.solution LIKE '%$term%'";
        $viewdata = [];
        $viewdata['data'] = $this->db->query($sql)->result();
        $this->template->rander("knowledgebase/searchresult", $viewdata);

    }

    function indexi()
    {
        $viewdata = [];
        $viewdata['types'] = $this->TblKnowledgeBaseTypesModel->getall()->result();
        $this->template->rander("knowledgebase/index", $viewdata);
    }

    function viewknowledge($id)
    {
        $viewdata = [];
        $base = $this->TblKnowledgeBaseModel->get_knowledge_details($id)->row();
        $base->type = $this->TblKnowledgeBaseTypesModel->get_details($base->type_id)->row();
        $viewdata['viewdata'] = $base;

        $this->template->rander("knowledgebase/viewknowledge", $viewdata);
    }

    function list_data()
    {
        $list_data = $this->TblKnowledgeBaseModel->get_details()->result();
        $result = array();
        foreach ($list_data as $key => $data) {
            $key += 1;
            $result[] = $this->_make_row($data, $key);
        }

        echo json_encode(array("data" => $result));
    }

    private function _make_row($data, $key)
    {
        $options = "";

        $type = $this->TblKnowledgeBaseTypesModel->get_details($data->type_id)->row();

        $options .= modal_anchor(get_uri("knowledge_base/knowledge_base_modal_form"), "<i class='fa fa-pencil'></i>",
            array("class" => "edit", "title" => 'Update Knowledge base', "data-post-id" => $data->id));

        $options .= js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => 'Delete', "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("knowledge_base/delete"), "data-action" => "delete"));

        return array($key++,
            $data->title,
            ($type) ? ($type->name) : '-',
            $data->solution,
            $options

        );
    }


    function delete()
    {
        $id = $this->input->post('id');

        $deleted = false;
        if ($id) {
            $this->TblKnowledgeBaseModel->row_delete($id);
            $deleted = true;
        }
        echo json_encode(array("success" => $deleted, 'message' => (!$deleted) ? lang('record_cannot_be_deleted') : lang('record_deleted')));

    }

    function knowledge_base_modal_form()
    {
        //get data
        $id = $this->input->post('id');
        $viewdata = [];
        $viewdata['types'] = $this->TblKnowledgeBaseTypesModel->get_dropdown_list(array('name'));;
        $viewdata['model_info'] = $this->TblKnowledgeBaseModel->getOne($id);
        $this->load->view("knowledgebase/modal_form", $viewdata);

    }



    function save_form_data()
    {
        $datasaved = false;
        $id = $this->input->post('id');

        validate_submitted_data(array(
            "title" => "required",
            "type_id" => "required",
            "solution" => "required",

        ));
        $image_path = realpath(APPPATH . '../files/knowledgebase');
        $savedimage = "";
        if ($_FILES) {
            $path = $_FILES['imagefile']['name'];
            $ext = pathinfo($path, PATHINFO_EXTENSION);
            $imagename = time() . "." . pathinfo($path, PATHINFO_EXTENSION);
            move_uploaded_file(
                $_FILES['imagefile']['tmp_name'],
                $image_path . "/" . $imagename
            );

            $savedimage = $imagename;
        }

        $data = array(
            "title" => $this->input->post('title'),
            "type_id" => (int)$this->input->post('type_id'),
            "solution" => $this->input->post('solution'),
            "image" => $savedimage,
            'created_by' => $this->login_user->id,
            'created_at' => date('Y-m-d H:i:s')
        );


        if ($this->TblKnowledgeBaseModel->save($data, $id)) {
            $datasaved = true;
        }
        echo json_encode(array("success" => $datasaved, 'message' => lang('record_saved')));
    }

    function knowledge_base_types_modal_form()
    {
        $this->load->view("knowledgebase/types_modal_form");
    }

    function save_type()
    {
        $datasaved = false;
        $id = $this->input->post('id');

        validate_submitted_data(array(
            "name" => "required",

        ));

        $data = array(
            "name" => $this->input->post('name'),
        );


        if ($this->TblKnowledgeBaseTypesModel->save($data, $id)) {
            $datasaved = true;
        }
        echo json_encode(array("success" => $datasaved, 'message' => lang('record_saved')));
    }


}
