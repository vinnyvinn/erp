<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 01/12/2017
 * Time: 11:48
 */
defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_Tbl_Case_Status extends CI_Migration
{

    public function up()
    {
        $this->dbforge->add_field(array(
            'id' => array(
                'type' => 'INT',
                'constraint' => 50,
                'auto_increment' => TRUE,
                'NOT NULL'=>true
            ),
            'status' => array(
                'type' => 'VARCHAR',
                'constraint' => '100',
            ),
        ));
        $this->dbforge->add_key('id', TRUE);
        $this->dbforge->create_table('tbl_case_status');


    }

    public function down()
    {
        $this->dbforge->drop_table('tbl_legal_documents');
    }
}
    ?>