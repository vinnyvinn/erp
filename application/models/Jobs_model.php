<?php

class Jobs_model extends Crud_model {

  private $table = null;

  function __construct() {
    $this->table = 'jobs';
    parent::__construct($this->table);
  }

  function get_details() {
    $query="SELECT jobs.*,job_services.*,jobs.id as id ,assets.code,employees.name as driver,
    job_types.job_type_name job_type,spares.stock_name as stock FROM jobs 
    LEFT JOIN job_services ON job_services.id=jobs.job_service_id
    LEFT JOIN assets ON assets.id=jobs.vehicle_no
    LEFT JOIN employees ON employees.id=assets.driver_id
    LEFT JOIN job_types ON job_types.id=jobs.job_type_id
    LEFT JOIN spares ON spares.job_card_id=jobs.id
    WHERE jobs.reactive=0";
    
    return $this->db->query($query)->result_array();

  }
  function get_reactive_details() {
    $query="SELECT jobs.*,job_services.*,jobs.id as id ,assets.code,employees.name as driver,
    job_types.job_type_name job_type,spares.stock_name as stock FROM jobs 
    LEFT JOIN job_services ON job_services.id=jobs.job_service_id
    LEFT JOIN assets ON assets.id=jobs.vehicle_no
    LEFT JOIN employees ON employees.id=assets.driver_id
    LEFT JOIN job_types ON job_types.id=jobs.job_type_id
    LEFT JOIN spares ON spares.job_card_id=jobs.id
    WHERE jobs.reactive=1";
    return $this->db->query($query)->result_array();
  }

  function fetchId($id){

   $view_data=[];
   $query="SELECT jobs.*,jobs.description as explanation,job_services.*,jobs.id as id ,fuel_balances.description as balance,
   job_services.id as serviceID,assets.code,assets.asset_no,employees.name as driver,parts_suppliers.name as provider,
   service_types.name as service FROM jobs 
   LEFT JOIN job_services ON job_services.id=jobs.job_service_id
   LEFT JOIN assets ON assets.id=jobs.vehicle_no
   LEFT JOIN employees ON employees.id=assets.driver_id
   LEFT JOIN parts_suppliers ON parts_suppliers.id=jobs.supplier_id
   LEFT JOIN fuel_balances ON fuel_balances.id=jobs.fuel_balance
   LEFT JOIN service_types ON service_types.id=jobs.service_type_id
   WHERE jobs.id=$id";
   $data = $this->db->query($query)->result_array();
   return $data;
     
 }
    
 function data_info($id){

   $view_data=[];
   $query="SELECT jobs.*,jobs.description as explanation,job_services.*,jobs.id as id ,fuel_balances.description as balance,
   job_services.id as serviceID,assets.code,assets.asset_no,employees.name as driver,parts_suppliers.name as provider FROM jobs 
   LEFT JOIN job_services ON job_services.id=jobs.job_service_id
   LEFT JOIN assets ON assets.id=jobs.vehicle_no
   LEFT JOIN employees ON employees.id=assets.driver_id
   LEFT JOIN parts_suppliers ON parts_suppliers.id=jobs.supplier_id
   LEFT JOIN fuel_balances ON fuel_balances.id=jobs.fuel_balance
   WHERE jobs.id=$id";
   $data = $this->db->query($query)->row_array();
   $repairs=[];
   $services =json_decode($data['application_data']);

   if(count($services)){
    foreach ($services[0] as $item) {

      $user=$this->db->query("SELECT * FROM employees WHERE id= '$item->user'")
      ->row_array();
      $status=$this->db->query("SELECT * FROM jobs_status WHERE id = '$item->satus'")
      ->row_array();

      array_push($repairs, ['emp'=>$user, "status"=> $status]);
    }
    array_push($view_data , ['data'=>$data,'service'=>$repairs]);

    return $view_data;
  }

}

public function inspection($id){
 $data=$this->db->query("SELECT * FROM jobs WHERE id=$id")->row_array();

 $ins_data=[];
 $inspections=json_decode($data['application_data']);

 foreach ($inspections as $inspect) {
  $dta=$inspect->items->user;
  return $dta;
  $ins=$this->db->query("SELECT * FROM job_inspections WHERE id=$dta")->result_array();

  $ins_data=$dta;
}
return $ins_data;
$query="SELECT * FROM jobs
LEFT JOIN job_inspections ON find_in_set(job_inspections.id,$ins_data) WHERE jobs.id=$id";
return $this->db->query($query)->result_array();
}
   
public function SAGE_DB(){
  return $this->load->database('SAGE',TRUE);
}
     // public function status($id){
     //   $data=$this->db->query("SELECT * FROM jobs WHERE id=$id")->row_array();

     //   $status_data=[];
     //   $status=json_decode($data['application_data']);
     //   foreach ($status[0] as $st) {
     //     $info=$this->db->query("SELECT * FROM jobs_status WHERE id='$st->satus'")->row()->id;
     //     $status_data=$info;
     //   }
     //   return $status_data;
     //    $query="SELECT * FROM jobs 
     //    LEFT JOIN jobs_status ON find_in_set(jobs_status.id,$status_data) WHERE jobs.id=$id";
     //    return $this->db->query($query)->result_array();
     // }
}
