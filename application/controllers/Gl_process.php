<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Gl_process extends Pre_loader
{

    /**
     * Get All Data from this method.
     *
     * @return Response
     */

    public function __construct()
    {
      parent::__construct();
      
      $this->load->helper(array('form', 'url'));
      $this->load->library('excel');

    }

    public function index()
    { 
      $view_data['defferals'] = $this->SAGE_DB()->query("SELECT * FROM ESL_PROJ_DEF_POSTING")->result();
      $this->template->rander("gl/process_index",$view_data);
    }

    public function gl_form(){
     $view_data['accounts_dropdown'] = $this->Gl_model->get_all_where(array("deleted" => 0))->result(); 
     $view_data['projects_dropdown'] = $this->Sage_projects_model->get_all_where(array("deleted" => 0))->result(); 
     $this->template->rander("gl/process_form",$view_data);
   }

   public function save_def(){
     $data = array(
       'Income_Contra' =>  $this->input->post('account_revenue'),
       'Expense_Contra' => $this->input->post('account_sale'),
       'Prj' => $this->input->post('project_id'),
       'Posting_Date' => $this->input->post('post_date')
     );

     if($this->input->post('defferal') == 'rev'){

      return $this->save_rev($data);
    }


    $Income_Contra =  $this->input->post('account_revenue');
    $Expense_Contra = $this->input->post('account_sale');
    $Prj = $this->input->post('project_id');
    $Posting_Date = $this->input->post('post_date');

   if(!$this->checkDefferal($Prj)){
    $this->session->set_flashdata('msg', 'No records found for the selected Project. Please try again');
    return redirect(base_url().'gl_process');
   }
    $this->SAGE_DB()->query("Exec ESL_DEF_PROJ '$Prj','$Income_Contra' , $Expense_Contra , '$Posting_Date'");

    return redirect(base_url().'gl_process');

  }

  public function save_rev($data){
   $Income_Contra =  $data['Income_Contra'];
   $Expense_Contra = $data['Expense_Contra'];
   $Prj = $data['Prj'];
   $Posting_Date = $data['Posting_Date'];

    if(!$this->checkDefferal($Prj)){
    $this->session->set_flashdata('msg', 'No records found for the selected Project. Please try again');
    return redirect(base_url().'gl_process');
   }

   $this->SAGE_DB()->query("Exec ESL_DEF_PROJ_REV '$Prj','$Income_Contra' , $Expense_Contra , '$Posting_Date'");
   return redirect(base_url().'gl_process');
 }

 public function checkDefferal($code){
  
   echo json_encode($this->SAGE_DB()->query("Select Count (*) from PostGL G Inner Join Project P on G . Project = P . ProjectLink
   Where P . ProjectCode = '$code'")->row_array());
 }

public function SAGE_DB()
{
  return $this->load->database('SAGE', TRUE);
}

}
