<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');
require_once("Pre_loader.php");

class Events extends Pre_loader {

    function __construct() {
        parent::__construct();
         $this->load->helper(array('form', 'url'));
        $this->access_only_team_members();
    }

    //load calendar view
    function index() {
        $this->check_module_availability("module_event");
       
        $this->template->rander("events/index");
    }

    //show add/edit event modal form
    function modal_form() {
        $event_id = decode_id($this->input->post('encrypted_event_id'), "event_id");
        $model_info = $this->Events_model->get_one($event_id);

        $model_info->start_date = $model_info->start_date ? $model_info->start_date : $this->input->post('start_date');
        $model_info->end_date = $model_info->end_date ? $model_info->end_date : $this->input->post('end_date');
        $model_info->start_time = $model_info->start_time ? $model_info->start_time : $this->input->post('start_time');
        $model_info->end_time = $model_info->end_time ? $model_info->end_time : $this->input->post('end_time');

        $view_data['model_info'] = $model_info;
        $view_data['members_and_teams_dropdown'] = json_encode(get_team_members_and_teams_select2_data_list());
        $view_data['time_format_24_hours'] = get_setting("time_format") == "24_hours" ? true : false;

        $view_data['client_contact_persons_dropdown'] = $this->SAGE_DB()->get('Client')->result();
        $view_data['prospect_contact_persons_dropdown'] = $this->SAGE_DB()->get('_rtblProspect')->result();
        $view_data['pipeline_stage_dropdown'] = $this->SAGE_DB()->get('_rtblOpportunityStage')->result();
        $view_data['business_type_dropdown'] = $this->Business_types_model->get_all_where(array("deleted" => 0))->result();
        $view_data['call_types_dropdown'] = $this->Call_types_model->get_all_where(array("deleted" => 0))->result();
        $view_data['objectives_dropdown'] = $this->Business_types_model->get_all_where(array("deleted" => 0))->result();

        $this->load->view('events/modal_form', $view_data);
    }

    //save an event
    function save() {

        validate_submitted_data(array(
            "title" => "required",
            "description" => "required",
            "start_date" => "required",
            "end_date" => "required"
        ));

        $id = $this->input->post('id');

        //convert to 24hrs time format
        $start_time = $this->input->post('start_time');
        $end_time = $this->input->post('end_time');

        if (get_setting("time_format") != "24_hours") {
            $start_time = convert_time_to_24hours_format($start_time);
            $end_time = convert_time_to_24hours_format($end_time);
        }


        //prepare share with data

        $share_with = $this->input->post('share_with');
        if ($share_with == "specific") {
            $share_with = $this->input->post('share_with_specific');
        }

        $target_path = get_setting("timeline_file_path");
        $files_data = move_files_from_temp_dir_to_permanent_dir($target_path, "event");

        $data = array(
            "title" => $this->input->post('title'),
            "description" => $this->input->post('description'),
            "start_date" => $this->input->post('start_date'),
            "end_date" => $this->input->post('end_date'),
            "start_time" => $start_time,
            "end_time" => $end_time,
            "location" => $id ? $this->_current($id, "location") : $this->input->post('location'),
            "color" => $id ? $this->_current($id, "color") : "#2d9cdb",
            "created_by" => $this->login_user->id,
            "share_with" => $share_with,
            "client_id" => $id ? $this->_current($id, "client_id") : $this->input->post('client_contact_persons'),
            "prospector_id" => $id ? $this->_current($id, "prospector_id") : $this->input->post('prospect_contact_persons'),
            "business_type" => $id ? $this->_current($id, "business_type") : $this->input->post('business_type'),
            "call_type" => $id ? $this->_current($id, "call_type") : $this->input->post('call_type'),
            "objective_type" => $id ? $this->_current($id, "objective_type") : $this->input->post('objective'),
            "pipeline_stage" => $id ? $this->_current($id, "pipeline_stage") : $this->input->post('pipeline_stage'),
            "files" => $files_data ? $files_data : NULL

        );


        //only admin can edit other team members events
        //non-admin team members can edit only their own events
        if ($id && !$this->login_user->is_admin) {
            $event_info = $this->Events_model->get_one($id);
            if ($event_info->created_by != $this->login_user->id) {
                redirect("forbidden");
            }
        }

        $save_id = $this->Events_model->save($data, $id);
        if ($save_id) {
            echo json_encode(array("success" => true, 'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    //delete/undo an event
    function delete() {
        validate_submitted_data(array(
            "encrypted_event_id" => "required"
        ));

        $id = decode_id($this->input->post('encrypted_event_id'), "event_id"); //to make is secure we'll use the encrypted id
        //only admin can delete other team members events
        //non-admin team members can delete only their own events
        if ($id && !$this->login_user->is_admin) {
            $event_info = $this->Events_model->get_one($id);
            if ($event_info->created_by != $this->login_user->id) {
                redirect("forbidden");
            }
        }


        if ($this->Events_model->delete($id)) {
            echo json_encode(array("success" => true, 'message' => lang('event_deleted')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
        }
    }

    //get calendar event
    function calendar_events() {
        $options = array("user_id" => $this->login_user->id, "team_ids" => $this->login_user->team_ids);
        $list_data = $this->login_user->is_admin ? $this->Events_model->get_details()->result() : $this->Events_model->get_details($options)->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_calendar_event($data);
        }
        echo json_encode($result);
    }

    //prepare calendar event
    private function _make_calendar_event($data) {
        return array(
            "title" => ucwords($data->title),
            "icon" => get_event_icon($data->share_with),
            "start" => $data->start_date . " " . $data->start_time,
            "end" => $data->end_date . " " . $data->end_time,
            "encrypted_event_id" => encode_id($data->id, "event_id"), //to make is secure we'll use the encrypted id
            "backgroundColor" => $data->color,
            "borderColor" => $data->color,
        );
    }

    //view an event
    function view() {
        $encrypted_event_id = $this->input->post('id');
        $event_id = decode_id($encrypted_event_id, "event_id");
        validate_submitted_data(array(
            "id" => "required"
        ));

        $model_info = $this->Events_model->get_details(array("id" => $event_id))->row();

        if ($model_info->id) {
            $view_data['event_id'] = $event_id;
            $view_data['encrypted_event_id'] = $encrypted_event_id; //to make is secure we'll use the encrypted id 
            $view_data['editable'] = $this->input->post('editable');
            $view_data['model_info'] = $model_info;
            $view_data['event_icon'] = get_event_icon($model_info->share_with);
            $view_data['event_files'] = unserialize($model_info->files);
            $view_data['event_notes'] = $this->Event_notes_model->get_details(array("event_id" => $event_id))->result();

            $this->load->view('events/view', $view_data);
        } else {
            show_404();
        }
    }

    public function status() {

         validate_submitted_data(array(
            "encrypted_event_id" => "required"
        ));

        $id = decode_id($this->input->post('encrypted_event_id'), "event_id"); //to make is secure we'll use the encrypted id
        //only admin can delete other team members events
        //non-admin team members can delete only their own events
        if ($id && !$this->login_user->is_admin) {
            $event_info = $this->Events_model->get_one($id);
            if ($event_info->created_by != $this->login_user->id) {
                redirect("forbidden");
            }
        }

        if ($this->input->post('color') === "#e74c3c") {
            // push incident to sage
            $data = ['dCreated' => date('Y-m-d H:i:s'), 'dLastModified' => date('Y-m-d H:i:s'), 'iClassID' => 1,'iIncidentStatusID' => 1,'iDebtorID' => $this->Events_model->get_one($id)->client_id,'cOutline' => "Client Visit",'iPriorityID' => 4,'iCurrentAgentID' => $this->get_one_sage($this->Users_model->get_one($this->Events_model->get_one($id)->created_by)->email, "_rtblAgents")->idAgents];

            $this->SAGE_DB()->insert('_rtblIncidents', $data);
        }

        $data = ["color" => $this->input->post('color') ? $this->input->post('color') : $this->_current($id, "color")];

        if ($this->Events_model->save($data, $id)) {
            echo json_encode(array("success" => true, 'message' => lang('event_updated')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_updated')));
        }
    }

    public function upload_file ()
    {
        upload_file_to_temp();
    }

    public function validate_file ()
    {
        return validate_post_file($this->input->post("file_name"));
    }

    public function _current($id, $return) {
        return $this->Events_model->get_one($id)->$return;
    }

    public function SAGE_DB() {
        return $this->load->database('SAGE', TRUE);
    }

    function get_one_sage($id = 0, $table) {
        return $this->get_one_where_sage($table, array('cEmail' => $id));
    }

    function get_one_where_sage($table, $where = array()) {
        $result = $this->SAGE_DB()->get_where($table, $where, 1);
        if ($result->num_rows()) {
            return $result->row();
        } else {
            $db_fields = $this->SAGE_DB()->list_fields($table);
            $fields = new stdClass();
            foreach ($db_fields as $field) {
                $fields->$field = "";
            }
            return $fields;
        }
    }

    function notes_modal_form() {
        $view_data['model_info'] = $this->Event_notes_model->get_one($this->input->post('id'));
        $view_data['event_id'] = $this->input->post('event_id') ? $this->input->post('event_id') : $view_data['model_info']->event_id;
        $labels = explode(",", $this->Event_notes_model->get_label_suggestions($this->login_user->id));

        //check permission for saved note
        if ($view_data['model_info']->id) {
            $this->validate_access_to_note($view_data['model_info']);
        }
        
        $label_suggestions = array();
        foreach ($labels as $label) {
            if ($label && !in_array($label, $label_suggestions)) {
                $label_suggestions[] = $label;
            }
        }

        if (!count($label_suggestions)) {
            $label_suggestions = array("0" => "Important");
        }

        $view_data['label_suggestions'] = $label_suggestions;

        // echo "<pre>";
        // print_r($view_data);

        $this->load->view('events/notes_modal_form', $view_data);
    }

    function save_notes() {
        validate_submitted_data(array(
            "id" => "numeric",
            "title" => "required",
            "event_id" => "numeric"
        ));

        $id = $this->input->post('id');

        $data = array(
            "title" => $this->input->post('title'),
            "description" => $this->input->post('description'),
            "created_by" => $this->login_user->id,
            "labels" => $this->input->post('labels'),
            "event_id" => $this->input->post('event_id')
        );

        if ($id) {
            //saving existing note. check permission
            $note_info = $this->Event_notes_model->get_one($id);

            $this->validate_access_to_note($note_info);
        } else {
            $data['created_at'] = get_current_utc_time();
        }

        $save_id = $this->Event_notes_model->save($data, $id);
        if ($save_id) {
            echo json_encode(array("success" => true, 'message' => lang('record_saved')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    function notes_delete($id = 0) {

        // $id = $this->input->post('id'); //to make is secure we'll use the encrypted id
        //only admin can delete other team members events
        //non-admin team members can delete only their own events
        if ($id && !$this->login_user->is_admin) {
            $event_info = $this->Event_notes_model->get_one($id);
            if ($event_info->created_by != $this->login_user->id) {
                redirect("forbidden");
            }
        }


        if ($this->Event_notes_model->delete($id)) {
            // echo json_encode(array("success" => true, 'message' => lang('event_deleted')));
            redirect('/dashboard');
        } else {
            // echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
            redirect('/dashboard');
        }
    }

}

/* End of file events.php */
    /* Location: ./application/controllers/events.php */