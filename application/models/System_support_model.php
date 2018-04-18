<?php

class System_support_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'system_supports';
        parent::__construct($this->table);
    }

    function getDetails(){
    	return $this->db->get_where('system_supports',array(''))->result_array();
    }
    public function get_all_system_supports()
		{
		$this->db->from('system_supports');
		$query=$this->db->get();
		return $query->result_array();
		}
    function system_supports($data){
        $this->db->insert('system_supports', $data);
        return $this->db->insert_id();
        }

        public function get_system_supports_by_id($id)
		{
		$this->db->from($this->table);
		$this->db->where('id',$id);
		$query = $this->db->get();
 
		return $query->row();
		}
		public function system_supports_update($where, $data)
		{
		$this->db->update($this->table, $data, $where);
		return $this->db->affected_rows();
		}
      
		public function delete_system_supports($id)
		{
		$this->db->where('id', $id);
		$this->db->delete($this->table);
		}
  }