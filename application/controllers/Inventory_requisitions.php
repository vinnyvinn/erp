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

        if ($this->login_user->is_admin && $this->login_user->role_id == 1) {
            $list_data = $this->Inventory_requisitions_model->get_all_where(array("deleted" => 0))->result();
        } elseif (!$this->login_user->is_admin && $this->login_user->role_id == 2) {
            $list_data = $this->Inventory_requisitions_model->get_all_where(array("user_id" => $this->login_user->id, "deleted" => 0))->result();
        }

        $result = [];
        foreach ($list_data as $data) {
            $data->available_quantity = $this->SAGE_DB()->where('StockLink', $list_data[0]->StkItem_id)->get('StkItem')->result()[0]->Qty_On_Hand - $this->SAGE_DB()->where('StockLink', $list_data[0]->StkItem_id)->get('StkItem')->result()[0]->ReservedQty;
            $data->unit_of_measure = $this->SAGE_DB()->where('idUnits', ($this->SAGE_DB()->where('StockLink', $list_data[0]->StkItem_id)->get('StkItem')->result()[0]->iUOMStockingUnitID))->get('_etblUnits')->result()[0]->cUnitCode;
            $data->status = $data->item_quantity <= $data->available_quantity ? $data->status : "Awaiting Stock";
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
        } elseif ($data->status == "Awaiting Stock") {
            $status = "<button type=\"button\" class=\"btn btn-warning\"> $data->status </button>";
        }

        if ($this->login_user->is_admin) {
            $optoins = NULL;

            if ($data->status == "Pending" || $data->status == "Awaiting Stock") {
                if ($data->item_quantity <= $data->available_quantity) {
                    $optoins .= anchor(get_uri("inventory_requisitions/approve/" . $data->id), "<i class='fa fa-check'></i>");
                    $optoins .= modal_anchor(get_uri("inventory_requisitions/modal_disapprove"), "<i class='fa fa-trash'></i>", array("class" => "edit", "title" => "Inventory Requisitions Disapproval", "data-post-id" => $data->id));
                }

                if ($this->login_user->is_admin) {
                    $quantities = modal_anchor(get_uri("inventory_requisitions/modal_edit"), $data->item_quantity . " / " . $data->available_quantity . " " . $data->unit_of_measure, array("class" => "edit", "title" => "Edit Inventory Requisition", "data-post-id" => $data->id));
                } elseif (!$this->login_user->is_admin && $this->login_user->role_id == 2) {
                    $quantities = modal_anchor(get_uri("inventory_requisitions/modal_edit"), $data->item_quantity . " " . $data->unit_of_measure, array("class" => "edit", "title" => "Edit Inventory Requisition", "data-post-id" => $data->id));
                }
            } else {
                 $optoins .= NULL;
                 if ($this->login_user->is_admin) {
                    $quantities = $data->item_quantity . " / " . $data->available_quantity . " " . $data->unit_of_measure;
                } elseif (!$this->login_user->is_admin && $this->login_user->role_id == 2) {
                    $quantities = $data->item_quantity . " " . $data->unit_of_measure;
                }
            }
        } elseif (!$this->login_user->is_admin && $this->login_user->role_id == 2) {
            $optoins = NULL;
            if ($data->status == "Pending" || $data->status == "Awaiting Stock") {
                if ($data->item_quantity <= $data->available_quantity) {
                    $optoins .= anchor(get_uri("inventory_requisitions/approve/" . $data->id), "<i class='fa fa-check'></i>");
                    $optoins .= modal_anchor(get_uri("inventory_requisitions/modal_disapprove"), "<i class='fa fa-trash'></i>", array("class" => "edit", "title" => "Inventory Requisitions Disapproval", "data-post-id" => $data->id));
                }

                if ($this->login_user->is_admin) {
                    $quantities = modal_anchor(get_uri("inventory_requisitions/modal_edit"), $data->item_quantity . " / " . $data->available_quantity . " " . $data->unit_of_measure, array("class" => "edit", "title" => "Edit Inventory Requisition", "data-post-id" => $data->id));
                } elseif (!$this->login_user->is_admin && $this->login_user->role_id == 2) {
                    $quantities = modal_anchor(get_uri("inventory_requisitions/modal_edit"), $data->item_quantity . " " . $data->unit_of_measure, array("class" => "edit", "title" => "Edit Inventory Requisition", "data-post-id" => $data->id));
                }
            } else {
                 $optoins .= NULL;
                 if ($this->login_user->is_admin) {
                    $quantities = $data->item_quantity . " / " . $data->available_quantity . " " . $data->unit_of_measure;
                } elseif (!$this->login_user->is_admin && $this->login_user->role_id == 2) {
                    $quantities = $data->item_quantity . " " . $data->unit_of_measure;
                }
            }
        }

        // if ($this->login_user->is_admin) {
        //     $quantities = modal_anchor(get_uri("inventory_requisitions/modal_edit"), $data->item_quantity . " / " . $data->available_quantity . " " . $data->unit_of_measure, array("class" => "edit", "title" => "Edit Inventory Requisition", "data-post-id" => $data->id));
        // } elseif (!$this->login_user->is_admin && $this->login_user->role_id == 2) {
        //     $quantities = modal_anchor(get_uri("inventory_requisitions/modal_edit"), $data->item_quantity . " " . $data->unit_of_measure, array("class" => "edit", "title" => "Edit Inventory Requisition", "data-post-id" => $data->id));
        // }

        $sage_project = $this->SAGE_DB()->where('ProjectLink', $data->sage_project_id)->get('Project')->result()[0]->ProjectCode . " : " . $this->SAGE_DB()->where('ProjectLink', $data->sage_project_id)->get('Project')->result()[0]->ProjectName;

        return array($data->id, $title, $quantities, number_format(($data->item_quantity * $this->SAGE_DB()->where('StockLink', $data->item_id)->get('StkItem')->result()[0]->AveUCst), 2), $sage_project, date("dS M Y",strtotime($data->created_at)), $status, $optoins);
    }

    public function modal_edit() {
        $view_data['_id'] = $this->input->post('id');
        $this->load->view('inventory_requisitions/modal_edit', $view_data);
    }

    public function modal_disapprove() {

        $id = $this->input->post('id');

        $view_data['_id'] = $this->input->post('id');

        $this->load->view('inventory_requisitions/modal_disapprove', $view_data);
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

            // if (!$this->SAGE_DB()->get_where('_etblInvJrBatchLines', ["iStockID" => $list_data[0]->item_id])->result()) {
                // send to sage
                $_etblInvJrBatchLines = [
                    'iInvJrBatchID' => get_setting('sage_IDInvJrBatches'),
                    'iStockID' => $list_data[0]->item_id,
                    'iWarehouseID' => get_setting('sage_WarehouseID'),
                    'dTrDate' => date('Y-m-d'),
                    'iTrCodeID' => get_setting('sage_TrCode'),
                    'cReference' => "Issued Stock",
                    'cDescription' => $list_data[0]->description,
                    'fQtyOut' => $list_data[0]->item_quantity,
                    'fNewCost' => $this->SAGE_DB()->where('StockLink', $list_data[0]->item_id)->get('StkItem')->result()[0]->AveUCst,
                    'iProjectID' => $list_data[0]->sage_project_id
                ];

                $this->SAGE_DB()->insert('_etblInvJrBatchLines', $_etblInvJrBatchLines);
            // }

            // $this->SAGE_DB()->update_where(array("Qty_On_Hand" => $this->SAGE_DB()->where('StockLink', $list_data[0]->item_id)->get('StkItem')->result()[0]->Qty_On_Hand; - $list_data[0]->item_quantity), array("StockLink" => $list_data[0]->item_id));

            $this->stock_arithmetics($id); // do some arithmetics on the stock item requested here

            // echo json_encode(array("success" => true, 'message' => lang('record_saved')));
            $this->template->rander("inventory_requisitions/index");
        } else {
            // echo "failed";
            $this->template->rander("inventory_requisitions/index");
        }
    }

    public function disapprove() {

        $id = $this->input->post('_id');
        $_reason = "Because of : " . $this->input->post('disapproval_comment');

        $data = ["status" => "Disapproved"];

        if($this->Inventory_requisitions_model->update_where($data, array("id" => $id, "deleted" => 0))) {

            /*$list_data = $this->Inventory_requisitions_model->get_all_where(array("id" => $id, "deleted" => 0))->result();

            if ($this->SAGE_DB()->get_where('_etblInvJrBatchLines', ["iStockID" => $list_data[0]->item_id])->result()) {

                $sage_data = array(
                    'iStockID' => $list_data[0]->item_id
                );

                $this->SAGE_DB()->delete('_etblInvJrBatchLines', $sage_data);
            }*/

            $this->mail_status($id, $_reason);

            echo json_encode(array("success" => true, 'message' => lang('record_saved')));
            // $this->template->rander("inventory_requisitions/index");
        } else {
            // echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
            $this->template->rander("inventory_requisitions/index");
        }
    }

    public function mail_status($id, $_reason = NULL) {

        $list_data = $this->db->query("SELECT inventory_requisitions.id, inventory_requisitions.item_name, inventory_requisitions.item_quantity, inventory_requisitions.StkItem_id, users.first_name, users.last_name, users.email, inventory_requisitions.created_at, inventory_requisitions.`status` FROM inventory_requisitions INNER JOIN users ON inventory_requisitions.user_id = users.id WHERE inventory_requisitions.id = " . $id)->result();

        foreach ($list_data as $key => $value) {

            $requisitions_amount = $this->SAGE_DB()->where('StockLink', $list_data[0]->StkItem_id)->get('StkItem')->result()[0]->Qty_On_Hand;

            $data = ["requisitions_id" => $id, "requisitions_name" => $value->item_name, "first_name" => $value->first_name, "last_name" => $value->last_name, "requisitions_quantity" => $value->item_quantity, "requisitions_available" => $requisitions_amount, "requisitions_date" => date("dS M Y",strtotime($value->created_at)), "requisitions_status" => $value->status, "send_to" => $value->email, "_reason" => $_reason];

           $this->_Mailler($data);
        }
    }

    public function _Mailler($data) {

        $email_template = $this->Email_templates_model->get_final_template("inventory_requisitions");

        $parser_data["INVENTORY_REQUISITIONS_ID"] = $data['requisitions_id'];
        $parser_data["INVENTORY_REQUISITIONS_NAME"] = $data["requisitions_name"];
        $parser_data["CONTACT_FIRST_NAME"] = $data["first_name"];
        $parser_data["CONTACT_LAST_NAME"] = $data["last_name"];
        $parser_data["INVENTORY_REQUISITIONS_QUANTITY"] = $data['requisitions_quantity'];
        $parser_data["INVENTORY_REQUISITIONS_AVAILABLE"] = $data['requisitions_available'];
        $parser_data["INVENTORY_REQUISITIONS_REQUEST_DATE"] = $data['requisitions_date'];
        $parser_data["INVENTORY_REQUISITIONS_STATUS"] = $data['requisitions_status'];
        $parser_data["INVENTORY_REQUISITIONS_COMMENT"] = $data['_reason'];

        $parser_data["SIGNATURE"] = $email_template->signature;

        $message = $this->parser->parse_string($email_template->message, $parser_data, true);
        send_app_mail($data['send_to'], $email_template->subject, $message);
    }

    public function stock_arithmetics($id) {

        $list_data = $this->Inventory_requisitions_model->get_all_where(array("id" => $id, "deleted" => 0))->result();

            $current_stock = $this->SAGE_DB()->query("SELECT Qty_On_Hand FROM StkItem WHERE StockLink = {$list_data[0]->item_id}")->result()[0]->Qty_On_Hand;
            $to_deducte = $list_data[0]->item_quantity;

            //if current stock is less what the user requests
            if ($current_stock < $to_deducte) {
                // user will receive all thats available in stock
                $this->mail_status($id, "You Requested In Amount For {$to_deducte}, But Will Receive An Amount Of {$current_stock} Because Stocks Are Out");
                $this->update_stock($id, 0); // all stock will be depleted thus updated to zero items in stock
            } else {
                $this->mail_status($id); // user will receive exactly amount requested
                $this->update_stock($id, ($current_stock - $to_deducte)); // stock will be less what the user receives
            }
    }

    public function update_stock($id, $stock) {

        $list_data = $this->Inventory_requisitions_model->get_all_where(array("id" => $id, "deleted" => 0))->result();

        // $this->SAGE_DB()->query("UPDATE StkItem SET Qty_On_Hand = abs((SELECT Qty_On_Hand FROM StkItem WHERE StockLink = {$list_data[0]->item_id}) -  {$list_data[0]->item_quantity}) WHERE StockLink = {$list_data[0]->item_id}");

        $this->SAGE_DB()->query("UPDATE StkItem SET Qty_On_Hand = $stock WHERE StockLink = {$list_data[0]->item_id}");
    }

    function Stocks() {

        $query = $this->SAGE_DB()->get('StkItem');

        $data = array();
        foreach ($query->result() as $row) {
            $data[] = array(
               'StockLink' => $row->StockLink,
               'StockItem' => $row->Code . " : " . $row->Description_1,
               'QuantityAvailable' => $row->Qty_On_Hand,
               'unit_of_measure' => $this->SAGE_DB()->where('idUnits', ($row->iUOMStockingUnitID))->get('_etblUnits')->result()[0]->cUnitCode,
            );
        }
        return json_encode($data);
    }

    function modal_form() {

        $view_data['stocks_dropdown'] = json_decode($this->Stocks());
        $view_data['projects_dropdown'] = $this->SAGE_DB()->get('Project')->result();
        $this->load->view('inventory_requisitions/modal_form', $view_data);
    }

    function save() {

        $id = $this->input->post('_id');
        $item_id = $this->input->post('item') ? $this->input->post('item') : $this->Inventory_requisitions_model->get_one($id)->item_id;
        $fields = new stdClass();
        foreach (($this->SAGE_DB()->query("SELECT StockLink, Description_1, AveUCst FROM StkItem WHERE StockLink = " . $item_id)->result()) as $value) {
        	$fields = $value;
        }

        $data = array(
        	"user_id" => $this->login_user->id,
            "item_id" => $item_id,
            "item_name" => $fields->Description_1,
            "item_quantity" => $this->input->post('quantity'),
            "StkItem_id" => $fields->StockLink,
            "sage_project_id" => $this->input->post('project') ? $this->input->post('project') : $this->Inventory_requisitions_model->get_one($id)->sage_project_id,
            "description" => $this->input->post('description') ? $this->input->post('description') : $this->Inventory_requisitions_model->get_one($id)->description,
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

    public function fields($object) {

        $return = new stdClass();

        foreach ($object as $value) {
            $return = $value;
        }

        return $return;
    }

}