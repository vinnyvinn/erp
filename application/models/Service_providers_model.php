<?php

class Service_providers_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'providers';
        parent::__construct($this->table);
    }

    function getDetails(){
    	return $this->db->get_where('providers',array(''))->result_array();
    }
    public function get_all_providers()
		{
		$this->db->from('providers');
		$query=$this->db->get();
		return $query->result_array();
		}
    function add_providers($data){
        $this->db->insert('providers', $data);
        return $this->db->insert_id();
        }

        public function get_providers_by_id($id)
		{
		$this->db->from($this->table);
		$this->db->where('id',$id);
		$query = $this->db->get();
 
		return $query->row();
		}
		public function providers_update($where, $data)
		{
		$this->db->update($this->table, $data, $where);
		return $this->db->affected_rows();
		}
 
		public function delete_provider($id)
		{
		$this->db->where('id', $id);
		$this->db->delete($this->table);
		}
  }