<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');
require_once("Pre_loader.php");

class Ticket_types extends Pre_loader {

    function __construct() {
        parent::__construct();
        $this->access_only_admin();
    }

    function index() {
        $this->template->rander("ticket_types/index");
    }
    function model_comment(){
      validate_submitted_data(array(
          "id" => "numeric"
      ));

      $view_data['model_info'] = $this->Ticket_types_model->get_one($this->input->post('id'));
      $view_data['tk_id'] = $this->session->ticket_ID;
      $this->load->view('ticket_types/comments_form',$view_data);
  }

  function add_comment()
  {
     $data=array('description' => $this->input->post('description'),
      'user_id' => $this->session->user_id);
     if($this->Ticket_types_model->insert_comment($data)){
       $saved = true;
   }

   echo json_encode(array("success" => true, 'message' => lang('record_saved')) );


}
  

function add_mark_solved(){

 $email_data = array(
         'email' => $this->session->TK_EMAIL,
         'title' => $this->session->TK_TITLE,
         'username' => $this->session->TK_USERNAME,
         'ticket_id' => $this->session->TK_ID,
         'ticket_url' => get_uri("knowledge_base"),
         );
        $this->_mail_solved($email_data);

  return redirect(base_url("tickets/view_support/".$this->session->TK_ID));
}

function add_mark_closed(){
         
         $email_data = array(
         'email' => $this->session->TK_EMAIL,
         'username' => $this->session->TK_USERNAME,
         'ticket_id' => $this->session->TK_ID,
         'email_user' => $this->login_user->email,
         'closed_by' => $this->login_user->first_name .' '.$this->login_user->last_name,
         'ticket_url' => get_uri("knowledge_base"),
         );

         $this->_mail_closed($email_data);

  return redirect(base_url("tickets/view_support/".$this->session->TK_ID));
}

function modal_form() {

    validate_submitted_data(array(
        "id" => "numeric"
    ));

    $view_data['model_info'] = $this->Ticket_types_model->get_one($this->input->post('id'));
    $this->load->view('ticket_types/modal_form', $view_data);
}
function assign_modal(){

 $view_data['ict_memebers_dropdown'] = $this->db->query("SELECT email,CONCAT(first_name,' ',last_name) as username FROM users WHERE role_id=9")->result();

 $this->load->view('ticket_types/assign_modal_form',$view_data);
}

function assign_ticket(){
    $email = $this->input->post('assign_to');

    $name=$this->db->query("SELECT email,CONCAT(first_name,' ',last_name) as username FROM users WHERE email= '$email'")->row_array()['username'];

    $assign_to = array("email" => $email ,
       "username" => $name,
       "ticket_id" => $this->session->TK_ID,
       'created_at' => date('Y/m/d'),
       'ticket_title' => $this->session->TK_TITLE,
       'created_by' => $this->login_user->first_name .' '.$this->login_user->last_name,
       'ticket_url' => get_uri("tickets/view_support/".$this->session->TK_ID),
   );

    $sender = array("email" => $email ,
       "assign_to" => $name,
       "ticket_id" => $this->session->TK_ID,
       'created_at' => date('Y/m/d'),
       'username' => $this->session->TK_USERNAME,
       'email_user' => $this->session->TK_EMAIL,
       'ticket_url' => get_uri("tickets/view_support/".$this->session->TK_ID),
   );
    //anchor(get_uri("tickets/view/" . $data->id), $data->title)

   $this->_mail_ict_member($assign_to);
  $this->_mail_ticket_owner($sender);

  return redirect(base_url("tickets/view_support/".$this->session->TK_ID));
}
function save() {
    validate_submitted_data(array(
        "id" => "numeric",
        "title" => "required"
    ));


    $id = $this->input->post('id');
    $data = array(
        "title" => $this->input->post('title')
    );
    $save_id = $this->Ticket_types_model->save($data, $id);
    if ($save_id) {
        echo json_encode(array("success" => true, "data" => $this->_row_data($save_id), 'id' => $save_id, 'message' => lang('record_saved')));
    } else {
        echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
    }
}
public function save_ticket_status() {

  $data_comment=array('description' => $this->input->post('description'),
     'created_by' => $this->session->TK_OWNER,
     'created_at' => date('Y/m/d'),
     'ticket_id' => $this->session->TK_ID,
 );

  $comment_id = $this->Support_comments_model->save($data_comment);

  $this->Support_entries_model->support_update($this->session->TK_ID);

  if($comment_id){

     echo json_encode(array("success" => true, 'message' => lang('comment_submited')));

 } else {
    echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
}

}

public function mark_as_open(){

    $this->Support_entries_model->support_update_open($this->session->TK_ID);
}

function delete() {
    validate_submitted_data(array(
        "id" => "required|numeric"
    ));

    $id = $this->input->post('id');
    if ($this->input->post('undo')) {
        if ($this->Ticket_types_model->delete($id, true)) {
            echo json_encode(array("success" => true, "data" => $this->_row_data($id), "message" => lang('record_undone')));
        } else {
            echo json_encode(array("success" => false, lang('error_occurred')));
        }
    } else {
        if ($this->Ticket_types_model->delete($id)) {
            echo json_encode(array("success" => true, 'message' => lang('record_deleted')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('record_cannot_be_deleted')));
        }
    }
}

function list_data() {
    $list_data = $this->Ticket_types_model->get_details()->result();
    $result = array();
    foreach ($list_data as $data) {
        $result[] = $this->_make_row($data);
    }
    echo json_encode(array("data" => $result));
}

private function _row_data($id) {
    $options = array("id" => $id);
    $data = $this->Ticket_types_model->get_details($options)->row();
    return $this->_make_row($data);
}

private function _make_row($data) {
    return array($data->title,
        modal_anchor(get_uri("ticket_types/modal_form"), "<i class='fa fa-pencil'></i>", array("class" => "edit", "title" => lang('edit_ticket_type'), "data-post-id" => $data->id))
        . js_anchor("<i class='fa fa-times fa-fw'></i>", array('title' => lang('delete_ticket_type'), "class" => "delete", "data-id" => $data->id, "data-action-url" => get_uri("ticket_types/delete"), "data-action" => "delete"))
    );
}
public function _mail_ict_member($assign_to){
   $email_template = $this->Email_templates_model->get_final_template("assign_ticket");

   $parser_data["CREATED_BY"] =$assign_to['created_by'] ;
   $parser_data["CREATED_AT"] =  $assign_to['created_at'];
   $parser_data["TICKET_TITLE"] =  $assign_to['ticket_title'];
   $parser_data["USER_NAME"] =  $assign_to['username'];
   $parser_data["TICKET_URL"] =  $assign_to['ticket_url'];
   $parser_data["TICKET_ID"] =  $assign_to['ticket_id'];
   $parser_data["SIGNATURE"] = $email_template->signature;
   $message = $this->parser->parse_string($email_template->message, $parser_data, TRUE);

   send_app_mail($assign_to['email'], $email_template->subject, $message);
   

}
public function _mail_ticket_owner($sender){
   $email_template = $this->Email_templates_model->get_final_template("ticket_owner");

   $parser_data["USER_NAME"] =  $sender['username'];
   $parser_data["ASSIGNED_TO"] =  $sender['assign_to'];
   $parser_data["TICKET_URL"] =  $sender['ticket_url'];
   $parser_data["TICKET_ID"] =  $sender['ticket_id'];
   $parser_data["TITLE"] =  $sender['email_user'];
   $parser_data["SIGNATURE"] = $email_template->signature;
   $message = $this->parser->parse_string($email_template->message, $parser_data, TRUE);

   send_app_mail($sender['email'], $email_template->subject, $message);
   

}
 public function _mail_solved($email_data){
    $email_template = $this->Email_templates_model->get_final_template("ticket_solved");

   $parser_data["USER_NAME"] =  $email_data['username'];
   $parser_data["TICKET_URL"] =  $email_data['ticket_url'];
   $parser_data["TICKET_ID"] =  $email_data['ticket_id'];
   $parser_data["TITLE"] =  $email_data['title'];
   $parser_data["SIGNATURE"] = $email_template->signature;
   $message = $this->parser->parse_string($email_template->message, $parser_data, TRUE);

   send_app_mail($email_data['email'], $email_template->subject, $message);
  
 }

 public function _mail_closed($email_data){
    $email_template = $this->Email_templates_model->get_final_template("ticket_closed");

   $parser_data["USER_NAME"] =  $email_data['username'];
   $parser_data["TICKET_URL"] =  $email_data['ticket_url'];
   $parser_data["TICKET_ID"] =  $email_data['ticket_id'];
   $parser_data["CLOSED_BY"] =  $email_data['closed_by'];
   $parser_data["EMAIL_USER"] =  $email_data['email_user'];
   $parser_data["SIGNATURE"] = $email_template->signature;
   $message = $this->parser->parse_string($email_template->message, $parser_data, TRUE);

   send_app_mail($email_data['email'], $email_template->subject, $message);
    


 }


}

/* End of file ticket_types.php */
/* Location: ./application/controllers/ticket_types.php */
