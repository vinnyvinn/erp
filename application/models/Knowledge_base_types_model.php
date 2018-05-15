<?php

class Knowledge_base_types_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'tbl_knowledge_base_types';
        parent::__construct($this->table);
    }

}