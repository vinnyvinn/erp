<?php


class LegalProceduresModel extends Crud_model  {

    private $table = null;

    function __construct() {
        $this->table = 'tbl_case_procedures';
        parent::__construct($this->table);
    }

    function getProcedures($deleted){
        $sql = "SELECT $this->table.*  FROM $this->table WHERE deleted=".$deleted;

        return $this->db->query($sql);
    }

    function getProcedure($id){
        $sql = "SELECT $this->table.*  FROM $this->table WHERE id=".$id;

        return $this->db->query($sql)->row();
    }

    function row_delete($id){
        return $this->delete($id);
    }


}

