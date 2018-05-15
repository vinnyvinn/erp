<?php

class Escalation_matrix_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'escalation_matrix';
        parent::__construct($this->table);
    }

}
