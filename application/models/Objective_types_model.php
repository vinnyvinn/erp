<?php

class Objective_types_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'objective_types';
        parent::__construct($this->table);
    }

    function get_details($options = array()) {
        $objective_types_table = $this->db->dbprefix('objective_types');
        $where = "";
        $id = get_array_value($options, "id");
        if ($id) {
            $where = " AND $objective_types_table.id=$id";
        }

        $sql = "SELECT $objective_types_table.*
        FROM $objective_types_table
        WHERE $objective_types_table.deleted=0 $where";
        return $this->db->query($sql);
    }
    

}
