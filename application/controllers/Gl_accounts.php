<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Gl_accounts extends Pre_loader
{

    /**
     * Get All Data from this method.
     *
     * @return Response
     */

    public function __construct()
    {
      parent::__construct();
      
      $this->load->helper(array('form', 'url'));
      $this->load->library('excel');
      


    }

    public function index()
    {
      
     $view_data['accounts'] = $this->Gl_model->get_all_gl();
     $this->template->rander("gl/index",$view_data);
   }

   public function import_gl(){
     $existing = $this->db->query("SELECT account_link FROM gl_accounts")->result_array();
     $existing = array_map(function ($item) {
      return $item['account_link'];
    }, $existing);


     $SAGEQuery = "SELECT  AccountLink , Master_Sub_Account , Description FROM Accounts
     WHERE  AccountLink NOT IN ( '" . implode( "', '" , $existing ) . "' )";

     $fromSage = $this->SAGE_DB()->query($SAGEQuery)->result_array();
     $fromSage = array_map(function ($item) {
      return [
        "account_link" => $item['AccountLink'],
        "master_account" => $item['Master_Sub_Account'],
        "description" => $item['Description'],
      ];
    }, $fromSage);


     if(!empty($fromSage)){
      $this->db->insert_batch('gl_accounts', $fromSage);
      return redirect('gl_accounts','refresh'); 
    }

    else
    {
      return redirect('gl_accounts','refresh'); 
    }
  }
  public function add_gl()
  {
   
    $data = array(
     'master_account' => $this->input->post('master_account'),
     'description' => $this->input->post('description'),
     
   );

    $this->db->insert('gl_accounts',$data);

    echo json_encode(array("status" => TRUE));

  }

  public function gl_edit($id)
  {
    $data = $this->Gl_model->get_gl_by_id($id);
    echo json_encode($data);
  }
  public function gl_update()
  {
    
   $data = array(
     'master_account' => $this->input->post('master_account'),
     'description' => $this->input->post('description'),
     
     
   );
   $this->Gl_model->gl_update(array('id' => $this->input->post('id')), $data);
   
   echo json_encode(array("status" => TRUE));
   

 }


 public function gl_delete($id)
 {
  $this->Gl_model->delete_gl($id);
  echo json_encode(array("status" => TRUE));
}
public function SAGE_DB() {
  return $this->load->database('SAGE', TRUE);
}
}