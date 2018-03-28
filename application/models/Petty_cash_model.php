<?php

class Petty_cash_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'petty_cash';
        parent::__construct($this->table);
    }

}
