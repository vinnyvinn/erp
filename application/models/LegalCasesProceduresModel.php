<?php


class LegalCasesProceduresModel extends Crud_model  {

    private $table = null;

    function __construct() {
        $this->table = 'tbl_legal_case_procedures';
        parent::__construct($this->table);
    }

    function getCasesProcedures($case=0,$deleted=0){
        $sql = "SELECT $this->table.*  FROM $this->table WHERE deleted=0 AND legal_case =".$case;

        return $this->db->query($sql)->result();
    }
    function getSingleCasesProcedures($case=0,$deleted=0){
        $sql = "SELECT $this->table.*  FROM $this->table WHERE deleted=".$deleted ." AND legal_case =".$case;

        return $this->db->query($sql)->row();
    }




    function row_delete($id){
        return $this->delete($id);
    }


}

