<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 01/12/2017
 * Time: 11:48
 */
defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_tbl_legal_dcs_fkey extends CI_Migration
{

    public function up()
    {
        $this->db->query('ALTER TABLE `tbl_legal_documents` ADD CONSTRAINT `fk_doc_type` FOREIGN KEY(`document_type`) REFERENCES tbl_legal_document_types(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;');
        $this->db->query('ALTER TABLE `tbl_legal_documents` ADD CONSTRAINT `fk_status` FOREIGN KEY(`status`) REFERENCES tbl_case_status(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;');

    }

    public function down()
    {
        //remove foreign key

    }
}
?>