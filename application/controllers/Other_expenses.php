<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Other_expenses extends Pre_loader {

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
    $view_data['expenses']=$this->db->query("SELECT * FROM other_expenses")->result_array();
    $this->template->rander("maintenance/services/expenses_form",$view_data);
  }
 
public function add_expense()
{
  $data = array(
   'name' => $this->input->post('name'),
   'description' => $this->input->post('description'),
   'cost' => $this->input->post('cost')
   );
  
 $this->Other_expenses_model->add_expenses($data);

   echo json_encode(array("status" => TRUE));

    
}

public function expense_edit($id)
{
  $data = $this->Other_expenses_model->get_expenses_by_id($id);
  echo json_encode($data);
}
public function expense_update()
{
  $data = array(
   'name' => $this->input->post('name'),
   'description' => $this->input->post('description'),
   'cost' => $this->input->post('cost')
   
 );
  $this->Other_expenses_model->expenses_update(array('id' => $this->input->post('id')), $data);
 echo json_encode(array("status" => TRUE));

}

public function expense_delete($id)
{
  $this->Other_expenses_model->delete_expense($id);
  echo json_encode(array("status" => TRUE));
}
public function SAGE_DB() {
  return $this->load->database('SAGE', TRUE);
}
}