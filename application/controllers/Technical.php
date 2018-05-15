<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Technical extends Pre_loader {

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
    $view_data['all_details']=$this->Assets_model->getDetails();
     $this->template->rander("maintenance/sage_data",$view_data);
  }

  public function services(){

     $view_data['service_details']=$this->db->query('SELECT * FROM service_types')->result_array();
     $this->template->rander("maintenance/services/index",$view_data); 
  }
 
  public function service_add()
    {
      $data = array(
          'name' => $this->input->post('name'),
          'km_range' => $this->input->post('km_range'),
          'description' => $this->input->post('description'),
             );
      $insert = $this->Service_types_model->add_service($data);
      echo json_encode(array("status" => TRUE));
    }
    public function service_edit($id)
    {
      $data = $this->Service_types_model->getservice_by_id($id);
        echo json_encode($data);
    }
    public function service_update()
  {
    $data = array(
        'name' => $this->input->post('name'),
        'km_range' => $this->input->post('km_range'),
        'description' => $this->input->post('description'),
        
      );
    $this->Service_types_model->service_type_update(array('id' => $this->input->post('id')), $data);
    echo json_encode(array("status" => TRUE));
  }
  public function service_delete($id)
  {
    $this->Service_types_model->delete_service_type($id);
    echo json_encode(array("status" => TRUE));
  }
           
  }
