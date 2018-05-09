<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Fuel extends Pre_loader {

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
    $view_data['suppliers_dropdown'] = $this->Fuel_suppliers_model->get_all_where(array("deleted" => 0))->result();  
    $view_data['staffs_dropdown'] = $this->Employees_model->get_all_where(array("deleted" => 0))->result(); 
    $view_data['expenses_dropdown'] = $this->Other_expenses_model->get_all_where(array("deleted" => 0))->result();   
    $view_data['vehicles_dropdown'] = $this->Assets_model->get_all_where(array("deleted" => 0))->result(); 
    $view_data['fuels']=$this->db->query("SELECT fuels.*,employees.name as staff,fuel_suppliers.name as supplier,
      assets.code as vehicle FROM fuels
      LEFT JOIN fuel_suppliers ON fuel_suppliers.id=fuels.supplier_id
      LEFT JOIN employees ON employees.id=fuels.staff_id
      LEFT JOIN assets ON assets.id=fuels.vehicle_id")->result_array();

    $this->template->rander("maintenance/services/fuel_form",$view_data);
  }
  public function km_reading($id)
  {
    $query = $this->db->query("SELECT assets.km_reading FROM assets WHERE id=$id")->row()->km_reading;
    echo json_encode($query);
  }
  public function miles_reading($id)
  {
    $query = $this->db->query("SELECT assets.miles_reading FROM assets WHERE id=$id")->row()->miles_reading;
    echo json_encode($query);
  }

  public function add_fuel()
  {

    $is_petrol='';
    if($this->input->post('fuel_id')=='petrol'){
      $is_petrol=1;
    }
    elseif($this->input->post('fuel_id')=='diesel'){
      $is_petrol=0;
    }
    $data = array(
     'litres' => $this->input->post('litres'),
     'supplier_id' => $this->input->post('supplier_id'),
     'staff_id' => $this->input->post('staff_id'),
     'expense_id' => $this->input->post('expense_id'),
     'invoice_no' => $this->input->post('invoice_no'),
     'km_reading' => $this->input->post('km_reading'),
     'done_on' => $this->input->post('done_on'),
     'vehicle_id' => $this->input->post('vehicle_id'),
     'currency' => $this->input->post('currency'),
     'fuel_id' => $this->input->post('fuel_id'),
     'miles_reading' => $this->input->post('miles_reading'),
     'is_petrol' => $is_petrol
     );
    $insert = $this->Fuel_model->fuels_add($data);
    $query=$this->db->query("SELECT fuels.*,fuel_suppliers.code FROM fuels 
      LEFT JOIN fuel_suppliers ON fuel_suppliers.id=fuels.supplier_id WHERE fuels.id=$insert")->row_array();

    $supplier=$query['supplier_id'];
    $expense_id=$query['expense_id'];
    $distance_km=$query['km_reading'];
    $distance_miles=$query['miles_reading'];
    $asset_id=$query['vehicle_id'];
    $supp=$query['supplier_id'];
    $fuel_type=$query['fuel_id'];
    $ptrl=$query['is_petrol'];
    $code_no=$query['code'];
    $assets=$this->db->query("SELECT * FROM assets WHERE id=$asset_id")->row_array();
    $suppliers=$this->db->query("SELECT fuel_suppliers.* FROM fuel_suppliers
    LEFT JOIN fuels ON  fuel_suppliers.id=fuels.supplier_id WHERE
     fuel_suppliers.code LIKE '%$code_no%' AND fuel_suppliers.is_petrol=$ptrl")->row_array();

    $expense='';
    if($expense_id){
      $expense=$this->db->query("SELECT * FROM other_expenses WHERE id=$expense_id")->row_array()['cost'];
    }
    $km=$distance_km-$assets['km_reading'];
    $mils=$distance_miles-$assets['miles_reading'];
    $total=$suppliers['price']*$query['litres'];
    $update_km=array('km_reading' => $distance_km,'miles_reading' => $distance_miles);
    $updated = array('price' => $suppliers['price'],'total' => $total,'expense_cost' => $expense,
      'mileage_km' => $km,'mileage_miles' => $mils);
    $this->Fuel_model->fuel_update(array('id' => $insert), $updated);
    $this->Assets_model->assets_update(array('id' => $assets['id']), $update_km);
    echo json_encode(array("status" => TRUE));
  }
  public function fuel_edit($id)
  {
    $data = $this->Fuel_model->get_fuel_by_id($id);
    echo json_encode($data);
  }
  public function fuel_update()
  {
   $is_petrol='';
   if($this->input->post('fuel_id')=='petrol'){
    $is_petrol=1;
  }
  elseif($this->input->post('fuel_id')=='diesel'){
    $is_petrol=0;
  }
  $data = array(
    'litres' => $this->input->post('litres'),
    'supplier_id' => $this->input->post('supplier_id'),
    'staff_id' => $this->input->post('staff_id'),
    'expense_id' => $this->input->post('expense_id'),
    'invoice_no' => $this->input->post('invoice_no'),
    'km_reading' => $this->input->post('km_reading'),
    'vehicle_id' => $this->input->post('vehicle_id'),
    'currency' => $this->input->post('currency'),
    'done_on' => $this->input->post('done_on'),
    'fuel_id' => $this->input->post('fuel_id'),
    'is_petrol' => $is_petrol,
    'miles_reading' => $this->input->post('miles_reading'),
    'updated_at' => date('Y-m-d H:i:s')
    );
  $this->Fuel_model->fuel_update(array('id' => $this->input->post('id')), $data);
  $fuel=$this->db->query("SELECT fuels.*,fuel_suppliers.code FROM fuels
      LEFT JOIN fuel_suppliers ON fuel_suppliers.id=fuels.supplier_id 
      ORDER BY fuels.updated_at DESC LIMIT 1")->row_array();
  $id=$fuel['id'];
  $supplier=$fuel['supplier_id'];
  $expense_id=$fuel['expense_id'];
  $distance_km=$fuel['km_reading'];
  $distance_miles=$fuel['miles_reading'];
  $vehicle=$fuel['vehicle_id'];
  $supp=$fuel['supplier_id'];
  $fuel_typ=$fuel['fuel_id'];
  $ptrl=$fuel['is_petrol'];
  $code_no=$fuel['code'];

  $assets=$this->db->query("SELECT * FROM assets WHERE id=$vehicle")->row_array();
  $suppliers=$this->db->query("SELECT fuel_suppliers.*, fuel_suppliers.code as code FROM fuel_suppliers
    LEFT JOIN fuels ON  fuel_suppliers.is_petrol=fuels.is_petrol WHERE
     fuel_suppliers.code LIKE '%$code_no%' AND fuel_suppliers.is_petrol=$ptrl")->row_array();

  $expense='';
  if($expense_id){
    $expense=$this->db->query("SELECT * FROM other_expenses WHERE id=$expense_id")->row_array()['cost'];
  }

  $km=$distance_km-$assets['km_reading'];
  $mils=$distance_miles-$assets['miles_reading'];
  $total=$suppliers['price']*$fuel['litres'];
  $update_km=array('km_reading' => $distance_km,'miles_reading' => $distance_miles);
  $updated = array('price' => $suppliers['price'],'total' => $total,'expense_cost' => $expense,
    'mileage_km' => $km,'mileage_miles' => $mils);
  $this->Fuel_model->fuel_update(array('id' => $id), $updated);
  $this->Assets_model->assets_update(array('id' => $assets['id']), $update_km);
  echo json_encode(array("status" => TRUE));
}

public function delete($id)
{
  $this->Fuel_model->delete_fuel($id);
  echo json_encode(array("status" => TRUE));
}

}