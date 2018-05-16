<?php

if (!defined('BASEPATH'))
	exit('No direct script access allowed');
require_once("Pre_loader.php");

class Cheques extends Pre_loader {

	public function __construct() {
		parent::__construct();
		$this->load->helper(array('form', 'url'));
	}

	function index() {
		// $this->template->rander("cheques/index");
        redirect("forbidden");
	}

    function outwards() {
        $this->template->rander("cheques/outwards");
    }

    function outwards_list_data() {

        if (!$this->login_user->is_admin && $this->login_user->role_id == 7) {
            $list_data = $this->Cheques_model->get_all_where(array("activity_id" => 4, "deleted" => 0))->result();
        } elseif (!$this->login_user->is_admin && $this->login_user->role_id == 2) {
            $list_data = $this->Cheques_model->get_all_where(array("activity_id" => 4, "sender_id" => $this->login_user->id, "deleted" => 0))->result();
        }

        
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->outwards_make_row($data);
        }
        echo json_encode(array("data" => $result));
    }

    private function outwards_make_row($data) {

        $title = modal_anchor(get_uri("cheques/view_modal"), ucwords($data->title), array("class" => "edit", "title" => "Cheque Details", "data-post-id" => $data->id));

        $cheque_amount = modal_anchor(get_uri("cheques/view_modal"), ucwords($data->cheque_amount), array("class" => "edit", "title" => "Cheque Details : " . $data->title, "data-post-id" => $data->id));

        if ($data->status == 0) {
            $status = $this->login_user->is_admin ? "<button type=\"button\" class=\"btn btn-info\">Processing</button>" : "<button type=\"button\" class=\"btn btn-info\">Process</button>";
        } elseif ($data->status == 1) {
            $status = "<button type=\"button\" class=\"btn btn-success\">Collected</button>";
        } elseif ($data->status == 2) {
            $status = "<button type=\"button\" class=\"btn btn-danger\">Rejected</button>";
        }

        $optoins = NULL;
        if (!$this->login_user->is_admin && $this->login_user->role_id == 2) {
            if ($data->status == 0) {
                $optoins .= anchor(get_uri("cheques/delete/" . $data->id), "<i class='fa fa-trash'></i>");
            }
        } elseif ($this->login_user->is_admin) {
            if ($data->status == 0) {
                $optoins .= anchor(get_uri("cheques/accept/" . $data->id), "<i class='fa fa-check'></i>");
                $optoins .= anchor(get_uri("cheques/reject/" . $data->id), "<i class='fa fa-trash'></i>");
            }
        }

        $activity = ucwords($this->Mailing_activity_model->get_one($data->activity_id)->title);

        $receiver = $data->receiver_id ? ucwords($this->Mailing_list_model->get_one($data->receiver_id)->title) : "NOT SET";

        $sender = ucwords($this->Users_model->get_one($data->sender_id)->first_name . " " . $this->Users_model->get_one($data->sender_id)->last_name);

        return array(
            $data->id,
            $title,
            $cheque_amount,
            // $activity,
            $sender,
            $receiver,
            date("dS M Y",strtotime($data->expiry_date)),
            $data->date_collected ? date("dS M Y",strtotime($data->date_collected)) : "Not Collected",
            $status,
            $optoins
        );
    }

    public function accept($id = 0) {

        if (!$id) {
            return;
        }

        $data = ["date_collected" => date('Y-m-d H:i:s'), "status" => 1];

        if($this->Cheques_model->update_where($data, array("id" => $id, "deleted" => 0))) {
            // echo json_encode(array("success" => true, 'message' => lang('record_updated')));
            redirect("cheques/outwards");
        } else {
            // echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
            redirect("cheques/outwards");
        }
    }

    public function reject($id = 0) {

        if (!$id) {
            return;
        }

        $data = ["status" => 2];

        if($this->Cheques_model->update_where($data, array("id" => $id, "deleted" => 0))) {
            // echo json_encode(array("success" => true, 'message' => lang('record_updated')));
            redirect("cheques/outwards");
        } else {
            // echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
            redirect("cheques/outwards");
        }
    }

    public function delete($id = 0) {

        if (!$id) {
            return;
        }

        $data = ["deleted" => 1];

        if($this->Cheques_model->update_where($data, array("id" => $id))) {
            // echo json_encode(array("success" => true, 'message' => lang('record_updated')));
            redirect("cheques/outwards");
        } else {
            // echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
            redirect("cheques/outwards");
        }
    }

    function modal_form_outwards() {

        $view_data['senders_dropdown'] = $this->Users_model->get_all_where(array("role_id" => 2, "deleted" => 0))->result();
        $view_data['receivers_dropdown'] = $this->Mailing_list_model->get_all_where(array("deleted" => 0))->result();

        $this->load->view('cheques/modal_form_outwards', $view_data);
    }

    function save() {

        $data = array(
            "activity_id" => $this->input->post('activity_id'),
			"user_id" => $this->login_user->id,
			"sender_id" => $this->input->post('sender_id'),
			"receiver_id" => $this->input->post('receiver_id'),
            "title" => $this->input->post('title'),
            "cheque_amount" => $this->input->post('cheque_amount'),
            "expiry_date" => $this->input->post('expiry_date'),
			"description" => $this->input->post('description')
        );

        $save_id = $this->Cheques_model->save($data);

        if ($save_id) {
        	echo json_encode(array("success" => true, 'message' => lang('record_saved')));
        } else {
        	echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    function view_modal() {
    	$id = $this->input->post('id');
        $list_data = $this->Cheques_model->get_all_where(array("id" => $id, "deleted" => 0))->result();

        $view_data['title'] = $list_data[0]->title;
        $view_data['description'] = $list_data[0]->description;

        $this->load->view('cheques/view_modal', $view_data);
    }

}