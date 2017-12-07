<?php

class TblKnowledgeBaseModel extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'tbl_knowledge_base';
        parent::__construct($this->table);
    }

    function get_details($options = array()) {
        $knowledgebase_table = $this->db->dbprefix('tbl_knowledge_base');
        $where = "";
        $id = get_array_value($options, "id");

        if ($id && $id != null) {
            $where = " AND $knowledgebase_table.id=$id";
        }

        $sql = "SELECT $knowledgebase_table.*
        FROM $knowledgebase_table
        WHERE $knowledgebase_table.deleted=0 $where";
        return $this->db->query($sql);
    }

    function get_knowledge_details($id) {
        $knowledgebase_table = $this->db->dbprefix('tbl_knowledge_base');
        if(!$id && empty($id) && $id == null){
            $where = "id = null";
        }else{
            $where = "id = ".$id;
        }

          $sql = "SELECT $knowledgebase_table.*
        FROM $knowledgebase_table
        WHERE $where AND $knowledgebase_table.deleted=0 ";
        return $this->db->query($sql);
    }

    function getOne($id){
        $this->db->select('*');
        $this->db->from($this->table);
        $this->db->where($this->table.".id", $id);
       return $query = $this->db->get()->row();

    }

}
