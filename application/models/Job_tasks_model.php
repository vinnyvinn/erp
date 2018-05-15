<?php

class Job_tasks_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'job_tasks';
        parent::__construct($this->table);
    }
     
     function get_details($options = array()) {
        $job_tasks_table = $this->db->dbprefix('job_tasks');
        $where = "";
        $id = get_array_value($options, "id");
        if ($id) {
            $where = " AND $job_tasks_table.id=$id";
        }

        $sql = "SELECT $job_tasks_table.*
        FROM $job_tasks_table
        WHERE $job_tasks_table.deleted=0 $where";
        return $this->db->query($sql);
    }
    public function get_all_tasks()
		{
		$this->db->from('job_tasks');
		$query=$this->db->get();
		return $query->result_array();
		}
    function add_task($data){
        $this->db->insert('job_tasks', $data);
        return $this->db->insert_id();
        }

        public function gettasks_by_id($id)
		{
		$this->db->from($this->table);
		$this->db->where('id',$id);
		$query = $this->db->get();
 
		return $query->row();
		}
		public function task_update($where, $data)
		{
		$this->db->update($this->table, $data, $where);
		return $this->db->affected_rows();
		}
 
		public function delete_task($id)
		{
		$this->db->where('id', $id);
		$this->db->delete($this->table);
		}

}
