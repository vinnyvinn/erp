<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');
require_once("Pre_loader.php");

class Email_templates extends Pre_loader {

    function __construct() {
        parent::__construct();
        $this->access_only_admin();
    }

    private function _templates() {
        return array(
            "login_info" => array("USER_FIRST_NAME", "USER_LAST_NAME", "DASHBOARD_URL", "USER_LOGIN_EMAIL", "USER_LOGIN_PASSWORD", "SIGNATURE"),
            "reset_password" => array("ACCOUNT_HOLDER_NAME", "RESET_PASSWORD_URL", "SITE_URL", "SIGNATURE"),
            "team_member_invitation" => array("INVITATION_SENT_BY", "INVITATION_URL", "SITE_URL", "SIGNATURE"),
            "client_contact_invitation" => array("INVITATION_SENT_BY", "INVITATION_URL", "SITE_URL", "SIGNATURE"),
            "send_invoice" => array("INVOICE_ID", "CONTACT_FIRST_NAME", "CONTACT_LAST_NAME", "PROJECT_TITLE", "BALANCE_DUE", "DUE_DATE","SIGNATURE"),
            "ticket_info" => array("TICKET_TYPE", "CREATED_BY", "CREATED_AT", "SUBJECT", "DESCRIPTION", "ASSIGNED_TO", "REFERENCE"),
            "ticket_created" => array("TICKET_ID", "TICKET_TITLE", "USER_NAME", "TICKET_CONTENT", "TICKET_URL", "SIGNATURE"),
            "ticket_commented" => array("TICKET_ID", "TICKET_TITLE", "USER_NAME", "TICKET_CONTENT", "TICKET_URL", "SIGNATURE"),
            "ticket_closed" => array("TICKET_ID", "CLOSED_BY", "USER_NAME", "TICKET_URL", "EMAIL_USER","SIGNATURE"),
            "ticket_reopened" => array("TICKET_ID", "TICKET_TITLE", "USER_NAME", "TICKET_URL", "SIGNATURE"),
            "assign_ticket" => array("TICKET_ID", "TICKET_TITLE", "USER_NAME", "TICKET_URL", "CREATED_AT","CREATED_BY","SIGNATURE"),
            "ticket_owner" => array("TICKET_ID", "ASSIGNED_TO", "TITLE", "TICKET_URL", "USER_NAME","SIGNATURE"),
            "ticket_solved" => array("TICKET_ID", "TITLE", "TICKET_URL", "USER_NAME","SIGNATURE"),
            "general_notification" => array("EVENT_TITLE", "EVENT_DETAILS", "APP_TITLE", "COMPANY_NAME", "NOTIFICATION_URL", "SIGNATURE"),
            "petty_cash" => array("PETTY_CASH_ID", "PETTY_CASH_NAME", "CONTACT_FIRST_NAME", "CONTACT_LAST_NAME", "PETTY_CASH_AMOUNT", "PETTY_CASH_REQUEST_DATE", "PETTY_CASH_STATUS", "SIGNATURE"),
            "inventory_requisitions" => array("INVENTORY_REQUISITIONS_ID", "INVENTORY_REQUISITIONS_NAME", "CONTACT_FIRST_NAME", "CONTACT_LAST_NAME", "INVENTORY_REQUISITIONS_QUANTITY", "INVENTORY_REQUISITIONS_AVAILABLE", "INVENTORY_REQUISITIONS_REQUEST_DATE", "INVENTORY_REQUISITIONS_STATUS", "SIGNATURE"),
            "legal_notification" => array("CASE_TITLE", "USER_NAME", "CASE_DATE", "NOTIFICATION_URL", "SIGNATURE"),
            "event_notification" => array("EVENT_TITLE", "USER_NAME", "EVENT_STATUS", "EVENT_START_DATE_TIME", "EVENT_END_DATE_TIME", "NOTIFICATION_URL", "SIGNATURE"),
            "ticket_done" => array("TICKET_ID", "CREATED_AT", "CREATED_BY", "SOLVED_BY","SIGNATURE"),
            "third_party" => array("TICKET_ID", "CREATED_AT", "CREATED_BY","THIRD_PARTY_NAME" ,"SIGNATURE"),
            "next_maintenance_date" => array("VEHICLE_NO", "USER_NAME", "NEXT_DATE", "TITLE"),
            "ict_asset_issue" => array("TO", "FROM", "ASSET", "ASSET_URL", "SIGNATURE"),
            "ict_asset_accept" => array("TO", "FROM", "ASSET", "ASSET_URL", "SIGNATURE"),
            "ict_asset_decline" => array("TO", "FROM", "ASSET", "ASSET_URL", "SIGNATURE"),
            "ict_asset_return" => array("TO", "FROM", "ASSET", "ASSET_URL", "SIGNATURE"),
            "ict_asset_disposal" => array("TO", "FROM", "ASSET", "ASSET_URL", "DISPOSAL_DATE", "SIGNATURE"),
            "signature" => array()
        );
    }

    function index() {
        $this->template->rander("email_templates/index");
    }

    function save() {
        validate_submitted_data(array(
            "id" => "required|numeric"
        ));

        $id = $this->input->post('id');

        $data = array(
            "email_subject" => $this->input->post('email_subject'),
            "custom_message" => decode_ajax_post_data($this->input->post('custom_message'))
        );
        $save_id = $this->Email_templates_model->save($data, $id);
        if ($save_id) {
            echo json_encode(array("success" => true, 'id' => $save_id, 'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    function restore_to_default() {

        validate_submitted_data(array(
            "id" => "required|numeric"
        ));

        $template_id = $this->input->post('id');

        $data = array(
            "custom_message" => ""
        );
        $save_id = $this->Email_templates_model->save($data, $template_id);
        if ($save_id) {
            $default_message = $this->Email_templates_model->get_one($save_id)->default_message;
            echo json_encode(array("success" => true, "data" => $default_message, 'message' => lang('template_restored')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    function list_data() {
        $list = array();
        foreach ($this->_templates() as $template_name => $variables) {

            $list[] = array("<span class='template-row' data-name='$template_name'>" . lang($template_name) . "</span>");
        }
        echo json_encode(array("data" => $list));

    }

    /* load template edit form */

    function form($template_name = "") {
        $view_data['model_info'] = $this->Email_templates_model->get_one_where(array("template_name" => $template_name));
        $variables = get_array_value($this->_templates(), $template_name);
        $view_data['variables'] = $variables ? $variables : array();
        $this->load->view('email_templates/form', $view_data);
    }

}

/* End of file email_templates.php */
/* Location: ./application/controllers/email_templates.php */