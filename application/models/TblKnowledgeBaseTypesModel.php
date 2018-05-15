<?php

class TblKnowledgeBaseTypesModel extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'tbl_knowledge_base_types';
        parent::__construct($this->table);
    }

    function get_details($id) {

        $sql = "SELECT *
        FROM $this->table
        WHERE deleted=0 AND id=".(int)$id;
        return $this->db->query($sql);
    }

    function getall(){
        $sql = "SELECT $this->table.*
        FROM $this->table
        WHERE $this->table.deleted=0";
        return $this->db->query($sql);
    }

}
