<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Fuel_suppliers extends Pre_loader {

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
    $view_data['suppliers']=$this->db->query("SELECT * FROM fuel_suppliers")->result_array();
    $this->template->rander("maintenance/services/fuel_suppliers_form",$view_data);
  }

  public function add_supplier()
  {
     $is_petrol='';
     if($this->input->post('fuel_type')=='petrol'){
      $is_petrol=1;
     }
     elseif($this->input->post('fuel_type')=='diesel'){
      $is_petrol=0;
     }
    $data = array(
     'code' => $this->input->post('code'),
     'name' => $this->input->post('name'),
     'phone_no' => $this->input->post('phone_no'),
     'price' => $this->input->post('price'),
     'fuel_type' => $this->input->post('fuel_type'),
     'is_petrol' => $is_petrol
     );

    $this->Fuel_suppliers_model->add_fuel_suppliers($data);
    echo json_encode(array("status" => TRUE));

    
  }

  public function supplier_edit($id)
  {
    $data = $this->Fuel_suppliers_model->get_fuel_suppliers_by_id($id);
    echo json_encode($data);
  }
  public function supplier_update()
  {
    $is_petrol='';
     if($this->input->post('fuel_type')=='petrol'){
      $is_petrol=1;
     }
     elseif($this->input->post('fuel_type')=='diesel'){
      $is_petrol=0;
     }
    $data = array(
     'code' => $this->input->post('code'),
     'name' => $this->input->post('name'),
     'phone_no' => $this->input->post('phone_no'),
     'price' => $this->input->post('price'),
     'fuel_type' => $this->input->post('fuel_type'),
     'is_petrol' => $is_petrol

     );
    $this->Fuel_suppliers_model->fuel_suppliers_update(array('id' => $this->input->post('id')), $data);
    echo json_encode(array("status" => TRUE));

  }

  public function supplier_delete($id)
  {
    $this->Fuel_suppliers_model->delete_fuel_supplier($id);
    echo json_encode(array("status" => TRUE));
  }

}