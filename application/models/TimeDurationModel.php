<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 01/12/2017
 * Time: 15:43
 */

class TimeDurationModel  extends Crud_model  {

    private $table = null;

    function __construct() {
        $this->table = 'tbl_time_durations';
        parent::__construct($this->table);
    }

    function getTime(){
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

