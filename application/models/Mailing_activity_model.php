<?php

class Mailing_activity_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'mailing_activity';
        parent::__construct($this->table);
    }

}
