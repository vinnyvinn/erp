<?php

class Event_notes_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'event_notes';
        parent::__construct($this->table);
    }

    function get_details($options = array()) {
        $event_notes_table = $this->db->dbprefix('event_notes');

        $where = "";
        $id = get_array_value($options, "id");
        if ($id) {
            $where .= " AND $event_notes_table.id=$id";
        }

        $project_id = get_array_value($options, "project_id");
        if ($project_id) {
            $where .= " AND $event_notes_table.project_id=$project_id";
        }

        $client_id = get_array_value($options, "client_id");
        if ($client_id) {
            $where .= " AND $event_notes_table.client_id=$client_id";
        }

        $user_id = get_array_value($options, "user_id");
        if ($user_id) {
            $where .= " AND $event_notes_table.user_id=$user_id";
        }


        $created_by = get_array_value($options, "created_by");
        if ($created_by) {
            $where .= " AND $event_notes_table.created_by=$created_by";
        }

        $my_event_notes = get_array_value($options, "my_event_notes");
        if ($my_event_notes) {
            $where .= " AND $event_notes_table.user_id=0 AND $event_notes_table.client_id=0 "; //don't include client's and team member's event_notes
        }


        $sql = "SELECT $event_notes_table.*
        FROM $event_notes_table
        WHERE $event_notes_table.deleted=0 $where";
        return $this->db->query($sql);
    }

    function get_label_suggestions($user_id) {
        $event_notes_table = $this->db->dbprefix('event_notes');
        $sql = "SELECT GROUP_CONCAT(labels) as label_groups
        FROM $event_notes_table
        WHERE $event_notes_table.deleted=0 AND $event_notes_table.created_by=$user_id";
        return $this->db->query($sql)->row()->label_groups;
    }

}

