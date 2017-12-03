<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 01/12/2017
 * Time: 15:43
 */

class LegalDocumentsModel  extends Crud_model  {

    private $table = null;

    function __construct() {
        $this->table = 'tbl_legal_documents';
        parent::__construct($this->table);
    }

    function getOne($id){
        $this->db->select('*');
        $this->db->from($this->table);
        $this->db->where($this->table.".id", $id);
        $this->db->join('tbl_legal_document_types', 'tbl_legal_document_types.id = '.$this->table.'.document_type');
        $query = $this->db->get();
        if(isset($newQuery)){
            $query = $newQuery;
        }
        return $query->result();
    }


    function getDocuments($newQuery= null){
        $this->db->select('*');
        $this->db->from($this->table);
        $this->db->where($this->table.'.deleted',0);
        $query = $this->db->get();
        if(isset($newQuery)){
            $query = $newQuery;
        }

       return $query->result();
    }

    function row_delete($id){

        return $this->delete($id);
    }


}

