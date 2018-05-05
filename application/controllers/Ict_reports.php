<?php
defined('BASEPATH') OR exit('No direct script access allowed');
ini_set('max_execution_time', 300); //300 seconds 

require_once("Pre_loader.php");

class Ict_reports extends Pre_loader {

   /**
    * Get All Data from this method.
    *
    * @return Response
   */

   public function __construct() {
    parent::__construct();
    $this->load->helper(array('form', 'url'));
    
  }

  public function index(){

    // $view_data['ticket_types_dropdown'] = $this->Ticket_types_model->get_dropdown_list(array("title"), "id");
    // $this->template->rander("checklists/reports/index", $view_data);

    $this->support_entries();
  }

  public function support_entries() {
    $this->template->rander("checklists/reports/support_entries/index");
  }

  public function support_tickets() {
    $this->template->rander("checklists/reports/support_tickets/index");
  }

  public function checklists() {
    $this->template->rander("checklists/reports/checklists/index");
  }

  public function asset_disposal() {
    $this->template->rander("checklists/disposal/index");
  }

  public function support_entries_list_data() {

    $id = $this->input->post("ticket_type_id");
    $list_data = $this->Tickets_model->get_all_where(array("ticket_type_id" => $id, "deleted" => 0))->result();

    $result = array();
    foreach ($list_data as $data) {
        $result[] = $this->support_entries_make_row($data);
    }
    echo json_encode(array("data" => $result));
  }

  private function support_entries_make_row($data) {

        $subject = anchor(get_uri("tickets/view/" . $data->id), $data->title);

        $project = $data->project_id ? anchor(get_uri("projects/view/" . $data->id), $this->Projects_model->get_one($data->project_id)->title) : "No Project";
        $ticket_type = $this->Ticket_types_model->get_one($data->ticket_type_id)->title;
        $assigned_to = anchor(get_uri("team_members/view/" . $data->id), $this->Users_model->get_one($data->assigned_to)->first_name . " " . $this->Users_model->get_one($data->assigned_to)->last_name);

        $ticket_status_class = "label-danger";
        if ($data->status === "new") {
            $ticket_status_class = "label-warning";
        } else if ($data->status === "closed") {
            $ticket_status_class = "label-success";
        } else if ($data->status === "client_replied" && $this->login_user->user_type === "client") {
            $data->status = "open"; //don't show client_replied status to client
        }

        $ticket_status = "<span class='label $ticket_status_class large'>" . lang($data->status) . "</span> ";

        return array($data->id, $subject, $project, $ticket_type, $assigned_to, $ticket_status);
    }


  public function support_tickets_list_data() {

    $id = $this->input->post("ticket_type_id");
    $list_data = $this->Tickets_model->get_all_where(array("ticket_type_id" => $id, "team_id" => 3, "deleted" => 0))->result();
    $result = array();
    foreach ($list_data as $data) {
        $result[] = $this->support_tickets_make_row($data);
    }
    echo json_encode(array("data" => $result));
  }

  private function support_tickets_make_row($data) {

        $subject = anchor(get_uri("tickets/view/" . $data->id), $data->title);

        //show labels fild to team members only
        $ticket_labels = "";
        if ($data->labels && $this->login_user->user_type == "staff") {
            $labels = explode(",", $data->labels);
            foreach ($labels as $label) {
                $ticket_labels.="<span class='label label-info'  title='$label'>" . $label . "</span> ";
            }
        }
        if ($ticket_labels) {
            $subject.="<span class='pull-right'>" . $ticket_labels . "</span>";
        }

        $ticket_type = $this->Ticket_types_model->get_one($data->ticket_type_id)->title;

        // $assigned_to = anchor(get_uri("team_members/view/" . $data->id), $this->Users_model->get_one($data->assigned_to)->first_name . " " . $this->Users_model->get_one($data->assigned_to)->last_name);

        // $escalation_matrix = $data->escalation_matrix != 0 ? modal_anchor(get_uri("ict_reports/excalation_matrix_view"), $data->escalation_matrix, array("class" => "edit", "title" => "Escalation Matrix", "data-post-view" => "details", "data-post-id" => $data->escalation_matrix)) : "None";

        $assigned_to = $this->Team_model->get_one($data->team_id)->title;

        $ticket_status_class = "label-danger";
        if ($data->status === "new") {
            $ticket_status_class = "label-warning";
        } else if ($data->status === "closed") {
            $ticket_status_class = "label-success";
        } else if ($data->status === "client_replied" && $this->login_user->user_type === "client") {
            $data->status = "open"; //don't show client_replied status to client
        }

        $ticket_status = "<span class='label $ticket_status_class large'>" . lang($data->status) . "</span> ";

        $options = "";
        if ($this->login_user->user_type == "staff" && $data->status !== "closed") {
            $options .= modal_anchor(get_uri("ict_reports/support_tickets_modal_form"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => lang('ticket'), "data-post-view" => "details", "data-post-id" => $data->id));
            $options .= js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete_task'), "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("tickets/delete_ticket"), "data-action" => "delete"));
        }

        return array($data->id, $subject, $ticket_type, $assigned_to, format_to_relative_time($data->last_activity_at), $ticket_status, $options);
    }

        //load new tickt modal
    public function support_tickets_modal_form()
    {
        validate_submitted_data(array(
            "id" => "numeric"
        ));

        //client should not be able to edit ticket
        if ($this->login_user->user_type === "client" && $this->input->post('id')) {
            redirect("forbidden");
        }

        $view_data['ticket_types_dropdown'] = $this->Ticket_types_model->get_dropdown_list(array("title"), "id");
        $view_data['model_info'] = $this->Tickets_model->get_one($this->input->post('id'));

        //prepare assign to list
        $assigned_to_dropdown = array("" => "-") + $this->Users_model
                ->get_dropdown_list(
                    ["first_name", "last_name"],
                    "id",
                    ['status' => 'active', "deleted" => 0, "user_type" => "staff"]
                );

        asort($assigned_to_dropdown, SORT_STRING);

        $view_data['assigned_to_dropdown'] = $assigned_to_dropdown;

        $escalation_matrix_dropdown = array("" => "-") + $this->Escalation_matrix_model
        ->get_dropdown_list(
            ["escalation_matrix"],
            "id",
            ["deleted" => 0]
        );

        asort($escalation_matrix_dropdown, SORT_STRING);

        $view_data['escalation_matrix_dropdown'] = $escalation_matrix_dropdown;

        //prepare label suggestions
        $labels = explode(",", $this->Tickets_model->get_label_suggestions());
        $label_suggestions = array();
        foreach ($labels as $label) {
            if ($label && !in_array($label, $label_suggestions)) {
                $label_suggestions[] = $label;
            }
        }
        if (!count($label_suggestions)) {
            $label_suggestions = array("0" => "");
        }
        $view_data['label_suggestions'] = $label_suggestions;
        $view_data['staffs_dropdown'] = $this->HR_DB()->query("SELECT Emp_Name FROM tblEmployee")->result();

        $this->load->view('checklists/reports/support_tickets/modal_form', $view_data);
    }

    public function checklists_list_data() {

      // $id = $this->input->post("ticket_type_id");
      $list_data = $this->TblChecklistsTasks->get_all_where(array("deleted" => 0))->result();

      $result = array();
      foreach ($list_data as $data) {
          $result[] = $this->checklists_make_row($data);
          // $result[] = ($data);
      }
      echo json_encode(array("data" => $result));
    }

    private function checklists_make_row($data) {

        $ref_no = modal_anchor(get_uri("ict_reports/modal_checklist_details"), $data->ref_no, array("class" => "edit", "title" => "Checklist Details", "data-post-id" => $data->ref_no));

        $performed_by = anchor(get_uri("team_members/view/" . $data->performed_by), $this->Users_model->get_one($data->performed_by)->first_name . " " . $this->Users_model->get_one($data->performed_by)->last_name);

        $title = $this->db->get_where('tbl_checklist_task_checks', array('ref_no' => $data->ref_no))->first_row()->check_item;

        return array($data->id, $ref_no, $performed_by, date("dS M Y",strtotime($data->performed_on)), $this->TblChecklistStatus->get_one($data->status)->name);
    }

    public function modal_checklist_details() {

        $view_data['id'] = $this->input->post('id');
        $view_data['list_data'] = $this->db->query("SELECT tbl_checklist_task_checks.id, tbl_checklist_task_checks.ref_no, tbl_checklists.`name`, tbl_checklist_performed_on.`name` AS `type`, tbl_checklist_task_checks.`comment`, tbl_checklist_status.`name` AS `status` FROM tbl_checklist_task_checks LEFT JOIN tbl_checklists ON tbl_checklist_task_checks.check_item = tbl_checklists.id LEFT JOIN tbl_checklist_performed_on ON tbl_checklists.performed_on = tbl_checklist_performed_on.id LEFT JOIN tbl_checklist_status ON tbl_checklist_task_checks.`status` = tbl_checklist_status.id")->result();

        $this->load->view('checklists/reports/checklists/view_modal', $view_data);
    }

    public function inventory() {
      $list_data = $this->SAGE_DB()->get_where("_btblFAAsset", array("iAssetTypeNo" => 6))->result();
      foreach ($list_data as $data) {
        // $this->Ict_issets_model->save(array("sage_id" => $data->idAssetNo));
        $this->db->get_where('ict_issets', array("sage_id" => $data->idAssetNo), 1)->num_rows() ? '' : $this->db->insert('ict_issets', array("sage_id" => $data->idAssetNo, "category_id" => 0));
      }
      $this->template->rander("checklists/ict_inventory/index");
    }

    public function inventory_list_data() {

      $category_id = $this->input->post("category_id");

      if ($this->login_user->is_admin) {
        $user_assets = $this->Ict_issets_model->get_all_where(array("category_id" => $category_id, "deleted" => 0))->result();
      } else {
        $user_assets = $this->Ict_issets_model->get_all_where(array("assigned_to" => $this->login_user->id, "category_id" => $category_id, "deleted" => 0))->result();
      }

      $list_data = array();
      foreach ($user_assets as $asset) {
        $list_data[] = $this->SAGE_DB()->get_where("_btblFAAsset", array("idAssetNo" => $asset->sage_id,"iAssetTypeNo" => 6))->result();
      }

      $result = array();
      foreach ($list_data as $data) {
        foreach ($data as $value) {
          $result[] = $this->inventory_make_row($value);
        }
      }
      echo json_encode(array("data" => $result));
    }

    private function inventory_make_row($data) {

      $id = $data->idAssetNo;
      $description = $data->cAssetDesc;
      $serial = $data->cAssetCode;
      $location = $data->iLocationNo != 0 ? $this->SAGE_DB()->get_where("_btblFALocation", array("idLocationNo" => $data->iLocationNo))->result()[0]->cLocationDesc : "NOT SET";
      $category = $data->iAssetTypeNo != 0 ? $this->SAGE_DB()->get_where("_btblFAAssetType", array("idAssetTypeNo" => $data->iAssetTypeNo))->result()[0]->cAssetTypeDesc : "NOT SET";
      $custodian = $this->Ict_issets_model->get_one_ict_asset($data->idAssetNo)->assigned_to;
      $depertment = $this->Ict_issets_model->get_one_ict_asset($data->idAssetNo)->sage_dept != 0 ? $this->SAGE_DB()->get_where("departments", array("id" => $this->Ict_issets_model->get_one_ict_asset($data->idAssetNo)->sage_dept))->result()[0]->name : "NOT SET";
      $pDate = date("dS M Y",strtotime($data->dPurchaseDate));
      $pCost = number_format($data->fPurchaseValue, 2);
      $Supplier = $data->iSupplierNo != 0 ? $this->SAGE_DB()->get_where("Vendor", array("DCLink" => $data->iSupplierNo))->result()[0]->Name : "NOT SET";

      if ($this->login_user->is_admin) {
        $custodian = modal_anchor(get_uri("ict_reports/custodian_modal_form"), $custodian != 0 ? $this->Users_model->get_one($custodian)->first_name : "NOT SET", array("class" => "edit", "title" => "Update Asset Custodian", "data-post-id" => $id));
        $depertment = modal_anchor(get_uri("ict_reports/depertment_modal_form"), $depertment, array("class" => "edit", "title" => "Update Asset Depertment", "data-post-id" => $id));
      } else {
        $custodian = $custodian != 0 ? $this->Users_model->get_one($custodian)->first_name : "NOT SET";
        $depertment = $depertment;
      }

      return array($id, $description, $serial, $location, $category, $custodian, $depertment, $pDate, $pCost, $Supplier);
    }

    public function custodian_modal_form() {

      $view_data['model_info'] = $this->Ict_issets_model->get_one_ict_asset($this->input->post('id'));
      $sage_id = $this->input->post('sage_id') ? $this->input->post('sage_id') : $view_data['model_info']->sage_id;
      $view_data['sage_id'] = $sage_id;
      $view_data['users_dropdown'] = $this->Users_model->get_dropdown_list(array("first_name", "last_name"), "id", array("user_type" => "staff"));
      $this->load->view('checklists/ict_inventory/custodian_modal_form', $view_data);
    }

    function save_custodian() {

      $id = $this->input->post('id');

      $data = array(
        "assigned_to" => $this->input->post('user_id')
      );

      $save_id = $this->Ict_issets_model->save($data, $id);
      if ($save_id) {
          echo json_encode(array("success" => true, 'message' => lang('record_saved')));
      } else {
          echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
      }
    }

    public function depertment_modal_form() {

      $view_data['model_info'] = $this->Ict_issets_model->get_one_ict_asset($this->input->post('id'));
      $sage_id = $this->input->post('sage_id') ? $this->input->post('sage_id') : $view_data['model_info']->sage_id;
      $view_data['sage_id'] = $sage_id;
      $view_data['depertments_dropdown'] = $this->SAGE_DB()->get('departments')->result();
      $this->load->view('checklists/ict_inventory/depertment_modal_form', $view_data);
    }

    function save_depertment() {

      $id = $this->input->post('id');

      $data = array(
        "sage_dept" => $this->input->post('sage_dept')
      );

      $save_id = $this->Ict_issets_model->save($data, $id);
      if ($save_id) {
          echo json_encode(array("success" => true, 'message' => lang('record_saved')));
      } else {
          echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
      }
    }

    public function actual_asset_modal_form() {
      $view_data['users_dropdown'] = $this->Users_model->get_dropdown_list(array("first_name", "last_name"), "id", array("user_type" => "staff"));
      $view_data['suppliers_dropdown'] = $this->SAGE_DB()->get('Vendor')->result();
      $this->load->view('checklists/ict_inventory/actual_asset_modal_form', $view_data);
    }

    function save_actual_asset() {

      $sage_data = array(
        // "assigned_to" => $this->input->post('user_id'),
        "cAssetCode" => $this->input->post('serial'),
        "cAssetDesc" => $this->input->post('title'),
        "iAssetTypeNo" => 6,
        "iSupplierNo" => $this->input->post('supplier'),
        "fNoOfUnits" => 1,
        "dPurchaseDate" => $this->input->post('dPurchaseDate'),
        "dDepreciationStartDate" => $this->input->post('dPurchaseDate'),
        "dWTStartDate" => $this->input->post('dPurchaseDate'),
        "fPurchaseValue" => $this->input->post('fPurchaseValue'),
        "fRevalueValue" => $this->input->post('fPurchaseValue'),
        "fInsuredValue" => 0,
        "fResidualValue" => 0,
        "fScrapValue" => 0,
        "dOriginalWTStartDate" => $this->input->post('dPurchaseDate'),
        "dOriginalDeprStartDate" => $this->input->post('dPurchaseDate')
      );

      $this->SAGE_DB()->insert("_btblFAAsset", $sage_data);

      $actual_data = array(
        "sage_id" => $this->SAGE_DB()->get_where("_btblFAAsset", array("cAssetCode" => $this->input->post('serial'), "cAssetDesc" => $this->input->post('title')))->result()[0]->idAssetNo,
        "assigned_to" => $this->input->post('user_id'),
        "category_id" => 1
      );

      $save_id = $this->Ict_issets_model->save($actual_data);

      if ($save_id) {
          echo json_encode(array("success" => true, 'message' => lang('record_saved')));
      } else {
          echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
      }
    }

    public function disposal_list_data() {

      if ($this->login_user->is_admin) {
        $user_assets = $this->Ict_issets_model->get_all_where(array("deleted" => 0))->result();
      } else {
        $user_assets = $this->Ict_issets_model->get_all_where(array("assigned_to" => $this->login_user->id, "deleted" => 0))->result();
      }

      $list_data = array();
      foreach ($user_assets as $asset) {
        $list_data[] = $this->SAGE_DB()->get_where("_btblFAAsset", array("idAssetNo" => $asset->sage_id,"iAssetTypeNo" => 6))->result();
      }

      $result = array();
      foreach ($list_data as $data) {
        foreach ($data as $value) {
          $result[] = $this->disposal_make_row($value);
        }
      }
      echo json_encode(array("data" => $result));
    }

    private function disposal_make_row($data) {

      $id = $data->idAssetNo;
      $description = $data->cAssetDesc;
      $serial = $data->cAssetCode;
      $category = $data->iAssetTypeNo != 0 ? $this->SAGE_DB()->get_where("_btblFAAssetType", array("idAssetTypeNo" => $data->iAssetTypeNo))->result()[0]->cAssetTypeDesc : "NOT SET";
      $custodian = $this->Ict_issets_model->get_one_ict_asset($data->idAssetNo)->assigned_to != 0 ? $this->Users_model->get_one($this->Ict_issets_model->get_one_ict_asset($data->idAssetNo)->assigned_to)->first_name : "NOT SET";
      $pDate = date("dS M Y",strtotime($data->dPurchaseDate));
      $dDate = (new DateTime($data->dDepreciationStartDate))->add(new DateInterval('P3Y'));
      $date_now = new DateTime();
      $optoins = ($date_now > $dDate) ? js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => "Dispose Asset", "class" => "delete", "data-id" => $id, "data-action-url" => get_uri("ict_reports/delete_asset"), "data-action" => "delete")) : '';

      return array($id, $description, $serial, $category, $custodian, $pDate, $dDate->format('dS M Y'), $optoins);
    }

    function delete_asset() {

       $id = $this->Ict_issets_model->get_one_ict_asset($this->input->post('id'))->id;

        if ($this->input->post('undo')) {
            if ($this->Ict_issets_model->delete($id, true)) {
                echo json_encode(array("success" => true, "message" => lang('record_undone')));
            } else {
                echo json_encode(array("success" => false, "message" => lang('error_occurred')));
            }
        } else {
            if ($this->Ict_issets_model->delete($id)) {
                echo json_encode(array("success" => true, "message" => lang('record_deleted')));
            } else {
                echo json_encode(array("success" => false, "message" => lang('record_cannot_be_deleted')));
            }
        }
    }

    public function inventory_maintenance() {      
      $this->template->rander("checklists/maintenance/index");
    }

    public function inventory_maintenance_modal_form() {
      $view_data['ict_assets_dropdown'] = $this->SAGE_DB()->get_where("_btblFAAsset", array("iAssetTypeNo" => 6))->result();
      $view_data['assign_dropdown'] = $this->Users_model->get_all_where(array("user_type" => "staff", "deleted" => 0))->result();
      $view_data['excalation_dropdown'] = $this->Escalation_matrix_model->get_all_where(array("deleted" => 0))->result();
      $this->load->view("checklists/maintenance/modal_form", $view_data);
    }

    public function inventory_maintenance_save() {

      $id = $this->input->post('id');

      $data = array(
        "sage_item_id" => $this->input->post('ict_assets'),
        "maintainance_date" => $this->input->post('maintainance_date'),
        "assigned_id" => $this->input->post('assign'),
        "excalation_id" => $this->input->post('excalation')
      );

      $save_id = $this->Preventive_maintainance_model->save($data, $id);

      if ($save_id) {
        echo json_encode(array("success" => true, 'message' => lang('record_saved')));
      } else {
        echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
      }
    }

    public function preventive_maintainance_list_data() {
      if ($this->login_user->is_admin) {
        $list_data = $this->Preventive_maintainance_model->get_all_where(array("deleted" => 0))->result();
      } else {
        $list_data = $this->Preventive_maintainance_model->get_all_where(array("assigned_id" => $this->login_user->id, "deleted" => 0))->result();
      }

      $result = array();
      foreach ($list_data as $data) {
          $result[] = $this->preventive_maintainance_make_row($data);
      }
      echo json_encode(array("data" => $result));
    }

    private function preventive_maintainance_make_row($data) {

      if ($data->status == 0) {
          $status_class = "label-warning";
          $status_data = "Not Performed";
      } else if ($data->status == 1) {
          $status_class = "label-success";
          $status_data = "Performed";
      }

      $status = "<span class='label $status_class large'>" . $status_data . "</span> ";
      $options = "";

      if ($this->login_user->is_admin) {
        // $options .= modal_anchor(get_uri("ict_reports/inventory_maintenance_modal_form"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => lang('edit_task'), "data-post-id" => $data->id));
        $options .= js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => 'Delete Maintenance', "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("ict_reports/inventory_maintenance_delete"), "data-action" => "delete"));
      } elseif($data->status == 0) {
          $options .= js_anchor("<i class='fa fa-pencil'></i>", array('title' => 'Perform Task', "class" => "edit", "data-id" => $data->id, "data-action-url" => get_uri("ict_reports/perform_maintenance"), "data-action" => "delete"));
          // $options .= js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => 'Escalate Task', "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("ict_reports/escalate_maintenance"), "data-action" => "delete"));
      }

      return array($data->id, $this->SAGE_DB()->get_where("_btblFAAsset", array("idAssetNo" => $data->sage_item_id))->result()[0]->cAssetDesc, $this->Users_model->get_one($data->assigned_id)->first_name . " " . $this->Users_model->get_one($data->assigned_id)->last_name, $this->Escalation_matrix_model->get_one($data->excalation_id)->escalation_matrix, $status, date("dS M Y",strtotime($data->maintainance_date)), $options);
    }

    public function perform_maintenance() {

      $id = $this->input->post('id');

      $save_id = $this->Preventive_maintainance_model->update_where(array("status" => 1, "performed_by" => $this->login_user->id), array("id" => $id));

      if ($save_id) {
        echo json_encode(array("success" => true, 'message' => lang('record_saved')));
      } else {
        echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
      }
    }

    public function escalate_maintenance() {
      $id = $this->input->post('id');
    }

    public function inventory_maintenance_delete() {

      $id = $this->input->post('id');

      $save_id = $this->Preventive_maintainance_model->update_where(array("deleted" => 1), array("id" => $id));

      if ($save_id) {
        echo json_encode(array("success" => true, 'message' => lang('record_saved')));
      } else {
        echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
      }

    }

    public function maintainance_reports() {      
      $this->template->rander("checklists/reports/ict_maintainance/index");
    }

    public function maintainance_reports_list_data() {

      $list_data = $this->Preventive_maintainance_model->get_all_where(array("status" => $this->input->post('status'), "deleted" => 0))->result();

      $result = array();
      foreach ($list_data as $data) {
          $result[] = $this->maintainance_reports_make_row($data);
          // $result[] = $data;
      }
      echo json_encode(array("data" => $result));
    }

    public function maintainance_reports_make_row($data) {

    if ($data->status == 0) {
          $status_class = "label-warning";
          $status_data = "Not Performed";
      } else if ($data->status == 1) {
          $status_class = "label-success";
          $status_data = "Performed";
      }

      $status = "<span class='label $status_class large'>" . $status_data . "</span> ";

      return array($data->id, $this->SAGE_DB()->get_where("_btblFAAsset", array("idAssetNo" => $data->sage_item_id))->result()[0]->cAssetDesc, $data->performed_by != 0 ? $this->Users_model->get_one($data->performed_by)->first_name . " " . $this->Users_model->get_one($data->performed_by)->last_name : $status, date("dS M Y",strtotime($data->maintainance_date)), $status);
    }

        // add a new ticket
    public function support_tickets_save()
    {
        $id = $this->input->post('id');

        validate_submitted_data(array(
            "ticket_type_id" => "required|numeric"
        ));

        $ticket_type_id = $this->input->post('ticket_type_id');

        $now = get_current_utc_time();
        $ticket_data = array(
            "title" => $this->input->post('title'),
            "ticket_type_id" => $ticket_type_id,
            "created_by" => $this->login_user->id,
            "created_at" => $now,
            "last_activity_at" => $now,
            "team_id" => $this->input->post('team_id'),
            "labels" => $this->input->post('labels')
        );

        if ($id) {
            //client can't update ticket
            if ($this->login_user->user_type === "client") {
                redirect("forbidden");
            }

            //remove not updateable fields
            unset($ticket_data['created_by']);
            unset($ticket_data['created_at']);
            unset($ticket_data['last_activity_at']);
        }

        $ticket_id = $this->Tickets_model->save($ticket_data, $id);

        $target_path = get_setting("timeline_file_path");
        $files_data = move_files_from_temp_dir_to_permanent_dir($target_path, "ticket");


        if ($ticket_id) {
            //ticket added. now add a comment in this ticket
            if (!$id) {
                $comment_data = array(
                    "description" => $this->input->post('description'),
                    "ticket_id" => $ticket_id,
                    "created_by" => $this->login_user->id,
                    "created_at" => $now,
                    "files" => $files_data
                );
                $ticket_comment_id = $this->Ticket_comments_model->save($comment_data);

                if ($ticket_id && $ticket_comment_id) {
                    // log_notification("ticket_created", array("ticket_id" => $ticket_id, "ticket_comment_id" => $ticket_comment_id));
                  $team = explode(',', $this->Team_model->get_one($this->input->post('team_id'))->members);
                  foreach ($team as $key => $value) {
                    $log_notification = array(
                      "user_id" => $this->login_user->id,
                      "created_at" => $now,
                      "notify_to" => $value,
                      "event" => "ticket_created",
                      "ticket_id" => $ticket_id,
                      "ticket_comment_id" => $ticket_comment_id
                    );
                    $notification_id = $this->Notifications_model->save($log_notification);
                  }
                }
            }

            echo json_encode(array("success" => true, "data" => $this->_row_data($ticket_id), 'id' => $ticket_id, 'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    /* upload a file */

    public function upload_file ()
    {
        upload_file_to_temp();
    }

    /* check valid file for ticket */

    public function validate_ticket_file ()
    {
        return validate_post_file($this->input->post("file_name"));
    }

    // return a row of ticket list table
    private function _row_data($id) {
        $options = array("id" => $id, "access_type" => $this->access_type);

        $data = $this->Tickets_model->get_details($options)->row();
        return $this->support_tickets_make_row($data);
    }

    public function SAGE_DB() {
      return $this->load->database('SAGE', TRUE);
    }

    public function HR_DB(){
       return  $this->load->database('HR',TRUE);
    }

  }