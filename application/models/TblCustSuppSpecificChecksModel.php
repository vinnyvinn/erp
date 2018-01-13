<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 13/12/2017
 * Time: 02:58
 */

class TblCustSuppSpecificChecksModel  extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'tbl_cust_supplier_specific_checks';
        parent::__construct($this->table);
    }

    function getChecks($custid){
        $sql = "SELECT * FROM ".$this->table." WHERE deleted=0 AND customer_id=".$custid;
        return $this->db->query($sql)->result();
    }

    function forcedelete($id){

        $sql = "DELETE FROM ".$this->table." WHERE id =".$id;
        return $this->db->query($sql);

    }

}
