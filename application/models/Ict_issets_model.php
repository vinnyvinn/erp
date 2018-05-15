<?php

class Ict_issets_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'ict_issets';
        parent::__construct($this->table);
    }

}
