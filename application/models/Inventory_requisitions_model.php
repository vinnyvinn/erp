<?php

class Inventory_requisitions_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'inventory_requisitions';
        parent::__construct($this->table);
    }

}
