<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Project_defferal extends Pre_loader
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

     $view_data['project_details']= $this->db->query("SELECT  sage_projects.*,defferals.*,sage_projects.id as id FROM sage_projects
      LEFT JOIN defferals ON defferals.project_id=sage_projects.project_link")->result();
     $this->template->rander("defferal/index",$view_data);
   }

   public function view_project($id){
    $view_data['details'] = $this->db->query("SELECT  sage_projects.*,defferals.*,sage_projects.id as id FROM sage_projects
      LEFT JOIN defferals ON defferals.project_id=sage_projects.project_link WHERE sage_projects.project_link=$id")->row_array();

    $this->template->rander("defferal/view_form",$view_data);
  }
  public function defferal_form($id){
   $view_data['project_id'] = $id;
   $this->template->rander("defferal/form_defferal", $view_data);
 }

 public function finance_form($id){
  $view_data['project_id'] = $id;
  $this->template->rander("defferal/form_finance", $view_data);
}

public function add_operations(){

 $data=array('comments' => $this->input->post('comments'),
  'operations_sign_off' => $this->input->post('operations_sign_off'),
  'project_id' => $this->input->post('project_id'),   
);

 $this->Defferal_model->defferal_add($data);
 return redirect(base_url().'project_defferal');

}

public function add_finance(){
  $project_id=$this->input->post('project_id');
  $fromSage = $this->SAGE_DB()->query("SELECT ProjectCode FROM Project WHERE ProjectLink = $project_id")->row_array();
  $proj_code = $fromSage['ProjectCode'];

  if(!empty($this->db->query("SELECT * FROM defferals WHERE project_id=$project_id")->row_array())){
   $data=array('finance_remarks' => $this->input->post('finance_remarks'),
    'project_defferal_date' => $this->input->post('defferal_date'),
    'finance_sign_off' => $this->input->post('finance_sign_off'), 
  );

   $this->db->where('project_id',$project_id);
   $this->db->update('defferals',$data);

   if($this->input->post('finance_sign_off') == 1){
    $this->SAGE_DB()->query("UPDATE Project SET ActiveProject = 0 WHERE ProjectCode = '$proj_code'");
    $this->db->query("UPDATE sage_projects SET status = 0 WHERE code = '$proj_code'");
  }


}
return redirect(base_url().'project_defferal');

}

public function edit_finance($id){
  $view_data['project_id'] = $id;
  $view_data['defferals']=$this->db->query("SELECT * FROM defferals WHERE project_id=$id")->row_array();
  $this->template->rander("defferal/edit_form",$view_data);

}
public function save_updated(){
  $project_id=$this->input->post('project_id');
  $fromSage = $this->SAGE_DB()->query("SELECT ProjectCode FROM Project WHERE ProjectLink = $project_id")->row_array();
  $proj_code = $fromSage['ProjectCode'];

  $operations_sign_off='';
  $finance_sign_off='';
  if($this->input->post('finance_sign_off')==1){
    $operations_sign_off=1;
    $finance_sign_off=1;
  }
  else if($this->input->post('finance_sign_off')==0){
    $operations_sign_off=0;
    $finance_sign_off=0;
  }

  $data=array('finance_remarks' => $this->input->post('finance_remarks'),
    'project_defferal_date' => $this->input->post('defferal_date'),
    'finance_sign_off' => $finance_sign_off, 
    'operations_sign_off' => $operations_sign_off,
  );

  $this->db->where('project_id',$project_id);
  $this->db->update('defferals',$data);

  if($this->input->post('finance_sign_off') == 0){
    $this->SAGE_DB()->query("UPDATE Project SET ActiveProject = 1 WHERE ProjectCode = '$proj_code'");
    $this->db->query("UPDATE sage_projects SET status = 1 WHERE code = '$proj_code'");
    $this->db->query("UPDATE defferals SET finance_sign_off = 0,operations_sign_off = 0 WHERE project_id = '$project_id'");
  }

  return redirect(base_url().'project_defferal');
}

public function print_project($id){
  $view_data['reports'] = $this->db->query("SELECT  sage_projects.*,defferals.*,sage_projects.id as id FROM sage_projects
      LEFT JOIN defferals ON defferals.project_id=sage_projects.project_link WHERE sage_projects.project_link=$id")->row_array();

   $this->load->library('pdf2');
  $this->pdf2->load_view('defferal/print_form', $view_data);
  $this->pdf2->render();
  $this->pdf2->stream('defferals.pdf');
}
public function projects(){
 $project=$this->SAGE_DB()->query("SELECT * FROM Project")->result_array();
 echo "<pre>";
 var_dump($project);
 die();

}
public function SAGE_DB()
{
  return $this->load->database('SAGE', TRUE);
}

}