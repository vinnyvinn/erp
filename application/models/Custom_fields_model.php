<?php

class Custom_fields_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'custom_fields';
        parent::__construct($this->table);
    }

    function get_details($options = array()) {
        $custom_fields_table = $this->db->dbprefix('custom_fields');

        $where = "";
        $id = get_array_value($options, "id");
        if ($id) {
            $where .= " AND $custom_fields_table.id=$id";
        }


        $related_to = get_array_value($options, "related_to");
        if ($related_to) {
            $where .= " AND $custom_fields_table.related_to='$related_to'";
        }

        $sql = "SELECT $custom_fields_table.*
        FROM $custom_fields_table
        WHERE $custom_fields_table.deleted=0 $where 
        ORDER by $custom_fields_table.sort ASC";
        return $this->db->query($sql);
    }

    function get_max_sort_value($related_to = "") {
        $custom_fields_table = $this->db->dbprefix('custom_fields');

        $sql = "SELECT MAX($custom_fields_table.sort) as sort
        FROM $custom_fields_table
        WHERE $custom_fields_table.deleted=0 AND $custom_fields_table.related_to='$related_to'";
        $result = $this->db->query($sql);
        if ($result->num_rows()) {
            return $result->row()->sort;
        } else {
            return 0;
        }
    }

}
