<?php

if (!defined('BASEPATH'))
	exit('No direct script access allowed');
require_once("Pre_loader.php");

class Parcels extends Pre_loader {

	public function __construct() {
		parent::__construct();
		$this->load->helper(array('form', 'url'));
	}

	function index() {
		$this->template->rander("parcels/index");
	}

	function list_data() {

        if ($this->login_user->is_admin) {
            $list_data = $this->Mailing_parcel_model->get_all_where(array("deleted" => 0))->result();
        } elseif (!$this->login_user->is_admin && $this->login_user->role_id == 1) {
            $list_data = $this->Mailing_parcel_model->get_all_where(array("user_id" => $this->login_user->id, "deleted" => 0))->result();
        }

        
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_row($data);
        }
        echo json_encode(array("data" => $result));
    }

    private function _make_row($data) {

        $title = modal_anchor(get_uri("parcels/view_modal"), ucwords($data->title), array("class" => "edit", "title" => "Mail / Parcel Details", "data-post-id" => $data->id));

        if ($data->status == 0) {
            $status = $this->login_user->is_admin ? "<button type=\"button\" class=\"btn btn-info\">Process</button>" : "<button type=\"button\" class=\"btn btn-info\">Processing</button>";
        } elseif ($data->status == 1) {
            $status = "<button type=\"button\" class=\"btn btn-success\">Processed</button>";
        } elseif ($data->status == 2) {
            $status = "<button type=\"button\" class=\"btn btn-danger\">Rejected</button>";
        }

        if ($this->login_user->is_admin) {
            $optoins = NULL;
            if ($data->status == 0) {
                $optoins .= anchor(get_uri("parcels/approve/" . $data->id), "<i class='fa fa-check'></i>");
                // $optoins .= modal_anchor(get_uri("parcels/modal_disapprove"), "<i class='fa fa-trash'></i>", array("class" => "edit", "title" => "Reject", "data-post-id" => $data->id));
                $optoins .= anchor(get_uri("parcels/disapprove/" . $data->id), "<i class='fa fa-trash'></i>");
            }
        } elseif (!$this->login_user->is_admin && $this->login_user->role_id == 1) {
            $optoins = NULL;
        }

        $activity = ucwords($this->Mailing_activity_model->get_one($data->activity_id)->title);

        if ($this->login_user->is_admin) {
            $receiver = $data->receiver_id ? ucwords($this->Mailing_list_model->get_one($data->receiver_id)->title) : "NOT SET";
        } elseif (!$this->login_user->is_admin && $this->login_user->role_id == 1) {
            $receiver = $data->receiver_id ? ucwords($this->Mailing_list_model->get_one_where(array("receiver_id" => $data->receiver_id, "created_by" => $this->login_user->id))->title) : "NOT SET";
        }

        return array($data->id, $title, $activity, $receiver, date("dS M Y",strtotime($data->created_at)), $status, $optoins);
    }

    public function approve($id = 0) {

        if (!$id) {
            return;
        }

        $data = ["status" => 1];

        if($this->Mailing_parcel_model->update_where($data, array("id" => $id, "deleted" => 0))) {
            // echo json_encode(array("success" => true, 'message' => lang('record_updated')));
            redirect("parcels/index");
        } else {
            // echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
            redirect("parcels/index");
        }
    }

    public function disapprove($id = 0) {

        if (!$id) {
            return;
        }

        $data = ["status" => 2];

        if($this->Mailing_parcel_model->update_where($data, array("id" => $id, "deleted" => 0))) {
            // echo json_encode(array("success" => true, 'message' => lang('record_updated')));
            redirect("parcels/index");
        } else {
            // echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
            redirect("parcels/index");
        }
    }

    function parcels_mailing_list () {
    	// $this->load->view('parcels/parcels_mailing_list');
        $this->template->rander("parcels/parcels_mailing_list");
    }

    function mailing_list_data () {
    	if ($this->login_user->is_admin) {
            $list_data = $this->Mailing_list_model->get_all_where(array("deleted" => 0))->result();
        } elseif (!$this->login_user->is_admin && $this->login_user->role_id == 1) {
            $list_data = $this->Mailing_list_model->get_all_where(array("user_id" => $this->login_user->id, "deleted" => 0))->result();
        }

        
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_mailing_list_row($data);
        }
        echo json_encode(array("data" => $result));
    }

    private function _make_mailing_list_row($data) {

        $title = modal_anchor(get_uri("parcels/view_modal"), ucwords($data->title), array("class" => "edit", "title" => "Mailing List Details", "data-post-id" => $data->id));

        // if ($data->status == "Pending") {
        //     $status = "<button type=\"button\" class=\"btn btn-info\"> $data->status </button>";
        // } elseif ($data->status == "Approved") {
        //     $status = "<button type=\"button\" class=\"btn btn-success\"> $data->status </button>";
        // } elseif ($data->status == "Disapproved") {
        //     $status = "<button type=\"button\" class=\"btn btn-danger\"> $data->status </button>";
        // }

        if ($this->login_user->is_admin) {
            $optoins = NULL;
            // $optoins .= anchor(get_uri("parcels/parcels_mailing_list/approve/" . $data->id), "<i class='fa fa-check'></i>");
            // $optoins .= modal_anchor(get_uri("parcels/parcels_mailing_list/modal_disapprove"), "<i class='fa fa-trash'></i>", array("class" => "edit", "title" => "Reject", "data-post-id" => $data->id));
            $optoins .= anchor(get_uri("parcels/disapprove_parcels_mailing_list/" . $data->id), "<i class='fa fa-trash'></i>");
        } elseif (!$this->login_user->is_admin && $this->login_user->role_id == 1) {
            $optoins = NULL;
        }

        return array($data->id, $title, $data->address, date("dS M Y",strtotime($data->created_at)), $optoins);
    }

    function modal_form_mailing_list () {
    	$this->load->view('parcels/modal_form_mailing_list');
    }

    function save_mailing_list () {
        $data = array(
            "title" => $this->input->post('title'),
            "address" => $this->input->post('address')
        );

        $save_id = $this->Mailing_list_model->save($data);

        if ($save_id) {
            echo json_encode(array("success" => true, 'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    public function disapprove_parcels_mailing_list($id = 0) {

        if (!$id) {
            return;
        }

        $data = ["deleted" => 1];

        if($this->Mailing_list_model->update_where($data, array("id" => $id))) {
            // echo json_encode(array("success" => true, 'message' => lang('record_updated')));
            redirect("parcels/parcels_mailing_list");
        } else {
            // echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
            redirect("parcels/parcels_mailing_list");
        }
    }

    function modal_form_mailing_categories () {
    	$this->load->view('parcels/modal_form_mailing_categories');
    }

    function save_mailing_categories() {

        $data = array(
			"title" => $this->input->post('title'),
			"description" => $this->input->post('description')
        );

        $save_id = $this->Mailing_activity_model->save($data);

        if ($save_id) {
        	echo json_encode(array("success" => true, 'message' => lang('record_saved')));
        } else {
        	echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    function modal_form() {

        $view_data['parcels_types_dropdown'] = $this->Mailing_activity_model->get_all_where(array("deleted" => 0))->result();
        $view_data['receivers_dropdown'] = $this->Mailing_list_model->get_all_where(array("deleted" => 0))->result();

        $this->load->view('parcels/modal_form', $view_data);
    }

    function save() {

        $data = array(
            "activity_id" => $this->input->post('activity_id'),
			"user_id" => $this->input->post('user_id'),
			"receiver_id" => $this->input->post('receiver_id'),
			"title" => $this->input->post('title'),
			"description" => $this->input->post('description')
        );

        $save_id = $this->Mailing_parcel_model->save($data);

        if ($save_id) {
        	echo json_encode(array("success" => true, 'message' => lang('record_saved')));
        } else {
        	echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    function view_modal() {
    	$id = $this->input->post('id');
        $list_data = $this->Mailing_parcel_model->get_all_where(array("id" => $id, "deleted" => 0))->result();

        $view_data['title'] = $list_data[0]->title;
        $view_data['description'] = $list_data[0]->description;

        $this->load->view('parcels/view_modal', $view_data);
    }

}