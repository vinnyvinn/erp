<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Preventive extends Pre_loader {

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

    $view_data['all_details']=$this->Jobs_model->get_details();

    $this->template->rander("maintenance/preventive/index", $view_data);
  }

  public function serviceTypesAjax($id){
            $result=$this->db->get_where('job_types',array('job_id' => $id))->result_array();
            echo json_encode($result);
  }
  public function model($id){
      $query=$this->db->query("SELECT assets.description,employees.name FROM assets 
      LEFT JOIN  employees ON employees.id=assets.driver_id WHERE assets.id=$id")->row()->description;
      echo json_encode($query);
  }
  public function driver($id){
     $driver=$this->db->query("SELECT assets.description,employees.name FROM assets 
      LEFT JOIN  employees ON employees.id=assets.driver_id WHERE assets.id=$id")->row()->name;
      echo json_encode($driver);
  }
  public function km_reading($id){
     $km=$this->db->query("SELECT assets.km_reading FROM assets 
      LEFT JOIN  employees ON employees.id=assets.driver_id WHERE assets.id=$id")->row()->km_reading;
      $this->session->set_userdata('k_r',$km);
      echo json_encode($km);
  }
  public function warrantyCheck($id){
    $date_now = date("Y-m-d");
    $query=$this->db->query("SELECT * FROM assets WHERE id=$id")->row()->warranty;
    $datediff =strtotime($date_now)/(60*60*24)-strtotime($query)/(60*60*24);
    $queryWarranty=$this->db->query("SELECT * FROM assets WHERE id=$id AND  $datediff >= 0")->result_array();
    echo json_encode($queryWarranty);
  }
  public function DisplayServiceType($id){
  $query="SELECT job_types.*,job_tasks.*,job_tasks.id as taskID,service_types.description as explanation,employees.name as employee FROM job_tasks
  LEFT JOIN employees ON employees.id=job_tasks.assigned_to 
  LEFT JOIN job_types ON job_types.id=job_tasks.jobs_type_id 
  LEFT JOIN service_types ON service_types.id=job_tasks.service_type_id WHERE job_types.id=$id"; 
   $all_data=$this->db->query($query)->result_array();

   echo json_encode($all_data);

  }
  public function DisplayTasksData(){

              $query="SELECT * FROM job_tasks";
              $result=$this->db->query($query);
              $all_data=[];
              foreach($result->result_array() as $value){
               $match=$value['assigned_to'];
               $sql="SELECT  tblEmployee.Emp_Name,tblEmployee.Emp_Id FROM tblEmployee WHERE tblEmployee.Emp_Id=$match";
               $res=$this->HR_DB()->query($sql);
               $results =$res->result_array();
              array_push($all_data,['details'=>$value,'results'=>$results]);
           
         }

         echo json_encode($all_data);
  }
  public function jobs_form() {
        $job_id = $this->input->post('id');
        $view_data['tasks_info'] = $this->Job_tasks_model->get_details();
        $view_data['job_info'] = $this->Jobs_model->get_one($job_id);
        $view_data['services_dropdown'] = $this->Service_types_model->get_all_where(array("deleted" => 0))->result();
        $view_data['service_types_dropdown'] = $this->Job_services_model->get_all_where(array("deleted" => 0))->result();
        $view_data['inspections_dropdown'] = $this->Inspections_model->get_all_where(array("deleted" => 0))->result();
        $view_data['job_types_dropdown'] = $this->Job_types_model->get_all_where(array("deleted" => 0))->result();
        $view_data['vehicles_dropdown'] = $this->Assets_model->get_all_where(array("deleted" => 0))->result();
        $view_data['jobs_status_dropdown'] = $this->Jobs_status_model->get_all_where(array("deleted" => 0))->result();
        $view_data['sage_staff_dropdown'] = $this->Employees_model->get_all_where(array("deleted" => 0))->result();
        $this->template->rander('maintenance/preventive/jobs_form', $view_data);
    }
     public function status_data(){
      $data_status=[];
        $status=$this->db->query("SELECT jobs_status.*,jobs_status.id as s_ID FROM jobs_status")->result_array();
      foreach ($status as $st) {
        $data_status[]=$st;
      }
      $data_inspections=[];
      $inspection=$this->db->query("SELECT job_inspections.* ,job_inspections.id as in_ID 
        FROM job_inspections")->result_array();
      foreach ($inspection as $insp) {
         $data_inspections[]=$insp;
      }
       $data_employees=[];
       $employees=$this->db->query("SELECT employees.* ,employees.id as emp_ID FROM employees")->result_array();
       foreach ($employees as $employee) {
           $data_employees[]=$employee;
          }   
      $all_data=array_merge(['inspect'=>$data_inspections,'emp'=>$data_employees,'status'=>$data_status]);;
      
      echo json_encode($all_data);
     }
     public function assigned_data(){

       $done_by= $this->Employees_model->get_all_where(array("deleted" => 0));
       $data=[];
       foreach ($done_by->result() as $value) {
         $data[]=$value;
       }
       echo json_encode($data);
     }

      public function save_task(){

        $data= array(
            "service_type_id" => $this->input->post('service_type_id'),
            "assigned_to" => $this->input->post('assigned_to'),
            "tasks" => $this->input->post('tasks'),
            "start_date" => $this->input->post('start_date'),
            "job_time_in" => $this->input->post('job_time_in'),
            "jobs_type_id" => $this->input->post('jobs_type_id'),
              );
           $saved_data=$this->Job_tasks_model->save($data);
           echo json_encode($saved_data);
          
      }

    public function save(){
        // var_dump($this->input->post('inspection_id'));
        // die();
        //  $info=[];
        //  $inspect=$this->input->post('inspection_id');
        //   foreach ($inspect as $inspection) {
        //  array_push( $info,$inspection);
        //   }

        //   $status=[];
        //  $stat=$this->input->post('status_id');
        //   foreach ($stat as $stato) {
        //  array_push($status,$stato);
        //   }  
        //   $done_by=[];
        //  $done=$this->input->post('done_by');
        //   foreach ($done as $who) {
        //  array_push($done_by,$who);
        //   }                    
            $data = array(
            "job_service_id" => $this->input->post('job_service_id'),
            "job_type_id" => $this->input->post('job_type_name'),
            "vehicle_no" => $this->input->post('vehicle_no'),
            "time_in" => $this->input->post('time_in'),
            "km_reading" => $this->input->post('km_reading'),
            "description" => $this->input->post('description'),
            "completion_date" => $this->input->post('completion_date'),
            "fuel_balance" => $this->input->post('fuel_balance'),
            "inspection_id" => $this->input->post('inspection_id'),
            "status_id" => $this->input->post('status_id'),
            "done_by" => $this->input->post('done_by'),
             );
         
         $data=$this->db->insert('jobs',$data);
         $last_id=$this->db->insert_id();
         $model=$this->db->query("SELECT assets.code FROM jobs
         LEFT JOIN assets ON assets.id=jobs.vehicle_no WHERE jobs.id=$last_id")->row()->code;
         $card=array("card_no"  =>substr('ESL-'.$last_id.'-'.$model,0,20));
         $this->db->where('id',$last_id)->update('jobs',$card);
          echo json_encode($data);

        }
   
    public function job_type_modal(){
        $view_data['services_dropdown'] = $this->Service_types_model->get_all_where(array("deleted" => 0))->result();
        $view_data['jobs_dropdown'] = $this->Job_services_model->get_all_where(array("deleted" => 0))->result();

        $this->load->view('maintenance/preventive/modal_form', $view_data);
    }
    public function save_job_type(){
       $data = array(
            "job_type_name" => $this->input->post('job_type_name'),
            "service_type" => $this->input->post('service_type'),
            "job_id" => $this->input->post('job_id'),
           );
         $this->Job_types_model->save($data);
         return redirect(base_url().'preventive');
        
        

    }

  public function show_job($id){
   $job_id = $this->input->post('id');
        $view_data['tasks_info'] = $this->Job_tasks_model->get_details();
        $view_data['job_info'] = $this->Jobs_model->get_one($job_id);
        $view_data['services_dropdown'] = $this->Service_types_model->get_all_where(array("deleted" => 0))->result();
    $view_data['service_types_dropdown'] = $this->Job_services_model->get_all_where(array("deleted" => 0))->result();
        $view_data['inspections_dropdown'] = $this->Inspections_model->get_all_where(array("deleted" => 0))->result();
        $view_data['job_types_dropdown'] = $this->Job_types_model->get_all_where(array("deleted" => 0))->result();
        $view_data['vehicles_dropdown'] = $this->Assets_model->get_all_where(array("deleted" => 0))->result();
        $view_data['jobs_status_dropdown'] = $this->Jobs_status_model->get_all_where(array("deleted" => 0))->result();
     $job_type_id=$this->Jobs_model->fetchId($id)['j_ID'];
       $query="SELECT job_tasks.*,job_tasks.tasks as work,employees.name as employee,
       service_types.description FROM job_tasks 
       LEFT JOIN job_types ON job_types.id=job_tasks.jobs_type_id
       LEFT JOIN service_types ON service_types.id=job_tasks.service_type_id
       LEFT JOIN employees ON employees.id=job_tasks.assigned_to WHERE job_types.id=$job_type_id";
       $view_data['tasks']=$this->db->query($query)->result(); 
       $view_data['jobs']=$this->Jobs_model->fetchId($id);
       $view_data['drivers']=$this->Jobs_model->driver($id);
       $view_data['inspection']=$this->Jobs_model->inspection($id);
      $view_data['status']=$this->Jobs_model->status($id);
     $view_data['services_dropdown'] = $this->Service_types_model->get_all_where(array("deleted" => 0))->result();
      $view_data['sage_staff_dropdown'] = $this->Employees_model->get_all_where(array("deleted" => 0))->result();
       $view_data ['job_types_dropdown'] = $this->Job_types_model->get_all_where(array("deleted" => 0))->result(); 
      $this->template->rander('maintenance/preventive/edit_form', $view_data);
  }

  public function import_assets_from_sage()
  {

    $existing = $this->db->query('SELECT asset_no from assets')->result_array();
    $existing = array_map(function ($item) {
      return $item['asset_no'];
    }, $existing);

    $SAGEQuery = 'SELECT * FROM _btblFAAsset WHERE iAssetTypeNo = 4 AND idAssetNo NOT IN (' . implode(',', $existing). ')';
    $fromSage = $this->SAGE_DB()
      ->query($SAGEQuery)
      ->result_array();

    $fromSage = array_map(function ($item) {
      return [
        "asset_no" =>$item['idAssetNo'],
        "code" => $item['cAssetCode'],
        "description" => $item['cAssetDesc'],
        "location" => $item['iLocationNo'],
        "purchased_date" => $item['dPurchaseDate']  
      ];
    }, $fromSage);


    $this->db->insert_batch('assets', $fromSage); 
    return redirect(base_url().'/preventive');
 }
 public function print_job($id){
   $job_id = $this->input->post('id');
        $view_data['tasks_info'] = $this->Job_tasks_model->get_details();
        $view_data['job_info'] = $this->Jobs_model->get_one($job_id);
        $view_data['services_dropdown'] = $this->Service_types_model->get_all_where(array("deleted" => 0))->result();
    $view_data['service_types_dropdown'] = $this->Job_services_model->get_all_where(array("deleted" => 0))->result();
        $view_data['inspections_dropdown'] = $this->Inspections_model->get_all_where(array("deleted" => 0))->result();
        $view_data['job_types_dropdown'] = $this->Job_types_model->get_all_where(array("deleted" => 0))->result();
        $view_data['vehicles_dropdown'] = $this->Assets_model->get_all_where(array("deleted" => 0))->result();
        $view_data['jobs_status_dropdown'] = $this->Jobs_status_model->get_all_where(array("deleted" => 0))->result();
     $job_type_id=$this->Jobs_model->fetchId($id)['j_ID'];
       $query="SELECT job_tasks.*,job_tasks.tasks as work,employees.name as employee,
       service_types.description FROM job_tasks 
       LEFT JOIN job_types ON job_types.id=job_tasks.jobs_type_id
       LEFT JOIN service_types ON service_types.id=job_tasks.service_type_id
       LEFT JOIN employees ON employees.id=job_tasks.assigned_to WHERE job_types.id=$job_type_id";
       $view_data['tasks']=$this->db->query($query)->result(); 
       $view_data['jobs']=$this->Jobs_model->fetchId($id);
       $view_data['drivers']=$this->Jobs_model->driver($id);
       $view_data['inspection']=$this->Jobs_model->inspection($id);
      $view_data['status']=$this->Jobs_model->status($id);
     $view_data['services_dropdown'] = $this->Service_types_model->get_all_where(array("deleted" => 0))->result();
      $view_data['sage_staff_dropdown'] = $this->Employees_model->get_all_where(array("deleted" => 0))->result();
       $view_data ['job_types_dropdown'] = $this->Job_types_model->get_all_where(array("deleted" => 0))->result();
  $this->template->rander('maintenance/preventive/print_job',$view_data);
 }
  
  public function employee(){

  	
    $query=$this->HR_DB()->get_where('tblEmployee',array(''));
     $res=$query->result_array();
     echo "<pre>";
   	var_dump($res);
    
  }
  public function supplier(){
        $sql = "SELECT * FROM dbo.Vendor";
        $results = $this->SAGE_DB()->query($sql)->result_array();
        echo "<pre>";
        var_dump($results);
  }


  public function asset(){
    $sql="SELECT * FROM _btblFAAsset WHERE cAssetDesc LIKE 'Trimm%'";
      $query=$this->SAGE_DB()->query($sql)->result_array();
  	// $query=$this->SAGE_DB()->get_where('_btblFAAsset',array('iAssetTypeNo' => 1));
  	// $result=$query->result_array();
    echo "<pre>";
    var_dump($query);
    die();
   	//echo json_encode($result);
  }

  public function SAGE_DB() {
    return $this->load->database('SAGE', TRUE);
  }

  public function HR_DB() {
    return $this->load->database('HR', TRUE);
  }
}