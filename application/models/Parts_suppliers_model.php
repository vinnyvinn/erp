<?php

class Parts_suppliers_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'parts_suppliers';
        parent::__construct($this->table);
    }

    function getDetails(){
    	return $this->db->get_where('parts_suppliers',array(''))->result_array();
    }
    public function get_all_suppliers()
		{
		$this->db->from('parts_suppliers');
		$query=$this->db->get();
		return $query->result_array();
		}
    function add_suppliers($data){
        $this->db->insert('parts_suppliers', $data);
        return $this->db->insert_id();
        }

        public function get_suppliers_by_id($id)
		{
		$this->db->from($this->table);
		$this->db->where('id',$id);
		$query = $this->db->get();
 
		return $query->row();
		}
		public function suppliers_update($where, $data)
		{
		$this->db->update($this->table, $data, $where);
		return $this->db->affected_rows();
		}
 
		public function delete_supplier($id)
		{
		$this->db->where('id', $id);
		$this->db->delete($this->table);
		}
  }