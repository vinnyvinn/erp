<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Assets_types extends Pre_loader {

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
     $query="SELECT assets.*,assets.id as asset_ID,employees.name FROM assets LEFT JOIN employees ON assets.driver_id=employees.id";
     $view_data['drivers_dropdown'] = $this->Employees_model->get_all_where(array("deleted" => 0))->result();   
     $view_data['assets']=$this->db->query($query)->result_array();
     $this->template->rander("maintenance/services/assets_form",$view_data);
  }
  public function import_assets(){
     $existing = $this->db->query('SELECT asset_no from assets')->result_array();
    $existing = array_map(function ($item) {
      return $item['asset_no'];
    }, $existing);

    $SAGEQuery = 'SELECT * FROM _btblFAAsset WHERE iAssetTypeNo = 4 AND idAssetNo NOT IN (' . implode(',', $existing). ')';
    $fromSage = $query=$this->SAGE_DB()
      ->query($SAGEQuery)
      ->result_array();
      
    $fromSage = array_map(function ($item) {
      return [
        "asset_no" =>$item['idAssetNo'],
        "code" => $item['cAssetCode'],
        "description" => $item['cAssetDesc'],
        "location" => $item['iLocationNo'],
        "purchased_date" => $item['dPurchaseDate']  
      ];
    }, $fromSage);


    if($this->db->insert_batch('assets', $fromSage)){
     return redirect(base_url().'assets_types'); 
    }
    else
    {
      return redirect(base_url().'assets_types'); 
    }
  }
  public function add_asset()
    {
      $data = array(
           'asset_no' => $this->input->post('asset_no'),
           'code' => $this->input->post('code'),
           'description' => $this->input->post('description'),
           'driver_id' => $this->input->post('driver_id'),
           'warranty' => $this->input->post('warranty'),
           'next_time' => $this->input->post('next_time'),
           'location' => $this->input->post('location'),

           );
      
      $insert = $this->Assets_model->add_assets($data);
      echo json_encode(array("status" => TRUE));
    }
    public function asset_edit($id)
    {
      $data = $this->Assets_model->get_assets_by_id($id);
        echo json_encode($data);
    }
    public function asset_update()
  {
    $data = array(
           'asset_no' => $this->input->post('asset_no'),
           'code' => $this->input->post('code'),
           'description' => $this->input->post('description'),
           'driver_id' => $this->input->post('driver_id'),
           'warranty' => $this->input->post('warranty'),
           'next_time' => $this->input->post('next_time'),
           'location' => $this->input->post('location'),
                
      );
    $this->Assets_model->assets_update(array('id' => $this->input->post('id')), $data);
    echo json_encode(array("status" => TRUE));
  }
  public function asset_delete($id)
  {
    $this->Assets_model->delete_asset($id);
    echo json_encode(array("status" => TRUE));
  }
  public function SAGE_DB() {
    return $this->load->database('SAGE', TRUE);
  }
}