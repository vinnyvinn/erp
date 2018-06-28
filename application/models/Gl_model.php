<?php

class Gl_model extends Crud_model {

	private $table = null;

	function __construct() {
		$this->table = 'gl_accounts';
		parent::__construct($this->table);
	}

	
	public function get_all_gl()
	{
		$this->db->from('gl_accounts');
		$query=$this->db->get();
		return $query->result_array();
	}
	function add_gl($data){
		$this->db->insert('gl_accounts', $data);
		return $this->db->insert_id();
	}

	public function get_gl_by_id($id)
	{
		$this->db->from($this->table);
		$this->db->where('id',$id);
		$query = $this->db->get();
		
		return $query->row();
	}
	public function gl_update($where, $data)
	{
		$this->db->update($this->table, $data, $where);
		return $this->db->affected_rows();
	}
	
	public function delete_gl($id)
	{
		$this->db->where('id', $id);
		$this->db->delete($this->table);
	}
}