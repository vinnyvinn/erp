<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 13/12/2017
 * Time: 14:42
 */

class TblCustSuppChecksModel extends Crud_model
{
    private $table = null;

    function __construct() {
        $this->table = 'tbl_cust_supplier_checks';
        parent::__construct($this->table);
    }

    function getCustSupp($cust_supp_id, $nature=1){
        $sql = "SELECT * FROM ".$this->table." WHERE deleted=0 AND cust_supp_id=".$cust_supp_id. " AND type= ".$nature;
        return $this->db->query($sql)->row();
    }
}