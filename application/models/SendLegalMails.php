<?php

if (!defined('BASEPATH'))
	exit('No direct script access allowed');
class SendLegalMails extends Crud_model {

    public function case_email($send_to, $subject, $data) {

        $config = array(
            'protocol' => get_setting('email_protocol'),
            'smtp_host' => get_setting('email_smtp_host'),
            'smtp_port' => get_setting('email_smtp_port'),
            'smtp_user' => get_setting('email_smtp_user'),
            'smtp_pass' => get_setting('email_smtp_pass'),
            'smtp_crypto' => get_setting('email_smtp_security_type'),
            'smtp_timeout' => '3000',
            'charset' => 'utf-8',
            'mailtype' => 'html'
        );

        $this->load->library('email', $config);
        $this->email->set_newline("\r\n");

        $this->email->from(get_setting('email_sent_from_address'), get_setting('email_sent_from_name'));

        $this->email->to($send_to);  // replace it with receiver mail id
        $this->email->subject($subject); // replace it with relevant subject

        $body = "jddj";
        //$this->load->view('email_templates/legal_template.php', $data, TRUE);
        $this->email->message($body);
        $this->email->send();

    }



}