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

}
