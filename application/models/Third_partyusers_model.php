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
function get_userId()
{

    $usertype_table = $this->db->dbprefix('tbl_third_party');
  $ID=$this->session->usn;
  $sql = "SELECT $usertype_table.*
  FROM $usertype_table
  WHERE $usertype_table.username=$ID";
  return $this->db->query($sql)->row()->id;
}
}
