<?php

class Job_types_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'job_types';
        parent::__construct($this->table);
    }

   function get_details($id) {
      return $this->db->get_where( 'job_types', array( 'id' => $id ) )->result_array();
        
    }

     public function get_all_jobs()
		{
		$this->db->from('job_types');
		$query=$this->db->get();
		return $query->result_array();
		}
    function add_jobs($data){
        $this->db->insert('job_types', $data);
        return $this->db->insert_id();
        }

        public function get_jobs_by_id($id)
		{
		$this->db->from($this->table);
		$this->db->where('id',$id);
		$query = $this->db->get();
 
		return $query->row();
		}
		public function jobs_update($where, $data)
		{
		$this->db->update($this->table, $data, $where);
		return $this->db->affected_rows();
		}
 
		public function delete_job($id)
		{
		$this->db->where('id', $id);
		$this->db->delete($this->table);
		}
}
