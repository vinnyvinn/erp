<?php

/*
 * Define who are allowed to receive notifications
 * Using following terms:
 * team_members, team,
 * project_members, client_primary_contact, client_all_contacts, task_assignee, task_collaborators, comment_creator, leave_applicant, ticket_creator, ticket_assignee
 */
if (!function_exists('get_notification_config')) {

    function get_notification_config($event = "", $key = "", $info_options = array()) {

        $task_link = function($options) {

            $url = "";
            $ajax_url = "";
            $id = "";

            if (isset($options->project_id)) {
                $url = get_uri("projects/view/" . $options->project_id);
            }

            if (isset($options->task_id)) {
                $ajax_url = get_uri("projects/task_view");
                $id = $options->task_id;
            }

            return array("url" => $url, "ajax_modal_url" => $ajax_url, "id" => $id);
        };


        $project_link = function($options) {
            $url = "";
            if (isset($options->project_id)) {
                $url = get_uri("projects/view/" . $options->project_id);

                if ($options->event == "project_customer_feedback_added" || $options->event == "project_customer_feedback_replied") {
                    $url.="/customer_feedback";
                } else if ($options->event == "project_comment_added" || $options->event == "project_comment_replied") {
                    $url.="/comment";
                }
            }

            return array("url" => $url);
        };


        $project_file_link = function($options) {

            $url = "";
            $app_modal_url = "";
            $id = "";

            if (isset($options->project_id)) {
                $url = get_uri("projects/view/" . $options->project_id . "/files");
            }

            if (isset($options->project_file_id)) {
                $app_modal_url = get_uri("projects/view_file/" . $options->project_file_id);
                $id = $options->project_file_id;
            }

            return array("url" => $url, "app_modal_url" => $app_modal_url, "id" => $id);
        };


        $client_link = function($options) {
            $url = "";
            if (isset($options->client_id)) {
                $url = get_uri("clients/view/" . $options->client_id);
            }

            return array("url" => $url);
        };

        $leave_link = function($options) {
            $url = "";
            $ajax_url = "";
            $id = "";

            if (isset($options->leave_id)) {
                $url = get_uri("dashboard");
                $ajax_url = get_uri("leaves/application_details");
                $id = $options->leave_id;
            }

            return array("url" => $url, "ajax_modal_url" => $ajax_url, "id" => $id);
        };


        $ticket_link = function($options) {
            $url = "";
            if (isset($options->ticket_id)) {
                $url = get_uri("tickets/view/" . $options->ticket_id);
            }

            return array("url" => $url);
        };


        $invoice_link = function($options) {
            $url = "";
            if (isset($options->payment_invoice_id)) {
                $url = get_uri("invoices/view/" . $options->payment_invoice_id);
            }

            return array("url" => $url);
        };

        $estimate_link = function($options) {
            $url = "";
            if (isset($options->estimate_id)) {
                $url = get_uri("estimates/preview/" . $options->estimate_id . "/1");
            }

            return array("url" => $url);
        };

        $estimate_request_link = function($options) {
            $url = "";
            if (isset($options->estimate_request_id)) {
                $url = get_uri("estimate_requests/view_estimate_request/" . $options->estimate_request_id);
            }

            return array("url" => $url);
        };



        $events = array(
            "project_created" => array(
                "notify_to" => array("client_primary_contact", "client_all_contacts", "team_members", "team"),
                "info" => $project_link
            ),
            "project_deleted" => array(
                "notify_to" => array("project_members", "client_primary_contact", "client_all_contacts", "team_members", "team")
            ),
            "project_task_created" => array(
                "notify_to" => array("project_members", "client_primary_contact", "client_all_contacts", "task_assignee", "task_collaborators", "team_members", "team"),
                "info" => $task_link
            ),
            "project_task_updated" => array(
                "notify_to" => array("project_members", "client_primary_contact", "client_all_contacts", "task_assignee", "task_collaborators", "team_members", "team"),
                "info" => $task_link
            ),
            "project_task_assigned" => array(
                "notify_to" => array("project_members", "task_assignee", "task_collaborators", "team_members", "team"),
                "info" => $task_link
            ),
            "project_task_started" => array(
                "notify_to" => array("project_members", "client_primary_contact", "client_all_contacts", "team_members", "team"),
                "info" => $task_link
            ),
            "project_task_finished" => array(
                "notify_to" => array("project_members", "client_primary_contact", "client_all_contacts", "team_members", "team"),
                "info" => $task_link
            ),
            "project_task_reopened" => array(
                "notify_to" => array("project_members", "client_primary_contact", "client_all_contacts", "team_members", "team"),
                "info" => $task_link
            ),
            "project_task_commented" => array(
                "notify_to" => array("project_members", "client_primary_contact", "client_all_contacts", "task_assignee", "task_collaborators", "team_members", "team"),
                "info" => $task_link
            ),
            "project_task_deleted" => array(
                "notify_to" => array("project_members", "client_primary_contact", "client_all_contacts", "task_assignee", "task_collaborators", "team_members", "team"),
            ),
            "project_member_added" => array(
                "notify_to" => array("project_members", "team_members", "team"),
                "info" => $project_link
            ),
            "project_member_deleted" => array(
                "notify_to" => array("project_members", "team_members", "team")
            ),
            "project_file_added" => array(
                "notify_to" => array("project_members", "client_primary_contact", "client_all_contacts", "team_members", "team"),
                "info" => $project_file_link
            ),
            "project_file_deleted" => array(
                "notify_to" => array("project_members", "client_primary_contact", "client_all_contacts", "team_members", "team")
            ),
            "project_file_commented" => array(
                "notify_to" => array("project_members", "client_primary_contact", "client_all_contacts", "team_members", "team"),
                "info" => $project_file_link
            ),
            "project_comment_added" => array(
                "notify_to" => array("project_members", "team_members", "team"),
                "info" => $project_link
            ),
            "project_comment_replied" => array(
                "notify_to" => array("project_members", "comment_creator", "team_members", "team"),
                "info" => $project_link
            ),
            "project_customer_feedback_added" => array(
                "notify_to" => array("project_members", "team_members", "team"),
                "info" => $project_link
            ),
            "project_customer_feedback_replied" => array(
                "notify_to" => array("project_members", "client_primary_contact", "client_all_contacts", "comment_creator", "team_members", "team"),
                "info" => $project_link
            ),
            "client_signup" => array(
                "notify_to" => array("team_members", "team"),
                "info" => $client_link
            ),
            "invoice_online_payment_received" => array(
                "notify_to" => array("team_members", "team"),
                "info" => $invoice_link
            ),
            "leave_application_submitted" => array(
                "notify_to" => array("team_members", "team"),
                "info" => $leave_link
            ),
            "leave_approved" => array(
                "notify_to" => array("leave_applicant", "team_members", "team"),
                "info" => $leave_link
            ),
            "leave_assigned" => array(
                "notify_to" => array("leave_applicant", "team_members", "team"),
                "info" => $leave_link
            ),
            "leave_rejected" => array(
                "notify_to" => array("leave_applicant", "team_members", "team"),
                "info" => $leave_link
            ),
            "leave_canceled" => array(
                "notify_to" => array("team_members", "team"),
                "info" => $leave_link
            ),
            "ticket_created" => array(
                "notify_to" => array("client_primary_contact", "client_all_contacts", "ticket_assignee", "team_members", "team"),
                "info" => $ticket_link
            ),
            "ticket_commented" => array(
                "notify_to" => array("client_primary_contact", "client_all_contacts", "ticket_creator", "ticket_assignee", "team_members", "team"),
                "info" => $ticket_link
            ),
            "ticket_closed" => array(
                "notify_to" => array("client_primary_contact", "client_all_contacts", "ticket_creator", "ticket_assignee", "team_members", "team"),
                "info" => $ticket_link
            ),
            "ticket_reopened" => array(
                "notify_to" => array("client_primary_contact", "client_all_contacts", "ticket_creator", "ticket_assignee", "team_members", "team"),
                "info" => $ticket_link
            ),
            "estimate_request_received" => array(
                "notify_to" => array("team_members", "team"),
                "info" => $estimate_request_link
            ),
            "estimate_sent" => array(
                "notify_to" => array("client_primary_contact", "client_all_contacts", "team_members", "team"),
                "info" => $estimate_link
            ),
            "estimate_accepted" => array(
                "notify_to" => array("team_members", "team"),
                "info" => $estimate_link
            ),
            "estimate_rejected" => array(
                "notify_to" => array("team_members", "team"),
                "info" => $estimate_link
            )
        );

        if ($event) {
            $result = get_array_value($events, $event);
            if ($key && $result) {
                $key_result = get_array_value($result, $key);
                if ($info_options && $key_result) {
                    return $key_result($info_options);
                } else {
                    return $key_result;
                }
            } else {
                return $result;
            }
        } else {
            return $events;
        }
    }

}



/*
 * Send notification emails
 */
if (!function_exists('send_notification_emails')) {

    function send_notification_emails($notification_id, $email_notify_to) {

        $ci = & get_instance();


        $notification = $ci->Notifications_model->get_email_notification($notification_id);

        if (!$notification) {
            return false;
        }

        $url = get_uri();
        $parser_data = array();
        $info = get_notification_config($notification->event, "info", $notification);

        if (is_array($info) && get_array_value($info, "url")) {
            $url = get_array_value($info, "url");
        }

        if ($notification->category == "ticket") {
            $email_template = $ci->Email_templates_model->get_final_template($notification->event);

            $parser_data["TICKET_ID"] = $notification->ticket_id;
            $parser_data["TICKET_TITLE"] = $notification->ticket_title;
            $parser_data["USER_NAME"] = $notification->user_name;
            $parser_data["TICKET_CONTENT"] = nl2br($notification->ticket_comment_description);
            $parser_data["TICKET_URL"] = $url;
        } else {
            $email_template = $ci->Email_templates_model->get_final_template("general_notification");

            $parser_data["EVENT_TITLE"] = "<b>" . $notification->user_name . "</b> " . sprintf(lang("notification_" . $notification->event), $notification->to_user_name);
            $parser_data["NOTIFICATION_URL"] = $url;
            $parser_data["APP_TITLE"] = get_setting("app_title");
            $parser_data["COMPANY_NAME"] = get_setting("company_name");

            $view_data["notification"] = $notification;
            $parser_data["EVENT_DETAILS"] = $ci->load->view("notifications/notification_description", $view_data, true);
        }

        $parser_data["SIGNATURE"] = $email_template->signature;
        $message = $ci->parser->parse_string($email_template->message, $parser_data, TRUE);

        $parser_data["EVENT_TITLE"] = $notification->user_name . " " . sprintf(lang("notification_" . $notification->event), $notification->to_user_name);
        $subject = $ci->parser->parse_string($email_template->subject, $parser_data, TRUE);

        if ($email_notify_to) {
            $email_notify_to_array = explode(",", $email_notify_to);
            foreach ($email_notify_to_array as $email_address) {
                send_app_mail($email_address, $subject, $message);
            }
        }
    }

}