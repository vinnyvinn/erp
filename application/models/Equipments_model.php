<?php

class Equipments_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'equipments';
        parent::__construct($this->table);
    }
     public function get_all_equipment()
		{
		$this->db->from('equipments');
		$query=$this->db->get();
		return $query->result_array();
		}
    function add_equipment($data){
        $this->db->insert('equipments', $data);
        return $this->db->insert_id();
        }

        public function get_equipment_by_id($id)
		{
		$this->db->from($this->table);
		$this->db->where('id',$id);
		$query = $this->db->get();
 
		return $query->row();
		}
		public function equipment_update($where, $data)
		{
		$this->db->update($this->table, $data, $where);
		return $this->db->affected_rows();
		}
 
		public function delete_equipment($id)
		{
		$this->db->where('id', $id);
		$this->db->delete($this->table);
		}

}