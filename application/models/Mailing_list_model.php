<?php

class Mailing_list_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'mailing_list';
        parent::__construct($this->table);
    }

}
