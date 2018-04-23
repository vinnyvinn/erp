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
    $this->load->helper(array('form', 'url'));
    
  }

  public function index(){
    $view_data['suppliers_dropdown'] = $this->Parts_suppliers_model->get_all_where(array("deleted" => 0))->result();  
    $view_data['staffs_dropdown'] = $this->Employees_model->get_all_where(array("deleted" => 0))->result(); 
    $view_data['expenses_dropdown'] = $this->Other_expenses_model->get_all_where(array("deleted" => 0))->result();   
    $view_data['vehicles_dropdown'] = $this->Assets_model->get_all_where(array("deleted" => 0))->result(); 
    $view_data['fuels']=$this->db->query("SELECT fuels.*,employees.name as staff,parts_suppliers.name as supplier,
      assets.code as vehicle FROM fuels
      LEFT JOIN parts_suppliers ON parts_suppliers.id=fuels.supplier_id
      LEFT JOIN employees ON employees.id=fuels.staff_id
      LEFT JOIN assets ON assets.id=fuels.vehicle_id")->result_array();

    $this->template->rander("maintenance/services/fuel_form",$view_data);
  }
  public function km_reading($id)
  {
    $query = $this->db->query("SELECT assets.km_reading FROM assets WHERE id=$id")->row()->km_reading;
    echo json_encode($query);
  }

  public function add_fuel()
  {
    $data = array(
     'litres' => $this->input->post('litres'),
     'supplier_id' => $this->input->post('supplier_id'),
     'staff_id' => $this->input->post('staff_id'),
     'expense_id' => $this->input->post('expense_id'),
     'invoice_no' => $this->input->post('invoice_no'),
     'km_reading' => $this->input->post('km_reading'),
     'done_on' => $this->input->post('done_on'),
     'vehicle_id' => $this->input->post('vehicle_id')

   );

    $insert = $this->Fuel_model->fuels_add($data);
    $query=$this->db->query("SELECT * FROM fuels WHERE id=$insert")->row();
    $supplier=$query->supplier_id;
    $expense_id=$query->expense_id;
    $distance=$query->km_reading;
    $vehicle=$query->vehicle_id;
    $assets=$this->db->query("SELECT * FROM assets WHERE id=$vehicle")->row();
    $price=$this->db->query("SELECT price FROM fuel_prices")->row()->price;
    $expense='';
    if($expense_id){
      $expense=$this->db->query("SELECT * FROM other_expenses WHERE id=$expense_id")->row()->cost;
    }
    $km=$distance-$assets->km_reading;
    $total=$price*$query->litres;
    $update_km=array('km_reading' => $distance);
    $updated = array('price' => $price,'total'=>$total,'expense_cost' => $expense,'mileage' => $km);
    $this->Fuel_model->fuel_update(array('id' => $insert), $updated);
    $this->Assets_model->assets_update(array('id' => $assets->id), $update_km);
    echo json_encode(array("status" => TRUE));
  }
  public function fuel_edit($id)
  {
    $data = $this->Fuel_model->get_fuel_by_id($id);
    echo json_encode($data);
  }
  public function fuel_update()
  {
    $data = array(
      'litres' => $this->input->post('litres'),
      'supplier_id' => $this->input->post('supplier_id'),
      'staff_id' => $this->input->post('staff_id'),
      'expense_id' => $this->input->post('expense_id'),
      'invoice_no' => $this->input->post('invoice_no'),
      'km_reading' => $this->input->post('km_reading'),
      'vehicle_id' => $this->input->post('vehicle_id'),
      'done_on' => $this->input->post('done_on'),
      'updated_at' => date('Y-m-d H:i:s')
    );
    $this->Fuel_model->fuel_update(array('id' => $this->input->post('id')), $data);
    $fuel=$this->db->query("SELECT * FROM fuels ORDER BY updated_at DESC LIMIT 1")->row();
    $id=$fuel->id;
    $supplier=$fuel->supplier_id;
    $distance=$fuel->km_reading;
    $vehicle=$fuel->vehicle_id;
    $assets=$this->db->query("SELECT * FROM assets WHERE id=$vehicle")->row();
    $price=$this->db->query("SELECT price FROM fuel_prices")->row()->price;
    $km=$distance-$assets->km_reading;
    $total=$price*$fuel->litres;
    $update_km=array('km_reading' => $distance);
    $updated = array('price' => $price,'total'=>$total,'mileage' => $km);
    $this->Fuel_model->fuel_update(array('id' => $id), $updated);
    $this->Assets_model->assets_update(array('id' => $assets->id), $update_km);
    echo json_encode(array("status" => TRUE));
  }

  public function delete($id)
  {
    $this->Fuel_model->delete_fuel($id);
    echo json_encode(array("status" => TRUE));
  }

}