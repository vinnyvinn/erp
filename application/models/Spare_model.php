<?php

class Spare_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'spares';
        parent::__construct($this->table);
    }
  
   
}