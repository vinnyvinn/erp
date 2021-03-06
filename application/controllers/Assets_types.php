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

    $query="SELECT assets.*,assets.id as asset_ID,employees.name FROM assets
    LEFT JOIN employees ON assets.driver_id=employees.id";
    $view_data['drivers_dropdown'] = $this->Employees_model->get_all_where(array("deleted" => 0))->result();   
    $view_data['service_types_dropdown'] = $this->Service_types_model->get_all_where(array("deleted" => 0))->result(); 
    $view_data['assets']=$this->db->query($query)->result_array();
    $this->template->rander("maintenance/services/assets_form",$view_data);
  }
  
  public function import_assets(){
   $existing = $this->db->query('SELECT asset_no from assets')->result_array();
   $existing = array_map(function ($item) {
    return $item['asset_no'];
  }, $existing);

$SAGEQuery = "SELECT idAssetNo,cAssetCode,cAssetDesc,ufFACurrentKMReading,ufFAMachineHours,ulFATrackBy,ucFAChasisnumber,ucFAEnginenumber
,ucFAYearofmake,ucFARegyear,ucFAMake,fInsuredValue FROM _btblFAAsset
      WHERE (iAssetTypeNo = 2 OR iAssetTypeNo = 7) AND idAssetNo NOT IN ( '" . implode( "', '" , $existing ) . "' )";
// var_dump($this->SAGE_DB()->query($SAGEQuery)->result_array());
// die();

    $fromSage = $this->SAGE_DB()->query($SAGEQuery)->result_array();
     $fromSage = array_map(function ($item) {
    return [
    "code" => $item['cAssetCode'],
    "asset_no" => $item['idAssetNo'],
    "description" => $item['cAssetDesc'],
    "km_reading" => $item['ufFACurrentKMReading'],
    "machine_hours" => $item['ufFAMachineHours'],
    "track_by" => $item['ulFATrackBy'],
    "chasis_no" => $item['ucFAChasisnumber'],
    "engine_no" => $item['ucFAEnginenumber'],
    "year_of_make" => $item['ucFAYearofmake'],
    "year_of_reg" => $item['ucFARegyear'],
    "make" => $item['ucFAMake'],
    "status" => $item['fInsuredValue'],
    ];
  }, $fromSage);


   if(!empty($fromSage)){
    $this->db->insert_batch('assets', $fromSage);
    return redirect('assets_types','refresh'); 
  }

  else
  {
    return redirect('assets_types','refresh'); 
  }
}
public function add_asset()
{
 
  $data = array(
   'code' => $this->input->post('code'),
   'year_of_reg' => $this->input->post('year_of_reg'),
   'year_of_make' => $this->input->post('year_of_make'),
   'chasis_no' => $this->input->post('chasis_no'),
   'engine_no' => $this->input->post('engine_no'),
   'description' => $this->input->post('description'),
   'driver_id' => $this->input->post('driver_id'),
   'warranty' => $this->input->post('warranty'),
   'next_time_km' => $this->input->post('next_time_km'),
   'next_time_miles' => $this->input->post('next_time_miles'),
   'make' => $this->input->post('make'),
   'km_reading' => $this->input->post('km_reading'),
   'miles_reading' => $this->input->post('miles'),
   'machine_hours' => $this->input->post('hours'),

   
   );

 $this->db->insert('assets',$data);

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
   'code' => $this->input->post('code'),
   'year_of_reg' => $this->input->post('year_of_reg'),
   'year_of_make' => $this->input->post('year_of_make'),
   'chasis_no' => $this->input->post('chasis_no'),
   'engine_no' => $this->input->post('engine_no'),
   'description' => $this->input->post('description'),
   'driver_id' => $this->input->post('driver_id'),
   'warranty' => $this->input->post('warranty'),
   'next_time_km' => $this->input->post('next_time_km'),
   'next_time_miles' => $this->input->post('next_time_miles'),
   'make' => $this->input->post('make'),
   'km_reading' => $this->input->post('km_reading'),
   'miles_reading' => $this->input->post('miles'),
   'machine_hours' => $this->input->post('hours'),
   'updated_at' => date("Y-m-d H:i:s"),
   
   );
  $this->Assets_model->assets_update(array('id' => $this->input->post('id')), $data);
 // $query = $this->db->query('SELECT id FROM assets ORDER BY updated_at DESC LIMIT 1');  
 // $result = $query->row_array()['id']; 
 // $variables = $this->db->query("SELECT assets.code,assets.next_time_km,assets.next_time_miles,employees.* FROM assets
 //  LEFT JOIN employees ON employees.id= assets.driver_id WHERE assets.id=$result")->row_array();
 // if($variables['next_time_km'] <= 200 || $variables['next_time_miles'] <=200){
 //  $this->tech_mail($variables);
 // }
 echo json_encode(array("status" => TRUE));
 

}

public function tech_mail($variables) {
  $email_template = $this->Email_templates_model->get_final_template("next_maintenance_date");
  $parser_data["VEHICLE_NO"] =$variables['code'];
  $parser_data["USER_NAME"] = $variables['name'];
  $parser_data["MILEAGE"] = $variables['next_time_km'] ? $variables['next_time_km'] .' km' : $variables['next_time_miles'] .' mi';
  $parser_data["TITLE"] = $variables['title'];
  $parser_data["SIGNATURE"] = $email_template->signature;

  $message = $this->parser->parse_string($email_template->message, $parser_data, true);
  send_app_mail($variables['email'], $email_template->subject, $message);
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