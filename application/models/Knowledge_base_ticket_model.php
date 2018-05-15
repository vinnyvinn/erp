<?php

class Knowledge_base_ticket_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'tbl_knowledge_base_ticket';
        parent::__construct($this->table);
    }

}