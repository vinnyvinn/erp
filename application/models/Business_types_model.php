<?php

class Business_types_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'business_types';
        parent::__construct($this->table);
    }

    function get_details($options = array()) {
        $business_types_table = $this->db->dbprefix('business_types');
        $where = "";
        $id = get_array_value($options, "id");
        if ($id) {
            $where = " AND $business_types_table.id=$id";
        }

        $sql = "SELECT $business_types_table.*
        FROM $business_types_table
        WHERE $business_types_table.deleted=0 $where";
        return $this->db->query($sql);
    }
    

}
