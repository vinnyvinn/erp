<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');
require_once("Pre_loader.php");

class Call_types extends Pre_loader {

    function __construct() {
        parent::__construct();
        $this->access_only_admin();
    }

    function index() {
        $this->template->rander("call_types/index");
    }
function model_comment(){
  validate_submitted_data(array(
      "id" => "numeric"
  ));

  $view_data['model_info'] = $this->Call_types_model->get_one($this->input->post('id'));
    $view_data['tk_id'] = $this->session->ticket_ID;
$this->load->view('call_types/comments_form',$view_data);
}

function add_comment()
  {
   $data=array('description' => $this->input->post('description'),
              'user_id' => $this->session->user_id);
   if($this->Call_types_model->insert_comment($data)){
     $saved = true;
   }

   echo json_encode(array("success" => true, 'message' => lang('record_saved')) );


  }
    function modal_form() {

        validate_submitted_data(array(
            "id" => "numeric"
        ));

        $view_data['model_info'] = $this->Call_types_model->get_one($this->input->post('id'));
        $this->load->view('call_types/modal_form', $view_data);
    }

    function save() {
        validate_submitted_data(array(
            "id" => "numeric",
            "title" => "required"
        ));

        $id = $this->input->post('id');
        $data = array(
            "title" => $this->input->post('title')
        );
        $save_id = $this->Call_types_model->save($data, $id);
        if ($save_id) {
            echo json_encode(array("success" => true, "data" => $this->_row_data($save_id), 'id' => $save_id, 'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    function delete() {
        validate_submitted_data(array(
            "id" => "required|numeric"
        ));

        $id = $this->input->post('id');
        if ($this->input->post('undo')) {
            if ($this->Call_types_model->delete($id, true)) {
                echo json_encode(array("success" => true, "data" => $this->_row_data($id), "message" => lang('record_undone')));
            } else {
                echo json_encode(array("success" => false, lang('error_occurred')));
            }
        } else {
            if ($this->Call_types_model->delete($id)) {
                echo json_encode(array("success" => true, 'message' => lang('record_deleted')));
            } else {
                echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
            }
        }
    }

    function list_data() {
        $list_data = $this->Call_types_model->get_details()->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_row($data);
        }
        echo json_encode(array("data" => $result));
    }

    private function _row_data($id) {
        $options = array("id" => $id);
        $data = $this->Call_types_model->get_details($options)->row();
        return $this->_make_row($data);
    }

    private function _make_row($data) {
        return array($data->title,
            modal_anchor(get_uri("call_types/modal_form"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => 'Edit call type', "data-post-id" => $data->id))
            . js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => 'Delete call type', "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("call_types/delete"), "data-action" => "delete"))
        );
    }

}

/* End of file call types.php */
/* Location: ./application/controllers call types.php */
