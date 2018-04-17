<?php

class Mailing_parcel_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'mailing_parcel';
        parent::__construct($this->table);
    }

}
