<?php

class Tickets_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'tickets';
        parent::__construct($this->table);
    }

    function get_details($options = array()) {
        $tickets_table = $this->db->dbprefix('tickets');
        $ticket_types_table = $this->db->dbprefix('ticket_types');
        $projectsTable = $this->db->dbprefix('projects');
        $clientsTable = $this->db->dbprefix('clients');
        $users_table = $this->db->dbprefix('users');

        $where = "";
        $id = get_array_value($options, "id");
        if ($id) {
            $where .= " AND $tickets_table.id=$id";
        }
        $client_id = get_array_value($options, "client_id");
        if ($client_id) {
            $where .= " AND $projectsTable.client_id=$client_id";
        }

        $status = get_array_value($options, "status");
        if ($status === "closed") {
            $where .= " AND $tickets_table.status='$status'";
        } if ($status === "open") {
            $where .= " AND FIND_IN_SET($tickets_table.status, 'new,open,client_replied')";
        }

        $ticket_label = get_array_value($options, "ticket_label");
        if ($ticket_label) {
            $where .= " AND (FIND_IN_SET('$ticket_label', $tickets_table.labels)) ";
        }
        
        $assigned_to = get_array_value($options, "assigned_to");
        if ($assigned_to) {
            $where .= " AND $tickets_table.assigned_to=$assigned_to";
        }

        $sql = "SELECT $tickets_table.*, $ticket_types_table.title AS ticket_type, $projectsTable.title as projectTitle,
              $projectsTable.id as projectId, $clientsTable.company_name, $clientsTable.id as client_id,
              CONCAT($users_table.first_name, ' ',$users_table.last_name) AS assigned_to_user, $users_table.image as assigned_to_avatar 
        FROM $tickets_table
        LEFT JOIN $ticket_types_table ON $ticket_types_table.id= $tickets_table.ticket_type_id
        LEFT JOIN $projectsTable ON $projectsTable.id= $tickets_table.project_id
        LEFT JOIN $clientsTable ON $projectsTable.client_id= $clientsTable.id
        LEFT JOIN $users_table ON $users_table.id= $tickets_table.assigned_to
        WHERE $tickets_table.deleted=0 $where";
        return $this->db->query($sql);
    }

    function count_new_tickets($ticket_types = "") {
        $tickets_table = $this->db->dbprefix('tickets');
        $where = "";
        if ($ticket_types) {
            $where = " AND FIND_IN_SET($tickets_table.ticket_type_id, '$ticket_types')";
        }
        $sql = "SELECT COUNT($tickets_table.id) AS total
        FROM $tickets_table
        WHERE $tickets_table.deleted=0  AND $tickets_table.status='new' $where";
        return $this->db->query($sql)->row()->total;
    }

    function get_ticket_status_info() {
        $tickets_table = $this->db->dbprefix('tickets');
        $where = "";

        $sql = "SELECT $tickets_table.status, COUNT($tickets_table.id) as total
        FROM $tickets_table
        WHERE $tickets_table.deleted=0 $where
        GROUP BY $tickets_table.status";
        return $this->db->query($sql);
    }

    function get_label_suggestions() {
        $tickets_table = $this->db->dbprefix('tickets');
        $sql = "SELECT GROUP_CONCAT(labels) as label_groups
        FROM $tickets_table
        WHERE $tickets_table.deleted=0";
        return $this->db->query($sql)->row()->label_groups;
    }

}
