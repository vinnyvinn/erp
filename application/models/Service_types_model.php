<?php

class Service_types_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'service_types';
        parent::__construct($this->table);
    }

      function get_details($options = array()) {
        $service_types_table = $this->db->dbprefix('service_types');
        $where = "";
        $id = get_array_value($options, "id");
        if ($id) {
            $where = " AND $service_types_table.id=$id";
        }

        $sql = "SELECT $service_types_table.*
        FROM $service_types_table
        WHERE $service_types_table.deleted=0 $where";
        return $this->db->query($sql);
    }
    public function get_all_service_types()
		{
		$this->db->from('service_types');
		$query=$this->db->get();
		return $query->result();
		}
    function add_service($data){
        $this->db->insert('service_types', $data);
        return $this->db->insert_id();
        }

        public function getservice_by_id($id)
		{
		$this->db->from($this->table);
		$this->db->where('id',$id);
		$query = $this->db->get();
 
		return $query->row();
		}
		public function service_type_update($where, $data)
		{
		$this->db->update($this->table, $data, $where);
		return $this->db->affected_rows();
		}
 
		public function delete_service_type($id)
		{
		$this->db->where('id', $id);
		$this->db->delete($this->table);
		}
}
