<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Job_services extends Pre_loader {

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

    $view_data['all_details']=$this->Job_services_model->get_all_job_services();
    $this->template->rander("maintenance/services/job_services_form",$view_data);
  }

public function jobservice_add()
    {
      $data = array(
          'service_name' => $this->input->post('service_name'),
           );
      $insert = $this->Job_services_model->add_jobservice($data);
      echo json_encode(array("status" => TRUE));
    }
    public function jobservice_edit($id)
    {
      $data = $this->Job_services_model->get_by_id($id);
        echo json_encode($data);
    }
    public function jobservice_update()
  {
    $data = array(
        'service_name' => $this->input->post('service_name'),
                
      );
    $this->Job_services_model->job_service_update(array('id' => $this->input->post('id')), $data);
    echo json_encode(array("status" => TRUE));
  }
  public function jobservice_delete($id)
  {
    $this->Job_services_model->delete_job_service($id);
    echo json_encode(array("status" => TRUE));
  }
           
}