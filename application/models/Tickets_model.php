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

        $team_id = get_array_value($options, "team_id");
        if ($team_id) {
            $where .= " AND $tickets_table.team_id=$team_id";
        }

        $team_id = get_array_value($options, "team_id");

        $sql = "SELECT $tickets_table.*, $ticket_types_table.title AS ticket_type,$projectsTable.title as projectTitle,
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

    function count_new_tickets($ticket_types = "", $assigned_to_id = "") {
        $tickets_table = $this->db->dbprefix('tickets');
        $where = "";
        $assigned_to = "";
        if ($ticket_types) {
            $where = " AND FIND_IN_SET($tickets_table.ticket_type_id, '$ticket_types')";
        }
        if ($assigned_to_id) {
            $assigned_to = " AND assigned_to = " . $assigned_to_id;
        }
        $sql = "SELECT COUNT($tickets_table.id) AS total
        FROM $tickets_table
        WHERE $tickets_table.deleted=0  AND $tickets_table.status='new' $where $assigned_to";
        return $this->db->query($sql)->row()->total;
        // echo $sql;
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
function get_tickets_id()
{
    $ss=$this->session->user_id;
    $t_ID=$this->session->ticket_ID;
    $tickets_table = $this->db->dbprefix('tickets');
    $users_table = $this->db->dbprefix('users');
    $sq="SELECT $tickets_table.*,$users_table.id
    FROM $tickets_table
       JOIN $users_table ON $tickets_table.created_by= $users_table.id
        WHERE $tickets_table.created_by=$ss AND $tickets_table.id=$t_ID";

         $query= $this->db->query($sq)->num_rows();


if($query>0)
return true;
else {
  return false;
}

}
function get_userassigned()
{
  $tickets_table = $this->db->dbprefix('tickets');
  $users_table = $this->db->dbprefix('users');
  $id=$this->session->assgn;
  $sq="SELECT $tickets_table.created_by,$users_table.first_name,$users_table.last_name
  FROM $tickets_table
     JOIN $users_table ON $tickets_table.created_by= $users_table.id
      WHERE $tickets_table.created_by=$id";

       $query= $this->db->query($sq)->num_rows();
       if($query>0)
       {
         return true;
       }
       else {
         return false;
}
}

function insert_thirdparty($data)
{
  $this->db->insert('tbl_third_party',$data);
}
public function ticket_info($ticket_id){
    $sql = $this->db->query("SELECT ticket_comments.description as info,tickets.external_reference,tickets.title as subject,tickets.created_at,CONCAT(users.first_name, ' ', users.last_name) as username ,users.email,ticket_types.title as ticket_type FROM tickets
                    LEFT JOIN users ON users.id=tickets.assigned_to
                    LEFT JOIN ticket_types ON ticket_types.id=tickets.ticket_type_id
                    LEFT JOIN ticket_comments ON ticket_comments.ticket_id=tickets.id WHERE tickets.id=$ticket_id")->row_array();
    return $sql;
}
}
