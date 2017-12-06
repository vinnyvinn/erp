<?php


class LegalCasesModel extends Crud_model  {

    private $table = null;

    function __construct() {
        $this->table = 'tbl_cases';
        parent::__construct($this->table);
    }

    function getCases($deleted){
        $sql = "SELECT $this->table.*  FROM $this->table WHERE deleted=".$deleted;

        return $this->db->query($sql)->result();
    }

    function getCaseDetails($id){
        $sql = "SELECT $this->table.*  FROM $this->table WHERE id=".$id;

        return $this->db->query($sql)->row();
    }

    function row_delete($id){
        return $this->delete($id);
    }


}

