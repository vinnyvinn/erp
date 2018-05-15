<?php

class Team_member_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'team_member_job_info';
        parent::__construct($this->table);
    }

}
