<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 13/12/2017
 * Time: 02:58
 */

class TblCustSuppCheckItemsModel  extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'tbl_cust_supp_checkitems';
        parent::__construct($this->table);
    }

    function getAll(){
        $SAGE_DB = $this->load->database('SAGE', TRUE);

        $sql = "SELECT * FROM ".$this->table." WHERE deleted=0";
        return $this->db->query($sql)->result();

    }
    function get_item($id){
        $sql = "SELECT * FROM ".$this->table." WHERE id=".$id;
        return $this->db->query($sql)->row();
    }
    function getChecks($nature){
        $oldsql = "SELECT * FROM ".$this->table." WHERE CONCAT(',', performed_on, ',') LIKE '%,$nature,%' AND deleted=0";
        return $this->db->query($oldsql)->result();
    }

}
