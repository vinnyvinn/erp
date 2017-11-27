<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');
require_once("Pre_loader.php");

class Tickets extends Pre_loader
{

    public function __construct()
    {
        parent::__construct();
        $this->init_permission_checker("ticket");
    }

    // load ticket list view
    public function index()
    {
        $this->check_module_availability("module_ticket");

        if ($this->login_user->user_type === "staff") {
            //prepare ticket label filter list
            $label_suggestions = array(array("id" => "", "text" => "- " . lang("label") . " -"));
            $labels = explode(",", $this->Tickets_model->get_label_suggestions());
            $temp_labels = array();

            foreach ($labels as $label) {
                if ($label && !in_array($label, $temp_labels)) {
                    $temp_labels[] = $label;
                    $label_suggestions[] = array("id" => $label, "text" => $label);
                }
            }

            $view_data['ticket_labels_dropdown'] = json_encode($label_suggestions);

            //prepare assign to filter list
            $assigned_to_dropdown = array(array("id" => "", "text" => "- " . lang("assigned_to") . " -"));

            $assigned_to_list = $this->Users_model->get_dropdown_list(array("first_name", "last_name"), "id", array("deleted" => 0, "user_type" => "staff"));
            foreach ($assigned_to_list as $key => $value) {
                $assigned_to_dropdown[] = array("id" => $key, "text" => $value);
            }

            $view_data['assigned_to_dropdown'] = json_encode($assigned_to_dropdown);

            $this->template->rander("tickets/index", $view_data);
        } else {
            $view_data['projects_dropdown'] = $this->Projects_model->getAll($this->login_user->client_id);
            $view_data['page_type'] = "full";
            $this->template->rander("clients/tickets/index", $view_data);
        }
    }

    //load new tickt modal 
    public function modal_form()
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
        $view_data['project_id'] = $this->input->post('project_id');
        if ($this->login_user->user_type == "client") {
            $view_data['projects_dropdown'] = $this->Projects_model->getAll($this->login_user->client_id);
        } else {
            $view_data['projects_dropdown'] = $this->Projects_model->getAll();
        }

        //prepare assign to list
        $assigned_to_dropdown = array("" => "-") + $this->Users_model
                ->get_dropdown_list(
                    ["first_name", "last_name"],
                    "id",
                    ['status' => 'active', "deleted" => 0, "user_type" => "staff"]
                );

        asort($assigned_to_dropdown, SORT_STRING);

        $view_data['assigned_to_dropdown'] = $assigned_to_dropdown;

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


        $this->load->view('tickets/modal_form', $view_data);
    }

    // add a new ticket
    public function save()
    {
        $id = $this->input->post('id');

        validate_submitted_data(array(
            "ticket_type_id" => "required|numeric"
        ));

        $ticket_type_id = $this->input->post('ticket_type_id');
        $assigned_to = $this->input->post('assigned_to');

        $now = get_current_utc_time();
        $ticket_data = array(
            "title" => $this->input->post('title'),
            "project_id" => $this->input->post('project_id'),
            "ticket_type_id" => $ticket_type_id,
            "created_by" => $this->login_user->id,
            "created_at" => $now,
            "last_activity_at" => $now,
            "labels" => $this->input->post('labels'),
            "assigned_to" => $assigned_to ? $assigned_to : 0,
            "external_reference" => $this->input->post('external_reference')
        );

        if ($id) {
            //client can't update ticket
            if ($this->login_user->user_type === "client") {
                redirect("forbidden");
            }

            //remove not updateable fields
            unset($ticket_data['project_id']);
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
                    log_notification("ticket_created", array("ticket_id" => $ticket_id, "ticket_comment_id" => $ticket_comment_id));
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

    // list of tickets, prepared for datatable 
    public function list_data()
    {
        $this->access_only_allowed_members();

        $status = $this->input->post("status");
        $ticket_label = $this->input->post("ticket_label");
        $assigned_to = $this->input->post("assigned_to");
        $options = array("status" => $status, "access_type" => $this->access_type, "ticket_label" => $ticket_label, "assigned_to" => $assigned_to);

        $list_data = $this->Tickets_model->get_details($options)->result();

        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_row($data);
        }
        echo json_encode(array("data" => $result));
    }

    // list of tickets of a specific client, prepared for datatable 
    public function ticket_list_data_of_client($client_id) {
        $this->access_only_allowed_members_or_client_contact($client_id);

        $options = array("client_id" => $client_id, "access_type" => $this->access_type);

        $list_data = $this->Tickets_model->get_details($options)->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_row($data);
        }
        echo json_encode(array("data" => $result));
    }

    // return a row of ticket list table 
    private function _row_data($id) {
        $options = array("id" => $id, "access_type" => $this->access_type);

        $data = $this->Tickets_model->get_details($options)->row();
        return $this->_make_row($data);
    }

    //prepare a row of ticket list table
    private function _make_row($data) {
        $ticket_status_class = "label-danger";
        if ($data->status === "new") {
            $ticket_status_class = "label-warning";
        } else if ($data->status === "closed") {
            $ticket_status_class = "label-success";
        } else if ($data->status === "client_replied" && $this->login_user->user_type === "client") {
            $data->status = "open"; //don't show client_replied status to client
        }

        $ticket_status = "<span class='label $ticket_status_class large'>" . lang($data->status) . "</span> ";


        $title = anchor(get_uri("tickets/view/" . $data->id), $data->title);

        //show labels fild to team members only
        $ticket_labels = "";
        if ($data->labels && $this->login_user->user_type == "staff") {
            $labels = explode(",", $data->labels);
            foreach ($labels as $label) {
                $ticket_labels.="<span class='label label-info'  title='$label'>" . $label . "</span> ";
            }
        }
        if ($ticket_labels) {
            $title.="<span class='pull-right'>" . $ticket_labels . "</span>";
        }

        //show assign to field to team members only
        $assigned_to = "-";
        if ($data->assigned_to && $this->login_user->user_type == "staff") {
            $image_url = get_avatar($data->assigned_to_avatar);
            $assigned_to_user = "<span class='avatar avatar-xs mr10'><img src='$image_url' alt='...'></span> $data->assigned_to_user";
            $assigned_to = get_team_member_profile_link($data->assigned_to, $assigned_to_user);
        }

        $options = "";
        if ($this->login_user->user_type == "staff" && $data->status !== "closed") {
            $options .= modal_anchor(get_uri("tickets/modal_form"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => lang('ticket'), "data-post-view" => "details", "data-post-id" => $data->id));
            $options .= js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete_task'), "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("tickets/delete_ticket"), "data-action" => "delete"));
        }

        return array(
            $data->id,
            $title,
            $data->projectTitle ? anchor(get_uri("projects/view/" . $data->projectId), $data->projectTitle) : "",
            $data->ticket_type,
            $assigned_to,
            $data->external_reference,
            $data->last_activity_at,
            format_to_relative_time($data->last_activity_at),
            $ticket_status,
            $options
        );
    }

    function delete_ticket() {
        $id = $this->input->post('id');
        $info = $this->Tickets_model->get_one($id);

        if ($this->login_user->user_type != "staff" || $info->status == 'closed') {
            redirect("forbidden");
        }

        if ($this->input->post('undo')) {
            if ($this->Tickets_model->delete($id, true)) {
                echo json_encode(array("success" => true, "data" => $this->_ticket_row($id), "message" => lang('record_undone')));
            } else {
                echo json_encode(array("success" => false, lang('error_occurred')));
            }
        } else {
            if ($this->Tickets_model->delete($id)) {
                echo json_encode(array("success" => true, 'message' => lang('record_deleted')));

                $task_info = $this->Tickets_model->get_one($id);
                log_notification("project_task_deleted", array("ticket_id" => $task_info->project_id, "task_id" => $id));
            } else {
                echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
            }
        }
    }


    // load ticket details view 
    public function view($ticket_id = 0)
    {
        if (! $ticket_id) {
            return;
        }

        $options = array("id" => $ticket_id);
        $options["access_type"] = $this->access_type;

        $ticket_info = $this->Tickets_model->get_details($options)->row();
        $this->access_only_allowed_members_or_client_contact($ticket_info->client_id);


        if ($ticket_info) {
            $view_data['ticket_info'] = $ticket_info;

            $comments_options = array("ticket_id" => $ticket_id);
            $view_data['comments'] = $this->Ticket_comments_model->get_details($comments_options)->result();

            $this->template->rander("tickets/view", $view_data);
        } else {
            show_404();
        }
    }

    public function save_comment() {
        $ticket_id = $this->input->post('ticket_id');
        $now = get_current_utc_time();

        $target_path = get_setting("timeline_file_path");
        $files_data = move_files_from_temp_dir_to_permanent_dir($target_path, "ticket");

        $comment_data = array(
            "description" => $this->input->post('description'),
            "ticket_id" => $ticket_id,
            "created_by" => $this->login_user->id,
            "created_at" => $now,
            "files" => $files_data
        );

        validate_submitted_data(array(
            "description" => "required",
            "ticket_id" => "required|numeric"
        ));

        $comment_id = $this->Ticket_comments_model->save($comment_data);
        if ($comment_id) {
            //update ticket status;
            if ($this->login_user->user_type === "client") {
                $ticket_data = array(
                    "status" => "client_replied",
                    "last_activity_at" => $now
                );
            } else {
                $ticket_data = array(
                    "status" => "open",
                    "last_activity_at" => $now
                );
            }
            $this->Tickets_model->save($ticket_data, $ticket_id);

            $comments_options = array("id" => $comment_id);
            $view_data['comment'] = $this->Ticket_comments_model->get_details($comments_options)->row();
            $comment_view = $this->load->view("tickets/comment_row", $view_data, true);
            echo json_encode(array("success" => true, "data" => $comment_view, 'message' => lang('comment_submited')));

            log_notification("ticket_commented", array("ticket_id" => $ticket_id, "ticket_comment_id" => $comment_id));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    public function save_ticket_status($ticket_id = 0, $status = "closed") {

        $status = ($status == "closed") ? "closed" : "open";

        $data = array(
            "status" => $status
        );

        $save_id = $this->Tickets_model->save($data, $ticket_id);

        if ($save_id) {
            $options = array("id" => $ticket_id, "access_type" => $this->access_type);

            $ticket_info = $this->Tickets_model->get_details($options)->row();

            $this->access_only_allowed_members_or_client_contact($ticket_info->client_id);

            $view_data['ticket_info'] = $ticket_info;
            $title_view = $this->load->view("tickets/ticket_sub_title", $view_data, true);
            echo json_encode(array("success" => true, "data" => $title_view, "message" => lang('record_saved')));

            if ($status == "open") {
                log_notification("ticket_reopened", array("ticket_id" => $ticket_id));
            } else if ($status == "closed") {
                log_notification("ticket_closed", array("ticket_id" => $ticket_id));
            }
        } else {
            echo json_encode(array("success" => false, lang('error_occurred')));
        }
    }

    /* download files by zip */

    public function download_comment_files($id) {

        $files = $this->Ticket_comments_model->get_one($id)->files;
        download_app_files(get_setting("timeline_file_path"), $files);
    }

    public function observation_modal() {
        validate_submitted_data(array(
            "id" => "numeric"
        ));

        //client should not be able to edit ticket
        if ($this->login_user->user_type === "client" && $this->input->post('id')) {
            redirect("forbidden");
        }
        $view_data = [];
        $view_data['id'] = $this->input->post('id');

        $this->load->view('tickets/observation_modal_form', $view_data);
    }

    private function createTask($title, $assignedTo, $projectId, $ticketId, $parent = 0, $label = 'Ticket')
    {
        $taskInfo = [
            "title" => $title,
            'assigned_to' => $assignedTo,
            'parent_id' => $parent,
            'priority' => 'High',
            "description" => '',
            "project_id" => $projectId,
            "milestone_id" => 0,
            "points" => 1,
            "status" => 'to_do - 0%',
            "labels" => $label,
            "max_hours" => 0,
            "start_date" => date('Y-m-d'),
            "deadline" => "0000-00-00",
            "ticket_id" => $ticketId
        ];

        return $this->Tasks_model->save($taskInfo);
    }

    private function firstOrCreateParent($title, $assignedTo, $projectId, $ticketId, $parent = 0)
    {
        $tasks = $this->MainTask->get_all_where([
            'title' => $title,
            'project_id' => $projectId
        ])->result();

        if (count($tasks) > 0) {
            return $tasks[0]->id;
        }

        $data = array(
            "title" => 'Ticket: ' . $title,
            "description" => '',
            "project_id" => $projectId,
        );

        return $this->MainTask->save($data);
    }

    public function save_observations()
    {
        $id = $this->input->post('id');
        $ticketInfo = $this->Tickets_model->get_details(['id' => $id])->row();
        $parentId = $this->firstOrCreateParent(
            $ticketInfo->title,
            $ticketInfo->assigned_to,
            $ticketInfo->project_id,
            $ticketInfo->id
        );

        $observationTypes = $this->input->post('observationTypes');
        foreach ($this->input->post('observations') as $key => $observation) {
            $this->createTask(
                $observation,
                $ticketInfo->assigned_to,
                $ticketInfo->project_id,
                $ticketInfo->id,
                $parentId,
                'Ticket,' . $observationTypes[$key]
            );
        }

        $files_data = move_files_from_temp_dir_to_permanent_dir(get_setting("timeline_file_path"), "ticket");

        echo json_encode([
            "success" => true,
            'message' => lang('record_saved')
        ]);
    }

    private function _ticket_row($id)
    {
        return $this->_make_row($this->Tickets_model->get_details([
            'id' => $id
        ])->row());
    }
}

/* End of file tickets.php */
/* Location: ./application/controllers/tickets.php */