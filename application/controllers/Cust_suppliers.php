<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 09/12/2017
 * Time: 11:10
 */

if (!defined('BASEPATH'))
    exit('No direct script access allowed');
require_once("Pre_loader.php");

class Cust_suppliers extends Pre_loader
{
    //ensure pagination is loaded


    function index()
    {
        $this->template->rander("legal/custsupp/index");
    }


}