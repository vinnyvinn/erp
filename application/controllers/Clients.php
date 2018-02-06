<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');
require_once("Pre_loader.php");

class Clients extends Pre_loader {

    function __construct() {
        parent::__construct();

        //check permission to access this module
        $this->init_permission_checker("client");
    }

    /* load clients list view */

    function index() {
        $this->access_only_allowed_members();

        $access_info = $this->get_access_info("invoice");
        $view_data["show_invoice_info"] = (get_setting("module_invoice") && $access_info->access_type == "all") ? true : false;
        $this->template->rander("clients/index", $view_data);
    }

    /* load client add/edit modal */

    function modal_form() {
        $this->access_only_allowed_members();

        $client_id = $this->input->post('id');
        validate_submitted_data(array(
            "id" => "numeric"
        ));

        $view_data['label_column'] = "col-md-3";
        $view_data['field_column'] = "col-md-9";

        $view_data["view"] = $this->input->post('view'); //view='details' needed only when loding from the client's details view
        $view_data['model_info'] = $this->Clients_model->get_one($client_id);
        $view_data["currency_dropdown"] = $this->get_currency_dropdown_select2_data();

        $this->load->view('clients/modal_form', $view_data);
    }

    function get_currency_dropdown_select2_data() {
        $currency = array(array("id" => "", "text" => "-"));
        foreach (get_international_currency_code_dropdown() as $value) {
            $currency[] = array("id" => $value, "text" => $value);
        }
        return $currency;
    }

    /* insert or update a client */

    function save() {
        $client_id = $this->input->post('id');

        $this->access_only_allowed_members_or_client_contact($client_id);

        validate_submitted_data(array(
            "id" => "numeric",
            "company_name" => "required"
        ));

        $data = array(
            "company_name" => $this->input->post('company_name'),
            "address" => $this->input->post('address'),
            "city" => $this->input->post('city'),
            "state" => $this->input->post('state'),
            "zip" => $this->input->post('zip'),
            "country" => $this->input->post('country'),
            "phone" => $this->input->post('phone'),
            "website" => $this->input->post('website'),
            "vat_number" => $this->input->post('vat_number'),
            "created_date" => get_current_utc_time(),
            "created_by" => $this->login_user->id,
            "description" => $this->input->post('description')
        );

        if ($this->login_user->is_admin) {
            $data["currency_symbol"] = $this->input->post('currency_symbol') ? $this->input->post('currency_symbol') : "";
            $data["currency"] = $this->input->post('currency') ? $this->input->post('currency') : "";
            $data["disable_online_payment"] = $this->input->post('disable_online_payment') ? $this->input->post('disable_online_payment') : 0;
        }

        $save_id = $this->Clients_model->save($data, $client_id);

        if ($data["currency"] != "USD" || empty($data["currency"])) {
            $currency = 2;
        } else {
            $currency = 1;
        }
         
        /*$SAGE_DB = $this->load->database('SAGE', TRUE);

        $SADE_SQL = "SELECT DEMO.dbo.Client.id FROM DEMO.dbo.Client WHERE DEMO.dbo.Client.id = " . $save_id;

        $sql   = $SAGE_DB->query($SADE_SQL);

        if ($sql->num_rows() != 0) {
            $query = "UPDATE DEMO.dbo.Client SET Name = '".$data['company_name']."', Physical1 = '".$data['address']."', Physical2 = '".$data['zip']."', Physical3 = '".$data['state']."', Physical4 = '".$data['city']."', Physical5 = '".$data['country']."', Telephone = '".$data['phone']."', Tax_Number = '".$data['vat_number']."', cWebPage = '".$data['website']."', iCurrencyID = '".$currency."' WHERE dbo.Client.id = " . $save_id ;
             $SAGE_DB->query($query);
        } else {
            $query = "INSERT INTO DEMO.dbo.Client(Name, Physical1, Physical2, Physical3, Physical4, Physical5, Telephone, Tax_Number, cWebPage, iCurrencyID, Client_dCreatedDate, id) VALUES ('".$data['company_name']."', '".$data['address']."', '".$data['zip']."', '".$data['state']."', '".$data['city']."', '".$data['country']."', '".$data['phone']."', '".$data['vat_number']."', '".$data['website']."', '".$currency."', '".$data['created_date']."', ".$save_id.")";
            $SAGE_DB->query($query);
        }*/

        if ($save_id) {

            if ($this->input->post('data-type') == 'plain') {
                echo json_encode(["success" => true, "data" => json_encode(['id' => $save_id, 'title' => $data['company_name']]), 'id' => $save_id, 'message' => lang('record_saved')]);
            } else {
                echo json_encode(array("success" => true, "data" => $this->_row_data($save_id), 'id' => $save_id, 'view' => $this->input->post('view'), 'message' => lang('record_saved')));
            }


        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    /* delete or undo a client */

    function delete() {
        $this->access_only_allowed_members();

        validate_submitted_data(array(
            "id" => "required|numeric"
        ));

        // $SAGE_DB = $this->load->database('SAGE', TRUE);

        $id = $this->input->post('id');

        if ($this->input->post('undo')) {

            if ($this->Clients_model->update_where(["status" => "Pending"], array("id" => $id, "deleted" => 0))) {
                echo json_encode(array("success" => true, "data" => $this->_row_data($id), "message" => "record undone"));
            } else {
                echo json_encode(array("success" => false, "error occurred"));
            }
        } else {

            // $query = "DELETE FROM DEMO.dbo.Client WHERE id = " . $id;
            // $SAGE_DB->query($query);
            
            if ($this->Clients_model->update_where(["status" => "Disapproved"], array("id" => $id, "deleted" => 0))) {
                echo json_encode(array("success" => true, 'message' => "record disapproved"));
            } else {
                echo json_encode(array("success" => false, 'message' => "record cannot be disapproved"));
            }
        }
    }

    /* list of clients, prepared for datatable  */

    function list_data() {

        $this->access_only_allowed_members();

        $list_data = $this->Clients_model->get_details()->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_row($data);
        }
        echo json_encode(array("data" => $result));
    }

    /* return a row of client list  table */

    private function _row_data($id) {
        $options = array("id" => $id);
        $data = $this->Clients_model->get_details($options)->row();
        return $this->_make_row($data);
    }

    /* prepare a row of client list table */

    private function _make_row($data) {

        if ($data->status == "Pending") {
            $status = "<button type=\"button\" class=\"btn btn-info\"> $data->status </button>";
        } elseif ($data->status == "Approved") {
            $status = "<button type=\"button\" class=\"btn btn-success\"> $data->status </button>";
        } elseif ($data->status == "Disapproved") {
            $status = "<button type=\"button\" class=\"btn btn-danger\"> $data->status </button>";
        }

        return array($data->id,
            anchor(get_uri("clients/view/" . $data->id), $data->company_name),
            $data->primary_contact,
            // to_decimal_format($data->total_projects),
            // to_currency($data->invoice_value, $data->currency_symbol),
            // to_currency($data->payment_received, $data->currency_symbol),
            $data->description,
            $status,
            modal_anchor(get_uri("clients/to_sage_modal_form"), "<i class='fa fa-check'></i>", array("class" => "edit", "title" => "Approve lead", "data-post-id" => $data->id))
            . js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete_client'), "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("clients/delete"), "data-action" => "delete"))
        );
    }

    public function to_sage_modal_form() {

        $view_data['_id'] = $this->input->post('id'); 
        $view_data['sage_agents_dropdown'] = $this->SAGE_DB()->where('cEmail !=', NULL)->get('_rtblAgents')->result();

        $this->load->view("clients/to_sage_modal_form", $view_data);
    }

    public function SAGE_DB() {
        return $this->load->database('SAGE', TRUE);
    }

    public function save_to_sage() {

        $id = $this->input->post('_id');
        $sage_agent = $this->input->post('sage_agent');
        $description = $this->input->post('description');

        $company_data_list = $this->Clients_model->get_details(array('id' => $id))->result()[0];

        $_rtblPeople = array(
            'cFirstName' => $this->Users_model->get_one_where(array('client_id' => $company_data_list->id))->first_name,
            'cLastName' => $this->Users_model->get_one_where(array('client_id' => $company_data_list->id))->last_name,
            'cTelWork' => $this->Users_model->get_one_where(array('client_id' => $company_data_list->id))->phone,
            'cEmail' => $this->Users_model->get_one_where(array('client_id' => $company_data_list->id))->email
        );

        $this->SAGE_DB()->insert('_rtblPeople', $_rtblPeople);
        $iPeopleID = $this->SAGE_DB()->select('idPeople')->order_by('idPeople','desc')->limit(1)->get('_rtblPeople')->row('idPeople');

        $_rtblProspect = array(
            'cCompanyName' => $company_data_list->company_name,
            'cTelephone' => $this->Users_model->get_one_where(array('client_id' => $company_data_list->id))->phone,
            'cPhysicalAddress1' => $company_data_list->address,
            'cWebsite' => $company_data_list->website,
            'cEmail' => $this->Users_model->get_one_where(array('client_id' => $company_data_list->id))->email,
            'iAgentID' => $sage_agent
        );

        $this->SAGE_DB()->insert('_rtblProspect', $_rtblProspect);
        $iProspectID = $this->SAGE_DB()->select('IDProspect')->order_by('IDProspect','desc')->limit(1)->get('_rtblProspect')->row('IDProspect');

        $_rtblOpportunity = array(
            "cOpportunityNumber" => $this->SAGE_DB()->select('cSFAOpportunityPrefix')->order_by('idCMDefaults','desc')->limit(1)->get('_rtblCMDefaults')->row('cSFAOpportunityPrefix') . str_pad($this->SAGE_DB()->select('cSFAOpportunityNextNum')->order_by('idCMDefaults','desc')->limit(1)->get('_rtblCMDefaults')->row('cSFAOpportunityNextNum'), $this->SAGE_DB()->select('iSFAOpportunityPadTo')->order_by('idCMDefaults','desc')->limit(1)->get('_rtblCMDefaults')->row('iSFAOpportunityPadTo'), '0', STR_PAD_LEFT),
            "iClientID" => 0,
            "iProspectID" => $iProspectID,
            "iPeopleID" => $iPeopleID,
            "iAgentID" => $sage_agent,
            "iOpportunityStageID" => 1,
            "iOpportunityStatusID" => 1,
            "iOpportunitySourceID" => 1,
            "dDateStart" => date('Y-m-d'),
            "dDateClose" => date('Y-m-d'),
            "dDateActualClose" => date('Y-m-d'),
            "fProbabilityPerc" => 10,
            "bPublic" => 1
        );

        $this->SAGE_DB()->insert('_rtblOpportunity', $_rtblOpportunity);
        $iOpportunityID = $this->SAGE_DB()->select('IDOpportunity')->order_by('IDOpportunity','desc')->limit(1)->get('_rtblOpportunity')->row('IDOpportunity');

        $_rtblIncidents = array(
            'dCreated' => date('Y-m-d'),
            'dLastModified' => date('Y-m-d'),
            'iClassID' => 1,
            'iIncidentStatusID' => 1,
            'bRequireAck' => 1,
            'cOurRef' => $this->SAGE_DB()->select('vIncidentPrefix')->order_by('idCMDefaults','desc')->limit(1)->get('_rtblCMDefaults')->row('vIncidentPrefix') . str_pad($this->SAGE_DB()->select('cSFAOpportunityNextNum')->order_by('idCMDefaults','desc')->limit(1)->get('_rtblCMDefaults')->row('cSFAOpportunityNextNum'), $this->SAGE_DB()->select('iIncidentPadLength')->order_by('idCMDefaults','desc')->limit(1)->get('_rtblCMDefaults')->row('iIncidentPadLength'), '0', STR_PAD_LEFT),
            'cOutline' => $description,
            'iPriorityID' => 4,
            'iCurrentAgentID' => $sage_agent,
            'iIncidentTypeID' => 1,
            'iProspectID' => $iProspectID,
            'iOpportunityID' => $iOpportunityID
        );

        $this->SAGE_DB()->insert('_rtblIncidents', $_rtblIncidents);

        /*$_rtblCMDefaults = array(
            'cSFAOpportunityNextNum' => $this->SAGE_DB()->select('cSFAOpportunityNextNum')->order_by('idCMDefaults','desc')->limit(1)->get('_rtblCMDefaults')->row('cSFAOpportunityNextNum') + $this->SAGE_DB()->select('bSFAOpportunityAutoNum')->order_by('idCMDefaults','desc')->limit(1)->get('_rtblCMDefaults')->row('bSFAOpportunityAutoNum')
        );*/

        $idCMDefaults = $this->SAGE_DB()->select('idCMDefaults')->order_by('idCMDefaults','desc')->limit(1)->get('_rtblCMDefaults')->row('idCMDefaults');
        $this->SAGE_DB()->where('idCMDefaults', $idCMDefaults);
        $this->SAGE_DB()->update('_rtblCMDefaults', array('cSFAOpportunityNextNum' => $this->SAGE_DB()->select('cSFAOpportunityNextNum')->order_by('idCMDefaults','desc')->limit(1)->get('_rtblCMDefaults')->row('cSFAOpportunityNextNum') + $this->SAGE_DB()->select('bSFAOpportunityAutoNum')->order_by('idCMDefaults','desc')->limit(1)->get('_rtblCMDefaults')->row('bSFAOpportunityAutoNum')));

        if ($this->Clients_model->update_where(["status" => "Approved"], array("id" => $id, "deleted" => 0))) {
            echo json_encode(array("success" => true, 'message' => "record approved"));
        } else {
            echo json_encode(array("success" => false, 'message' => "record cannot be approved"));
        }
    }

    /* load client details view */

    function view($client_id = 0) {
        $this->access_only_allowed_members();

        if ($client_id) {
            $options = array("id" => $client_id);
            $client_info = $this->Clients_model->get_details($options)->row();
            if ($client_info) {
 
                $access_info = $this->get_access_info("invoice");
                $view_data["show_invoice_info"] = (get_setting("module_invoice") && $access_info->access_type == "all") ? true : false;

                $access_info = $this->get_access_info("estimate");
                $view_data["show_estimate_info"] = (get_setting("module_estimate") && $access_info->access_type == "all") ? true : false;

                $access_info = $this->get_access_info("estimate_request");
                $view_data["show_estimate_request_info"] = (get_setting("module_estimate_request") && $access_info->access_type == "all") ? true : false;

                $access_info = $this->get_access_info("ticket");
                $view_data["show_ticket_info"] = (get_setting("module_ticket") && $access_info->access_type == "all") ? true : false;

                $view_data['client_info'] = $client_info;
                $this->template->rander("clients/view", $view_data);
            } else {
                show_404();
            }
        } else {
            show_404();
        }
    }

    /* load projects tab  */

    function projects($client_id) {
        $this->access_only_allowed_members();

        $view_data['can_create_projects'] = $this->can_create_projects();
        $view_data['client_id'] = $client_id;
        $this->load->view("clients/projects/index", $view_data);
    }

    /* load payments tab  */

    function payments($client_id) {
        $this->access_only_allowed_members();

        if ($client_id) {
            $view_data["client_info"] = $this->Clients_model->get_one($client_id);
            $view_data['client_id'] = $client_id;
            $this->load->view("clients/payments/index", $view_data);
        }
    }

    /* load tickets tab  */

    function tickets($client_id) {
        $this->access_only_allowed_members();

        if ($client_id) {
            $view_data['client_id'] = $client_id;
            $this->load->view("clients/tickets/index", $view_data);
        }
    }

    /* load invoices tab  */

    function invoices($client_id) {
        $this->access_only_allowed_members();

        if ($client_id) {
            $view_data["client_info"] = $this->Clients_model->get_one($client_id);
            $view_data['client_id'] = $client_id;
            $this->load->view("clients/invoices/index", $view_data);
        }
    }

    /* load estimates tab  */

    function estimates($client_id) {
        $this->access_only_allowed_members();

        if ($client_id) {
            $view_data["client_info"] = $this->Clients_model->get_one($client_id);
            $view_data['client_id'] = $client_id;
            $this->load->view("clients/estimates/estimates", $view_data);
        }
    }

    /* load estimate requests tab  */

    function estimate_requests($client_id) {
        $this->access_only_allowed_members();

        if ($client_id) {
            $view_data['client_id'] = $client_id;
            $this->load->view("clients/estimates/estimate_requests", $view_data);
        }
    }

    /* load notes tab  */

    function notes($client_id) {
        $this->access_only_allowed_members();

        if ($client_id) {
            $view_data['client_id'] = $client_id;
            $this->load->view("clients/notes/index", $view_data);
        }
    }

    function contact_profile($contact_id = 0, $tab = "") {
        $this->access_only_allowed_members_or_contact_personally($contact_id);

        $view_data['user_info'] = $this->Users_model->get_one($contact_id);
        $view_data['client_info'] = $this->Clients_model->get_one($view_data['user_info']->client_id);
        $view_data['tab'] = $tab;
        if ($view_data['user_info']->user_type === "client") {

            $view_data['show_cotact_info'] = true;
            $view_data['show_social_links'] = true;
            $view_data['social_link'] = $this->Social_links_model->get_one($contact_id);
            $this->template->rander("clients/contacts/view", $view_data);
        } else {
            show_404();
        }
    }

    //show account settings of a user
    function account_settings($contact_id) {
        $this->access_only_allowed_members_or_contact_personally($contact_id);
        $view_data['user_info'] = $this->Users_model->get_one($contact_id);
        $this->load->view("users/account_settings", $view_data);
    }

    /* load contacts tab  */

    function contacts($client_id) {
        $this->access_only_allowed_members();

        if ($client_id) {
            $view_data['client_id'] = $client_id;
            $this->load->view("clients/contacts/index", $view_data);
        }
    }

    /* contact add modal */

    function add_new_contact_modal_form() {
        $this->access_only_allowed_members();

        $view_data['model_info'] = $this->Users_model->get_one(0);
        $view_data['model_info']->client_id = $this->input->post('client_id');
        $this->load->view('clients/contacts/modal_form', $view_data);
    }

    /* load contact's general info tab view */

    function contact_general_info_tab($contact_id = 0) {
        if ($contact_id) {
            $this->access_only_allowed_members_or_contact_personally($contact_id);

            $view_data['model_info'] = $this->Users_model->get_one($contact_id);
            $view_data['label_column'] = "col-md-2";
            $view_data['field_column'] = "col-md-10";
            $this->load->view('clients/contacts/contact_general_info_tab', $view_data);
        }
    }

    /* load contact's company info tab view */

    function company_info_tab($client_id = 0) {
        if ($client_id) {
            $this->access_only_allowed_members_or_client_contact($client_id);

            $view_data['model_info'] = $this->Clients_model->get_one($client_id);
            $view_data['label_column'] = "col-md-2";
            $view_data['field_column'] = "col-md-10";
            $this->load->view('clients/contacts/company_info_tab', $view_data);
        }
    }

    /* load contact's social links tab view */

    function contact_social_links_tab($contact_id = 0) {
        if ($contact_id) {
            $this->access_only_allowed_members_or_contact_personally($contact_id);

            $view_data['user_id'] = $contact_id;
            $view_data['user_type'] = "client";
            $view_data['model_info'] = $this->Social_links_model->get_one($contact_id);
            $this->load->view('users/social_links', $view_data);
        }
    }

    /* insert/upadate a contact */

    function save_contact() {
        $contact_id = $this->input->post('contact_id');
        $client_id = $this->input->post('client_id');

        $this->access_only_allowed_members_or_contact_personally($contact_id);

        $user_data = array(
            "first_name" => $this->input->post('first_name'),
            "last_name" => $this->input->post('last_name'),
            "phone" => $this->input->post('phone'),
            "skype" => $this->input->post('skype'),
            "job_title" => $this->input->post('job_title'),
            "gender" => $this->input->post('gender'),
            "note" => $this->input->post('note')
        );

        validate_submitted_data(array(
            "first_name" => "required",
            "last_name" => "required",
            "client_id" => "required|numeric"
        ));


        if (!$contact_id) {
            //inserting new contact. client_id is required

            validate_submitted_data(array(
                "email" => "required|valid_email",
                "login_password" => "required",
            ));

            //we'll save following fields only when creating a new contact from this form
            $user_data["client_id"] = $client_id;
            $user_data["email"] = trim($this->input->post('email'));
            $user_data["password"] = md5($this->input->post('login_password'));
            $user_data["created_at"] = get_current_utc_time();

            //validate duplicate email address
            if ($this->Users_model->is_email_exists($user_data["email"])) {
                echo json_encode(array("success" => false, 'message' => lang('duplicate_email')));
                exit();
            }
        }

        //by default, the first contact of a client is the primary contact
        //check existing primary contact. if not found then set the first contact = primary contact
        $primary_contact = $this->Clients_model->get_primary_contact($client_id);
        if (!$primary_contact) {
            $user_data['is_primary_contact'] = 1;
        }

        //only admin can change existing primary contact
        $is_primary_contact = $this->input->post('is_primary_contact');
        if ($is_primary_contact && $this->login_user->is_admin) {
            $user_data['is_primary_contact'] = 1;
        }


        $save_id = $this->Users_model->save($user_data, $contact_id);

        /*$SAGE_DB = $this->load->database('SAGE', TRUE);
        $Name = $user_data['first_name'] ." ". $user_data['last_name'];
        $SAGE_query = "UPDATE DEMO.dbo.Client SET Contact_Person = '".$Name."', Telephone2 = '".$user_data['phone']."', EMail = '".$user_data['email']."' WHERE Init = ".$client_id."";

        $SAGE_DB->query($SAGE_query);*/

        if ($save_id) {

            //has changed the existing primary contact? updete previous primary contact and set is_primary_contact=0
            if ($is_primary_contact) {
                $user_data = array("is_primary_contact" => 0);
                $this->Users_model->save($user_data, $primary_contact);
            }

            //send login details to user only for first time. when creating  a new contact
            if (!$contact_id && $this->input->post('email_login_details')) {
                $email_template = $this->Email_templates_model->get_final_template("login_info");

                $parser_data["SIGNATURE"] = $email_template->signature;
                $parser_data["USER_FIRST_NAME"] = $user_data["first_name"];
                $parser_data["USER_LAST_NAME"] = $user_data["last_name"];
                $parser_data["USER_LOGIN_EMAIL"] = $user_data["email"];
                $parser_data["USER_LOGIN_PASSWORD"] = $this->input->post('login_password');
                $parser_data["DASHBOARD_URL"] = base_url();

                $message = $this->parser->parse_string($email_template->message, $parser_data, TRUE);
                send_app_mail($this->input->post('email'), $email_template->subject, $message);
            }

            echo json_encode(array("success" => true, "data" => $this->_contact_row_data($save_id), 'id' => $contact_id, 'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    //save social links of a contact
    function save_contact_social_links($contact_id = 0) {
        $this->access_only_allowed_members_or_contact_personally($contact_id);

        $id = 0;

        //find out, the user has existing social link row or not? if found update the row otherwise add new row.
        $has_social_links = $this->Social_links_model->get_one($contact_id);
        if (isset($has_social_links->id)) {
            $id = $has_social_links->id;
        }

        $social_link_data = array(
            "facebook" => $this->input->post('facebook'),
            "twitter" => $this->input->post('twitter'),
            "linkedin" => $this->input->post('linkedin'),
            "googleplus" => $this->input->post('googleplus'),
            "digg" => $this->input->post('digg'),
            "youtube" => $this->input->post('youtube'),
            "pinterest" => $this->input->post('pinterest'),
            "instagram" => $this->input->post('instagram'),
            "github" => $this->input->post('github'),
            "tumblr" => $this->input->post('tumblr'),
            "vine" => $this->input->post('vine'),
            "user_id" => $contact_id,
            "id" => $id ? $id : $contact_id
        );

        $this->Social_links_model->save($social_link_data, $id);
        echo json_encode(array("success" => true, 'message' => lang('record_updated')));
    }

    //save account settings of a client contact (user)
    function save_account_settings($user_id) {
        $this->access_only_allowed_members_or_contact_personally($user_id);

        validate_submitted_data(array(
            "email" => "required|valid_email"
        ));

        if ($this->Users_model->is_email_exists($this->input->post('email'), $user_id)) {
            echo json_encode(array("success" => false, 'message' => lang('duplicate_email')));
            exit();
        }

        $account_data = array(
            "email" => $this->input->post('email')
        );

        //don't reset password if user doesn't entered any password
        if ($this->input->post('password')) {
            $account_data['password'] = md5($this->input->post('password'));
        }

        //only admin can disable other users login permission
        if ($this->login_user->is_admin) {
            $account_data['disable_login'] = $this->input->post('disable_login');
        }


        if ($this->Users_model->save($account_data, $user_id)) {
            echo json_encode(array("success" => true, 'message' => lang('record_updated')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    //save profile image of a contact
    function save_profile_image($user_id = 0) {
        $this->access_only_allowed_members_or_contact_personally($user_id);

        //process the the file which has uploaded by dropzone
        $profile_image = str_replace("~", ":", $this->input->post("profile_image"));

        if ($profile_image) {
            $profile_image = move_temp_file("avatar.png", get_setting("profile_image_path"), "", $profile_image);
            $image_data = array("image" => $profile_image);
            $this->Users_model->save($image_data, $user_id);
            echo json_encode(array("success" => true, 'message' => lang('profile_image_changed')));
        }

        //process the the file which has uploaded using manual file submit
        if ($_FILES) {
            $profile_image_file = get_array_value($_FILES, "profile_image_file");
            $image_file_name = get_array_value($profile_image_file, "tmp_name");
            if ($image_file_name) {
                $profile_image = move_temp_file("avatar.png", get_setting("profile_image_path"), "", $image_file_name);
                $image_data = array("image" => $profile_image);
                $this->Users_model->save($image_data, $user_id);
                echo json_encode(array("success" => true, 'message' => lang('profile_image_changed')));
            }
        }
    }

    /* delete or undo a contact */

    function delete_contact() {

        validate_submitted_data(array(
            "id" => "required|numeric"
        ));

        $this->access_only_allowed_members();

        $id = $this->input->post('id');

        if ($this->input->post('undo')) {
            if ($this->Users_model->delete($id, true)) {
                echo json_encode(array("success" => true, "data" => $this->_contact_row_data($id), "message" => lang('record_undone')));
            } else {
                echo json_encode(array("success" => false, lang('error_occurred')));
            }
        } else {
            if ($this->Users_model->delete($id)) {
                echo json_encode(array("success" => true, 'message' => lang('record_deleted')));
            } else {
                echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
            }
        }
    }

    /* list of contacts, prepared for datatable  */

    function contacts_list_data($client_id = 0) {

        $this->access_only_allowed_members_or_client_contact($client_id);

        $options = array("user_type" => "client", "client_id" => $client_id);
        $list_data = $this->Users_model->get_details($options)->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_contact_row($data);
        }
        echo json_encode(array("data" => $result));
    }

    /* return a row of contact list table */

    private function _contact_row_data($id) {
        $options = array("id" => $id);
        $data = $this->Users_model->get_details($options)->row();
        return $this->_make_contact_row($data);
    }

    /* prepare a row of contact list table */

    private function _make_contact_row($data) {
        $image_url = get_avatar($data->image);
        $user_avatar = "<span class='avatar avatar-xs'><img src='$image_url' alt='...'></span>";
        $full_name = $data->first_name . " " . $data->last_name . " ";
        $primary_contact = "";
        if ($data->is_primary_contact == "1") {
            $primary_contact = "<span class='label-info label'>" . lang('primary_contact') . "</span>";
        }

        $contact_link = anchor(get_uri("clients/contact_profile/" . $data->id), $full_name . $primary_contact);
        if ($this->login_user->user_type === "client") {
            $contact_link = $full_name; //don't show clickable link to client
        }


        return array(
            $user_avatar,
            $contact_link,
            $data->job_title,
            $data->email,
            $data->phone ? $data->phone : "-",
            $data->skype ? $data->skype : "-",
            js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete_contact'), "class" => "delete", "data-id" => "$data->id", "data-action-url" => get_uri("clients/delete_contact"), "data-action" => "delete"))
        );
    }

    /* open invitation modal */

    function invitation_modal() {


        validate_submitted_data(array(
            "client_id" => "required|numeric"
        ));

        $client_id = $this->input->post('client_id');

        $this->access_only_allowed_members_or_client_contact($client_id);

        $view_data["client_info"] = $this->Clients_model->get_one($client_id);
        $this->load->view('clients/contacts/invitation_modal', $view_data);
    }

    //send a team member invitation to an email address
    function send_invitation() {

        $client_id = $this->input->post('client_id');
        $email = trim($this->input->post('email'));

        validate_submitted_data(array(
            "client_id" => "required|numeric",
            "email" => "required|valid_email|trim"
        ));

        $this->access_only_allowed_members_or_client_contact($client_id);

        $email_template = $this->Email_templates_model->get_final_template("client_contact_invitation");

        $parser_data["INVITATION_SENT_BY"] = $this->login_user->first_name . " " . $this->login_user->last_name;
        $parser_data["SIGNATURE"] = $email_template->signature;
        $parser_data["SITE_URL"] = get_uri();

        //make the invitation url with 24hrs validity
        $key = encode_id($this->encrypt->encode('client|' . $email . '|' . (time() + (24 * 60 * 60)) . '|' . $client_id), "signup");
        $parser_data['INVITATION_URL'] = get_uri("signup/accept_invitation/" . $key);

        //send invitation email
        $message = $this->parser->parse_string($email_template->message, $parser_data, TRUE);
        if (send_app_mail($email, $email_template->subject, $message)) {
            echo json_encode(array('success' => true, 'message' => lang("invitation_sent")));
        } else {
            echo json_encode(array('success' => false, 'message' => lang('error_occurred')));
        }
    }

    /* only visible to client  */

    function users() {
        if ($this->login_user->user_type === "client") {
            $view_data['client_id'] = $this->login_user->client_id;
            $this->template->rander("clients/contacts/users", $view_data);
        }
    }

}

/* End of file clients.php */
/* Location: ./application/controllers/clients.php */