<?php

if (!defined('BASEPATH'))
	exit('No direct script access allowed');
require_once("Pre_loader.php");

class Petty_cash extends Pre_loader {

	public function __construct() {
		parent::__construct();
		$this->load->helper(array('form', 'url'));
	}

	function index() {
		$this->template->rander("petty_cash/index");
	}

	function list_data() {

        if ($this->login_user->is_admin) {
            $list_data = $this->Petty_cash_model->get_all_where(array("deleted" => 0))->result();
        } elseif (!$this->login_user->is_admin && $this->login_user->role_id == 1) {
            $list_data = $this->Petty_cash_model->get_all_where(array("user_id" => $this->login_user->id, "deleted" => 0))->result();
        }

        
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_row($data);
        }
        echo json_encode(array("data" => $result));
    }

    private function _make_row($data) {

        $title = modal_anchor(get_uri("petty_cash/view_modal"), ucwords($data->petty_cash), array("class" => "edit", "title" => "Petty Cash Details", "data-post-id" => $data->id));

        if ($data->status == "Pending") {
            $status = "<button type=\"button\" class=\"btn btn-info\"> $data->status </button>";
        } elseif ($data->status == "Approved") {
            $status = "<button type=\"button\" class=\"btn btn-success\"> $data->status </button>";
        } elseif ($data->status == "Disapproved") {
            $status = "<button type=\"button\" class=\"btn btn-danger\"> $data->status </button>";
        }

        if ($this->login_user->is_admin) {
            $optoins = NULL;
            $optoins .= anchor(get_uri("petty_cash/approve/" . $data->id), "<i class='fa fa-check'></i>");
            $optoins .= anchor(get_uri("petty_cash/disapprove/" . $data->id), "<i class='fa fa-trash'></i>");
        } elseif (!$this->login_user->is_admin && $this->login_user->role_id == 1) {
            $optoins = NULL;
        }

        return array($data->id, $title, number_format($data->amount,2), $data->sage_project, date("dS M Y",strtotime($data->created_at)), $status, $optoins);
    }

    public function view_modal() {

        $id = $this->input->post('id');

        $list_data = $this->Petty_cash_model->get_all_where(array("id" => $id, "deleted" => 0))->result();

        $user_data = $this->Users_model->get_all_where(array("id" => $list_data[0]->user_id, "deleted" => 0))->result();

        $view_data['user_name'] = $user_data[0]->first_name . " " . $user_data[0]->last_name;
        $view_data['description'] = $list_data[0]->description;

        $this->load->view('petty_cash/view_modal', $view_data);
    }

    public function approve($id = 0) {

        if (!$id) {
            return;
        }

        $data = ["status" => "Approved"];

        if($this->Petty_cash_model->update_where($data, array("id" => $id, "deleted" => 0))) {

            if (!$this->SAGE_DB()->get_where('_btblCbBatchLines', ["TK_ID" => $id])->result()) {
                $accQuery = $this->SAGE_DB()->get_where('Accounts', ["AccountLink" => get_setting('sage_petty_cash_account_id')])->result();

                $sage_data = array(
                    'iBatchesID' => get_setting('sage_petty_cash_batches_id'),
                    'dTxDate' => date('Y-m-d'),
                    'iModule' => 0,
                    'iAccountID' => get_setting('sage_petty_cash_account_id'),
                    'cDescription' => $this->Petty_cash_model->get_one($id)->description,        
                    'cReference' => $this->fields($accQuery)->Master_Sub_Account . " : " . $this->fields($accQuery)->Description,
                    'fCredit' => $this->Petty_cash_model->get_one($id)->amount,
                    'bReconcile' => 0,
                    'iProjectID' => $this->Petty_cash_model->get_one($id)->sage_project_id,
                    'bPostDated' => 0,
                    'TK_ID' => $id
                );

                // $sql = $this->SAGE_DB()->set($sage_data)->get_compiled_insert('_btblCbBatchLines');
                $this->SAGE_DB()->insert('_btblCbBatchLines', $sage_data);
            }

            
            $this->mail_status($id);
            // echo json_encode(array("success" => true, 'message' => lang('record_saved')));
            $this->template->rander("petty_cash/index");
        } else {
            // echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
            $this->template->rander("petty_cash/index");
        }
    }

    public function disapprove($id = 0) {

        if (!$id) {
            return;
        }

        $data = ["status" => "Disapproved"];

        if($this->Petty_cash_model->update_where($data, array("id" => $id, "deleted" => 0))) {

            if ($this->SAGE_DB()->get_where('_btblCbBatchLines', ["TK_ID" => $id])->result()) {
                $accQuery = $this->SAGE_DB()->get_where('Accounts', ["AccountLink" => get_setting('sage_petty_cash_account_id')])->result();

                $sage_data = array(
                    'TK_ID' => $id
                );

                $this->SAGE_DB()->delete('_btblCbBatchLines', $sage_data);
            }
            
            $this->mail_status($id);
            // echo json_encode(array("success" => true, 'message' => lang('record_saved')));
            $this->template->rander("petty_cash/index");
        } else {
            // echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
            $this->template->rander("petty_cash/index");
        }
    }

    public function mail_status($id) {

        $variables = $this->db->query("SELECT petty_cash.id, petty_cash_types.name_type, users.`status`, petty_cash.amount, petty_cash.description, users.first_name, users.last_name, users.email, petty_cash.created_at, petty_cash.status FROM petty_cash INNER JOIN users ON petty_cash.user_id = users.id INNER JOIN petty_cash_types ON petty_cash.type_id = petty_cash_types.id WHERE petty_cash.id = " . $id)->result();

        foreach ($variables as $key => $value) {
           $data = ["petty_cash_id" => $id, "petty_cash_name" => $value->name_type, "first_name" => $value->first_name, "last_name" => $value->last_name, "petty_cash_amount" => $value->amount,"petty_cash_date" => date("dS M Y",strtotime($value->created_at)), "petty_cash_status" => $value->status, "send_to" => $value->email];

           $this->_Mailler($data);
        }
    }


    public function _Mailler($data) {

        $email_template = $this->Email_templates_model->get_final_template("petty_cash");

        $parser_data["PETTY_CASH_ID"] = $data['petty_cash_id'];
        $parser_data["PETTY_CASH_NAME"] = $data["petty_cash_name"];
        $parser_data["CONTACT_FIRST_NAME"] = $data["first_name"];
        $parser_data["CONTACT_LAST_NAME"] = $data["last_name"];
        $parser_data["PETTY_CASH_AMOUNT"] = $data['petty_cash_amount'];
        $parser_data["PETTY_CASH_REQUEST_DATE"] = $data['petty_cash_date'];
        $parser_data["PETTY_CASH_STATUS"] = $data['petty_cash_status'];
        $parser_data["SIGNATURE"] = $email_template->signature;

        $message = $this->parser->parse_string($email_template->message, $parser_data, true);
        send_app_mail($data['send_to'], $email_template->subject, $message);
    }

    function Projects() {

        $query = $this->SAGE_DB()->get('Project');
        $row = $query->result();

        $data = array();
        foreach ($query->result() as $row) {
            $data[] = array(
               'ProjectLink' => $row->ProjectLink,
               'PROJECT' => $row->ProjectCode . " : " . $row->ProjectName
            );
        }
        return json_encode($data);
    }

    function modal_form() {

        $view_data['petty_cash_types_dropdown'] = $this->Petty_cash_type_model->get_all_where(array("deleted" => 0))->result();
        $view_data['projects_dropdown'] = json_decode($this->Projects());

        $this->load->view('petty_cash/modal_form', $view_data);
    }

    function modal_form_types() {

        //prepare assign to list
        $assign_to_dropdown = array("" => "-") + $this->Users_model
                ->get_dropdown_list(
                    ["first_name", "last_name"],
                    "id",
                    ['status' => 'active', "deleted" => 0, "user_type" => "staff",  "is_admin" => 1]
                );

        asort($assign_to_dropdown, SORT_STRING);

        $view_data['assign_to_dropdown'] = $assign_to_dropdown;

        $this->load->view('petty_cash/modal_form_types', $view_data);
    }

    function save() {

        $fields1 = new stdClass();
        foreach (($this->db->query("SELECT petty_cash_types.name_type FROM petty_cash_types WHERE petty_cash_types.id = " . $this->input->post('petty_cash_type'))->result()) as $value) {
        	$fields1 = $value;
        }

        $fields2 = new stdClass();
        foreach (($this->SAGE_DB()->query("SELECT (ProjectCode + ' : ' + ProjectName) AS Project FROM DEMO.dbo.Project WHERE Project.ProjectLink = " . $this->input->post('project'))->result()) as $value) {
        	$fields2 = $value;
        }

        $data = array(
        	"user_id" => $this->login_user->id,
            "type_id" => $this->input->post('petty_cash_type'),
            "petty_cash" => $fields1->name_type,
            "description" => $this->input->post('description'),
            "amount" => $this->input->post('cost_amount'),
            "sage_project_id" => $this->input->post('project'),
            "sage_project" => $fields2->Project,
            "created_at" => date('Y-m-d')
        );

        $save_id = $this->Petty_cash_model->save($data);

        if ($save_id) {
        	echo json_encode(array("success" => true, 'message' => lang('record_saved')));
        } else {
        	echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    public function save_petty_cash_type() {
        $data = array(
            "name_type" => $this->input->post('petty_cash_type'),
            "admin_id" => $this->input->post('assigned_to'),
            "created_at" => date('Y-m-d')
        );

        $save_id = $this->Petty_cash_type_model->save($data);

        if ($save_id) {
            echo json_encode(array("success" => true, 'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    /*public function view($petty_cash_id = 0) {
        if (! $petty_cash_id) {
            return;
        }

        $petty_cash_info = $this->Petty_cash_model->get_all_where(array("id" => $petty_cash_id, "deleted" => 0))->result();

        $view_data = [];
        for ($i=0; $i < count($petty_cash_info); $i++) { 
            $view_data["id"] = $petty_cash_info[$i]->id;
            $view_data["requested_by"] = $this->Users_model->get_one($petty_cash_info[$i]->user_id)->first_name . " " . $this->Users_model->get_one($petty_cash_info[$i]->user_id)->last_name;;
            $view_data["petty_cash_name"] = $this->Petty_cash_type_model->get_one($petty_cash_info[$i]->type_id)->name_type;
            $view_data["description"] = $petty_cash_info[$i]->description;
            $view_data["amount"] = $petty_cash_info[$i]->amount;
            $view_data["project"] = $petty_cash_info[$i]->project;
            $view_data["created_at"] = $petty_cash_info[$i]->created_at;
            $view_data["status"] = $petty_cash_info[$i]->status;
        }

        $obj = json_decode (json_encode ($view_data), FALSE);

        if ($obj->id) {
            $this->template->rander("petty_cash/view", $view_data);
        } else {
            show_404();
        }

    }*/

    public function SAGE_DB() {
    	return $this->load->database('SAGE', TRUE);
    }

    public function fields($object) {

        $return = new stdClass();

        foreach ($object as $value) {
            $return = $value;
        }

        return $return;
    }

}