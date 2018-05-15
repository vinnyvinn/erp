<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 14/12/2017
 * Time: 12:12
 */
class TblChecklistStatus extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'tbl_checklist_status';
        parent::__construct($this->table);
    }

    function getAll(){
        $sql = "SELECT * FROM ".$this->table." WHERE deleted=0";
        return $this->db->query($sql)->result();

    }
    function get_item($id){
        $sql = "SELECT * FROM ".$this->table." WHERE id=".$id;
        return $this->db->query($sql)->row();
    }

}
