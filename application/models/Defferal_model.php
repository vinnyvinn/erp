<?php

class Defferal_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'defferals';
        parent::__construct($this->table);
    }

    function defferal_add($data){
		$this->db->insert('defferals', $data);
		return $this->db->insert_id();
	}

	public function defferal_update($where, $data)
  {
    $this->db->update($this->table, $data, $where);
    return $this->db->affected_rows();
  }

  }