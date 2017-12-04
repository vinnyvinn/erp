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

        $list_data = $this->Petty_cash_model->get_all_where(array("user_id" => $this->login_user->id, "deleted" => 0))->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $data;
        }
        echo json_encode(array("data" => $result));
    }

    function Projects() {
        
        $SADE_SQL = "SELECT ProjectLink, (ProjectCode + ' : ' + ProjectName) AS PROJECT FROM DEMO.dbo.Project";
        $stmt = $this->SAGE_DB()->query($SADE_SQL);

        $data = array();
        foreach ($stmt->result() as $row) {
        $data[] = array(
               'ProjectLink' => $row->ProjectLink,
               'PROJECT' => $row->PROJECT
            );
        }
        return json_encode($data);
    }

    function modal_form() {

        $view_data['petty_cash_types_dropdown'] = $this->Petty_cash_type_model->get_all_where(array("deleted" => 0))->result();
        $view_data['projects_dropdown'] = json_decode($this->Projects());

        $this->load->view('petty_cash/modal_form', $view_data);
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
            "project" => $fields2->Project,
            "created_at" => date('Y-m-d')
        );

        $save_id = $this->Petty_cash_model->save($data, $id);

        if ($save_id) {
        	echo json_encode(array("success" => true, 'message' => lang('record_saved')));
        } else {
        	echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    public function SAGE_DB() {
    	return $this->load->database('SAGE', TRUE);
    }

}