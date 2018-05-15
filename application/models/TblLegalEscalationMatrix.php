<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 01/12/2017
 * Time: 15:43
 */

class TblLegalEscalationMatrix  extends Crud_model  {

    private $table = null;

    function __construct() {
        $this->table = 'tbl_escalation_matrix';
        parent::__construct($this->table);
    }

    function getOne($id){
        $this->db->select('*');
        $this->db->from($this->table);
        $this->db->where($this->table.".id", $id);
        $query = $this->db->get();
        return $query->result();
    }


    function getMatrix(){
        $this->db->select('*');
        $this->db->from($this->table);
        $this->db->where($this->table.'.deleted',0);
        $query = $this->db->get();

       return $query->result();
    }

    function row_delete($id){

        return $this->delete($id);
    }


}

