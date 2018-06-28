<?php

class Sage_projects_model extends Crud_model {

	private $table = null;

	function __construct() {
		$this->table = 'sage_projects';
		parent::__construct($this->table);
	}

	
	public function get_all_projects()
	{
		$this->db->from('sage_projects');
		$query=$this->db->get();
		return $query->result_array();
	}
	function add_project($data){
		$this->db->insert('sage_projects', $data);
		return $this->db->insert_id();
	}

	public function get_project_by_id($id)
	{
		$this->db->from($this->table);
		$this->db->where('id',$id);
		$query = $this->db->get();
		
		return $query->row();
	}
	public function project_update($where, $data)
	{
		$this->db->update($this->table, $data, $where);
		return $this->db->affected_rows();
	}
	
	public function delete_project($id)
	{
		$this->db->where('id', $id);
		$this->db->delete($this->table);
	}
}