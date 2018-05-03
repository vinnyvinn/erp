<?php

class Sage_clients_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'sage_clients';
        parent::__construct($this->table);
    }

    function getDetails(){
    	return $this->db->get_where('sage_clients',array(''))->result_array();
    }
    public function get_all_sage_clients()
		{
		$this->db->from('sage_clients');
		$query=$this->db->get();
		return $query->result_array();
		}
    function add_sage_clients($data){
        $this->db->insert('sage_clients', $data);
        return $this->db->insert_id();
        }

        public function get_sage_clients_by_id($id)
		{
		$this->db->from($this->table);
		$this->db->where('id',$id);
		$query = $this->db->get();
 
		return $query->row();
		}
		public function sage_clients_update($where, $data)
		{
		$this->db->update($this->table, $data, $where);
		return $this->db->affected_rows();
		}
      
		public function delete_sage_clients($id)
		{
		$this->db->where('id', $id);
		$this->db->delete($this->table);
		}
  }