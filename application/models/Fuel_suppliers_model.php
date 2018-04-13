<?php

class Fuel_suppliers_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'fuel_suppliers';
        parent::__construct($this->table);
    }

    function getDetails(){
    	return $this->db->get_where('fuel_suppliers',array(''))->result_array();
    }
    public function get_all_fuel_suppliers()
		{
		$this->db->from('fuel_suppliers');
		$query=$this->db->get();
		return $query->result_array();
		}
    function add_fuel_suppliers($data){
        $this->db->insert('fuel_suppliers', $data);
        return $this->db->insert_id();
        }

        public function get_fuel_suppliers_by_id($id)
		{
		$this->db->from($this->table);
		$this->db->where('id',$id);
		$query = $this->db->get();
 
		return $query->row();
		}
		public function fuel_suppliers_update($where, $data)
		{
		$this->db->update($this->table, $data, $where);
		return $this->db->affected_rows();
		}
      
		public function delete_fuel_supplier($id)
		{
		$this->db->where('id', $id);
		$this->db->delete($this->table);
		}
  }