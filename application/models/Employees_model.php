<?php

class Employees_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'employees';
        parent::__construct($this->table);
    }

    function getDetails(){
    	return $this->db->get_where('employees',array(''))->result_array();
    }
    public function get_all_employees()
		{
		$this->db->from('employees');
		$query=$this->db->get();
		return $query->result_array();
		}
    function add_employees($data){
        $this->db->insert('employees', $data);
        return $this->db->insert_id();
        }

        public function get_employees_by_id($id)
		{
		$this->db->from($this->table);
		$this->db->where('id',$id);
		$query = $this->db->get();
 
		return $query->row();
		}
		public function employees_update($where, $data)
		{
		$this->db->update($this->table, $data, $where);
		return $this->db->affected_rows();
		}
 
		public function delete_employee($id)
		{
		$this->db->where('id', $id);
		$this->db->delete($this->table);
		}
  }