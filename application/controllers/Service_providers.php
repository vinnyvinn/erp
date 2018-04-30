<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Service_providers extends Pre_loader {

   /**
    * Get All Data from this method.
    *
    * @return Response
   */

   public function __construct() {
    parent::__construct();
    $this->init_permission_checker("technical");
    $this->load->helper(array('form', 'url'));
    
  }

  public function index(){
    $this->access_only_allowed_members();
   $view_data['suppliers']=$this->db->query("SELECT * FROM providers")->result_array();
   $this->template->rander("maintenance/services/providers_form",$view_data);
 }

 public function add_provider()
 {
  $data = array(
   'name' => $this->input->post('name'),
   'code' => $this->input->post('code'),
   'telephone_no' => $this->input->post('telephone_no'),
   'tax' => $this->input->post('tax')
 );
  
  $insert = $this->Service_providers_model->add_providers($data);
  echo json_encode(array("status" => TRUE));
}
public function provider_edit($id)
{
  $data = $this->Service_providers_model->get_providers_by_id($id);
  echo json_encode($data);
}
public function provider_update()
{
  $data = array(
    'name' => $this->input->post('name'),
    'code' => $this->input->post('code'),
    'telephone_no' => $this->input->post('telephone_no'),
    'tax' => $this->input->post('tax')
  );
  $this->Service_providers_model->providers_update(array('id' => $this->input->post('id')), $data);
  echo json_encode(array("status" => TRUE));
        //$this->tech_mail($variables);
  
}

public function provider_delete($id)
{
  $this->Service_providers_model->delete_provider($id);
  echo json_encode(array("status" => TRUE));
}

}