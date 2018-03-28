<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Inspection_types extends Pre_loader {

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

     $view_data['all_details']=$this->Inspections_model->get_all_inspections();
     $this->template->rander("maintenance/services/tasks_form",$view_data);
  }

  public function add()
    {
      $data = array(
          'type' => $this->input->post('type'),
           );
      
      $insert = $this->Inspections_model->add_data($data);
      echo json_encode(array("status" => TRUE));
    }
    public function inspections_edit($id)
    {
      $data = $this->Inspections_model->get_inspections_by_id($id);
        echo json_encode($data);
    }
    public function inspections_update()
  {
    $data = array(
        'type' => $this->input->post('type'),
                
      );
    $this->Inspections_model->inspections_update(array('id' => $this->input->post('id')), $data);
    echo json_encode(array("status" => TRUE));
  }
  public function inspections_delete($id)
  {
    $this->Inspections_model->delete_inspection($id);
    echo json_encode(array("status" => TRUE));
  }
}