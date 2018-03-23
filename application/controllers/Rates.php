<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Rates extends Pre_loader {

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
     
     $view_data['rates'] = $this->Rates_model->get_all_rates();   
     $this->template->rander("maintenance/services/rates_form",$view_data);
  }
   public function add_rate()
    {
      $data = array(
           'amount' => $this->input->post('amount'),
           'description' => $this->input->post('description'),
           );
      
      $insert = $this->Rates_model->add_rates($data);
      echo json_encode(array("status" => TRUE));
    }
    public function rate_edit($id)
    {
      $data = $this->Rates_model->get_rates_by_id($id);
        echo json_encode($data);
    }
    public function rate_update()
  {
    $data = array(
           'amount' => $this->input->post('amount'),
           'description' => $this->input->post('description'),
           
                
      );
       $this->Rates_model->rates_update(array('id' => $this->input->post('id')), $data);
        echo json_encode(array("status" => TRUE));
        
  }
    
  public function rate_delete($id)
  {
    $this->Rates_model->delete_rate($id);
    echo json_encode(array("status" => TRUE));
  }
 
}