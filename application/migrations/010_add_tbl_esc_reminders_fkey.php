<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 01/12/2017
 * Time: 11:48
 */
defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_tbl_esc_reminders_fkey extends CI_Migration
{

    public function up()
    {
        $this->db->query('ALTER TABLE `tbl_doc_escalation_n_reminders` ADD CONSTRAINT `fk_doc_esc_rem_type` FOREIGN KEY(`doc_type`) REFERENCES tbl_legal_document_types(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;');
        $this->db->query('ALTER TABLE `tbl_doc_escalation_n_reminders` ADD CONSTRAINT `fk_esc_rem_esc_to` FOREIGN KEY(`reminder_to`) REFERENCES team(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;');
        $this->db->query('ALTER TABLE `tbl_doc_escalation_n_reminders` ADD CONSTRAINT `fk_esc_rem_rem_every` FOREIGN KEY(`reminder_every`) REFERENCES tbl_time_durations(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;');
        $this->db->query('ALTER TABLE `tbl_doc_escalation_n_reminders` ADD CONSTRAINT `fk_esc_rem_reminder_for` FOREIGN KEY(`reminder_for`) REFERENCES tbl_time_durations(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;');
        $this->db->query('ALTER TABLE `tbl_doc_escalation_n_reminders` ADD CONSTRAINT `fk_esc_rem_duration_before` FOREIGN KEY(`duration_before`) REFERENCES tbl_time_durations(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;');
    }

    public function down()
    {
        //remove foreign key

    }
}

?>