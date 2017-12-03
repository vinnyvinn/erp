<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 01/12/2017
 * Time: 11:48
 */
defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_tbl_cases extends CI_Migration
{

    public function up()
    {
        $this->dbforge->add_field(array(
            'id' => array(
                'type' => 'INT',
                'unsigned' => TRUE,
                'auto_increment' => TRUE
            ),
            'name' => array(
                'type' => 'VARCHAR',
                'constraint' => '100',
            ),
            'status' => array(
                'type' => 'INT',
            ),
            'deleted' => array(
                'type' => 'INT',
                'default' => '0',
            ),
            'procedure' => array(
                'type' => 'INT',
                'constraint' => '10',
                'unsigned' => TRUE,
            ),


        ));
        $this->dbforge->add_key('id', TRUE);
        $this->dbforge->create_table('tbl_case_type');
    }

    public function down()
    {


    }
}
?>