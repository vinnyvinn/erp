<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 01/12/2017
 * Time: 11:48
 */
defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_tbl_time_durations extends CI_Migration
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
                'constraint' => '200',
            ),
            'type' => array(
                'type' => 'INT',
                'unsigned' => TRUE,
            ),
            'deleted' => array(
                'type' => 'INT',
                'default'=>0
            ),
        ));
        $this->dbforge->add_key('id', TRUE);
        $this->dbforge->create_table('tbl_time_durations');

       // $this->db->query('ALTER TABLE `tbl_time_durations` ADD CONSTRAINT `fk_doc_esc_type` FOREIGN KEY(`type`) REFERENCES tbl_time_types(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;');
        //insert first n/a time duration
        $sql2 = "INSERT INTO tbl_time_durations (name, type)
                VALUES ('N/A', 1)";

        $this->db->query($sql2);
    }

    public function down()
    {


    }
}
?>