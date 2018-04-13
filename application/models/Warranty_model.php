<?php

class Warranty_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'warranties';
        parent::__construct($this->table);
    }

    function getDetails(){
    	return $this->db->get_where('warranties',array(''))->result_array();
    }
    public function get_all_warranty_assets()
		{
		$this->db->from('warranties');
		$query=$this->db->get();
		return $query->result_array();
		}
    function warranty_assets_add($data){
        $this->db->insert('warranties', $data);
        return $this->db->insert_id();
        }

        public function get_warranty_asset_by_id($id)
		{
		$this->db->from($this->table);
		$this->db->where('id',$id);
		$query = $this->db->get();
 
		return $query->row();
		}
		public function warranty_asset_update($where, $data)
		{
		$this->db->update($this->table, $data, $where);
		return $this->db->affected_rows();
		}
 
		public function delete_warranty_asset($id)
		{
		$this->db->where('id', $id);
		$this->db->delete($this->table);
		}
  }