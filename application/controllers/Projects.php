<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');
require_once("Pre_loader.php");

class Projects extends Pre_loader {

    private $is_user_a_project_member = false;
    private $is_clients_project = false; //check if loged in user's client's project

    public function __construct() {
        parent::__construct();
        $this->load->helper(array('form', 'url'));
    }

    // When checking project permissions, to reduce db query we'll use this init function, where team members has to be access on the project
    private function init_project_permission_checker($project_id = 0) {
        if ($this->login_user->user_type == "client") {
            $project_info = $this->Projects_model->get_one($project_id);
            if ($project_info->client_id == $this->login_user->client_id) {
                $this->is_clients_project = true;
            }
        } else {
            $this->is_user_a_project_member = $this->Project_members_model->is_user_a_project_member($project_id, $this->login_user->id);
        }
    }

    private function can_edit_projects() {
        if ($this->login_user->user_type == "staff") {
            if ($this->login_user->is_admin) {
                return true;
            } else if (get_array_value($this->login_user->permissions, "can_edit_projects") == "1") {
                return true;
            }
        }
    }

    private function can_delete_projects() {
        if ($this->login_user->user_type == "staff") {
            if ($this->login_user->is_admin) {
                return true;
            } else if (get_array_value($this->login_user->permissions, "can_delete_projects") == "1") {
                return true;
            }
        }
    }

    private function can_add_remove_project_members() {
        if ($this->login_user->user_type == "staff") {
            if ($this->login_user->is_admin) {
                return true;
            } else if (get_array_value($this->login_user->permissions, "can_add_remove_project_members") == "1") {
                return true;
            }
        }
    }

    private function can_view_tasks() {
        if ($this->login_user->user_type == "staff") {
            if ($this->login_user->is_admin) {
                return true;
            } else if ($this->is_user_a_project_member) {
                //all team members who has access to project can view tasks
                return true;
            }
        } else {
            //check settings for client's project permission
            if (get_setting("client_can_view_tasks")) {
                //even the settings allow to create/edit task, the client can only create their own project's tasks
                return $this->is_clients_project;
            }
        }
    }

    private function can_create_tasks() {
        if ($this->login_user->user_type == "staff") {
            if ($this->login_user->is_admin) {
                return true;
            } else if (get_array_value($this->login_user->permissions, "can_create_tasks") == "1") {
                //check is user a project member
                return $this->is_user_a_project_member;
            }
        } else {
            //check settings for client's project permission
            if (get_setting("client_can_create_tasks")) {
                return $this->is_clients_project;
            }
        }
    }

    private function can_edit_tasks() {
        if ($this->login_user->user_type == "staff") {
            if ($this->login_user->is_admin) {
                return true;
            } else if (get_array_value($this->login_user->permissions, "can_edit_tasks") == "1") {
                //check is user a project member
                return $this->is_user_a_project_member;
            }
        } else {
            //check settings for client's project permission
            if (get_setting("client_can_edit_tasks")) {
                return $this->is_clients_project;
            }
        }
    }

    private function can_delete_tasks() {
        if ($this->login_user->user_type == "staff") {
            if ($this->login_user->is_admin) {
                return true;
            } else if (get_array_value($this->login_user->permissions, "can_delete_tasks") == "1") {
                //check is user a project member
                return $this->is_user_a_project_member;
            }
        } else {
            //check settings for client's project permission
            if (get_setting("client_can_delete_tasks")) {
                return $this->is_clients_project;
            }
        }
    }

    private function can_comment_on_tasks() {
        if ($this->login_user->user_type == "staff") {
            if ($this->login_user->is_admin) {
                return true;
            } else if (get_array_value($this->login_user->permissions, "can_comment_on_tasks") == "1") {
                //check is user a project member
                return $this->is_user_a_project_member;
            }
        } else {
            //check settings for client's project permission
            if (get_setting("client_can_comment_on_tasks")) {
                //even the settings allow to create/edit task, the client can only create their own project's tasks
                return $this->is_clients_project;
            }
        }
    }

    private function can_create_milestones() {
        if ($this->login_user->user_type == "staff") {
            if ($this->login_user->is_admin) {
                return true;
            } else if (get_array_value($this->login_user->permissions, "can_create_milestones") == "1") {
                //check is user a project member
                return $this->is_user_a_project_member;
            }
        }
    }

    private function can_edit_milestones() {
        if ($this->login_user->user_type == "staff") {
            if ($this->login_user->is_admin) {
                return true;
            } else if (get_array_value($this->login_user->permissions, "can_edit_milestones") == "1") {
                //check is user a project member
                return $this->is_user_a_project_member;
            }
        }
    }

    private function can_delete_milestones() {
        if ($this->login_user->user_type == "staff") {
            if ($this->login_user->is_admin) {
                return true;
            } else if (get_array_value($this->login_user->permissions, "can_delete_milestones") == "1") {
                //check is user a project member
                return $this->is_user_a_project_member;
            }
        }
    }

    private function can_delete_files() {
        if ($this->login_user->user_type == "staff") {
            if ($this->login_user->is_admin) {
                return true;
            } else if (get_array_value($this->login_user->permissions, "can_delete_files") == "1") {
                //check is user a project member
                return $this->is_user_a_project_member;
            }
        }
    }

    private function can_view_files() {
        if ($this->login_user->user_type == "staff") {
            if ($this->login_user->is_admin) {
                return true;
            } else {
                //check is user a project member
                return $this->is_user_a_project_member;
            }
        } else {
            //check settings for client's project permission
            if (get_setting("client_can_view_project_files")) {
                return $this->is_clients_project;
            }
        }
    }

    private function can_add_files() {
        if ($this->login_user->user_type == "staff") {
            if ($this->login_user->is_admin) {
                return true;
            } else {
                //check is user a project member
                return $this->is_user_a_project_member;
            }
        } else {
            //check settings for client's project permission
            if (get_setting("client_can_add_project_files")) {
                return $this->is_clients_project;
            }
        }
    }

    private function can_comment_on_files() {
        if ($this->login_user->user_type == "staff") {
            if ($this->login_user->is_admin) {
                return true;
            } else {
                //check is user a project member
                return $this->is_user_a_project_member;
            }
        } else {
            //check settings for client's project permission
            if (get_setting("client_can_comment_on_files")) {
                //even the settings allow to create/edit task, the client can only comment on their own project's files
                return $this->is_clients_project;
            }
        }
    }

    private function can_view_gantt() {
        if ($this->login_user->user_type == "staff") {
            if ($this->login_user->is_admin) {
                return true;
            } else {
                //check is user a project member
                return $this->is_user_a_project_member;
            }
        }
    }

    /* load project view */

    function index() {
        redirect("projects/all_projects");
    }

    function all_projects() {
        $label_suggestions = array(array("id" => "", "text" => "- " . lang("label") . " -"));
        $labels = explode(",", $this->Projects_model->get_label_suggestions());
        $temp_labels = array();

        foreach ($labels as $label) {
            if ($label && !in_array($label, $temp_labels)) {
                $temp_labels[] = $label;
                $label_suggestions[] = array("id" => $label, "text" => $label);
            }
        }

        $view_data['project_labels_dropdown'] = json_encode($label_suggestions);

        if ($this->login_user->user_type === "staff") {

            $view_data["can_create_projects"] = $this->can_create_projects();
            $view_data["can_edit_projects"] = $this->can_edit_projects();
            $view_data["can_delete_projects"] = $this->can_delete_projects();

            $this->template->rander("projects/index", $view_data);
        } else {
            $view_data['client_id'] = $this->login_user->client_id;
            $view_data['page_type'] = "full";
            $this->template->rander("clients/projects/index", $view_data);
        }
    }

    /* load project  add/edit modal */

    function get_sage_projects_dropdown_list($option_fields = array(), $key = "ProjectLink") {
        $list_data = $this->SAGE_DB()->get('Project')->result();
        $result = array();
        foreach ($list_data as $data) {
            $text = "";
            foreach ($option_fields as $option) {
                $text.=$data->$option . " ";
            }
            $result[$data->$key] = $text;
        }
        return $result;
    }

    function get_sage_project_data($id, $return) {
        return $this->SAGE_DB()->get_where('Project', array('ProjectLink' => $id))->result()[0]->$return;
    }

    function get_sage_client_data($id, $return) {
        return $this->SAGE_DB()->get_where('Client', array('DCLink' => $id))->result()[0]->$return;
    }

    function get_sage_clients_dropdown_list($option_fields = array(), $key = "DCLink") {
        $list_data = $this->SAGE_DB()->get('Client')->result();
        $result = array();
        foreach ($list_data as $data) {
            $text = "";
            foreach ($option_fields as $option) {
                $text.=$data->$option . " ";
            }
            $result[$data->$key] = $text;
        }
        return $result;
    }

    function modal_form() {

        $project_id = $this->input->post('id');
        $client_id = $this->input->post('client_id');
        $sage_project_id = $this->input->post('sage_project_id');

        if ($project_id) {
            if (!$this->can_edit_projects()) {
                redirect("forbidden");
            }
        } else {
            if (!$this->can_create_projects()) {
                redirect("forbidden");
            }
        }

        $view_data['model_info'] = $this->Projects_model->get_one($project_id);
        if ($client_id) {
            $view_data['model_info']->client_id = $client_id;
        }
        if ($sage_project_id) {
            $view_data['model_info']->sage_project_id = $sage_project_id;
        }


        // $view_data['clients_dropdown'] = $this->Clients_model->get_dropdown_list(array("company_name"));
        $view_data['clients_dropdown'] = $this->get_sage_clients_dropdown_list(array("Account", "Name"));
        $view_data['sage_projects_dropdown'] = $this->get_sage_projects_dropdown_list(array("ProjectCode", "ProjectName"));

        $labels = explode(",", $this->Projects_model->get_label_suggestions());
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


        $this->load->view('projects/modal_form', $view_data);

    }

    /* insert or update a project */

    function save_xlsx() {

        $project_id = $this->input->post('project_id');
        $id = $this->input->post('id');

        $this->init_project_permission_checker($project_id);

        if ($id) {
            if (!$this->can_edit_tasks()) {
                redirect("forbidden");
            }
        } else {
            if (!$this->can_create_tasks()) {
                redirect("forbidden");
            }
        }

        $config['upload_path']   = APPPATH.'uploads/xlsx/'; 
        $config['allowed_types'] = 'csv|xlsx'; 
        $config['max_size']      = 100;

        $this->load->library('upload', $config);

        if (!$this->upload->do_upload('xlsx_file')) {
            $error = array('error' => $this->upload->display_errors());
            // $this->load->view('upload_form', $error);
            print_r($error);
        }

        else {

            $data = array('upload_data' => $this->upload->data()); 
            $objPHPExcel = PHPExcel_IOFactory::load($config['upload_path'] . "/" .$data['upload_data']['file_name']);
            $allDataInSheet = $objPHPExcel->getActiveSheet()->toArray(null,true,true,true);
            unset($allDataInSheet[1]); // remove the header row

            foreach($allDataInSheet as $import) {

                $assigned_to = $this->input->post('assigned_to');
                $collaborators = $this->input->post('collaborators');
                $this->updateResources($assigned_to, $collaborators, $project_id);

                $data = array(
                    'parent_id' => $this->input->post('parent_id'),
                    'serial' => $import['A'],
                    'priority' => $this->input->post('priority'),
                    "title" => $import['B'],
                    "description" => $import['C'],
                    "project_id" => $project_id,
                    "milestone_id" => $this->input->post('milestone_id'),
                    "points" => $this->input->post('points'),
                    "status" => $this->input->post('status'),
                    "labels" => $import['D'], // $this->input->post('labels'),
                    "max_hours" => $import['E'],
                    "start_date" => date("Y-m-d", strtotime($import['F'])),
                    "deadline" => date("Y-m-d", strtotime($import['G']))
                );

                //clint can't save the assign to and collaborators
                if ($this->login_user->user_type == "client") {
                    if (!$id) { //it's new data to save
                        $data["assigned_to"] = 0;
                        $data["collaborators"] = "";
                    }
                } else {
                    $data["assigned_to"] = $assigned_to;
                    $data["collaborators"] = $collaborators;
                }

                $save_id = $this->Tasks_model->save($data, $id);
                if ($save_id) {

                    if ($id) {
                    //updated
                        log_notification("project_task_updated", array("project_id" => $project_id, "task_id" => $save_id, "activity_log_id" => get_array_value($data, "activity_log_id")));
                    } else {
                    //created
                        log_notification("project_task_created", array("project_id" => $project_id, "task_id" => $save_id));
                    }

                    // echo json_encode(array("success" => true, "data" => $this->_task_row_data($save_id), 'id' => $save_id, 'message' => lang('record_saved')));
                } else {
                    //echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
                }
            }
        }

        redirect(base_url().'projects/view/'. $project_id);
    }

    function save() {

        $id = $this->input->post('id');

        if ($id) {
            if (!$this->can_edit_projects()) {
                redirect("forbidden");
            }
        } else {
            if (!$this->can_create_projects()) {
                redirect("forbidden");
            }
        }

        // validate_submitted_data(array(
        //     "title" => "required"
        //     ));

        $now = get_current_utc_time();

        $data = array(
            "title" => $this->get_sage_project_data($this->input->post('sage_project_id'), "ProjectCode") . " : " . $this->get_sage_project_data($this->input->post('sage_project_id'), "ProjectName"),
            "description" => $this->input->post('description'),
            "client_id" => $this->input->post('client_id'),
            "sage_client_id" => $this->input->post('client_id'), //$this->input->post('sage_client_id'),
            "sage_project_id" => $this->input->post('sage_project_id'),
            "start_date" => $this->input->post('start_date') * 1 ? $this->input->post('start_date') : "0000-00-00",
            "deadline" => $this->input->post('deadline') * 1 ? $this->input->post('deadline') : "0000-00-00",
            "price" => unformat_currency($this->input->post('price')),
            "created_date" => $now,
            "labels" => $this->input->post('labels'),
            "status" => $this->input->post('status') ? $this->input->post('status') : "open",
            );

        /*echo "<pre>";
        print_r($data);*/

        $save_id = $this->Projects_model->save($data, $id);

        if ($save_id) {
            if (!$id) {
                // this is a new project
                // add default project member after project creation
                $data = array(
                    "project_id" => $save_id,
                    "user_id" => $this->login_user->id,
                    "is_leader" => 1
                    );

                $this->Project_members_model->save_member($data);

                log_notification("project_created", array("project_id" => $save_id));
            }
            echo json_encode(array("success" => true, "data" => $this->_row_data($save_id), 'id' => $save_id, 'message' => lang('record_saved')));

        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }

    }

    /* Show a modal to clone a project */

    function clone_project_modal_form() {

        $project_id = $this->input->post('id');

        if (!$this->can_create_projects()) {
            redirect("forbidden");
        }


        $view_data['model_info'] = $this->Projects_model->get_one($project_id);

        $view_data['clients_dropdown'] = $this->Clients_model->get_dropdown_list(array("company_name"));

        $labels = explode(",", $this->Projects_model->get_label_suggestions());
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


        $this->load->view('projects/clone_project_modal_form', $view_data);
    }

    /* create a new project from another project */

    function save_cloned_project() {

        ini_set('max_execution_time', 300); //300 seconds 

        $project_id = $this->input->post('project_id');

        if (!$this->can_create_projects()) {
            redirect("forbidden");
        }

        validate_submitted_data(array(
            "title" => "required"
        ));


        $copy_same_assignee_and_collaborators = $this->input->post("copy_same_assignee_and_collaborators");
        $copy_milestones = $this->input->post("copy_milestones");
        $copy_tasks_start_date_and_deadline = $this->input->post("copy_tasks_start_date_and_deadline");


        //prepare new project data
        $now = get_current_utc_time();
        $data = array(
            "title" => $this->input->post('title'),
            "description" => $this->input->post('description'),
            "client_id" => $this->input->post('client_id'),
            "start_date" => $this->input->post('start_date') * 1 ? $this->input->post('start_date') : "0000-00-00",
            "deadline" => $this->input->post('deadline') * 1 ? $this->input->post('deadline') : "0000-00-00",
            "price" => unformat_currency($this->input->post('price')),
            "created_date" => $now,
            "labels" => $this->input->post('labels'),
            "status" => "open",
        );

        //add new project
        $new_project_id = $this->Projects_model->save($data);

        //add milestones
        //when the new milestones will be created the ids will be different. so, we have to convert the milestone ids. 
        $milestones_array = array();

        if ($copy_milestones) {
            $milestones = $this->Milestones_model->get_all_where(array("project_id" => $project_id, "deleted" => 0))->result();
            foreach ($milestones as $milestone) {
                $old_milestone_id = $milestone->id;

                //prepare new milestone data. remove id from existing data
                $milestone->project_id = $new_project_id;
                $milestone_data = (array) $milestone;
                unset($milestone_data["id"]);

                //add new milestone and keep a relation with new id and old id
                $milestones_array[$old_milestone_id] = $this->Milestones_model->save($milestone_data);
            }
        }



        //add tasks
        $tasks = $this->Tasks_model->get_all_where(array("project_id" => $project_id, "deleted" => 0))->result();
        foreach ($tasks as $task) {

            //prepare new task data. 
            $task->project_id = $new_project_id;
            $milestone_id = get_array_value($milestones_array, $task->milestone_id);
            $task->milestone_id = $milestone_id ? $milestone_id : "";
            $task->status = "to_do - 0%";

            if (!$copy_same_assignee_and_collaborators) {
                $task->assigned_to = "";
                $task->collaborators = "";
            }

            if (!$copy_tasks_start_date_and_deadline) {
                $task->start_date = "";
                $task->deadline = "";
            }

            $task_data = (array) $task;
            unset($task_data["id"]); //remove id from existing data
            //add new task
            $this->Tasks_model->save($task_data);
        }

        //add project members
        $project_members = $this->Project_members_model->get_all_where(array("project_id" => $project_id, "deleted" => 0))->result();

        foreach ($project_members as $project_member) {
            //prepare new project member data. remove id from existing data
            $project_member->project_id = $new_project_id;
            $project_member_data = (array) $project_member;
            unset($project_member_data["id"]);

            $this->Project_members_model->save_member($project_member_data);
        }


        if ($new_project_id) {
            log_notification("project_created", array("project_id" => $new_project_id));

            echo json_encode(array("success" => true, 'id' => $new_project_id, 'message' => lang('project_cloned_successfully')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    /* delete or undo a project */

    function delete() {

        if (!$this->can_delete_projects()) {
            redirect("forbidden");
        }


        $id = $this->input->post('id');

        if ($this->input->post('undo')) {
            if ($this->Projects_model->delete($id, true)) {
                echo json_encode(array("success" => true, "data" => $this->_row_data($id), "message" => lang('record_undone')));
            } else {
                echo json_encode(array("success" => false, lang('error_occurred')));
            }
        } else {
            if ($this->Projects_model->delete($id)) {

                log_notification("project_deleted", array("project_id" => $id));

                echo json_encode(array("success" => true, 'message' => lang('record_deleted')));
            } else {
                echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
            }
        }
    }

    /* list of projcts, prepared for datatable  */

    function list_data() {
        $this->access_only_team_members();
        $options = array(
            "status" => $this->input->post("status"),
            "project_label" => $this->input->post("project_label")
        );


        //only admin can see all projects, other team mebers can see only their own projects.
        if (!$this->login_user->is_admin) {
            $options["user_id"] = $this->login_user->id;
        }

        $list_data = $this->Projects_model->get_details($options)->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_row($data);
            // $result[] = $data;
        }

        echo json_encode(array("data" => $result));
    }

    /* list of projcts, prepared for datatable  */

    function projects_list_data_of_team_member($team_member_id = 0) {
        $this->access_only_team_members();
        $options = array(
            "status" => $this->input->post("status")
        );

        //add can see all members projects but team members can see only ther own projects
        if (!$this->login_user->is_admin && $team_member_id != $this->login_user->id) {
            redirect("forbidden");
        }

        $options["user_id"] = $team_member_id;


        $list_data = $this->Projects_model->get_details($options)->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_row($data);
        }
        echo json_encode(array("data" => $result));
    }

    function projects_list_data_of_client($client_id) {

        $this->access_only_team_members_or_client_contact($client_id);

        $options = array(
            "client_id" => $client_id,
            "status" => $this->input->post("status"),
            "project_label" => $this->input->post("project_label")
        );

        $list_data = $this->Projects_model->get_details($options)->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_row($data);
        }
        echo json_encode(array("data" => $result));
    }

    /* return a row of project list  table */

    private function _row_data($id) {
        $options = array("id" => $id);
        $data = $this->Projects_model->get_details($options)->row();
        return $this->_make_row($data);
    }

    /* prepare a row of project list table */

    private function _make_row($data) {

        $progress = $data->total_points ? round(($data->completed_points / $data->total_points) * 100) : 0;

        $class = "progress-bar-primary";
        if ($progress == 100) {
            $class = "progress-bar-success";
        }

        $progress_bar = "<div class='progress' title='$progress%'>
            <div  class='progress-bar $class' role='progressbar' aria-valuenow='$progress' aria-valuemin='0' aria-valuemax='100' style='width: $progress%'>
            </div>
        </div>";
        $start_date = $data->start_date * 1 ? format_to_date($data->start_date) : "-";
        $dateline = $data->deadline * 1 ? format_to_date($data->deadline) : "-";
        $price = $data->price ? to_currency($data->price, $data->currency_symbol) : "-";

        //has deadline? change the color of date based on status
        if ($data->deadline * 1) {
            if ($progress !== 100 && $data->status === "open" && get_my_local_time("Y-m-d") > $data->deadline) {
                $dateline = "<span class='text-danger mr5'>" . $dateline . "</span> ";
            } else if ($progress !== 100 && $data->status === "open" && get_my_local_time("Y-m-d") == $data->deadline) {
                $dateline = "<span class='text-warning mr5'>" . $dateline . "</span> ";
            }
        }

        $title = anchor(get_uri("projects/view/" . $data->id), $data->title);
        $project_labels = "";
        if ($data->labels) {
            $labels = explode(",", $data->labels);
            foreach ($labels as $label) {
                $project_labels.="<span class='label label-info'  title='Label'>" . $label . "</span> ";
            }
            $title.="<br />" . $project_labels;
        }

        $optoins = "";
        if ($this->can_edit_projects()) {
            $optoins.=modal_anchor(get_uri("projects/modal_form"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => lang('edit_project'), "data-post-id" => $data->id));
        }

        if ($this->can_delete_projects()) {
            $optoins.=js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete_project'), "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("projects/delete"), "data-action" => "delete"));
        }

        //show the project price to them who has permission to create projects
        if ($this->login_user->user_type == "staff" && !$this->can_create_projects()) {
            $price = "-";
        }

        return array(
            anchor(get_uri("projects/view/" . $data->id), $data->id),
            $title,
            // anchor(get_uri("clients/view/" . $data->client_id), $data->company_name),
            $this->get_sage_client_data($data->client_id, "Account") . " : " . $this->get_sage_client_data($data->client_id, "Name"),
            $price,
            $data->start_date,
            $start_date,
            $data->deadline,
            $dateline,
            $progress_bar,
            lang($data->status),
            $optoins
        );
    }

    /* load project details view */

    function view($project_id = 0, $tab = "") {

        $view_data = $this->_get_project_info_data($project_id);

        $access_info = $this->get_access_info("invoice");
        $view_data["show_invoice_info"] = (get_setting("module_invoice") && $access_info->access_type == "all") ? true : false;

        $expense_access_info = $this->get_access_info("expense");
        $view_data["show_expense_info"] = (get_setting("module_expense") && $expense_access_info->access_type == "all") ? true : false;

        $view_data["can_create_projects"] = $this->can_create_projects();

        $view_data["show_timmer"] = true;
        $view_data["show_tasks"] = true;
        if ($this->login_user->user_type === "client") {
            $this->init_project_permission_checker($project_id);
            $view_data["show_timmer"] = false;
            $view_data["show_tasks"] = $this->can_view_tasks();
        }

        $view_data["show_files"] = $this->can_view_files();

        $view_data["tab"] = $tab;


        $this->template->rander("projects/details_view", $view_data);
    }

    /* prepare project info data for reuse */

    private function _get_project_info_data($project_id) {
        $options = array(
            "id" => $project_id,
            "client_id" => $this->login_user->client_id,
        );

        if (!$this->login_user->is_admin) {
            $options["user_id"] = $this->login_user->id;
        }

        $project_info = $this->Projects_model->get_details($options)->row();
        $view_data['project_info'] = $project_info;

        if ($project_info) {
            $view_data['project_info'] = $project_info;

            $totalUsers = $this->Team_model->count()->result()[0]->total;
            $rate = is_numeric(get_setting('admin_costs')) ? intval(get_setting('admin_costs')) : 1;
            $hours = is_numeric(get_setting('working_hours')) ? intval(get_setting('working_hours')) : 1;
            $individualRate = $rate / ($totalUsers * $hours);
            $view_data['rate'] = round($individualRate, 2);

            $timeCost = $this->Tasks_model->getCurrentCost($project_id)->result()[0];
            $estimatedCost = $this->Tasks_model->getEstimatedCost($project_id, $individualRate)->result();

            $view_data['resourceCost'] = ($individualRate * $timeCost->time_rate) + $timeCost->total_cost;
            $view_data['expenses'] = floatval($this->Expenses_model->getProjectCost($project_id));
            $view_data['totalCost'] = $view_data['resourceCost'] + $view_data['expenses'];
            $view_data['costVariance'] = $project_info->price - $view_data['totalCost'];
            $view_data['estimateCost'] = count($estimatedCost) > 0 ? $estimatedCost[0]->estimate : 0;


            $timer = $this->Timesheets_model->get_timer_info($project_id, $this->login_user->id)->row();

            if ($timer) {
                $view_data['timer_status'] = "open";
            } else {
                $view_data['timer_status'] = "";
            }

            $view_data['project_progress'] = $project_info->total_points ? round(($project_info->completed_points / $project_info->total_points) * 100) : 0;

            return $view_data;
        } else {
            show_404();
        }
    }

    /* load project overview section */

    function overview($project_id) {
        $this->access_only_team_members();
        $this->init_project_permission_checker($project_id);

        $view_data = $this->_get_project_info_data($project_id);
        $task_statuses = $this->Tasks_model->get_task_statistics(array("project_id" => $project_id));

        $view_data['taskStatus']["to_do - 0%"] = 0;
        $view_data['taskStatus']["in_progress - 25%"] = 0;
        $view_data['taskStatus']["in_progress - 50%"] = 0;
        $view_data['taskStatus']["in_progress - 75%"] = 0;
        $view_data['taskStatus']["done - 100%"] = 0;
        foreach ($task_statuses as $status) {
            $view_data['taskStatus'][$status->status] = $status->total;
        }

        $view_data['project_id'] = $project_id;
        $offset = 0;
        $view_data['offset'] = $offset;
        $view_data['activity_logs_params'] = array("log_for" => "project", "log_for_id" => $project_id, "limit" => 20, "offset" => $offset);

        $view_data["can_add_remove_project_members"] = $this->can_add_remove_project_members();

        $this->load->view('projects/overview', $view_data);
    }

    /* load project overview section */

    function overview_for_client($project_id) {
        if ($this->login_user->user_type === "client") {
            $view_data = $this->_get_project_info_data($project_id);

            $view_data['project_id'] = $project_id;
            $this->load->view('projects/overview_for_client', $view_data);
        }
    }

    /* load project members add/edit modal */

    function project_member_modal_form() {

        $view_data['model_info'] = $this->Project_members_model->get_one($this->input->post('id'));
        $project_id = $this->input->post('project_id') ? $this->input->post('project_id') : $view_data['model_info']->project_id;

        $this->init_project_permission_checker($project_id);

        if (!$this->can_add_remove_project_members()) {
            redirect("forbidden");
        }

        $view_data['project_id'] = $project_id;
        $view_data['users_dropdown'] = $this->Users_model->get_dropdown_list(array("first_name", "last_name"), "id", array("user_type" => "staff"));
        $this->load->view('projects/project_members/modal_form', $view_data);
    }

    /* add a project members  */

    function save_project_member() {
        $project_id = $this->input->post('project_id');

        $this->init_project_permission_checker($project_id);

        if (!$this->can_add_remove_project_members()) {
            redirect("forbidden");
        }

        $project_member_id = $this->input->post('user_id');

        $data = array(
            "project_id" => $project_id,
            "user_id" => $project_member_id
        );
        $save_id = $this->Project_members_model->save_member($data);
        if ($save_id && $save_id == "exists") {
            //this member already exists.
            echo json_encode(array("success" => true, 'id' => $save_id));
        } else if ($save_id) {
            log_notification("project_member_added", array("project_id" => $project_id, "to_user_id" => $project_member_id));
            echo json_encode(array("success" => true, "data" => $this->_project_member_row_data($save_id), 'id' => $save_id, 'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    /* delete/undo a project members  */

    function delete_project_member() {
        $id = $this->input->post('id');
        $project_member_info = $this->Project_members_model->get_one($id);

        $this->init_project_permission_checker($project_member_info->project_id);
        if (!$this->can_add_remove_project_members()) {
            redirect("forbidden");
        }


        if ($this->input->post('undo')) {
            if ($this->Project_members_model->delete($id, true)) {
                echo json_encode(array("success" => true, "data" => $this->_project_member_row_data($id), "message" => lang('record_undone')));
            } else {
                echo json_encode(array("success" => false, lang('error_occurred')));
            }
        } else {
            if ($this->Project_members_model->delete($id)) {

                $project_member_info = $this->Project_members_model->get_one($id);

                log_notification("project_member_deleted", array("project_id" => $project_member_info->project_id, "to_user_id" => $project_member_info->user_id));
                echo json_encode(array("success" => true, 'message' => lang('record_deleted')));
            } else {
                echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
            }
        }
    }

    /* list of project members, prepared for datatable  */

    function project_member_list_data($project_id = 0) {
        $this->access_only_team_members();
        $this->init_project_permission_checker($project_id);

        $options = array("project_id" => $project_id);
        $list_data = $this->Project_members_model->get_details($options)->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_project_member_row($data);
        }
        echo json_encode(array("data" => $result));
    }

    /* return a row of project member list */

    private function _project_member_row_data($id) {
        $options = array("id" => $id);
        $data = $this->Project_members_model->get_details($options)->row();
        return $this->_make_project_member_row($data);
    }

    /* prepare a row of project member list */

    private function _make_project_member_row($data) {
        $image_url = get_avatar($data->member_image);
        $member = get_team_member_profile_link($data->user_id, "<span class='avatar avatar-xs mr10'><img src='$image_url' alt='...'></span> $data->member_name");
        $link = "";

        //check message module availability and show message button
        if (get_setting("module_message") && ($this->login_user->id != $data->user_id)) {
            $link = modal_anchor(get_uri("messages/modal_form/" . $data->user_id), "<i class='fa fa-envelope-o'></i>", array("class" => "edit", "title" => lang('send_message')));
        }

        $can_add_remove_project_members = $this->can_add_remove_project_members();
        if ($can_add_remove_project_members && !$data->is_leader && $data->user_id != $this->login_user->id) {
            $link.= js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete_member'), "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("projects/delete_project_member"), "data-action" => "delete"));
        }
        $member = '<div class="pull-left">' . $member . '</div><div class="pull-right"><label class="label label-light ml10">' . $data->job_title . '</label></div>';
        return array($member,
            $link
        );
    }

    /* start/stop project timer */

    function timer($project_id, $timer_status = "start") {
        $this->access_only_team_members();
        $data = array(
            "project_id" => $project_id,
            "user_id" => $this->login_user->id,
            "status" => $timer_status,
        );
        $this->Timesheets_model->process_timer($data);
        $view_data = $this->_get_project_info_data($project_id);
        $this->load->view('projects/project_timer', $view_data);
    }

    /* load timesheets view */

    function timesheets($project_id) {
        $this->access_only_team_members();
        $view_data['project_id'] = $project_id;

//        $project_members = $this->Project_members_model->get_project_members_dropdown_list($project_id)->result();
        $project_members = $this->Users_model->all_dropdown()->result();
        $project_members_dropdown = array(array("id" => "", "text" => "- " . lang("member") . " -"));
        foreach ($project_members as $member) {
            $project_members_dropdown[] = array("id" => $member->user_id, "text" => $member->member_name);
        }
        $view_data['project_members_dropdown'] = json_encode($project_members_dropdown);
        $this->load->view("projects/timesheets/index", $view_data);
    }

    /* load timelog add/edit modal */

    function timelog_modal_form() {
        $this->access_only_team_members();
        $view_data['time_format_24_hours'] = get_setting("time_format") == "24_hours" ? true : false;
        $view_data['model_info'] = $this->Attendance_model->get_one($this->input->post('id'));

        $view_data['project_id'] = $this->input->post('project_id') ? $this->input->post('project_id') : $view_data['model_info']->project_id;
        $this->load->view('projects/timesheets/modal_form', $view_data);
    }

    /* insert/update a timelog */

    function save_timelog() {
        $this->access_only_team_members();
        $id = $this->input->post('id');

        //convert to 24hrs time format
        $start_time = $this->input->post('start_time');
        $end_time = $this->input->post('end_time');

        if (get_setting("time_format") != "24_hours") {
            $start_time = convert_time_to_24hours_format($start_time);
            $end_time = convert_time_to_24hours_format($end_time);
        }

        //join date with time
        $start_date_time = $this->input->post('start_date') . " " . $start_time;
        $end_date_time = $this->input->post('end_date') . " " . $end_time;

        //add time offset
        $start_date_time = convert_date_local_to_utc($start_date_time);
        $end_date_time = convert_date_local_to_utc($end_date_time);

        $data = array(
            "project_id" => $this->input->post('project_id'),
            "in_time" => $start_date_time,
            "out_time" => $end_date_time,
            "difference" => abs(strtotime($end_date_time) - strtotime($start_date_time)),
        );

        //save user_id only on insert and it will not be editable
        if (!$id) {
            $data["user_id"] = $this->input->post('user_id') ? $this->input->post('user_id') : $this->login_user->id;
        }


        $save_id = $this->Attendance_model->save($data, $id);
        if ($save_id) {
            echo json_encode(array("success" => true, "data" => $this->_timesheet_row_data($save_id), 'id' => $save_id, 'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    /* delete/undo a timelog */

    function delete_timelog() {
        $this->access_only_admin();
        $id = $this->input->post('id');
        if ($this->input->post('undo')) {
            if ($this->Attendance_model->delete($id, true)) {
                echo json_encode(array("success" => true, "data" => $this->_timesheet_row_data($id), "message" => lang('record_undone')));
            } else {
                echo json_encode(array("success" => false, lang('error_occurred')));
            }
        } else {
            if ($this->Attendance_model->delete($id)) {
                echo json_encode(array("success" => true, 'message' => lang('record_deleted')));
            } else {
                echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
            }
        }
    }

    /* list of timesheets, prepared for datatable  */

    function timesheet_list_data($project_id = 0) {
        $this->access_only_team_members();
        $options = array("project_id" => $project_id, "user_id" => $this->input->post("user_id"));
        $list_data = $this->Timesheets_model->get_details($options)->result();

        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_timesheet_row($data);
        }
        echo json_encode(array("data" => $result));
    }

    /* return a row of timesheet list  table */

    private function _timesheet_row_data($id) {
        $options = array("id" => $id);
        $data = $this->Timesheets_model->get_details($options)->row();
        return $this->_make_timesheet_row($data);
    }

    /* prepare a row of timesheet list table */

    private function _make_timesheet_row($data) {
        $image_url = get_avatar($data->logged_by_avatar);
        $user = "<span class='avatar avatar-xs mr10'><img src='$image_url' alt=''></span> $data->logged_by_user";

        $start_time = $data->in_time;
        $end_time = $data->out_time;

        return array(
            get_team_member_profile_link($data->user_id, $user),
            "$data->taskName",
            format_to_datetime($data->in_time),
            format_to_datetime($data->out_time),
            convert_seconds_to_time_format(abs(strtotime($end_time) - strtotime($start_time))),
            modal_anchor(get_uri("projects/timelog_modal_form"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => lang('edit_timelog'), "data-post-id" => $data->id))
            . js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete_timelog'), "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("projects/delete_timelog"), "data-action" => "delete"))
        );
    }

    /* load milestones view */

    function milestones($project_id) {
        $this->init_project_permission_checker($project_id);

        $view_data['project_id'] = $project_id;

        $view_data["can_create_milestones"] = $this->can_create_milestones();
        $view_data["can_edit_milestones"] = $this->can_edit_milestones();
        $view_data["can_delete_milestones"] = $this->can_delete_milestones();

        $this->load->view("projects/milestones/index", $view_data);
    }

    /* load milestone add/edit modal */

    function milestone_modal_form() {
        $id = $this->input->post('id');
        $view_data['model_info'] = $this->Milestones_model->get_one($this->input->post('id'));
        $project_id = $this->input->post('project_id') ? $this->input->post('project_id') : $view_data['model_info']->project_id;

        $this->init_project_permission_checker($project_id);

        if ($id) {
            if (!$this->can_edit_milestones()) {
                redirect("forbidden");
            }
        } else {
            if (!$this->can_create_milestones()) {
                redirect("forbidden");
            }
        }

        $view_data['project_id'] = $project_id;

        $this->load->view('projects/milestones/modal_form', $view_data);
    }

    /* insert/update a milestone */

    function save_milestone() {

        $id = $this->input->post('id');
        $project_id = $this->input->post('project_id');

        $this->init_project_permission_checker($project_id);

        if ($id) {
            if (!$this->can_edit_milestones()) {
                redirect("forbidden");
            }
        } else {
            if (!$this->can_create_milestones()) {
                redirect("forbidden");
            }
        }

        $data = array(
            "title" => $this->input->post('title'),
            "project_id" => $this->input->post('project_id'),
            "due_date" => $this->input->post('due_date')
        );
        $save_id = $this->Milestones_model->save($data, $id);
        if ($save_id) {
            if ($this->input->post('data-type') == 'plain') {
                echo json_encode(["success" => true, "data" => json_encode(['id' => $save_id, 'title' => $data['title']]), 'id' => $save_id, 'message' => lang('record_saved')]);
            } else {
                echo json_encode(array("success" => true, "data" => $this->_milestone_row_data($save_id), 'id' => $save_id, 'message' => lang('record_saved')));
            }
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    /* delete/undo a milestone */

    function delete_milestone() {

        $id = $this->input->post('id');
        $info = $this->Milestones_model->get_one($id);
        $this->init_project_permission_checker($info->project_id);

        if (!$this->can_delete_milestones()) {
            redirect("forbidden");
        }

        if ($this->input->post('undo')) {
            if ($this->Milestones_model->delete($id, true)) {
                echo json_encode(array("success" => true, "data" => $this->_milestone_row_data($id), "message" => lang('record_undone')));
            } else {
                echo json_encode(array("success" => false, lang('error_occurred')));
            }
        } else {
            if ($this->Milestones_model->delete($id)) {
                echo json_encode(array("success" => true, 'message' => lang('record_deleted')));
            } else {
                echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
            }
        }
    }

    /* list of milestones, prepared for datatable  */

    function milestones_list_data($project_id = 0) {
        $this->init_project_permission_checker($project_id);

        $options = array("project_id" => $project_id);
        $list_data = $this->Milestones_model->get_details($options)->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_milestone_row($data);
        }
        echo json_encode(array("data" => $result));
    }

    /* return a row of milestone list  table */

    private function _milestone_row_data($id) {
        $options = array("id" => $id);
        $data = $this->Milestones_model->get_details($options)->row();
        $this->init_project_permission_checker($data->project_id);

        return $this->_make_milestone_row($data);
    }

    /* prepare a row of milestone list table */

    private function _make_milestone_row($data) {

        //calculate milestone progress
        $progress = $data->total_points ? round(($data->completed_points / $data->total_points) * 100) : 0;
        $class = "progress-bar-primary";
        if ($progress == 100) {
            $class = "progress-bar-success";
        }

        $progress_bar = "<div class='progress' title='$progress%'>
            <div  class='progress-bar $class' role='progressbar' aria-valuenow='$progress' aria-valuemin='0' aria-valuemax='100' style='width: $progress%'>
            </div>
        </div>";

        //define milesone color based on due date
        $due_date = date("L", strtotime($data->due_date));
        $label_class = "";
        if ($progress == 100) {
            $label_class = "label-success";
        } else if ($progress !== 100 && get_my_local_time("Y-m-d") > $data->due_date) {
            $label_class = "label-danger";
        } else if ($progress !== 100 && get_my_local_time("Y-m-d") == $data->due_date) {
            $label_class = "label-warning";
        } else {
            $label_class = "label-primary";
        }

        $day_name = lang(strtolower(date("l", strtotime($data->due_date)))); //get day name from language
        $month_name = lang(strtolower(date("F", strtotime($data->due_date)))); //get month name from language

        $due_date = "<div class='milestone pull-left' title='" . format_to_date($data->due_date) . "'>
            <span class='label $label_class'>" . $month_name . "</span>
            <h1>" . date("d", strtotime($data->due_date)) . "</h1>
            <span>" . $day_name . "</span>
            </div>
            "
        ;

        $optoins = "";
        if ($this->can_edit_milestones()) {
            $optoins.=modal_anchor(get_uri("projects/milestone_modal_form"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => lang('edit_milestone'), "data-post-id" => $data->id));
        }

        if ($this->can_delete_milestones()) {
            $optoins.=js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete_milestone'), "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("projects/delete_milestone"), "data-action" => "delete"));
        }

        return array(
            $data->due_date,
            $due_date,
            $data->title,
            $progress_bar,
            $optoins
        );
    }

    /* load task list view */

    function tasks($project_id) {

        $this->init_project_permission_checker($project_id);

        if (!$this->can_view_tasks($project_id)) {
            redirect("forbidden");
        }

        $view_data['project_id'] = $project_id;
        $view_data['view_type'] = "project_tasks";

        $view_data['can_import_tasks'] = get_setting("add_projects_from_excel");

        $view_data['can_create_tasks'] = $this->can_create_tasks();
        $view_data['can_edit_tasks'] = $this->can_edit_tasks();
        $view_data['can_delete_tasks'] = $this->can_delete_tasks();

        $view_data['milestone_dropdown'] = $this->_get_milestones_dropdown_list($project_id);
        $view_data['assigned_to_dropdown'] = $this->_get_project_members_dropdown_list();

        $this->load->view("projects/tasks/index", $view_data);
    }

    private function _get_milestones_dropdown_list($project_id = 0) {
        $milestones = $this->Milestones_model->get_all_where(array("project_id" => $project_id, "deleted" => 0))->result();
        $milestone_dropdown = array(array("id" => "", "text" => "- " . lang("milestone") . " -"));

        foreach ($milestones as $milestone) {
            $milestone_dropdown[] = array("id" => $milestone->id, "text" => $milestone->title);
        }
        return json_encode($milestone_dropdown);
    }

    private function _get_project_members_dropdown_list() {
        $assigned_to_dropdown = array(array("id" => "", "text" => "- " . lang("assigned_to") . " -"));
        $assigned_to_list = $this->Users_model->get_dropdown_list(array("first_name", "last_name"), "id", array("deleted" => 0, "user_type" => "staff"));
        foreach ($assigned_to_list as $key => $value) {
            $assigned_to_dropdown[] = array("id" => $key, "text" => $value);
        }
        return json_encode($assigned_to_dropdown);
    }

    function all_tasks() {
        $this->access_only_team_members();
        $view_data['project_id'] = 0;
        $projects = $this->Tasks_model->get_my_projects_dropdown_list($this->login_user->id)->result();
        $projects_dropdown = array(array("id" => "", "text" => "- " . lang("project") . " -"));
        foreach ($projects as $project) {
            if ($project->project_id && $project->project_title) {
                $projects_dropdown[] = array("id" => $project->project_id, "text" => $project->project_title);
            }
        }

        $team_members_dropdown = array(array("id" => "", "text" => "- " . lang("team_member") . " -"));
        $assigned_to_list = $this->Users_model->get_dropdown_list(array("first_name", "last_name"), "id", array("deleted" => 0, "user_type" => "staff"));
        foreach ($assigned_to_list as $key => $value) {

            if ($key == $this->login_user->id) {
                $team_members_dropdown[] = array("id" => $key, "text" => $value, "isSelected" => true);
            } else {
                $team_members_dropdown[] = array("id" => $key, "text" => $value);
            }
        }


        $view_data['team_members_dropdown'] = json_encode($team_members_dropdown);
        $view_data['projects_dropdown'] = json_encode($projects_dropdown);
        $this->template->rander("projects/tasks/my_tasks", $view_data);
    }

    function task_view() {

        $task_id = $this->input->post('id');
        $model_info = $this->Tasks_model->get_details(array("id" => $task_id))->row();

        $this->init_project_permission_checker($model_info->project_id);

        if (!$this->can_view_tasks($model_info->project_id)) {
            redirect("forbidden");
        }

        $view_data['can_edit_tasks'] = $this->can_edit_tasks();
        $view_data['can_comment_on_tasks'] = $this->can_comment_on_tasks();

        $view_data['model_info'] = $model_info;
        $view_data['collaborators'] = $this->_get_collaborators($model_info->collaborator_list);

        $task_labels = "";
        if ($model_info->labels) {
            $labels = explode(",", $model_info->labels);
            foreach ($labels as $label) {
                $task_labels.="<span class='label label-info'  title='Label'>" . $label . "</span> ";
            }
        }

        $view_data['labels'] = $task_labels;

        $options = array("task_id" => $task_id);
        $view_data['comments'] = $this->Project_comments_model->get_details($options)->result();
        $view_data['task_id'] = $task_id;

        $this->load->view('projects/tasks/view', $view_data);
    }

    public function main_task_modal_form()
    {

        if (!$this->can_create_tasks()) {
            redirect("forbidden");
        }

        //prepare assign to list
        $projects_dropdown = array("" => "-") + $this->Projects_model->get_dropdown_list(["title"], "id", ["deleted" => 0]);

        asort($projects_dropdown, SORT_STRING);

        $view_data['projects_dropdown'] = $projects_dropdown;
        $view_data['prefix'] = get_setting("serial_prefix");
        $view_data['serial'] = $this->Projects_model->hesabu("SELECT * FROM `main_tasks`");

        $this->load->view('projects/tasks/main_task_modal_form', $view_data);
    }

    /* task add/edit modal */

    function task_modal_form() {
        $id = $this->input->post('id');
        $view_data['model_info'] = $this->Tasks_model->get_one($id);
        $project_id = $this->input->post('project_id') ? $this->input->post('project_id') : $view_data['model_info']->project_id;

        $this->init_project_permission_checker($project_id);

        if ($id) {
            if (!$this->can_edit_tasks()) {
                redirect("forbidden");
            }
        } else {
            if (!$this->can_create_tasks()) {
                redirect("forbidden");
            }
        }

        $view_data['milestones_dropdown'] = array(0 => "None") + $this->Milestones_model->get_dropdown_list(array("title"), "id", array("project_id" => $project_id));
        $view_data['tasks_dropdown'] = $this->MainTask->forProject($project_id);

        $project_members = $this->Users_model->all_dropdown()->result();
        $project_members_dropdown = array("" => "-");
        $collaborators_dropdown = array();
        foreach ($project_members as $member) {
            $project_members_dropdown[$member->user_id] = $member->member_name;
            $collaborators_dropdown[] = array("id" => $member->user_id, "text" => $member->member_name);
        }
        $view_data['assign_to_dropdown'] = $project_members_dropdown;
        $view_data['collaborators_dropdown'] = $collaborators_dropdown;

        $labels = explode(",", $this->Tasks_model->get_label_suggestions($project_id));
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
        $view_data['points_dropdown'] = array(1 => "1 " . lang("point"), 2 => "2 " . lang("points"), 3 => "3 " . lang("points"), 4 => "4 " . lang("points"), 5 => "5 " . lang("points"));

        $view_data['project_id'] = $project_id;

        $view_data["can_create_milestones"] = $this->can_create_milestones();
        $view_data["can_edit_milestones"] = $this->can_edit_milestones();
        $view_data["can_delete_milestones"] = $this->can_delete_milestones();

        $view_data['show_assign_to_dropdown'] = true;
        if ($this->login_user->user_type == "client") {
            $view_data['show_assign_to_dropdown'] = false;
        } else {
            //set default assigne to for new tasks
            if (!$id && !$view_data['model_info']->assigned_to) {
                $view_data['model_info']->assigned_to = $this->login_user->id;
            }
        }

        // $view_data['main_serial'] = $this->main_serial($project_id); // serial from main_tasks
        // $view_data['sub_serial']  = $view_data['main_serial'] . "-" . $project_id; // serial from main_tasks

        $this->load->view('projects/tasks/modal_form', $view_data);
    }

    /*function main_serial($project_id) {
        $object = $this->Projects_model->A("SELECT `serial` FROM `main_tasks` WHERE `project_id` = '$project_id'");
        $data   = array();;
        foreach ($object as $key => $value) {
            $data['serial'] = $value->serial;
        }
        return $data['serial'];
    }*/

    function task_import_modal_form() {

        $id = $this->input->post('id');
        $view_data['model_info'] = $this->Tasks_model->get_one($id);
        $project_id = $this->input->post('project_id') ? $this->input->post('project_id') : $view_data['model_info']->project_id;


        $this->init_project_permission_checker($project_id);

        if ($id) {
            if (!$this->can_edit_tasks()) {
                redirect("forbidden");
            }
        } else {
            if (!$this->can_create_tasks()) {
                redirect("forbidden");
            }
        }

        $view_data['milestones_dropdown'] = array(0 => "None") + $this->Milestones_model->get_dropdown_list(array("title"), "id", array("project_id" => $project_id));

        // $project_members = $this->Project_members_model->get_project_members_dropdown_list($project_id)->result();
        $project_members = $this->Users_model->all_dropdown()->result();

        $project_members_dropdown = array("" => "-");
        $collaborators_dropdown = array();
        foreach ($project_members as $member) {
            $project_members_dropdown[$member->user_id] = $member->member_name;
            $collaborators_dropdown[] = array("id" => $member->user_id, "text" => $member->member_name);
        }
        $view_data['assign_to_dropdown'] = $project_members_dropdown;
        $view_data['collaborators_dropdown'] = $collaborators_dropdown;

        $labels = explode(",", $this->Tasks_model->get_label_suggestions($project_id));
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
        $view_data['points_dropdown'] = array(1 => "1 " . lang("point"), 2 => "2 " . lang("points"), 3 => "3 " . lang("points"), 4 => "4 " . lang("points"), 5 => "5 " . lang("points"));

        $view_data['project_id'] = $project_id;

        $view_data['show_assign_to_dropdown'] = true;
        if ($this->login_user->user_type == "client") {
            $view_data['show_assign_to_dropdown'] = false;
        } else {
            //set default assigne to for new tasks
            if (!$id && !$view_data['model_info']->assigned_to) {
                $view_data['model_info']->assigned_to = $this->login_user->id;
            }
        }

        $view_data['milestones_dropdown'] = array(0 => "None") + $this->Milestones_model->get_dropdown_list(array("title"), "id", array("project_id" => $project_id));
        $view_data['tasks_dropdown'] = $this->MainTask->forProject($project_id);

        $view_data['import'] = '../../files/import_template/Import.xlsx';

        $this->load->view('projects/tasks/import_modal_form', $view_data);
    }

    function Percentages($status) {

        if ($status == "to_do - 0%") {
            $hesabu = 0;
        } elseif ($status == "in_progress - 25%") {
            $hesabu = 25;
        } elseif ($status == "in_progress - 50%") {
            $hesabu = 50;
        } elseif ($status == "in_progress - 75%") {
            $hesabu = 75;
        } elseif ($status == "done - 100%") {
            $hesabu = 100;
        }

        return $hesabu;

    }

    /* insert/upadate a task */

    function save_task() {

        // echo "<pre>";
        // print_r($_POST);
        // die();

        $project_id = $this->input->post('project_id');
        $id = $this->input->post('id');

        $this->init_project_permission_checker($project_id);

        if ($id) {
            if (!$this->can_edit_tasks()) {
                redirect("forbidden");
            }
        } else {
            if (!$this->can_create_tasks()) {
                redirect("forbidden");
            }
        }

        $assigned_to = $this->input->post('assigned_to');
        $collaborators = $this->input->post('collaborators');

        $this->updateResources($assigned_to, $collaborators, $project_id);

        $data = array(
            'parent_id' => $this->input->post('parent_id'),
            // 'serial' => $this->input->post('serial'),
            'priority' => $this->input->post('priority'),
            "title" => $this->input->post('title'),
            "description" => $this->input->post('description'),
            "project_id" => $project_id,
            "milestone_id" => $this->input->post('milestone_id'),
            "points" => $this->input->post('points'),
            "status" => $this->input->post('status'),
            // "hesabu" => $this->Percentages($this->input->post('status')),
            "labels" => $this->input->post('labels'),
            "max_hours" => $this->input->post('max_hours'),
            "start_date" => $this->input->post('start_date') ? $this->input->post('start_date') : "0000-00-00",
            "deadline" => $this->input->post('deadline') ? $this->input->post('deadline') : "0000-00-00"
        );


        //clint can't save the assign to and collaborators
        if ($this->login_user->user_type == "client") {
            if (!$id) { //it's new data to save
                $data["assigned_to"] = 0;
                $data["collaborators"] = "";
            }
        } else {
            $data["assigned_to"] = $assigned_to;
            $data["collaborators"] = $collaborators;
        }

        $save_id = $this->Tasks_model->save($data, $id);
        if ($save_id) {

            if ($id) {
                //updated
                log_notification("project_task_updated", array("project_id" => $project_id, "task_id" => $save_id, "activity_log_id" => get_array_value($data, "activity_log_id")));
            } else {
                //created
                log_notification("project_task_created", array("project_id" => $project_id, "task_id" => $save_id));
            }

            echo json_encode(array("success" => true, "data" => $this->_task_row_data($save_id), 'id' => $save_id, 'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    function save_main_task() {
        $project_id = $this->input->post('project_id');
        $id = $this->input->post('id');

        $data = array(
            "serial" => $this->input->post('serial'),
            "title" => $this->input->post('title'),
            "description" => $this->input->post('description'),
            "project_id" => $project_id,
        );

        //$this->MainTask->insert_main_task($data['serial'], $data['title'], $data['description'], $data['project_id']);
        $save_id = $this->MainTask->save($data, $id);
        if ($save_id) {
            if ($id) {
                //updated
                log_notification("project_main_task_updated", array("project_id" => $project_id, "main_task_id" => $save_id, "activity_log_id" => get_array_value($data, "activity_log_id")));
            } else {
                //created
                log_notification("project_main_task_created", array("project_id" => $project_id, "main_task_id" => $save_id));
            }
            if ($this->input->post('data-type') == 'plain') {
                echo json_encode([
                    "success" => true,
                    "data" => json_encode(['id' => $save_id, 'title' => $data['title']]),
                    'id' => $save_id,
                    'message' => lang('record_saved')
                ]);
            } else {
                echo json_encode([
                    "success" => true,
                    "data" => $this->_task_row_data($save_id),
                    'id' => $save_id,
                    'message' => lang('record_saved')
                ]);
            }
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }

    }

    /* upadate a task status */

    function save_task_status($id = 0) {
        $this->access_only_team_members();
        $data = array(
            "status" => $this->input->post('value'),
            "hesabu" => $this->Percentages($this->input->post('value'))
        );

        $save_id = $this->Tasks_model->save($data, $id);

        if ($save_id) {
            echo json_encode(array("success" => true, "data" => $this->_task_row_data($save_id), 'id' => $save_id, "message" => lang('record_saved')));

            $task_info = $this->Tasks_model->get_one($save_id);

            log_notification("project_task_updated", array("project_id" => $task_info->project_id, "task_id" => $save_id, "activity_log_id" => get_array_value($data, "activity_log_id")));
        } else {
            echo json_encode(array("success" => false, lang('error_occurred')));
        }
    }

    /* delete or undo a task */

    function delete_task() {
        $id = $this->input->post('id');
        $info = $this->Tasks_model->get_one($id);

        $this->init_project_permission_checker($info->project_id);

        if (!$this->can_delete_tasks()) {
            redirect("forbidden");
        }

        if ($this->input->post('undo')) {
            if ($this->Tasks_model->delete($id, true)) {
                echo json_encode(array("success" => true, "data" => $this->_task_row_data($id), "message" => lang('record_undone')));
            } else {
                echo json_encode(array("success" => false, lang('error_occurred')));
            }
        } else {
            if ($this->Tasks_model->delete($id)) {
                echo json_encode(array("success" => true, 'message' => lang('record_deleted')));

                $task_info = $this->Tasks_model->get_one($id);
                log_notification("project_task_deleted", array("project_id" => $task_info->project_id, "task_id" => $id));
            } else {
                echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
            }
        }
    }

    function tasks_list_data($project_id = 0) {
        $this->init_project_permission_checker($project_id);

        if (!$this->can_view_tasks($project_id)) {
            redirect("forbidden");
        }

        $status = $this->input->post('status') ? implode(",", $this->input->post('status')) : "";
        $milestone_id = $this->input->post('milestone_id');
        $options = array("project_id" => $project_id, "assigned_to" => $this->input->post('assigned_to'), "status" => $status, "milestone_id" => $milestone_id);
        $list_data = $this->Tasks_model->get_details($options)->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_task_row($data, "project_tasks");
        }

        echo json_encode(array("data" => $result));
    }

    /* list of tasks, prepared for datatable  */

    function my_tasks_list_data() {
        $this->access_only_team_members();

        $status = $this->input->post('status') ? implode(",", $this->input->post('status')) : "";
        $project_id = $this->input->post('project_id');

        $this->init_project_permission_checker($project_id);

        $specific_user_id = $this->input->post('specific_user_id');

        $options = array("specific_user_id" => $specific_user_id, "status" => $status, "project_id" => $project_id);

        if (!$this->login_user->is_admin) {
            $options["project_member_id"] = $this->login_user->id; //don't show all tasks to non-admin users
        }


        $list_data = $this->Tasks_model->get_details($options)->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_task_row($data);
        }
        
        echo json_encode(array("data" => $result));
    }

    /* return a row of task list table */

    private function _task_row_data($id) {
        $options = array("id" => $id);
        $data = $this->Tasks_model->get_details($options)->row();

        $this->init_project_permission_checker($data->project_id);

        return $this->_make_task_row($data);
    }

    /* prepare a row of task list table */


    private function _get_collaborators($collaborator_list) {
        $collaborators = "";
        if ($collaborator_list) {

            $collaborators_array = explode(",", $collaborator_list);
            foreach ($collaborators_array as $collaborator) {
                $collaborator_parts = explode("--::--", $collaborator);

                $collaborator_id = get_array_value($collaborator_parts, 0);
                $collaborator_name = get_array_value($collaborator_parts, 1);

                $image_url = get_avatar(get_array_value($collaborator_parts, 2));
                $collaboratr_image = "<span class='avatar avatar-xs mr10'><img src='$image_url' alt='...'></span>";
                $collaborators .= get_team_member_profile_link($collaborator_id, $collaboratr_image, array("title" => $collaborator_name));
            }
        }
        return $collaborators;
    }

    private function _make_task_row($data) {
        $title = modal_anchor(get_uri("projects/task_view"), $data->title, array("title" => lang('task_info') . " #$data->id", "data-post-id" => $data->id));
        $task_labels = "";
        if ($data->labels) {
            $labels = explode(",", $data->labels);
            foreach ($labels as $label) {
                $task_labels.="<span class='label label-info'  title='Label'>" . $label . "</span> ";
            }
        }
        $title.="<span class='pull-right'>" . $task_labels . "</span>";

        $project_title = anchor(get_uri("projects/view/" . $data->project_id), $data->project_title);

        $assigned_to = "-";

        if ($data->assigned_to) {
            $assigned_to = get_team_member_profile_link($data->assigned_to, $data->assigned_to_user);
        }

        $collaborators = $this->_get_collaborators($data->collaborator_list);

        if (!$collaborators) {
            $collaborators = "-";
        }

        $status_class = "";
        $checkbox_class = "checkbox-blank";

        if (strpos($data->status, "to_do - 0%") !== false) {
            $status_class = "b-warning";
        } else if (strpos($data->status, "in_progress") !== false) {
            $status_class = "b-primary";
        } else {
            $checkbox_class = "checkbox-checked";
            $status_class = "b-success";
        }

        $data->parsed_status = ucwords(str_replace('_', ' ', $data->status)) . ' Complete';

        if ($this->login_user->user_type == "staff") {
            //show changeable status checkbox and link to team members
            $check_status = js_anchor("<span class='$checkbox_class'></span>",
                [
                    'title' => "",
                    "class" => "",
                    "data-id" => $data->id,
                    "data-value" => $data->status === "done - 100%" ? "to_do - 0%" : "done - 100%",
                    "data-act" => "update-task-status-checkbox"
                ]);
            $status = js_anchor($data->parsed_status, array('title' => "", "class" => "", "data-id" => $data->id, "data-value" => $data->status, "data-act" => "update-task-status"));
        } else {
            //don't show clickable checkboxes/status to client
            if ($checkbox_class == "checkbox-blank") {
                $checkbox_class = "checkbox-un-checked";
            }
            $check_status = "<span class='$checkbox_class'></span> ";
            $status = $data->parsed_status;
        }

        $deadline_text = "-";
        if ($data->deadline) {
            $deadline_text = format_to_date($data->deadline);
            if (get_my_local_time("Y-m-d") > $data->deadline && $data->status != "done") {
                $deadline_text = "<span class='text-danger'>" . $deadline_text . "</span> ";
            } else if (get_my_local_time("Y-m-d") == $data->deadline && $data->status != "done") {
                $deadline_text = "<span class='text-warning'>" . $deadline_text . "</span> ";
            }
        }

        $start_date = "-";
        if ($data->start_date * 1) {
            $start_date = format_to_date($data->start_date);
        }

        $options = "";
        if ($this->can_edit_tasks()) {
            $options .= modal_anchor(get_uri("projects/task_modal_form"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => "Edit / Update Task", "data-post-id" => $data->id));
        }
        if ($this->can_delete_tasks()) {
            $options .= js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete_task'), "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("projects/delete_task"), "data-action" => "delete"));
        }

        $currentHours = round($data->logged / 3600, 2);

        $data->created_at = format_to_date($data->created_at);

        return array(
            $check_status,
            $data->parentTask ? $data->parentTask : 'Main Tasks',
            $title,
            $data->max_hours,
            ($currentHours <= $data->max_hours) && ($data->max_hours > 0) ?
                '<span class="text-success">' . $currentHours . ' (' . $data->max_hours . ')</span>' :
                '<span class="text-danger">' . $currentHours . ' (' . $data->max_hours . ')</span>',
            $currentHours,
            $data->start_date,
            $start_date,
            $data->deadline,
            $deadline_text,
            $project_title,
            $assigned_to,
            $data->priority,
            $status,
            $data->created_at,
            $options,
            $status_class
        );
    }

    /* load comments view */

    function comments($project_id) {
        $this->access_only_team_members();

        $options = array("project_id" => $project_id);
        $view_data['comments'] = $this->Project_comments_model->get_details($options)->result();
        $view_data['project_id'] = $project_id;
        $this->load->view("projects/comments/index", $view_data);
    }

    /* load comments view */

    function customer_feedback($project_id) {
        $options = array("customer_feedback_id" => $project_id); //customer feedback id and project id is same
        $view_data['comments'] = $this->Project_comments_model->get_details($options)->result();
        $view_data['customer_feedback_id'] = $project_id;
        $this->load->view("projects/comments/index", $view_data);
    }

    /* save project comments */

    function save_comment() {
        $id = $this->input->post('id');

        $target_path = get_setting("timeline_file_path");
        $files_data = move_files_from_temp_dir_to_permanent_dir($target_path, "project_comment");

        $project_id = $this->input->post('project_id');
        $task_id = $this->input->post('task_id');
        $file_id = $this->input->post('file_id');
        $customer_feedback_id = $this->input->post('customer_feedback_id');
        $comment_id = $this->input->post('comment_id');


        $data = array(
            "created_by" => $this->login_user->id,
            "created_at" => get_current_utc_time(),
            "project_id" => $project_id,
            "file_id" => $file_id ? $file_id : 0,
            "task_id" => $task_id ? $task_id : 0,
            "customer_feedback_id" => $customer_feedback_id ? $customer_feedback_id : 0,
            "comment_id" => $comment_id ? $comment_id : 0,
            "description" => $this->input->post('description'),
            "files" => $files_data
        );

        $save_id = $this->Project_comments_model->save_comment($data, $id);
        if ($save_id) {
            $response_data = "";
            $options = array("id" => $save_id);

            if ($this->input->post("reload_list")) {
                $view_data['comments'] = $this->Project_comments_model->get_details($options)->result();
                $response_data = $this->load->view("projects/comments/comment_list", $view_data, true);
            }
            echo json_encode(array("success" => true, "data" => $response_data, 'message' => lang('comment_submited')));


            $comment_info = $this->Project_comments_model->get_one($save_id);

            $notification_options = array("project_id" => $comment_info->project_id, "project_comment_id" => $save_id);

            if ($comment_info->file_id) { //file comment
                $notification_options["project_file_id"] = $comment_info->file_id;
                log_notification("project_file_commented", $notification_options);
            } else if ($comment_info->task_id) { //task comment
                $notification_options["task_id"] = $comment_info->task_id;
                log_notification("project_task_commented", $notification_options);
            } else if ($comment_info->customer_feedback_id) {  //customer feedback comment
                $notification_options["customer_feedback_id"] = $comment_info->customer_feedback_id;

                if ($comment_id) {
                    log_notification("project_customer_feedback_replied", $notification_options);
                } else {
                    log_notification("project_customer_feedback_added", $notification_options);
                }
            } else {  //project comment
                if ($comment_id) {
                    log_notification("project_comment_replied", $notification_options);
                } else {
                    log_notification("project_comment_added", $notification_options);
                }
            }
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    function delete_comment($id = 0) {

        if (!$id) {
            exit();
        }

        $comment_info = $this->Project_comments_model->get_one($id);

        //only admin and creator can delete the comment
        if (!($this->login_user->is_admin || $comment_info->created_by == $this->login_user->id)) {
            redirect("forbidden");
        }


        //delete the comment and files
        if ($this->Project_comments_model->delete($id) && $comment_info->files) {

            //delete the files
            $file_path = get_setting("timeline_file_path");
            $files = unserialize($comment_info->files);

            foreach ($files as $file) {
                $source_path = $file_path . get_array_value($file, "file_name");
                delete_file_from_directory($source_path);
            }
        }
    }

    /* load all replies of a comment */

    function view_comment_replies($comment_id) {
        $view_data['reply_list'] = $this->Project_comments_model->get_details(array("comment_id" => $comment_id))->result();
        $this->load->view("projects/comments/reply_list", $view_data);
    }

    /* show comment reply form */

    function comment_reply_form($comment_id, $type = "project", $type_id = 0) {
        $view_data['comment_id'] = $comment_id;

        if ($type === "project") {
            $view_data['project_id'] = $type_id;
        } else if ($type === "task") {
            $view_data['task_id'] = $type_id;
        } else if ($type === "file") {
            $view_data['file_id'] = $type_id;
        }
        $this->load->view("projects/comments/reply_form", $view_data);
    }

    /* load files view */

    function files($project_id) {

        $this->init_project_permission_checker($project_id);

        if (!$this->can_view_files()) {
            redirect("forbidden");
        }

        $view_data['can_add_files'] = $this->can_add_files();
        $options = array("project_id" => $project_id);
        $view_data['files'] = $this->Project_files_model->get_details($options)->result();
        $view_data['project_id'] = $project_id;
        $this->load->view("projects/files/index", $view_data);
    }

    function view_file($file_id = 0) {
        $file_info = $this->Project_files_model->get_details(array("id" => $file_id))->row();

        if ($file_info) {

            $this->init_project_permission_checker($file_info->project_id);

            if (!$this->can_view_files()) {
                redirect("forbidden");
            }

            $view_data['can_comment_on_files'] = $this->can_comment_on_files();


            $file_url = get_file_uri(get_setting("project_file_path") . $file_info->project_id . "/" . $file_info->file_name);
            $view_data["file_url"] = $file_url;
            $view_data["is_image_file"] = is_image_file($file_info->file_name);
            $view_data["is_google_preview_available"] = is_google_preview_available($file_info->file_name);

            $view_data["file_info"] = $file_info;
            $options = array("file_id" => $file_id);
            $view_data['comments'] = $this->Project_comments_model->get_details($options)->result();
            $view_data['file_id'] = $file_id;
            $this->load->view("projects/files/view", $view_data);
        } else {
            show_404();
        }
    }

    /* file upload modal */

    function file_modal_form() {
        $view_data['model_info'] = $this->Project_files_model->get_one($this->input->post('id'));
        $project_id = $this->input->post('project_id') ? $this->input->post('project_id') : $view_data['model_info']->project_id;

        $this->init_project_permission_checker($project_id);

        if (!$this->can_add_files()) {
            redirect("forbidden");
        }

        $view_data['project_id'] = $project_id;
        $this->load->view('projects/files/modal_form', $view_data);
    }

    /* save project file data and move temp file to parmanent file directory */

    function save_file() {

        $project_id = $this->input->post('project_id');

        $this->init_project_permission_checker($project_id);

        if (!$this->can_add_files()) {
            redirect("forbidden");
        }


        $files = $this->input->post("files");
        $success = false;
        $now = get_current_utc_time();

        $target_path = getcwd() . "/" . get_setting("project_file_path") . $project_id . "/";

        //process the fiiles which has been uploaded by dropzone
        if ($files && get_array_value($files, 0)) {
            foreach ($files as $file) {
                $file_name = $this->input->post('file_name_' . $file);
                $new_file_name = move_temp_file($file_name, $target_path);
                if ($new_file_name) {
                    $data = array(
                        "project_id" => $project_id,
                        "file_name" => $new_file_name,
                        "description" => $this->input->post('description_' . $file),
                        "file_size" => $this->input->post('file_size_' . $file),
                        "created_at" => $now,
                        "uploaded_by" => $this->login_user->id
                    );
                    $success = $this->Project_files_model->save($data);

                    log_notification("project_file_added", array("project_id" => $project_id, "project_file_id" => $success));
                } else {
                    $success = false;
                }
            }
        }
        //process the files which has been submitted manually
        if ($_FILES) {
            $files = $_FILES['manualFiles'];
            if ($files && count($files) > 0) {
                $description = $this->input->post('description');
                foreach ($files["tmp_name"] as $key => $file) {
                    $temp_file = $file;
                    $file_name = $files["name"][$key];
                    $file_size = $files["size"][$key];

                    $new_file_name = move_temp_file($file_name, $target_path, "", $temp_file);
                    if ($new_file_name) {
                        $data = array(
                            "project_id" => $project_id,
                            "file_name" => $new_file_name,
                            "description" => get_array_value($description, $key),
                            "file_size" => $file_size,
                            "created_at" => $now,
                            "uploaded_by" => $this->login_user->id
                        );
                        $success = $this->Project_files_model->save($data);

                        log_notification("project_file_added", array("project_id" => $project_id, "project_file_id" => $success));
                    }
                }
            }
        }

        if ($success) {
            echo json_encode(array("success" => true, 'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    /* upload a post file */

    function upload_file() {
        upload_file_to_temp();
    }

    /* check valid file for project */

    function validate_project_file() {
        return validate_post_file($this->input->post("file_name"));
    }

    /* delete a file */

    function delete_file() {

        $id = $this->input->post('id');
        $info = $this->Project_files_model->get_one($id);

        $this->init_project_permission_checker($info->project_id);

        if (!$this->can_delete_files()) {
            redirect("forbidden");
        }

        if ($this->input->post('undo')) {
            if ($this->Project_files_model->delete($id, true)) {
                echo json_encode(array("success" => true, "data" => $this->_file_row_data($id), "message" => lang('record_undone')));
            } else {
                echo json_encode(array("success" => false, lang('error_occurred')));
            }
        } else {
            if ($this->Project_files_model->delete($id)) {
                log_notification("project_file_deleted", array("project_id" => $info->project_id, "project_file_id" => $id));
                echo json_encode(array("success" => true, 'message' => lang('record_deleted')));
            } else {
                echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
            }
        }
    }

    /* download a file */

    function download_file($id) {

        $file_info = $this->Project_files_model->get_one($id);

        $this->init_project_permission_checker($file_info->project_id);
        if (!$this->can_view_files()) {
            redirect("forbidden");
        }
        //serilize the path
        $file_data = serialize(array(array("file_name" => $file_info->project_id . "/" . $file_info->file_name)));

        download_app_files(get_setting("project_file_path"), $file_data);
    }

    /* download files by zip */

    function download_comment_files($id) {

        $info = $this->Project_comments_model->get_one($id);

        $this->init_project_permission_checker($info->project_id);
        if ($this->login_user->user_type == "client" && !$this->is_clients_project) {
            redirect("forbidden");
        } else if ($this->login_user->user_type == "staff" && !$this->is_user_a_project_member) {
            redirect("forbidden");
        }

        download_app_files(get_setting("timeline_file_path"), $info->files);
    }

    /* list of files, prepared for datatable  */

    function files_list_data($project_id = 0) {

        $this->init_project_permission_checker($project_id);

        if (!$this->can_view_files()) {
            redirect("forbidden");
        }


        $options = array("project_id" => $project_id);
        $list_data = $this->Project_files_model->get_details($options)->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_file_row($data);
        }
        echo json_encode(array("data" => $result));
    }

    /* return a row of file list table */

    private function _file_row_data($id) {
        $options = array("id" => $id);
        $data = $this->Project_files_model->get_details($options)->row();

        $this->init_project_permission_checker($data->project_id);
        return $this->_make_file_row($data);
    }

    /* prepare a row of file list table */

    private function _make_file_row($data) {
        $file_icon = get_file_icon(strtolower(pathinfo($data->file_name, PATHINFO_EXTENSION)));

        $image_url = get_avatar($data->uploaded_by_user_image);
        $uploaded_by = "<span class='avatar avatar-xs mr10'><img src='$image_url' alt='...'></span> $data->uploaded_by_user_name";

        if ($data->uploaded_by_user_type == "staff") {
            $uploaded_by = get_team_member_profile_link($data->uploaded_by, $uploaded_by);
        } else {
            $uploaded_by = get_client_contact_profile_link($data->uploaded_by, $uploaded_by);
        }

        $description = "<div class='pull-left'>" .
                js_anchor(remove_file_prefix($data->file_name), array('title' => "", "data-toggle" => "app-modal", "data-sidebar" => "1", "data-url" => get_uri("projects/view_file/" . $data->id)));

        if ($data->description) {
            $description .= "<br /><span>" . $data->description . "</span></div>";
        } else {
            $description .="</div>";
        }

        $options = anchor(get_uri("projects/download_file/" . $data->id), "<i class='fa fa fa-cloud-download'></i>", array("title" => lang("download")));
        if ($this->can_delete_files()) {
            $options.= js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete_file'), "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("projects/delete_file"), "data-action" => "delete"));
        }

        return array($data->id,
            "<div class='fa fa-$file_icon font-22 mr10 pull-left'></div>" . $description,
            convert_file_size($data->file_size),
            $uploaded_by,
            format_to_datetime($data->created_at),
            $options
        );
    }

    /* load notes view */

    function notes($project_id) {
        $this->access_only_team_members();
        $view_data['project_id'] = $project_id;
        $this->load->view("projects/notes/index", $view_data);
    }

    /* load history view */

    function history($offset = 0, $project_id = 0) {
        $this->access_only_team_members();
        $view_data['project_id'] = $project_id;
        $view_data['offset'] = $offset;
        $view_data['activity_logs_params'] = array("log_for" => "project", "log_for_id" => $project_id, "limit" => 20, "offset" => $offset);
        $this->load->view("projects/history/index", $view_data);
    }

    /* load project members view */

    function members($project_id = 0) {
        $this->access_only_team_members();
        $view_data['project_id'] = $project_id;
        $this->load->view("projects/project_members/index", $view_data);
    }

    /* load payments tab  */

    function payments($project_id) {
        $this->access_only_team_members();
        if ($project_id) {
            $view_data['project_info'] = $this->Projects_model->get_details(array("id" => $project_id))->row();
            $view_data['project_id'] = $project_id;
            $this->load->view("projects/payments/index", $view_data);
        }
    }

    /* load invoices tab  */

    function invoices($project_id) {
        $this->access_only_team_members();
        if ($project_id) {
            $view_data['project_id'] = $project_id;
            $view_data['project_info'] = $this->Projects_model->get_details(array("id" => $project_id))->row();
            $this->load->view("projects/invoices/index", $view_data);
        }
    }

    /* load payments tab  */

    function expenses($project_id) {
        $this->access_only_team_members();
        if ($project_id) {
            $view_data['project_id'] = $project_id;
            $this->load->view("projects/expenses/index", $view_data);
        }
    }

    function change_status($project_id, $status) {
        if ($project_id && $this->can_create_projects() && ($status == "completed" || $status == "canceled" || $status == "open" )) {
            $status_data = array("status" => $status);
            $this->Projects_model->save($status_data, $project_id);
        }
    }

    function gantt($project_id = 0) {


        if ($project_id) {
            $this->init_project_permission_checker($project_id);

            if (!$this->can_view_gantt()) {
                redirect("forbidden");
            }

            $view_data['project_id'] = $project_id;

            //prepare members list
            $view_data['milestone_dropdown'] = $this->_get_milestones_dropdown_list($project_id);
            $view_data['project_members_dropdown'] = $this->_get_project_members_dropdown_list();


            $this->load->view("projects/gantt/index", $view_data);
        }
    }

    //prepare gantt data for gantt chart
    function gantt_data($project_id = 0, $group_by = "milestones", $filter_id = 0) {
        if ($project_id) {
            $this->init_project_permission_checker($project_id);

            if (!$this->can_view_gantt()) {
                redirect("forbidden");
            }

            $options = array();

            if ($group_by == "milestones") {
                $options["milestone_id"] = $filter_id;
            } else if ($group_by == "members") {
                $options["assigned_to"] = $filter_id;
            }

            $gantt_data = $this->Projects_model->get_gantt_data($project_id, $options);
            $now = get_current_utc_time("Y-m-d");

            $group_array = array();
            $series = array();

            $status_class = [
                "to_do - 0%" => "label-warning",
                "in_progress - 25%" => "label-primary",
                "in_progress - 50%" => "label-primary",
                "in_progress - 75%" => "label-primary",
                "done - 100%" => "label-success"
            ];

            foreach ($gantt_data as $data) {

                $start_date = $data->start_date * 1 ? $data->start_date : $now;
                $end_date = $data->end_date * 1 ? $data->end_date : $data->milestone_due_date;

                if (!$end_date * 1) {
                    $end_date = $start_date;
                }

                $group_id = 0;

                if ($group_by === "milestones") {
                    $group_id = $data->milestone_id;
                    $group_array[$group_id] = array("id" => $group_id, "name" => $data->milestone_title);
                } else {
                    $group_id = $data->assigned_to;
                    $group_array[$data->assigned_to] = array("id" => $group_id, "name" => $data->assigned_to_name);
                }
                $series[$group_id][] = [
                    "name" => modal_anchor(get_uri("projects/task_view"), $data->task_title, array("title" => lang('task_info') . " #$data->task_id", "data-post-id" => $data->task_id)),
                    "start" => $start_date,
                    "end" => $end_date,
                    "class" => get_array_value($status_class, $data->status)
                ];
            }

            $gantt = array();
            foreach ($group_array as $group_value) {
                $gantt_section = $group_value;

                if (!get_array_value($group_value, "name")) {
                    $gantt_section["name"] = lang("not_specified");
                } else {
                    $gantt_section["name"] = get_array_value($group_value, "name");
                }



                $gantt_section["id"] = get_array_value($group_value, "id");
                $gantt_section["series"] = get_array_value($series, get_array_value($group_value, "id"));
                $gantt[] = $gantt_section;
            }
            echo json_encode($gantt);
        }
    }

    function croneJob() {

        $query = "SELECT `id` FROM projects WHERE projects.deleted = 0";

        $sql = $this->db->query($query);

        foreach ($sql->result_array() as $row) {
            $ids[] =  $row['id'];
        }

        for ($i=0; $i < count($ids); $i++) {

            $stmt_query = "SELECT CONCAT(users.first_name, ' ',users.last_name) AS Member, projects.title AS Project, (attendance.difference / 3600) AS Hours, team_member_job_info.hourly_rate AS Rate, (attendance.difference / 3600) * team_member_job_info.hourly_rate AS Total FROM attendance INNER JOIN team_member_job_info ON attendance.user_id = team_member_job_info.user_id INNER JOIN projects ON attendance.project_id = projects.id INNER JOIN users ON attendance.user_id = users.id WHERE attendance.project_id = " . $ids[$i];

            $stmt = $this->db->query($stmt_query);

            foreach ($stmt->result_array() as $row) {
                $totals[] =  $row['Total'];
            }
        }

        //print_r($totals);

        echo "INSERT INTO DEMO.dbo._btblJrBatchLines (iBatchesID, dTxDate, iAccountID, cDescription, cReference, fDebit, fCredit, iProjectID) VALUES (1, '".date('Y-m-d')."', 2, 'test' ,'test', ".$totals[0].", 0, 15)";

    }

    /**
     * @param $assigned_to
     * @param $collaborators
     * @param $project_id
     */
    protected function updateResources($assigned_to, $collaborators, $project_id)
    {
        $users = [];
        $users[] = $assigned_to;
        $users = array_merge($users, $collaborators == '' ? [] : explode(',', $collaborators));
        $users = array_unique($users);
        $assigned = $this->Project_members_model->get_project_members_dropdown_list($project_id)->result();
        $assigned = array_map(
            function ($value) {
                return $value->user_id;
            },
            $assigned);

        $users = array_filter(
            $users,
            function ($value) use ($assigned) {
                return ! in_array($value, $assigned);
            });

        if (count($users)) {
            $this->Project_members_model->bulkInsert($project_id, $users);
        }
    }

    public function SAGE_DB() {
        return $this->load->database('SAGE', TRUE);
    }
}

/* End of file projects.php */
/* Location: ./application/controllers/projects.php */