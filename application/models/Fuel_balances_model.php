<?php

class Fuel_balances_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'fuel_balances';
        parent::__construct($this->table);
    }
}