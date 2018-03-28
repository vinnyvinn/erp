<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');
require_once("Pre_loader.php");

class Reports extends Pre_loader {

    function __construct() {
        parent::__construct();
        $this->init_permission_checker("announcement");
    }

   function index(){
       $this->template->rander("geom/reports/index");
   }

}

/* End of file announcements.php */
/* Location: ./application/controllers/announcements.php */