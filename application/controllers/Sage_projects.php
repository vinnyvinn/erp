<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Sage_projects extends Pre_loader
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
      
     $view_data['all_projects'] = $this->Sage_projects_model->get_all_projects();
     $this->template->rander("gl/projects_index",$view_data);
   }

   public function import_projects(){
     $existing = $this->db->query("SELECT project_link FROM sage_projects")->result_array();
     $existing = array_map(function ($item) {
      return $item['project_link'];
    }, $existing);


     $SAGEQuery = "SELECT  ProjectLink , ProjectCode , ProjectName ,ActiveProject ,ProjectDescription , MasterSubProject, Project_dCreatedDate FROM Project
     WHERE  ProjectLink NOT IN ( '" . implode( "', '" , $existing ) . "' )";

     $fromSage = $this->SAGE_DB()->query($SAGEQuery)->result_array();
     $fromSage = array_map(function ($item) {
      return [
        "project_link" => $item['ProjectLink'],
        "code" => $item['ProjectCode'],
        "name" => $item['ProjectName'],
        "description" => $item['ProjectDescription'],
        "master_sub_project" => $item['MasterSubProject'],
        "date_created" => $item['Project_dCreatedDate'],
        "status" => $item['ActiveProject'],
      ];
    }, $fromSage);


     if(!empty($fromSage)){
      $this->db->insert_batch('sage_projects', $fromSage);
      return redirect('sage_projects','refresh'); 
    }

    else
    {
      return redirect('sage_projects','refresh'); 
    }
  }
  public function add_project()
  {
   
    $data = array(
     'code' => $this->input->post('code'),
     'name' => $this->input->post('name'),
     'description' => $this->input->post('description'),
     'date_created' => $this->input->post('date_created'),
    
     
   );

    $this->db->insert('sage_projects',$data);

    echo json_encode(array("status" => TRUE));

  }

  public function project_edit($id)
  {
    $data = $this->Sage_projects_model->get_project_by_id($id);
    echo json_encode($data);
  }
  public function project_update()
  {
    
   $data = array(
     'code' => $this->input->post('code'),
     'name' => $this->input->post('name'),
     'description' => $this->input->post('description'),
     'date_created' => $this->input->post('date_created'),
     
     
   );
   $this->Sage_projects_model->project_update(array('id' => $this->input->post('id')), $data);
   
   echo json_encode(array("status" => TRUE));
   

 }


 public function project_delete($id)
 {
  $this->Sage_projects_model->delete_project($id);
  echo json_encode(array("status" => TRUE));
}
public function SAGE_DB() {
  return $this->load->database('SAGE', TRUE);
}
}