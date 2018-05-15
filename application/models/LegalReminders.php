<?php


class LegalReminders extends Crud_model  {

    private $table = null;

    function __construct() {
        $this->table = 'tbl_doc_escalation_n_reminders';
        parent::__construct($this->table);
    }

    function getReminders($deleted=0){
        $sql = "SELECT $this->table.*  FROM $this->table WHERE deleted=".$deleted;

        return $this->db->query($sql)->result();
    }

    function row_delete($id){
        return $this->delete($id);
    }


}
