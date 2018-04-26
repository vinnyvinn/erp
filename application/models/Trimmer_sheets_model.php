<?php

class Trimmer_sheets_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'trimmer_sheets';
        parent::__construct($this->table);
    }

    function getDetails(){
    	return $this->db->get_where('trimmer_sheets',array(''))->result_array();
    }
    public function get_all_trimmers()
		{
		$this->db->from('trimmer_sheets');
		$query=$this->db->get();
		return $query->result_array();
		}
    function add_trimmers($data){
        $this->db->insert('trimmer_sheets', $data);
        return $this->db->insert_id();
        }

        public function get_trimmers_by_id($id)
		{
		$this->db->from($this->table);
		$this->db->where('id',$id);
		$query = $this->db->get();
 
		return $query->row();
		}
		public function trimmers_update($where, $data)
		{
		$this->db->update($this->table, $data, $where);
		return $this->db->affected_rows();
		}
      
		public function delete_trimmer($id)
		{
		$this->db->where('id', $id);
		$this->db->delete($this->table);
		}
  }