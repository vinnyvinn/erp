<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 01/12/2017
 * Time: 11:48
 */
defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_tbl_escalation_reminders extends CI_Migration
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
               'constraint'=>200
            ),
            'doc_type' => array(
                'type' => 'INT',
                'unsigned' => TRUE,
            ),
            'reminder_to' => array(
                'type' => 'INT',
                'constraint' => '11',
            ),
            'duration_before'=> array(
                'type' => 'INT',
                'unsigned' => TRUE,
            ),
            'reminder_every' => array(
                'type' => 'INT',
                'unsigned' => TRUE,

            ),
            'reminder_for' => array(
                'type' => 'INT',
                'unsigned' => TRUE,
            ),
            'deleted' => array(
                'type' => 'INT',
                'default' => '0',
            ),


        ));
        $this->dbforge->add_key('id', TRUE);
        $this->dbforge->create_table('tbl_doc_escalation_n_reminders');
    }

    public function down()
    {


    }
}
?>