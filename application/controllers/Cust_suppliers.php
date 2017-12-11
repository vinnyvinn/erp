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
    public function __construct() {
        parent::__construct();
        $this->load->helper(array('form', 'url'));
        $this->load->library('pagination');

        $config['base_url'] = 'http://example.com/index.php/test/page/';
        $config['total_rows'] = 200;
        $config['per_page'] = 20;

        $this->pagination->initialize($config);
    }

    function index()
    {
        $this->template->rander("legal/custsupp/index");
    }

    //customers
    function list_customers($status=0)
    {
        $SAGE_DB = $this->load->database('SAGE', TRUE);
        $sql = "SELECT * FROM dbo.Vendor";

        $results =  $SAGE_DB->query($sql)->result();

        return $results;


    }

    //suppliers
    function list_suppliers($status=0)
    {
        $SAGE_DB = $this->load->database('SAGE', TRUE);
        $sql = "SELECT * FROM dbo.Vendor";

        $results =  $SAGE_DB->query($sql)->result();

        return $results;


    }


}