<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Fuel_price extends Pre_loader {

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
    $view_data['prices']=$this->db->query("SELECT * FROM fuel_prices")->result_array();
    $this->template->rander("maintenance/services/price_form",$view_data);
  }
  
public function add_price()
{
  $data = array(
   'price' => $this->input->post('price'),
 );
  
 $this->Fuel_price_model->add_prices($data);

   echo json_encode(array("status" => TRUE));

    
}

public function price_edit($id)
{
  $data = $this->Fuel_price_model->get_prices_by_id($id);
  echo json_encode($data);
}
public function price_update()
{
  $data = array(
   'price' => $this->input->post('price'),
   'updated_at' => date("Y-m-d H:i:s"),
   
 );
  $this->Fuel_price_model->prices_update(array('id' => $this->input->post('id')), $data);
   echo json_encode(array("status" => TRUE));
        //$this->tech_mail($variables);

}


public function price_delete($id)
{
  $this->Fuel_price_model->delete_price($id);
  echo json_encode(array("status" => TRUE));
}

}