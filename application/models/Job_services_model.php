<?php

class Job_services_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'job_services';
        parent::__construct($this->table);
    }

     function get_details($options = array()) {
        $services_types_table = $this->db->dbprefix('job_services');
        $where = "";
        $id = get_array_value($options, "id");
        if ($id) {
            $where = " AND $services_types_table.id=$id";
        }

        $sql = "SELECT $services_types_table.*
        FROM $services_types_table
        WHERE $services_types_table.deleted=0 $where";
        return $this->db->query($sql);
    }

     public function get_all_job_services()
        {
        $this->db->from('job_services');
        $query=$this->db->get();
        return $query->result_array();
        }
    function add_jobservice($data){
        $this->db->insert('job_services', $data);
        return $this->db->insert_id();
        }

        public function get_by_id($id)
        {
        $this->db->from($this->table);
        $this->db->where('id',$id);
        $query = $this->db->get();
 
        return $query->row();
        }
        public function job_service_update($where, $data)
        {
        $this->db->update($this->table, $data, $where);
        return $this->db->affected_rows();
        }
 
        public function delete_job_service($id)
        {
        $this->db->where('id', $id);
        $this->db->delete($this->table);
        }

}
