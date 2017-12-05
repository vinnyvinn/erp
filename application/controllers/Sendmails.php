<?php

if (!defined('BASEPATH'))
	exit('No direct script access allowed');
class Sendmails extends CI_Controller {


	public function htmlmail() {

		$config = array(        
			'protocol' => get_setting('email_protocol'),
			'smtp_host' => get_setting('email_smtp_host'),
			'smtp_port' => get_setting('email_smtp_port'),
			'smtp_user' => get_setting('email_smtp_user'),
			'smtp_pass' => get_setting('email_smtp_pass'),
			'smtp_crypto' => get_setting('email_smtp_security_type'),
			'smtp_timeout' => '400',
			'charset' => 'utf-8',
            'mailtype' => 'html'
		);

		$send_to = 'wagura465@gmail.com';
		$subject = "demo";

		$this->load->library('email', $config);
		$this->email->set_newline("\r\n");

		$this->email->from(get_setting('email_sent_from_address'), get_setting('email_sent_from_name'));
		
		$data = array('userName'=> 'Maurice Wagura');

		$this->email->to($send_to);  // replace it with receiver mail id
		$this->email->subject($subject); // replace it with relevant subject 

		$body = $this->load->view('email_templates/email.php',$data,TRUE);
		$this->email->message($body);   
		

		if ($this->email->send()) {
			echo "true";
		} else {
			echo "false";
		}
	}
}