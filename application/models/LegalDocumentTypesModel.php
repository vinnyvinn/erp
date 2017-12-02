<?php


class LegalDocumentTypesModel extends Crud_model  {

    private $table = null;

    function __construct() {
        $this->table = 'tbl_legal_document_types';
        parent::__construct($this->table);
    }

    function getTypes($newSql= null){
         $sql = "SELECT $this->table.*  FROM $this->table WHERE deleted=0";

        return $this->db->query($sql);
    }

    function row_delete($id){
        return $this->delete($id);
    }


}

