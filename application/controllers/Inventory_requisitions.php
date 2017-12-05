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

        if ($this->login_user->is_admin) {
            $list_data = $this->Inventory_requisitions_model->get_all_where(array("deleted" => 0))->result();
        } elseif (!$this->login_user->is_admin && $this->login_user->role_id == 1) {
            $list_data = $this->Inventory_requisitions_model->get_all_where(array("user_id" => $this->login_user->id, "deleted" => 0))->result();
        }

        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_row($data);
        }
        echo json_encode(array("data" => $result));
    }

    private function _make_row($data) {

        $title = modal_anchor(get_uri("inventory_requisitions/view_modal"), ucwords($data->item_name), array("class" => "edit", "title" => "Inventory requisitions Details", "data-post-id" => $data->id));

        if ($data->status == "Pending") {
            $status = "<button type=\"button\" class=\"btn btn-info\"> $data->status </button>";
        } elseif ($data->status == "Approved") {
            $status = "<button type=\"button\" class=\"btn btn-success\"> $data->status </button>";
        } elseif ($data->status == "Disapproved") {
            $status = "<button type=\"button\" class=\"btn btn-danger\"> $data->status </button>";
        }

        if ($this->login_user->is_admin) {
            $optoins = NULL;
            $optoins .= anchor(get_uri("inventory_requisitions/approve/" . $data->id), "<i class='fa fa-check'></i>");
            $optoins .= anchor(get_uri("inventory_requisitions/disapprove/" . $data->id), "<i class='fa fa-trash'></i>");
        } elseif (!$this->login_user->is_admin && $this->login_user->role_id == 1) {
            $optoins = NULL;
        }

        return array($data->id, $title, $data->item_quantity, number_format($data->item_cost,2), date("dS M Y",strtotime($data->created_at)), $status, $optoins);
    }

    public function view_modal() {

        $id = $this->input->post('id');

        $list_data = $this->Inventory_requisitions_model->get_all_where(array("id" => $id, "deleted" => 0))->result();
        $user_data = $this->Users_model->get_all_where(array("id" => $list_data[0]->user_id, "deleted" => 0))->result();

        $view_data['user_name'] = $user_data[0]->first_name . " " . $user_data[0]->last_name;
        $view_data['item_name'] = $list_data[0]->item_name;

        $this->load->view('inventory_requisitions/view_modal', $view_data);
    }

    public function approve($id = 0) {

        if (!$id) {
            return;
        }

        $data = ["status" => "Approved"];

        if($this->Inventory_requisitions_model->update_where($data, array("id" => $id, "deleted" => 0))) {

            $list_data = $this->Inventory_requisitions_model->get_all_where(array("id" => $id, "deleted" => 0))->result();

            if (!$this->SAGE_DB()->get_where('_etblInvJrBatchLines', ["iStockID" => $list_data[0]->item_id])->result()) {
                // send to sage
                $sage_data = [
                    'iInvJrBatchID' => get_setting('sage_IDInvJrBatches'),
                    'iStockID' => $list_data[0]->item_id,
                    'iWarehouseID' => get_setting('sage_WarehouseID'),
                    'dTrDate' => date('Y-m-d'),
                    'iTrCodeID' => get_setting('sage_TrCode'),
                    'fQtyOut' => $list_data[0]->item_cost,
                    'iProjectID' => get_setting('sage_Inventory_Project')
                ];

                $this->SAGE_DB()->insert('_etblInvJrBatchLines', $sage_data);

                $this->Send_mail_model->htmlmail("wagura465@gmail.com", "petty cash",  array('userName'=> 'Maurice Wagura'));
            }
            // echo json_encode(array("success" => true, 'message' => lang('record_saved')));
            // $this->template->rander("inventory_requisitions/index");
        } else {
            echo "failed";
        }
    }

    public function disapprove($id = 0) {

        if (!$id) {
            return;
        }

        $data = ["status" => "Disapproved"];

        if($this->Inventory_requisitions_model->update_where($data, array("id" => $id, "deleted" => 0))) {

            $list_data = $this->Inventory_requisitions_model->get_all_where(array("id" => $id, "deleted" => 0))->result();

            if ($this->SAGE_DB()->get_where('_etblInvJrBatchLines', ["iStockID" => $list_data[0]->item_id])->result()) {

                $sage_data = array(
                    'iStockID' => $list_data[0]->item_id
                );

                $this->SAGE_DB()->delete('_etblInvJrBatchLines', $sage_data);
            }

            // echo json_encode(array("success" => true, 'message' => lang('record_saved')));
            $this->template->rander("inventory_requisitions/index");
        } else {
            // echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
            $this->template->rander("inventory_requisitions/index");
        }
    }

    function Stocks() {

        $query = $this->SAGE_DB()->get('StkItem');
        $row = $query->result();

        $data = array();
        foreach ($query->result() as $row) {
            $data[] = array(
               'StockLink' => $row->StockLink,
               'StockItem' => $row->Code . " : " . $row->Description_1
            );
        }
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

        $save_id = $this->Inventory_requisitions_model->save($data);

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