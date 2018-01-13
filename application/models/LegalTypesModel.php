<?php


class LegalTypesModel extends Crud_model  {

    private $table = null;

    function __construct() {
        $this->table = 'tbl_case_type';
        parent::__construct($this->table);
    }

    function getType($deleted){
        $sql = "SELECT $this->table.*  FROM $this->table WHERE deleted=".$deleted;

        return $this->db->query($sql);
    }

    function row_delete($id){
        return $this->delete($id);
    }


}

