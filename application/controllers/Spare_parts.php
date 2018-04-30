<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Spare_parts extends Pre_loader {

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
   	$view_data['equipments']=$this->Equipments_model->get_all_equipment();
   	$this->template->rander('maintenance/reactive/add_equipment',$view_data);
   }
 public function import_sage(){
 	$existing=$this->db->query("SELECT asset_no FROM equipments")->result_array();
 	$existing=array_map(function($item){
      return $item['asset_no'];
 	},$existing);
 	
 	$fromSage = "SELECT cAssetCode,cAssetDesc, ubFAForHire,ulFAHireItemGroup,idAssetNo,fPurchaseValue FROM _btblFAAsset WHERE ulFAHireItemGroup=1";
  $querySage=$this->SAGE_DB()->query($fromSage)->result_array();
 	$querySage=array_map(function($parts){
 		return[
           'code' => $parts['cAssetCode'],
           'asset_no' => $parts['idAssetNo'],
           'description' => $parts['cAssetDesc'],
           'for_hire' => $parts['ubFAForHire'],
           'purchase_price' => $parts['fPurchaseValue'],
           'forhire_group' => $parts['ulFAHireItemGroup']
          ];
 	},$querySage);
    $this->db->insert_batch('equipments',$querySage);
    return redirect(base_url().'equipments');
 }
   public function add_equipment()
    {
      $data = array(
           'code' => $this->input->post('code'),
           'asset_no' => $this->input->post('asset_no'),
           'description' => $this->input->post('description'),
            'purchase_price' => $this->input->post('purchase_price'),
            'source' => 'inhouse',
            );
      
      $insert = $this->Equipments_model->add_equipment($data);
      echo json_encode(array("status" => TRUE));
    }
    public function equipment_edit($id)
    {
      $data = $this->Equipments_model->get_equipment_by_id($id);
        echo json_encode($data);
    }
    public function equipment_update()
  {
    $data = array(
           'code' => $this->input->post('code'),
           'asset_no' => $this->input->post('asset_no'),
           'description' => $this->input->post('description'),
           'purchase_price' => $this->input->post('purchase_price'),
           'source' => 'inhouse',
            );
         
    $this->Equipments_model->equipment_update(array('id' => $this->input->post('id')), $data);
    echo json_encode(array("status" => TRUE));
  }
  public function delete($id)
  {
    $this->Equipments_model->delete_equipment($id);
    echo json_encode(array("status" => TRUE));
  }
  public function SAGE_DB() {
    return $this->load->database('SAGE', TRUE);
  }

}