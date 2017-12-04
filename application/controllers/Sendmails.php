<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');
class Sendmails extends CI_Controller {

    public function htmlmail(){
        $config = Array(
        'protocol' => 'sendmail',
        'smtp_host' => 'smtp.mailtrap.io',
        'smtp_port' => 25,
        'smtp_user' => 'dd5ba209d6a718',
        'smtp_pass' => '4fefe28f506618',
        'smtp_timeout' => '4',
        'mailtype'  => 'html',
        'charset'   => 'iso-8859-1'
        );

        $this->load->library('email', $config);
        $this->email->set_newline("\r\n");

        $this->email->from('wagura465@gmail.com', 'WaguraMaurice');
        $data = array('userName'=> 'Maurice Wagura');
        $this->email->to('wagura.maurice@hotmail.com');  // replace it with receiver mail id
        $this->email->subject('demo'); // replace it with relevant subject

        $body = $this->load->view('email_templates/anillabs.php',$data,TRUE);
        $this->email->message($body);
        $this->email->send();

}
       
}