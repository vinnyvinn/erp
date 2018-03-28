<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Extended_services extends Pre_loader {

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

    $view_data['all_details']=$this->Extended_service_model->get_all_services();
     $this->template->rander("maintenance/services/external_service",$view_data);
  }
  public function add_service()
    {
      $data = array(
           'name' => $this->input->post('name'),
            );
      
      $insert = $this->Extended_service_model->add_services($data);
      echo json_encode(array("status" => TRUE));
    }
    public function service_edit($id)
    {
      $data = $this->Extended_service_model->get_services_by_id($id);
        echo json_encode($data);
    }
    public function service_update()
  {
    $data = array(
           'name' => $this->input->post('name'),
              );
         
    $this->Extended_service_model->services_update(array('id' => $this->input->post('id')), $data);
    echo json_encode(array("status" => TRUE));
  }
  public function delete($id)
  {
    $this->Extended_service_model->delete_service($id);
    echo json_encode(array("status" => TRUE));
  }
}