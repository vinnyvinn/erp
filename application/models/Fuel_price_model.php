<?php

class Fuel_price_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'fuel_prices';
        parent::__construct($this->table);
    }

    function getDetails(){
    	return $this->db->get_where('fuel_prices',array(''))->result_array();
    }
    public function get_all_prices()
		{
		$this->db->from('fuel_prices');
		$query=$this->db->get();
		return $query->result_array();
		}
    function add_prices($data){
        $this->db->insert('fuel_prices', $data);
        return $this->db->insert_id();
        }

        public function get_prices_by_id($id)
		{
		$this->db->from($this->table);
		$this->db->where('id',$id);
		$query = $this->db->get();
 
		return $query->row();
		}
		public function prices_update($where, $data)
		{
		$this->db->update($this->table, $data, $where);
		return $this->db->affected_rows();
		}
      
		public function delete_price($id)
		{
		$this->db->where('id', $id);
		$this->db->delete($this->table);
		}
  }