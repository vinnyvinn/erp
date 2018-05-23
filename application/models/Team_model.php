<?php

class Team_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'team';
        parent::__construct($this->table);
    }

    function count() {
        $teamTable = $this->db->dbprefix('team_member_job_info');
        $usersTable = $this->db->dbprefix('users');
        $sql = "SELECT count($teamTable.id) as total FROM " . $teamTable . ' INNER JOIN ' . $usersTable .
            " ON $teamTable.user_id = $usersTable.id WHERE $usersTable.status = 'active'";

        return $this->db->query($sql);
    }

    function get_details($options = array()) {
        $team_table = $this->db->dbprefix('team');
        $where = "";
        $id = get_array_value($options, "id");
        if ($id) {
            $where = " AND $team_table.id=$id";
        }

        $sql = "SELECT $team_table.*
        FROM $team_table
        WHERE $team_table.deleted=0 $where";
        return $this->db->query($sql);
    }

    function get_members($team_ids = array()) {
        $team_table = $this->db->dbprefix('team');
        $team_ids = implode(",", $team_ids);

        $sql = "SELECT $team_table.members
        FROM $team_table
        WHERE $team_table.deleted=0 AND id in($team_ids)";
        return $this->db->query($sql);
    }

    function dept_id_exists($dept_id, $id = 0) {
        $result = $this->get_all_where(array("dept_id" => $dept_id, "deleted" => 0));
        if ($result->num_rows() && $result->row()->id != $id) {
            return $result->row();
        } else {
            return false;
        }
    }

    function desig_id_exists($desig_id, $id = 0) {
        $result = $this->get_all_where(array("desig_id" => $desig_id, "deleted" => 0));
        if ($result->num_rows() && $result->row()->id != $id) {
            return $result->row();
        } else {
            return false;
        }
    }

    function list_ict_members() {

        $ict_members = $this->db->like('title', 'ict')->get('team')->result();
        $data = [];
        foreach ($ict_members as $members) {
            foreach (explode(",", $members->members) as $member) {
                $data[] = $member;
            }
        }

        return json_encode(array_filter($data));
    }

    function is_ict_member() {

        $ict_members = $this->db->like('title', 'ict')->get('team')->result();
        $data = [];
        foreach ($ict_members as $members) {
            foreach (explode(",", $members->members) as $member) {
                $data[] = $member;
            }
        }

        if (array_search($this->login_user->id, $data)) {
            return TRUE;
        } else {
            return FALSE;
        }
    }
}
