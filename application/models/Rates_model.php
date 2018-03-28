<?php

class Rates_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'rates_perhour';
        parent::__construct($this->table);
    }
public function get_all_rates()
		{
		$this->db->from('rates_perhour');
		$query=$this->db->get();
		return $query->result_array();
		}
    function add_rates($data){
        $this->db->insert('rates_perhour', $data);
        return $this->db->insert_id();
        }

        public function get_rates_by_id($id)
		{
		$this->db->from($this->table);
		$this->db->where('id',$id);
		$query = $this->db->get();
 
		return $query->row();
		}
		public function rates_update($where, $data)
		{
		$this->db->update($this->table, $data, $where);
		return $this->db->affected_rows();
		}
 
		public function delete_rate($id)
		{
		$this->db->where('id', $id);
		$this->db->delete($this->table);
		}
	}