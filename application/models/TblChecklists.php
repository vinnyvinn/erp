<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 14/12/2017
 * Time: 12:12
 */
class TblChecklists extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'tbl_checklists';
        parent::__construct($this->table);
    }

    function getAll($performed_on=null){
        $sql = "SELECT * FROM ".$this->table." WHERE deleted=0 ";
        if(!empty($id)){
            $sql .="AND performed_on=".$performed_on;
        }
        return $this->db->query($sql)->result();
    }
    function get_item($id){
        $sql = "SELECT * FROM ".$this->table." WHERE id=".$id;
        return $this->db->query($sql)->row();
    }

}
