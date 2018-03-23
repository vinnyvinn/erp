<?php

class Inspections_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'job_inspections';
        parent::__construct($this->table);
    }

     function get_details() {
      return $this->db->get_where( 'job_inspections', array( 'deleted' => 0 ) )->result_array();
        
    }
   
   public function get_all_inspections()
		{
		$this->db->from('job_inspections');
		$query=$this->db->get();
		return $query->result_array();
		}
    function add_data($data){
        $this->db->insert('job_inspections', $data);
        return $this->db->insert_id();
        }

        public function get_inspections_by_id($id)
		{
		$this->db->from($this->table);
		$this->db->where('id',$id);
		$query = $this->db->get();
 
		return $query->row();
		}
		public function inspections_update($where, $data)
		{
		$this->db->update($this->table, $data, $where);
		return $this->db->affected_rows();
		}
 
		public function delete_inspection($id)
		{
		$this->db->where('id', $id);
		$this->db->delete($this->table);
		}
}
