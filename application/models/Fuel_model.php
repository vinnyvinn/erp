<?php

class Fuel_model extends Crud_model {

	private $table = null;

	function __construct() {
		$this->table = 'fuels';
		parent::__construct($this->table);
	}

	function getDetails(){
		return $this->db->get_where('fuels',array(''))->result_array();
	}
	public function get_all_fuels()
	{
		$this->db->from('fuels');
		$query=$this->db->get();
		return $query->result_array();
	}
	function fuels_add($data){
		$this->db->insert('fuels', $data);
		return $this->db->insert_id();
	}

	public function get_fuel_by_id($id)
	{
		$this->db->from($this->table);
		$this->db->where('id',$id);
		$query = $this->db->get();
		
		return $query->row();
	}
	public function fuel_update($where, $data)
	{
		$this->db->update($this->table, $data, $where);
		return $this->db->affected_rows();
	}
	
	public function delete_fuel($id)
	{
		$this->db->where('id', $id);
		$this->db->delete($this->table);
	}
}