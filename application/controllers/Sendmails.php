<?php

if (!defined('BASEPATH'))
	exit('No direct script access allowed');
class Sendmails extends CI_Controller {


    public function htmlmail(){
     /*   $config = Array(
        'protocol' => 'smtp',
        'smtp_host' => 'smtp.mailtrap.io',
        'smtp_port' => 2525,
        'smtp_user' => 'dd5ba209d6a718',
        'smtp_pass' => '4fefe28f506618',
        'smtp_timeout' => '4',
        'mailtype'  => 'html',
        'charset'   => 'iso-8859-1'
        );*/
        $config = Array(
            'protocol' => 'smtp',
            'smtp_host' => 'wizag.biz',
            'smtp_port' => 485,
            'smtp_user' => 't.development@wizag.biz',
            'smtp_pass' => 'Qwerty123!',
            'mailtype'  => 'html',
            'charset'   => 'iso-8859-1'
        );

        $this->load->library('email', $config);
        $this->email->set_newline("\r\n");

        $this->email->from('wagura465@gmail.com', 'WaguraMaurice');
        $data = array('userName'=> 'Maurice Wagura');
        $this->email->to('djeffmwash@gmail.com');  // replace it with receiver mail id
        //$this->email->to('wagura.maurice@hotmail.com');  // replace it with receiver mail id
      //  $this->load->view('email_templates/anillabs.php',$data,TRUE);
        $this->email->subject('demo'); // replace it with relevant subject
        $this->email->message(/*$this->load->view('email_templates/anillabs.php',$data,TRUE)*/"dffdfdfdf");
        $this->email->send();

}
}