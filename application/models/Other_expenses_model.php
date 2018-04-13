<?php

class Other_expenses_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'other_expenses';
        parent::__construct($this->table);
    }

    function getDetails(){
    	return $this->db->get_where('other_expenses',array(''))->result_array();
    }
    public function get_all_expenses()
		{
		$this->db->from('other_expenses');
		$query=$this->db->get();
		return $query->result_array();
		}
    function add_expenses($data){
        $this->db->insert('other_expenses', $data);
        return $this->db->insert_id();
        }

        public function get_expenses_by_id($id)
		{
		$this->db->from($this->table);
		$this->db->where('id',$id);
		$query = $this->db->get();
 
		return $query->row();
		}
		public function expenses_update($where, $data)
		{
		$this->db->update($this->table, $data, $where);
		return $this->db->affected_rows();
		}
      
		public function delete_expense($id)
		{
		$this->db->where('id', $id);
		$this->db->delete($this->table);
		}
  }