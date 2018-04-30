<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Warranty_parts extends Pre_loader {

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
   $query="SELECT warranties.*,warranties.id as id,assets.code FROM warranties LEFT JOIN assets ON assets.id=warranties.asset";
   $view_data['assets_dropdown'] = $this->Assets_model->get_all_where(array("deleted" => 0))->result();   
   $view_data['parts']=$this->db->query($query)->result_array();
   $this->template->rander("maintenance/services/warranty_form",$view_data);
 }
 
 public function add_warranty_asset()
{
  $data = array(
   'name' => $this->input->post('name'),
   'part_no' => $this->input->post('part_no'),
   'description' => $this->input->post('description'),
   'asset' => $this->input->post('asset'),
   'warranty_period' => $this->input->post('warranty_period'),
   'created' => date("Y-m-d H:i:s"),
   );
  
  $insert = $this->Warranty_model->warranty_assets_add($data);
  echo json_encode(array("status" => TRUE));
}
public function warranty_asset_edit($id)
{
  $data = $this->Warranty_model->get_warranty_asset_by_id($id);
  echo json_encode($data);
}
public function warranty_asset_update()
{
  $data = array(
   'name' => $this->input->post('name'),
   'part_no' => $this->input->post('part_no'),
   'description' => $this->input->post('description'),
   'asset' => $this->input->post('asset'),
   'warranty_period' => $this->input->post('warranty_period'),
   
   
 );
  $this->Warranty_model->warranty_asset_update(array('id' => $this->input->post('id')), $data);
   echo json_encode(array("status" => TRUE));
        //$this->tech_mail($variables);
  
}

public function delete($id)
{
  $this->Warranty_model->delete_warranty_asset($id);
  echo json_encode(array("status" => TRUE));
}

}