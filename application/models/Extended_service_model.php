<?php

class Extended_service_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'extended_services';
        parent::__construct($this->table);
    }

    function getDetails(){
    	return $this->db->get_where('extended_services',array(''))->result_array();
    }
    public function get_all_services()
		{
		$this->db->from('extended_services');
		$query=$this->db->get();
		return $query->result_array();
		}
    function add_services($data){
        $this->db->insert('extended_services', $data);
        return $this->db->insert_id();
        }

        public function get_services_by_id($id)
		{
		$this->db->from($this->table);
		$this->db->where('id',$id);
		$query = $this->db->get();
 		return $query->row();
		}
		public function services_update($where, $data)
		{
		$this->db->update($this->table, $data, $where);
		return $this->db->affected_rows();
		}
 
		public function delete_service($id)
		{
		$this->db->where('id', $id);
		$this->db->delete($this->table);
		}
  }