<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Employees_types extends Pre_loader {

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
     
     $view_data['employees']=$this->Employees_model->get_all_employees();
     $this->template->rander("maintenance/services/employees_form",$view_data);
  }
  
   public function import_staffs(){
     $existing = $this->db->query('SELECT code_no from employees')->result_array();
    $existing = array_map(function ($item) {
      return $item['code_no'];
    }, $existing);

    
   $HRQuery = "SELECT * FROM tblEmployee WHERE Emp_Code NOT IN ( '" . implode( "', '" , $existing ) . "' )";
    $fromHr = $query=$this->HR_DB()
      ->query($HRQuery)
      ->result_array();
       
       $fromHr = array_map(function ($item) {
       return [
         "name" =>$item['Emp_Name'],
         "title" => $item['Emp_Title'],
         "code_no" => $item['Emp_Code'],
         "join_date" => $item['Emp_Join_Date'],
        
       ];
     }, $fromHr);

    
    if($this->db->insert_batch('employees', $fromHr)){
     return redirect(base_url().'employees_types'); 
   } else
   {
    return redirect(base_url().'employees_types');
   }
     
   }
   public function add_employee()
    {
      $data = array(
           'name' => $this->input->post('name'),
           'title' => $this->input->post('title'),
           'code_no' => $this->input->post('code_no'),
           'join_date' => $this->input->post('join_date'),
            );
      
      $insert = $this->Employees_model->add_employees($data);
      echo json_encode(array("status" => TRUE));
    }
    public function employee_edit($id)
    {
      $data = $this->Employees_model->get_employees_by_id($id);
        echo json_encode($data);
    }
    public function employee_update()
  {
    $data = array(
           'name' => $this->input->post('name'),
           'title' => $this->input->post('title'),
           'code_no' => $this->input->post('code_no'),
           'join_date' => $this->input->post('join_date'),
              );
         
    $this->Employees_model->employees_update(array('id' => $this->input->post('id')), $data);
    echo json_encode(array("status" => TRUE));
  }
  public function delete($id)
  {
    $this->Employees_model->delete_employee($id);
    echo json_encode(array("status" => TRUE));
  }
  public function HR_DB() {
    return $this->load->database('HR', TRUE);
  }
}