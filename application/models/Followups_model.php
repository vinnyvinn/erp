<?php

class Followups_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'followups';
        parent::__construct($this->table);
    }

    function getDetails(){
    	return $this->db->query("SELECT followups.*,assets.code FROM followups LEFT JOIN assets ON assets.id=followups.vehicle_id")->result_array();
    }
        function details($id){
    return $this->db->query("SELECT followups.*,assets.code FROM followups LEFT JOIN assets ON assets.id=followups.vehicle_id WHERE followups.id=$id")->row_array();
    }
    public function get_all_followups()
		{
		$this->db->from('followups');
		$query=$this->db->get();
		return $query->result_array();
		}
    function add_followups($data){
        $this->db->insert('followups', $data);
        return $this->db->insert_id();
        }

        public function get_followups_by_id($id)
		{
		$this->db->from($this->table);
		$this->db->where('id',$id);
		$query = $this->db->get();
 
		return $query->row();
		}
		public function followups_update($where, $data)
		{
		$this->db->update($this->table, $data, $where);
		return $this->db->affected_rows();
		}
      
		public function delete_followups($id)
		{
		$this->db->where('id', $id);
		$this->db->delete($this->table);
		}
  }