<?php

class Jobs_status_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'jobs_status';
        parent::__construct($this->table);
    }

     function get_details($options = array()) {
        $jobs_status_table = $this->db->dbprefix('jobs_status');
        $where = "";
        $id = get_array_value($options, "id");
        if ($id) {
            $where = " AND $jobs_status_table.id=$id";
        }

        $sql = "SELECT $jobs_status_table.*
        FROM $jobs_status_table
        WHERE $jobs_status_table.deleted=0 $where";
        return $this->db->query($sql);
    }

}
