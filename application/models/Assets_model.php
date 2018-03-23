<?php

class Assets_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'assets';
        parent::__construct($this->table);
    }

    function getDetails(){
    	return $this->db->get_where('assets',array(''))->result_array();
    }
    public function get_all_assets()
		{
		$this->db->from('assets');
		$query=$this->db->get();
		return $query->result_array();
		}
    function add_assets($data){
        $this->db->insert('assets', $data);
        return $this->db->insert_id();
        }

        public function get_assets_by_id($id)
		{
		$this->db->from($this->table);
		$this->db->where('id',$id);
		$query = $this->db->get();
 
		return $query->row();
		}
		public function assets_update($where, $data)
		{
		$this->db->update($this->table, $data, $where);
		return $this->db->affected_rows();
		}
 
		public function delete_asset($id)
		{
		$this->db->where('id', $id);
		$this->db->delete($this->table);
		}
  }