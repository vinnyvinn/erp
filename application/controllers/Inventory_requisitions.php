<?php

if (!defined('BASEPATH'))
	exit('No direct script access allowed');
require_once("Pre_loader.php");

class Inventory_requisitions extends Pre_loader {

	public function __construct() {
		parent::__construct();
		$this->load->helper(array('form', 'url'));
	}

	function index() {
		$this->template->rander("inventory_requisitions/index");
	}

	function list_data() {

        $list_data = $this->Inventory_requisitions_model->get_all_where(array("user_id" => $this->login_user->id, "deleted" => 0))->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $data;
        }
        echo json_encode(array("data" => $result));
    }

    function Stocks() {
        
        $SADE_SQL = "SELECT StockLink, (Code + ' : ' + StkItem.Description_1) AS StockItem FROM DEMO.dbo.StkItem";
        $stmt   = $this->SAGE_DB()->query($SADE_SQL);

        $data = [];
        foreach ($stmt->result() as $row) {
        $data[] = array(
               'StockLink' => $row->StockLink,
               'StockItem' => $row->StockItem
            );
        }
        //save data mysql data in json encode format     
        // echo $data['data'] = json_encode($data);
        return json_encode($data);
    }

    function modal_form() {

        $view_data['stocks_dropdown'] = json_decode($this->Stocks());

        $this->load->view('inventory_requisitions/modal_form', $view_data);
    }

    function save() {

        // $query = $this->SAGE_DB()->query("SELECT StockLink, Description_1, AveUCst FROM DEMO.dbo.StkItem WHERE StockLink = " . $this->input->post('item'))->result();

        $fields = new stdClass();
        foreach (($this->SAGE_DB()->query("SELECT StockLink, Description_1, AveUCst FROM DEMO.dbo.StkItem WHERE StockLink = " . $this->input->post('item'))->result()) as $value) {
        	$fields = $value;
        }

        $data = array(
        	"user_id" => $this->login_user->id,
            "item_id" => $this->input->post('item'),
            "item_name" => $fields->Description_1,
            "item_quantity" => $this->input->post('quantity'),
            "item_cost" => $fields->AveUCst * $this->input->post('quantity'),
            "created_at" => date('Y-m-d')
        );

        $save_id = $this->Inventory_requisitions_model->save($data, $id);

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