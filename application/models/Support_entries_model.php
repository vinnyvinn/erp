<?php

class Support_entries_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'support_entries';
        parent::__construct($this->table);
    }
  public function get_details(){
  	$this->db->query("SELECT * FROM support_entries")->result();
  }

     public function support_update($comment_id)
		{

	     $this->db->set('status','closed');
       $this->db->where('id',$comment_id);
       $this->db->update('support_entries');
	}

   public function support_update_open($status_id)
    {

       $this->db->set('status','open');
       $this->db->where('id',$status_id);
       $this->db->update('support_entries');
  }

  public function get_ict_members(){
    return $this->db->query("SELECT email FROM users WHERE role_id = 9")->result();
  }
}