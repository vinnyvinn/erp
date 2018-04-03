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
           'code' => $this->input->post('code'),
           'description' => $this->input->post('description'),
           'driver_id' => $this->input->post('driver_id'),
           'warranty' => $this->input->post('warranty'),
           'next_time' => $this->input->post('next_time'),
           'location' => $this->input->post('location'),
           'km_reading' => $this->input->post('km_reading'),
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
           'code' => $this->input->post('code'),
           'description' => $this->input->post('description'),
           'driver_id' => $this->input->post('driver_id'),
           'warranty' => $this->input->post('warranty'),
           'next_time' => $this->input->post('next_time'),
         'location' => $this->input->post('location'),
         'km_reading' => $this->input->post('km_reading'),
         'updated_at' => date("Y-m-d H:i:s"),
                
      );
       $this->Assets_model->assets_update(array('id' => $this->input->post('id')), $data);
       $query = $this->db->query('SELECT id FROM assets ORDER BY updated_at DESC LIMIT 1');  
       $result = $query->row()->id; 
       $variables = $this->db->query("SELECT assets.code,assets.next_time,employees.* FROM Assets
        LEFT JOIN employees ON employees.id= assets.driver_id WHERE assets.id=$result")->result_array();
        echo json_encode(array("status" => TRUE));
        $this->tech_mail($variables);
    
  }
  
  public function tech_mail($variables) {

        $email_template = $this->Email_templates_model->get_final_template("next_maintenance_date");
        $parser_data["VEHICLE_NO"] =$variables[0]['code'];
        $parser_data["USER_NAME"] = $variables[0]['name'];
        $parser_data["NEXT_DATE"] = $variables[0]['next_time'];
        $parser_data["TITLE"] = $variables[0]['title'];
        $parser_data["SIGNATURE"] = $email_template->signature;

        $message = $this->parser->parse_string($email_template->message, $parser_data, true);
        send_app_mail($variables[0]['email'], $email_template->subject, $message);
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