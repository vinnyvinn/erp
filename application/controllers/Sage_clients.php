<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Sage_clients extends Pre_loader {

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
   $view_data['clients']=$this->db->query("SELECT * FROM sage_clients")->result_array();
    $this->template->rander("maintenance/services/clients_form",$view_data);
  }
  public function import_sage_clients(){
   $existing = $this->db->query('SELECT code from sage_clients')->result_array();
   $existing = array_map(function ($item) {
    return $item['code'];
  }, $existing);

   $SAGEQuery = "SELECT * FROM Client WHERE Account NOT IN ( '" . implode( "', '" , $existing ) . "' )";
   $fromSage = $query=$this->SAGE_DB()
   ->query($SAGEQuery)
   ->result_array();
   
   $fromSage = array_map(function ($item) {
    return [
      "code" => $item['Account'],
      "name" => $item['Name'],
      "contact_person" => $item['Contact_Person'],
      "telephone" => $item['Telephone']  
    ];
  }, $fromSage);

   $this->db->insert_batch('sage_clients', $fromSage);
   return redirect(base_url().'sage_clients');
 }
 public function add_sage_clients()
 {
  $data = array(
   'code' => $this->input->post('code'),
   'name' => $this->input->post('name'),
   'contact_person' => $this->input->post('contact_person'),
   'telephone' => $this->input->post('telephone'),
 );
  
  $insert = $this->Sage_clients_model->add_sage_clients($data);
  echo json_encode(array("status" => TRUE));


}

public function sage_clients_edit($id)
{
  $data = $this->Sage_clients_model->get_sage_clients_by_id($id);
  echo json_encode($data);
}
public function sage_clients_update()
{
  $data = array(
   'code' => $this->input->post('code'),
   'name' => $this->input->post('name'),
   'contact_person' => $this->input->post('contact_person'),
   'telephone' => $this->input->post('telephone'),
   'updated_at' => date("Y-m-d H:i:s"),
   
 );
  $this->Sage_clients_model->sage_clients_update(array('id' => $this->input->post('id')), $data);
  echo json_encode(array("status" => TRUE));
        //$this->tech_mail($variables);

}

public function sage_clients_delete($id)
{
  $this->Sage_clients_model->delete_sage_clients($id);
  echo json_encode(array("status" => TRUE));
}
public function SAGE_DB() {
  return $this->load->database('SAGE', TRUE);
}
}