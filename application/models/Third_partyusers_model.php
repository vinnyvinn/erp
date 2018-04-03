<?php

class Third_partyusers_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'tbl_third_party';
        parent::__construct($this->table);
    }
function add_messages($data)
{
  $this->db->insert('third_party_messages',$data);
}

function get_thirdparty_details($myName=""){
	$sql= "SELECT * FROM $this->table WHERE id=$myName";
	return $this->db->query($sql)->row();

	  
}
}
