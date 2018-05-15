<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');
require_once("Pre_loader.php");

class Invoices extends Pre_loader {

    function __construct() {
        parent::__construct();
        $this->init_permission_checker("invoice");
    }

    /* load invoice list view */

    function index() {
        //$this->check_module_availability("module_invoice");

        if ($this->login_user->user_type === "staff") {
            $this->access_only_allowed_members();

            $this->template->rander("invoices/index");
        } else {
            $view_data["client_info"] = $this->Clients_model->get_one($this->login_user->client_id);
            $view_data['client_id'] = $this->login_user->client_id;
            $view_data['page_type'] = "full";
            $this->template->rander("clients/invoices/index", $view_data);
        }
    }

    //load the yearly view of invoice list 
    function yearly() {
        $this->load->view("invoices/yearly_invoices");
    }

    /* load new invoice modal */

    function modal_form() {
        $this->access_only_allowed_members();

        validate_submitted_data(array(
            "id" => "numeric",
            "client_id" => "numeric",
            "project_id" => "numeric"
        ));

        $client_id = $this->input->post('client_id');
        $project_id = $this->input->post('project_id');
        $model_info = $this->Invoices_model->get_one($this->input->post('id'));


        //check if estimate_id posted. if found estimate_id, so, we'll show the estimate info to copy the estimate 
        $estimate_id = $this->input->post('estimate_id');
        $view_data['estimate_id'] = $estimate_id;
        if ($estimate_id) {
            $estimate_info = $this->Estimates_model->get_one($estimate_id);
            $now = get_my_local_time("Y-m-d");
            $model_info->bill_date = $now;
            $model_info->due_date = $now;
            $model_info->client_id = $estimate_info->client_id;
            $model_info->tax_id = $estimate_info->tax_id;
            $model_info->tax_id2 = $estimate_info->tax_id2;
        }

        //here has a project id. now set the client from the project
        if ($project_id) {
            $client_id = $this->Projects_model->get_one($project_id)->client_id;
            $model_info->client_id = $client_id;
        }


        $project_client_id = $client_id;
        if ($model_info->client_id) {
            $project_client_id = $model_info->client_id;
        }

        $view_data['model_info'] = $model_info;

        //make the drodown lists
        $view_data['taxes_dropdown'] = array("" => "-") + $this->Taxes_model->get_dropdown_list(array("title"));
        $view_data['clients_dropdown'] = array("" => "-") + $this->Clients_model->get_dropdown_list(array("company_name"));
        $projects = $this->Projects_model->get_dropdown_list(array("title"), "id", array("client_id" => $project_client_id));
        $suggestion = array(array("id" => "", "text" => "-"));
        foreach ($projects as $key => $value) {
            $suggestion[] = array("id" => $key, "text" => $value);
        }
        $view_data['projects_suggestion'] = $suggestion;

        $view_data['client_id'] = $client_id;

        $view_data['project_id'] = $project_id;
        $this->load->view('invoices/modal_form', $view_data);
    }

    /* prepare project dropdown based on this suggestion */

    function get_project_suggestion($client_id = 0) {
        $this->access_only_allowed_members();

        $projects = $this->Projects_model->get_dropdown_list(array("title"), "id", array("client_id" => $client_id));
        $suggestion = array(array("id" => "", "text" => "-"));
        foreach ($projects as $key => $value) {
            $suggestion[] = array("id" => $key, "text" => $value);
        }
        echo json_encode($suggestion);
    }

    /* add or edit an invoice */

    function save() {
        $this->access_only_allowed_members();

        validate_submitted_data(array(
            "id" => "numeric",
            "invoice_client_id" => "required|numeric",
            "invoice_bill_date" => "required",
            "invoice_due_date" => "required"
        ));

        $client_id = $this->input->post('invoice_client_id');
        $id = $this->input->post('id');

        $invoice_data = array(
            "client_id" => $client_id,
            "project_id" => $this->input->post('invoice_project_id') ? $this->input->post('invoice_project_id') : 0,
            "bill_date" => $this->input->post('invoice_bill_date'),
            "due_date" => $this->input->post('invoice_due_date'),
            "tax_id" => $this->input->post('tax_id') ? $this->input->post('tax_id') : 0,
            "tax_id2" => $this->input->post('tax_id2') ? $this->input->post('tax_id2') : 0,
            "note" => $this->input->post('invoice_note')
        );

        $invoice_id = $this->Invoices_model->save($invoice_data, $id);
        if ($invoice_id) {

            //submitted copy_items_from_estimate? copy all items from estimate
            $copy_items_from_estimate = $this->input->post("copy_items_from_estimate");
            if ($copy_items_from_estimate) {

                $estimate_items = $this->Estimate_items_model->get_details(array("estimate_id" => $copy_items_from_estimate))->result();

                foreach ($estimate_items as $data) {
                    $invoice_item_data = array(
                        "invoice_id" => $invoice_id,
                        "title" => $data->title ? $data->title : "",
                        "description" => $data->description ? $data->description : "",
                        "quantity" => $data->quantity ? $data->quantity : 0,
                        "unit_type" => $data->unit_type ? $data->unit_type : "",
                        "rate" => $data->rate ? $data->rate : 0,
                        "total" => $data->total ? $data->total : 0,
                    );
                    $this->Invoice_items_model->save($invoice_item_data);
                }
            }

            echo json_encode(array("success" => true, "data" => $this->_row_data($invoice_id), 'id' => $invoice_id, 'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    /* delete or undo an invoice */

    function delete() {
        $this->access_only_allowed_members();

        validate_submitted_data(array(
            "id" => "required|numeric"
        ));

        $id = $this->input->post('id');
        if ($this->input->post('undo')) {
            if ($this->Invoices_model->delete($id, true)) {
                echo json_encode(array("success" => true, "data" => $this->_row_data($id), "message" => lang('record_undone')));
            } else {
                echo json_encode(array("success" => false, lang('error_occurred')));
            }
        } else {
            if ($this->Invoices_model->delete($id)) {
                echo json_encode(array("success" => true, 'message' => lang('record_deleted')));
            } else {
                echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
            }
        }
    }

    /* list of invoices, prepared for datatable  */

    function list_data() {
        $this->access_only_allowed_members();

        $options = array(
            "status" => $this->input->post("status"),
            "start_date" => $this->input->post("start_date"),
            "end_date" => $this->input->post("end_date")
        );

        $list_data = $this->Invoices_model->get_details($options)->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_row($data);
        }

        echo json_encode(array("data" => $result));
    }

    /* list of invoice of a specific client, prepared for datatable  */

    function invoice_list_data_of_client($client_id) {
        $this->access_only_allowed_members_or_client_contact($client_id);

        $options = array("client_id" => $client_id, "status" => $this->input->post("status"));

        //don't show draft invoices to client
        if ($this->login_user->user_type == "client") {
            $options["exclude_draft"] = true;
        }

        $list_data = $this->Invoices_model->get_details($options)->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_row($data);
        }
        echo json_encode(array("data" => $result));
    }

    /* list of invoice of a specific project, prepared for datatable  */

    function invoice_list_data_of_project($project_id) {
        $this->access_only_allowed_members();

        $options = array("project_id" => $project_id, "status" => $this->input->post("status"));
        $list_data = $this->Invoices_model->get_details($options)->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_row($data);
        }
        echo json_encode(array("data" => $result));
    }

    /* return a row of invoice list table */

    private function _row_data($id) {
        $options = array("id" => $id);
        $data = $this->Invoices_model->get_details($options)->row();
        return $this->_make_row($data);
    }

    /* prepare a row of invoice list table */

    private function _make_row($data) {
        $invoice_url = "";
        if ($this->login_user->user_type == "staff") {
            $invoice_url = anchor(get_uri("invoices/view/" . $data->id), lang("invoice") . " - " . $data->id);
        } else {
            $invoice_url = anchor(get_uri("invoices/preview/" . $data->id), lang("invoice") . " - " . $data->id);
        }

        return array($invoice_url,
            anchor(get_uri("clients/view/" . $data->client_id), $data->company_name),
            $data->project_title ? anchor(get_uri("projects/view/" . $data->project_id), $data->project_title) : "-",
            format_to_date($data->bill_date),
            format_to_date($data->due_date),
            to_currency($data->invoice_value, $data->currency_symbol),
            to_currency($data->payment_received, $data->currency_symbol),
            $this->_get_invoice_status_label($data),
            modal_anchor(get_uri("invoices/modal_form"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => lang('edit_invoice'), "data-post-id" => $data->id))
            . js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete_invoice'), "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("invoices/delete"), "data-action" => "delete"))
        );
    }

    //prepare invoice status label 
    private function _get_invoice_status_label($data, $return_html = true) {
        return get_invoice_status_label($data, $return_html);
    }

    /* load invoice details view */

    function view($invoice_id = 0) {
        $this->access_only_allowed_members();

        if ($invoice_id) {
            $options = array("id" => $invoice_id);
            $invoice_info = $this->Invoices_model->get_details($options)->row();
            if ($invoice_info) {
                $view_data['invoice_info'] = $invoice_info;
                $view_data['client_info'] = $this->Clients_model->get_one($view_data['invoice_info']->client_id);
                $invoice_items_options = array("invoice_id" => $invoice_id);
                $view_data['invoice_items'] = $this->Invoice_items_model->get_details($invoice_items_options)->result();
                $view_data['invoice_status_label'] = $this->_get_invoice_status_label($invoice_info);
                $view_data['invoice_status'] = $this->_get_invoice_status_label($invoice_info, false);
                $view_data["invoice_total_summary"] = $this->Invoices_model->get_invoice_total_summary($invoice_id);
                $this->template->rander("invoices/view", $view_data);
            } else {
                show_404();
            }
        }
    }

    /* invoice total section */

    private function _get_invoice_total_view($invoice_id = 0) {
        $view_data["invoice_total_summary"] = $this->Invoices_model->get_invoice_total_summary($invoice_id);
        return $this->load->view('invoices/invoice_total_section', $view_data, true);
    }

    /* load item modal */

    function item_modal_form() {
        $this->access_only_allowed_members();

        validate_submitted_data(array(
            "id" => "numeric"
        ));

        $invoice_id = $this->input->post('invoice_id');

        $view_data['model_info'] = $this->Invoice_items_model->get_one($this->input->post('id'));
        if (!$invoice_id) {
            $invoice_id = $view_data['model_info']->invoice_id;
        }
        $view_data['invoice_id'] = $invoice_id;
        $this->load->view('invoices/item_modal_form', $view_data);
    }

    /* add or edit an invoice item */

    function save_item() {
        $this->access_only_allowed_members();

        validate_submitted_data(array(
            "id" => "numeric",
            "invoice_id" => "required|numeric"
        ));

        $invoice_id = $this->input->post('invoice_id');

        $id = $this->input->post('id');
        $rate = unformat_currency($this->input->post('invoice_item_rate'));
        $quantity = unformat_currency($this->input->post('invoice_item_quantity'));

        $invoice_item_data = array(
            "invoice_id" => $invoice_id,
            "title" => $this->input->post('invoice_item_title'),
            "description" => $this->input->post('invoice_item_description'),
            "quantity" => $quantity,
            "unit_type" => $this->input->post('invoice_unit_type'),
            "rate" => unformat_currency($this->input->post('invoice_item_rate')),
            "total" => $rate * $quantity,
        );

        $invoice_item_id = $this->Invoice_items_model->save($invoice_item_data, $id);
        if ($invoice_item_id) {
            $options = array("id" => $invoice_item_id);
            $item_info = $this->Invoice_items_model->get_details($options)->row();
            echo json_encode(array("success" => true, "invoice_id" => $item_info->invoice_id, "data" => $this->_make_item_row($item_info), "invoice_total_view" => $this->_get_invoice_total_view($item_info->invoice_id), 'id' => $invoice_item_id, 'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    /* delete or undo an invoice item */

    function delete_item() {
        $this->access_only_allowed_members();

        validate_submitted_data(array(
            "id" => "required|numeric"
        ));

        $id = $this->input->post('id');
        if ($this->input->post('undo')) {
            if ($this->Invoice_items_model->delete($id, true)) {
                $options = array("id" => $id);
                $item_info = $this->Invoice_items_model->get_details($options)->row();
                echo json_encode(array("success" => true, "invoice_id" => $item_info->invoice_id, "data" => $this->_make_item_row($item_info), "invoice_total_view" => $this->_get_invoice_total_view($item_info->invoice_id), "message" => lang('record_undone')));
            } else {
                echo json_encode(array("success" => false, lang('error_occurred')));
            }
        } else {
            if ($this->Invoice_items_model->delete($id)) {
                $item_info = $this->Invoice_items_model->get_one($id);
                echo json_encode(array("success" => true, "invoice_id" => $item_info->invoice_id, "invoice_total_view" => $this->_get_invoice_total_view($item_info->invoice_id), 'message' => lang('record_deleted')));
            } else {
                echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
            }
        }
    }

    /* list of invoice items, prepared for datatable  */

    function item_list_data($invoice_id = 0) {
        $this->access_only_allowed_members();

        $list_data = $this->Invoice_items_model->get_details(array("invoice_id" => $invoice_id))->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_item_row($data);
        }
        echo json_encode(array("data" => $result));
    }

    /* prepare a row of invoice item list table */

    private function _make_item_row($data) {
        $item = "<b>$data->title</b>";
        if ($data->description) {
            $item.="<br /><span>" . nl2br($data->description) . "</span>";
        }
        $type = $data->unit_type ? $data->unit_type : "";

        return array(
            $item,
            to_decimal_format($data->quantity) . " " . $type,
            to_currency($data->rate, $data->currency_symbol),
            to_currency($data->total, $data->currency_symbol),
            modal_anchor(get_uri("invoices/item_modal_form"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => lang('edit_invoice'), "data-post-id" => $data->id))
            . js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete'), "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("invoices/delete_item"), "data-action" => "delete"))
        );
    }

    /* prepare suggestion of invoice item */

    function get_invoice_item_suggestion() {
        $key = $_REQUEST["q"];
        $suggestion = array();

        $items = $this->Invoice_items_model->get_item_suggestion($key);

        foreach ($items as $item) {
            $suggestion[] = array("id" => $item->title, "text" => $item->title);
        }

        $suggestion[] = array("id" => "+", "text" => "+ " . lang("create_new_item"));

        echo json_encode($suggestion);
    }

    function get_invoice_item_info_suggestion() {
        $item = $this->Invoice_items_model->get_item_info_suggestion($this->input->post("item_name"));
        if ($item) {
            echo json_encode(array("success" => true, "item_info" => $item));
        } else {
            echo json_encode(array("success" => false));
        }
    }

    //view pdf is accessable to client also.
    function view_pdf($invoice_id = 0) {
        if ($invoice_id) {
            $this->_prepare_invoice($invoice_id, "view");
        } else {
            show_404();
        }
    }

    //view html is accessable to client only.
    function preview($invoice_id = 0, $show_close_preview = false) {


        $view_data = array();

        if ($invoice_id) {

            $view_data['invoice_preview'] = $this->_prepare_invoice($invoice_id, "html", $view_data);

            //show a back button
            $view_data['show_close_preview'] = $show_close_preview && $this->login_user->user_type === "staff" ? true : false;

            $view_data['invoice_id'] = $invoice_id;
            $view_data['payment_methods'] = $this->Payment_methods_model->get_available_online_payment_methods();

            $this->load->library("paypal");
            $view_data['paypal_url'] = $this->paypal->get_paypal_url();

            $this->template->rander("invoices/invoice_preview", $view_data);
        } else {
            show_404();
        }
    }

    function download_pdf($invoice_id = 0) {

        if ($invoice_id) {
            $this->_prepare_invoice($invoice_id, "download");
        } else {
            show_404();
        }
    }

    private function _prepare_invoice($invoice_id, $mode = "download", &$data = array()) {
        $this->load->library('pdf');
        $this->pdf->setPrintHeader(false);
        $this->pdf->setPrintFooter(false);
        $this->pdf->SetCellPadding(1.5);
        $this->pdf->setImageScale(1.42);
        $this->pdf->AddPage();

        if ($invoice_id) {

            $view_data = get_invoice_making_data($invoice_id);

            //check for valid invoice
            if (!$view_data) {
                show_404();
            }

            //check for security
            $invoice_info = get_array_value($view_data, "invoice_info");
            if ($this->login_user->user_type == "client") {
                if ($this->login_user->client_id != $invoice_info->client_id) {
                    redirect("forbidden");
                }
            } else {
                $this->access_only_allowed_members();
            }

            //so, we have a valid invoice data. Prepare the view.

            $view_data["mode"] = $mode;

            $html = $this->load->view("invoices/invoice_pdf", $view_data, true);

            if ($mode != "html") {
                $this->pdf->writeHTML($html, true, false, true, false, '');
            }

            $data = $view_data; //return back the data

            if ($mode === "download") {
                $this->pdf->Output("Invoice-$invoice_id.pdf", "D");
            } else if ($mode === "send_email") {
                $temp_download_path = getcwd() . "/" . get_setting("temp_file_path") . "Invoice-$invoice_id.pdf";
                $this->pdf->Output($temp_download_path, "F");
                return $temp_download_path;
            } else if ($mode === "view") {
                $this->pdf->Output("Invoice-$invoice_id.pdf", "I");
            } else if ($mode === "html") {
                return $html;
            }
        }
    }

    function send_invoice_modal_form($invoice_id) {
        $this->access_only_allowed_members();

        if ($invoice_id) {
            $options = array("id" => $invoice_id);
            $invoice_info = $this->Invoices_model->get_details($options)->row();
            $view_data['invoice_info'] = $invoice_info;
            $contacts_options = array("user_type" => "client", "client_id" => $invoice_info->client_id);
            $contacts = $this->Users_model->get_details($contacts_options)->result();
            $contact_first_name = "";
            $contact_last_name = "";
            $contacts_dropdown = array();
            foreach ($contacts as $contact) {
                if ($contact->is_primary_contact) {
                    $contact_first_name = $contact->first_name;
                    $contact_last_name = $contact->last_name;
                    $contacts_dropdown[$contact->id] = $contact->first_name . " " . $contact->last_name . " (" . lang("primary_contact") . ")";
                }
            }

            foreach ($contacts as $contact) {
                if (!$contact->is_primary_contact) {
                    $contacts_dropdown[$contact->id] = $contact->first_name . " " . $contact->last_name;
                }
            }

            $view_data['contacts_dropdown'] = $contacts_dropdown;

            $email_template = $this->Email_templates_model->get_final_template("send_invoice");

            $invoice_total_summary = $this->Invoices_model->get_invoice_total_summary($invoice_id);

            $parser_data["INVOICE_ID"] = $invoice_info->id;
            $parser_data["CONTACT_FIRST_NAME"] = $contact_first_name;
            $parser_data["CONTACT_LAST_NAME"] = $contact_last_name;
            $parser_data["BALANCE_DUE"] = to_currency($invoice_total_summary->balance_due, $invoice_total_summary->currency_symbol);
            $parser_data["DUE_DATE"] = $invoice_info->due_date;
            $parser_data["PROJECT_TITLE"] = $invoice_info->project_title;
            $parser_data["INVOICE_URL"] = get_uri("invoices/preview/" . $invoice_info->id);
            $parser_data['SIGNATURE'] = $email_template->signature;

            $view_data['message'] = $this->parser->parse_string($email_template->message, $parser_data, TRUE);
            $view_data['subject'] = $email_template->subject;

            $this->load->view('invoices/send_invoice_modal_form', $view_data);
        } else {
            show_404();
        }
    }

    function send_invoice() {
        $this->access_only_allowed_members();

        validate_submitted_data(array(
            "id" => "required|numeric"
        ));

        $invoice_id = $this->input->post('id');

        $contact_id = $this->input->post('contact_id');
        $cc = $this->input->post('invoice_cc');

        $custom_bcc = $this->input->post('invoice_bcc');
        $subject = $this->input->post('subject');
        $message = decode_ajax_post_data($this->input->post('message'));

        $contact = $this->Users_model->get_one($contact_id);
        $attachement_url = $this->_prepare_invoice($invoice_id, "send_email");

        $default_bcc = get_setting('send_bcc_to'); //get default settings
        $bcc_emails = "";

        if ($default_bcc && $custom_bcc) {
            $bcc_emails = $default_bcc . "," . $custom_bcc;
        } else if ($default_bcc) {
            $bcc_emails = $default_bcc;
        } else if ($custom_bcc) {
            $bcc_emails = $custom_bcc;
        }

        if (send_app_mail($contact->email, $subject, $message, array("attachments" => array($attachement_url), "cc" => $cc, "bcc" => $bcc_emails))) {
            // change email status
            $status_data = array("status" => "not_paid", "last_email_sent_date" => get_my_local_time());
            if ($this->Invoices_model->save($status_data, $invoice_id)) {
                echo json_encode(array('success' => true, 'message' => lang("invoice_sent_message"), "invoice_id" => $invoice_id));
            }
            // delete the temp invoice
            if (file_exists($attachement_url)) {
                unlink($attachement_url);
            }
        } else {
            echo json_encode(array('success' => false, 'message' => lang('error_occurred')));
        }
    }

    function get_invoice_status_bar($invoice_id = 0) {
        $this->access_only_allowed_members();

        $view_data["invoice_info"] = $this->Invoices_model->get_details(array("id" => $invoice_id))->row();
        $view_data['invoice_status_label'] = $this->_get_invoice_status_label($view_data["invoice_info"]);
        $this->load->view('invoices/invoice_status_bar', $view_data);
    }

    function set_invoice_status_to_not_paid($invoice_id = 0) {
        $this->access_only_allowed_members();

        if ($invoice_id) {
            //change the draft status of the invoice
            $this->Invoices_model->set_invoice_status_to_not_paid($invoice_id);
        }
        return "";
    }

}

/* End of file invoices.php */
/* Location: ./application/controllers/invoices.php */