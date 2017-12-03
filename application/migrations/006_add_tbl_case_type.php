<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 01/12/2017
 * Time: 11:48
 */
defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_tbl_case_type extends CI_Migration
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
            'deleted' => array(
                'type' => 'INT',
                'default' => '0',
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