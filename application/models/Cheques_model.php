<?php

class Cheques_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'cheques';
        parent::__construct($this->table);
    }

}
