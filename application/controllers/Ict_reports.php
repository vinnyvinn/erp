<?php
defined('BASEPATH') OR exit('No direct script access allowed');

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

    $view_data['ticket_types_dropdown'] = $this->Ticket_types_model->get_dropdown_list(array("title"), "id");
    
    $this->template->rander("checklists/reports/index", $view_data);
  }

  public function support_entries() {
    $this->template->rander("checklists/reports/support_entries/index");
  }

  public function checklists() {
    $this->template->rander("checklists/reports/checklists/index");
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
      $this->template->rander("checklists/ict_inventory/index");
    }

    public function inventory_list_data() {
      $list_data = $this->SAGE_DB()->get_where("_btblFAAsset", array("iAssetTypeNo" => 6))->result();

      $result = array();
      foreach ($list_data as $data) {
          $result[] = $this->inventory_make_row($data);
      }
      echo json_encode(array("data" => $result));
    }

    private function inventory_make_row($data) {
      return array($data->idAssetNo, $data->cAssetDesc, $data->ucFAModel ? $data->ucFAModel : "Not Set", $data->cAssetCode, $data->iLocationNo, $data->iLocationNo, $this->SAGE_DB()->get_where("_btblFAAssetType", array("idAssetTypeNo" => $data->iAssetTypeNo))->result()[0]->cAssetTypeDesc, $data->ucFACustodian ? $data->ucFACustodian : "Not Set", $data->iAssetTypeNo, date("dS M Y",strtotime($data->dPurchaseDate)), number_format($data->fPurchaseValue, 2), $data->iSupplierNo);
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

    public function SAGE_DB() {
      return $this->load->database('SAGE', TRUE);
    }

}