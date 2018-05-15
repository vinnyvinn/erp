<?php

class Hire_assets_model extends Crud_model {

	private $table = null;

	function __construct() {
		$this->table = 'hire_assets';
		parent::__construct($this->table);
	}

	function getDetails(){
		return $this->db->get_where('hire_assets',array(''))->result_array();
	}
	public function get_all_hire_assets()
	{
		$this->db->from('hire_assets');
		$query=$this->db->get();
		return $query->result_array();
	}
	function hire_assets_add($data){
		$this->db->insert('hire_assets', $data);
		return $this->db->insert_id();
	}

	public function get_hire_assets_by_id($id)
	{
		$this->db->from($this->table);
		$this->db->where('id',$id);
		$query = $this->db->get();
		
		return $query->row();
	}
	public function hire_assets_update($where, $data)
	{
		$this->db->update($this->table, $data, $where);
		return $this->db->affected_rows();
	}
	
	public function delete_hire_asset($id)
	{
		$this->db->where('id', $id);
		$this->db->delete($this->table);
	}
}