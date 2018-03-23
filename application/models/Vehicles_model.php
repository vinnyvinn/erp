<?php

class Vehicles_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'vehicle_details';
        parent::__construct($this->table);
    }
    function get_details($options = array()) {
        $vehicles_table = $this->db->dbprefix('vehicle_details');
        $where = "";
        $id = get_array_value($options, "id");
        if ($id) {
            $where = " AND $vehicles_table.id=$id";
        }

        $sql = "SELECT $vehicles_table.*
        FROM $vehicles_table
        WHERE $vehicles_table.deleted=0 $where";
        return $this->db->query($sql);
    }
}