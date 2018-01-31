<?php

class Call_types_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'call_types';
        parent::__construct($this->table);
    }

    function get_details($options = array()) {
        $call_types_table = $this->db->dbprefix('call_types');
        $where = "";
        $id = get_array_value($options, "id");
        if ($id) {
            $where = " AND $call_types_table.id=$id";
        }

        $sql = "SELECT $call_types_table.*
        FROM $call_types_table
        WHERE $call_types_table.deleted=0 $where";
        return $this->db->query($sql);
    }
    

}
