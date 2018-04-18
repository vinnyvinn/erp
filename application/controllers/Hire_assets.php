<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Hire_assets extends Pre_loader {

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
    $view_data['equipments_dropdown'] = $this->Equipments_model->get_all_where(array("deleted" => 0))->result();  
    $view_data['staffs_dropdown'] = $this->Employees_model->get_all_where(array("deleted" => 0))->result();
    $view_data['providers_dropdown'] = $this->Parts_suppliers_model->get_all_where(array("deleted" => 0))->result(); 
    $view_data['clients_dropdown'] = $this->Sage_clients_model->get_all_where(array("deleted" => 0))->result();     
    $view_data['hires']=$this->db->query("SELECT hire_assets.*,employees.name as staff,parts_suppliers.name as supplier,
      sage_clients.name as client,equipments.description as equipment FROM hire_assets
      LEFT JOIN employees ON employees.id=hire_assets.staff_id
      LEFT JOIN sage_clients ON sage_clients.id=hire_assets.client_id
      LEFT JOIN equipments ON equipments.id=hire_assets.asset
      LEFT JOIN parts_suppliers ON parts_suppliers.id=hire_assets.supplier_id")->result_array();
    $this->template->rander("maintenance/services/hire_form",$view_data);
  }

  public function add_asset()
  {
    $data = array(
     'asset' => $this->input->post('asset'),
     'tonnes' => $this->input->post('tonnes'),
     'staff_id' => $this->input->post('staff_id'),
     'client_id' => $this->input->post('client_id'),
     'supplier_id' => $this->input->post('supplier_id')

   );
    $insert = $this->Hire_assets_model->hire_assets_add($data);
    $query=$this->db->query("SELECT * FROM hire_assets WHERE id=$insert")->row();
    $asset_id=$query->asset;
    $rate= $this->db->query("SELECT * FROM equipments WHERE id=$asset_id")->row()->purchase_price;
    $total=$rate*$query->tonnes;
    $updated = array('rate' => $rate,'total'=>$total);
    $this->Hire_assets_model->hire_assets_update(array('id' => $insert), $updated);
    echo json_encode(array("status" => TRUE));
  }
  public function asset_edit($id)
  {
    $data = $this->Hire_assets_model->get_hire_assets_by_id($id);
    echo json_encode($data);
  }
  public function asset_update()
  {
    $data = array(
     'asset' => $this->input->post('asset'),
     'tonnes' => $this->input->post('tonnes'),
     'staff_id' => $this->input->post('staff_id'),
     'client_id' => $this->input->post('client_id'),
     'supplier_id' => $this->input->post('supplier_id'),
     'updated_at' => date('Y-m-d H:i:s'),
   );
    $this->Hire_assets_model->hire_assets_update(array('id' => $this->input->post('id')), $data);
    $hire=$this->db->query("SELECT * FROM hire_assets ORDER BY updated_at DESC LIMIT 1")->row();
    $id=$hire->id;
    $asset_id=$hire->asset;
    $price=$this->db->query("SELECT * FROM equipments WHERE id=$asset_id")->row()->purchase_price;
    $total=$price*$hire->tonnes;
    $updated = array('rate' => $price,'total'=>$total);
    $this->Hire_assets_model->hire_assets_update(array('id' => $id), $updated);
    echo json_encode(array("status" => TRUE));
  }

  public function delete($id)
  {
    $this->Hire_assets_model->delete_hire_asset($id);
    echo json_encode(array("status" => TRUE));
  }

}