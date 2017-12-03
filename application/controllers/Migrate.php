<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 01/12/2017
 * Time: 11:53
 */
class Migrate extends CI_Controller
{

    public function index()
    {
        $this->load->library('migration');

        if ($this->migration->current() === FALSE)
        {
            show_error($this->migration->error_string());
        }
    }

}

?>