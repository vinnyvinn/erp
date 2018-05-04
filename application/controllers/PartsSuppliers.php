<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class PartsSuppliers extends Pre_loader {

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
  	$view_data['suppliers']=$this->Parts_suppliers_model->get_all_suppliers();
  $this->template->rander('maintenance/reactive/supplier',$view_data);
  }
  public function import_sage(){
  	$existing=$this->db->query("SELECT account FROM parts_suppliers")->result_array();
  	$existing=array_map(function($item){
     return $item['account'];
  	},$existing);

   $fromSage="SELECT Name,Account,Telephone,Tax_Number FROM dbo.Vendor WHERE Account NOT IN ( '" . implode( "', '" , $existing ) . "' )";
    $querySage=$this->SAGE_DB()->query($fromSage)->result_array();
    $querySage=array_map(function($item){
     return[
     	'name' =>$item['Name'],
     	 'account' => $item['Account'],
     	 'phone' => $item['Telephone'],
     	 'tax_no' => $item['Tax_Number']
     ];
    },$querySage);  
    
    if(!empty($querySage)){  
    $this->db->insert_batch('parts_suppliers',$querySage);
    return redirect(base_url().'partsSuppliers');
    }
    else{
      return redirect(base_url().'partsSuppliers');
    }
   //$fromSage=array_map(function($item))

  }
   public function add_supplier()
    {
      $data = array(
           'name' => $this->input->post('name'),
           'account' => $this->input->post('account'),
           'phone' => $this->input->post('phone'),
           'tax_no' => $this->input->post('tax_no'),
            );
      
      $insert = $this->Parts_suppliers_model->add_suppliers($data);
      echo json_encode(array("status" => TRUE));
    }
    public function supplier_edit($id)
    {
      $data = $this->Parts_suppliers_model->get_suppliers_by_id($id);
        echo json_encode($data);
    }
    public function supplier_update()
  {
    $data = array(
           'name' => $this->input->post('name'),
           'account' => $this->input->post('account'),
           'phone' => $this->input->post('phone'),
           'tax_no' => $this->input->post('tax_no'),
             );
         
    $this->Parts_suppliers_model->suppliers_update(array('id' => $this->input->post('id')), $data);
    echo json_encode(array("status" => TRUE));
  }
  public function delete($id)
  {
    $this->Parts_suppliers_model->delete_supplier($id);
    echo json_encode(array("status" => TRUE));
  }
  public function SAGE_DB() {
    return $this->load->database('SAGE', TRUE);
  }

}