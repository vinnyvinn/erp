<?php

class Knowledge_base_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'tbl_knowledge_base';
        parent::__construct($this->table);
    }

}