<?php

class Preventive_maintainance_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'preventive_maintainance';
        parent::__construct($this->table);
    }

}
