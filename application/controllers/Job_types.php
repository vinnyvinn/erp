<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Job_types extends Pre_loader {

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

     $query="SELECT job_types.*,job_types.id as job_ID,service_types.*,job_services.*,job_services.id as js_ID FROM job_types LEFT JOIN service_types ON service_types.id=job_types.service_type LEFT JOIN job_services ON job_services.id=job_types.job_id";
    $view_data['all_details']=$this->db->query($query)->result_array();
    $view_data['services_dropdown'] = $this->Service_types_model->get_all_where(array("deleted" => 0))->result();
    $view_data['service_types_dropdown'] = $this->Job_services_model->get_all_where(array("deleted" => 0))->result();
     $this->template->rander("maintenance/services/job_types_form",$view_data);
  }

  public function add_job()
    {
      $data = array(
           'job_type_name' => $this->input->post('job_type_name'),
           'service_type' => $this->input->post('service_type'),
           'job_id' => $this->input->post('job_id'),
           );
      
      $insert = $this->Job_types_model->add_jobs($data);
      echo json_encode(array("status" => TRUE));
    }
    public function job_edit($id)
    {
      $data = $this->Job_types_model->get_jobs_by_id($id);
        echo json_encode($data);
    }
    public function job_update()
  {
    $data = array(
        'job_type_name' => $this->input->post('job_type_name'),
        'service_type' => $this->input->post('service_type'),
        'job_id' => $this->input->post('job_id'),
                
      );
    $this->Job_types_model->jobs_update(array('id' => $this->input->post('id')), $data);
    echo json_encode(array("status" => TRUE));
  }
  public function job_delete($id)
  {
    $this->Job_types_model->delete_job($id);
    echo json_encode(array("status" => TRUE));
  }
}