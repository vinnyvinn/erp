<?php

class Petty_cash_type_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'petty_cash_types';
        parent::__construct($this->table);
    }

}
