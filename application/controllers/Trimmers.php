<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Trimmers extends Pre_loader {

   /**
    * Get All Data from this method.
    *
    * @return Response
   */

   public function __construct() {
    parent::__construct();
    $this->load->helper(array('form', 'url'));
    
  }

  public function index(){

    
    $view_data['trimmers']=$this->db->query("SELECT * FROM trimmers")->result_array();
    $this->template->rander("maintenance/services/trimmers_form",$view_data);
  

}

public function add_trimmer()
{
  $data = array(
   'name' => $this->input->post('name'),
   'rate' => $this->input->post('rate'),
      
 );
  
  $this->Trimmers_model->add_trimmers($data);
   echo json_encode(array("status" => TRUE));
  
}

public function trimmer_edit($id)
{
  $data = $this->Trimmers_model->get_trimmers_by_id($id);
  echo json_encode($data);
}
public function trimmer_update()
{
  $data = array(
   'name' => $this->input->post('name'),
   'rate' => $this->input->post('rate'),
   'updated' => date("Y-m-d H:i:s"),
   
 );
  $this->Trimmers_model->trimmers_update(array('id' => $this->input->post('id')), $data);
  echo json_encode(array("status" => TRUE));
       
}


public function trimmer_delete($id)
{
  $this->Trimmers_model->delete_trimmer($id);
  echo json_encode(array("status" => TRUE));
}

}