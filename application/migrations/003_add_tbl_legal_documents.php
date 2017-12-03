<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 01/12/2017
 * Time: 11:48
 */
defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_tbl_legal_documents extends CI_Migration
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
            'document_type' => array(
                'type' => 'INT',
                'constraint' => '10',
                'unsigned' => TRUE,
            ),
            'user_responsible' => array(
                'type' => 'INT',
                'default' => '0',
            ),
            'status' => array(
                'type' => 'INT',
                'default' => '0',
            ),
            'covered_from' => array(
                'type' => 'TIMESTAMP',
            ),
            'covered_to' => array(
                'type' => 'TIMESTAMP',
            ),
            'deleted' => array(
                'type' => 'INT',
                'default' => '0',
            ),
            'created_at' => array(
                'type' => 'TIMESTAMP',
            ),
            'updated_at' => array(
                'type' => 'TIMESTAMP',
            ),
        ));
        $this->dbforge->add_key('id', TRUE);
        $this->dbforge->add_key('document_type', TRUE);
        $this->dbforge->create_table('tbl_legal_documents');
        //$this->db->query("ALTER TABLE `tbl_legal_documents` ADD FOREIGN KEY(`document_type`) REFERENCES 'tbl_legal_document_types'(id);");
    }

    public function down()
    {
        $this->dbforge->drop_table('tbl_legal_documents');
    }
}
    ?>