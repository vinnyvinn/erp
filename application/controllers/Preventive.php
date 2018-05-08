<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Preventive extends Pre_loader
{

    /**
     * Get All Data from this method.
     *
     * @return Response
     */

    public function __construct()
    {
      parent::__construct();
      $this->init_permission_checker("technical");
      $this->load->helper(array('form', 'url'));
      $this->load->library('excel');
      


    }

    public function index()
    {
      $this->access_only_allowed_members();
     $view_data['all_details'] = $this->Jobs_model->get_details();
     $this->template->rander("maintenance/preventive/index", $view_data);
   }

   public function serviceTypesAjax($id)
   {
    $result = $this->db->get_where('job_types', array('job_id' => $id))->result_array();
    echo json_encode($result);
  }
  public function selectedService($id){
   $services=$this->db->query("SELECT * FROM assets INNER JOIN service_types ON assets.service_type=service_types.name WHERE assets.id='$id'")->result_array();

   echo json_encode($services);

 }
 public function model($id)
 {
  $query = $this->db->query("SELECT assets.description,employees.name FROM assets 
   LEFT JOIN  employees ON employees.id=assets.driver_id WHERE assets.id=$id")->row()->description;
  echo json_encode($query);
}

public function driver($id)
{
  $driver = $this->db->query("SELECT assets.description,employees.name FROM assets 
    LEFT JOIN  employees ON employees.id=assets.driver_id WHERE assets.id=$id")->row()->name;
  echo json_encode($driver);
}

public function km_reading($id)
{
  $km = $this->db->query("SELECT assets.km_reading FROM assets 
    LEFT JOIN  employees ON employees.id=assets.driver_id WHERE assets.id=$id")->row()->km_reading;
   echo json_encode($km);
}
public function miles_reading($id)
{
  $miles = $this->db->query("SELECT assets.miles_reading FROM assets 
    LEFT JOIN  employees ON employees.id=assets.driver_id WHERE assets.id=$id")->row()->miles_reading;
    echo json_encode($miles);
}
public function machine_hours($id)
{
  $hrs = $this->db->query("SELECT assets.machine_hours FROM assets 
    LEFT JOIN  employees ON employees.id=assets.driver_id WHERE assets.id=$id")->row()->machine_hours;
  echo json_encode($hrs);
}

public function warrantyCheck($id)
{
  $date_now = date("Y-m-d");
  $query = $this->db->query("SELECT * FROM assets WHERE id=$id")->row()->warranty;
  $datediff = strtotime($query) / (60 * 60 * 24)-strtotime($date_now) / (60 * 60 * 24);
  $queryWarranty = $this->db->query("SELECT * FROM assets WHERE id=$id AND  $datediff >= 0")->result_array();
  echo json_encode($queryWarranty);
}

public function DisplayServiceType($id)
{
  $query = "SELECT job_types.*,job_tasks.*,job_tasks.id as taskID,service_types.description as explanation,employees.name as employee FROM job_tasks
  LEFT JOIN employees ON employees.id=job_tasks.assigned_to 
  LEFT JOIN job_types ON job_types.id=job_tasks.jobs_type_id 
  LEFT JOIN service_types ON service_types.id=job_tasks.service_type_id WHERE job_types.id=$id";
  $all_data = $this->db->query($query)->result_array();

  echo json_encode($all_data);

}

public function DisplayTasksData()
{

  $query = "SELECT * FROM job_tasks";
  $result = $this->db->query($query);
  $all_data = [];
  foreach ($result->result_array() as $value) {
    $match = $value['assigned_to'];
    $sql = "SELECT  tblEmployee.Emp_Name,tblEmployee.Emp_Id FROM tblEmployee WHERE tblEmployee.Emp_Id=$match";
    $res = $this->HR_DB()->query($sql);
    $results = $res->result_array();
    array_push($all_data, ['details' => $value, 'results' => $results]);

  }

  echo json_encode($all_data);
}

public function jobs_form()
{
  $this->access_only_allowed_members();
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
  $view_data['providers_dropdown'] = $this->Parts_suppliers_model->get_all_where(array("deleted" => 0))->result(); 
  $view_data['fuel_dropdown'] = $this->Fuel_balances_model->get_all_where(array("deleted" => 0))->result();

  $this->template->rander('maintenance/preventive/jobs_form', $view_data);
}
public function process_form($id){
  $this->access_only_allowed_members();
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
  $view_data['providers_dropdown'] = $this->Parts_suppliers_model->get_all_where(array("deleted" => 0))->result(); 
  $view_data['fuel_dropdown'] = $this->Fuel_balances_model->get_all_where(array("deleted" => 0))->result();

  $mydata=$this->Jobs_model->data_info($id)[0]['data']['application_data'];
  $f_data=json_decode($mydata);
  $user_info=[];
  $inspection_info=[];
  $status_info=[];
  $all_data=[];
  if($f_data){
    foreach ($f_data as $key => $employee) {
     $user_id=$employee->items->user;

     $user=$this->db->query("SELECT employees.*,employees.name as employee FROM employees WHERE find_in_set(id,$user_id)")->result_array();

     $user_info[]=$user;

   }


   foreach ($f_data as $key => $inspect) {
     $ins_id=$inspect->items->inspection_id;

     $inspection=$this->db->query("SELECT * FROM job_inspections WHERE find_in_set(id,$ins_id)")->result();
     $inspection_info[]=$inspection;

   }



   foreach ($f_data as $key => $status) {
     $status_id=$status->items->satus;
     $st_data=$this->db->query("SELECT jobs_status.*,jobs_status.name as status FROM jobs_status WHERE find_in_set(id,$status_id)")->result();
     $status_info[]=$st_data;

   }
 }


 $all_data=array_merge(['inspect' => $inspection_info, 'emp' => $user_info, 'status' => $status_info]);
 $view_data['inspections'] = $all_data;
 $view_data['jobs'] = $this->Jobs_model->fetchId($id);

 $this->template->rander('maintenance/preventive/jobs_process', $view_data);
}

public function status_data()
{
  $data_status = [];
  $status = $this->db->query("SELECT jobs_status.*,jobs_status.id as s_ID FROM jobs_status")->result_array();
  foreach ($status as $st) {
    $data_status[] = $st;
  }
  $data_inspections = [];
  $inspection = $this->db->query("SELECT job_inspections.* ,job_inspections.id as in_ID 
    FROM job_inspections")->result_array();
  foreach ($inspection as $insp) {
    $data_inspections[] = $insp;
  }
  $data_employees = [];
  $employees = $this->db->query("SELECT employees.* ,employees.id as emp_ID FROM employees")->result_array();
  foreach ($employees as $employee) {
    $data_employees[] = $employee;
  }
  $all_data = array_merge(['inspect' => $data_inspections, 'emp' => $data_employees, 'status' => $data_status]);;

  echo json_encode($all_data);
}

public function assigned_data()
{

  $done_by = $this->Employees_model->get_all_where(array("deleted" => 0));
  $data = [];
  foreach ($done_by->result() as $value) {
    $data[] = $value;
  }
  echo json_encode($data);
}

public function save_task()
{

  $data = array(
    "service_type_id" => $this->input->post('service_type_id'),
    "assigned_to" => $this->input->post('assigned_to'),
    "tasks" => $this->input->post('tasks'),
    "start_date" => $this->input->post('start_date'),
    "job_time_in" => $this->input->post('job_time_in'),
    "jobs_type_id" => $this->input->post('jobs_type_id'),
  );
  $saved_data = $this->Job_tasks_model->save($data);
  echo json_encode($saved_data);

}

public function save()
{


if(!empty($_FILES['picture']['name'])){
  $config['upload_path'] = 'uploads/images/';
  $config['allowed_types'] = 'jpg|jpeg|png|gif|pdf|doc|docx|xls|xlsx|csv|txt|rtf|html|zip|mp3|wma|mpg|flv|avi';
  $config['file_name'] = $_FILES['picture']['name'];

                //Load upload library and initialize configuration
  $this->load->library('upload',$config);
  $this->upload->initialize($config);

  if($this->upload->do_upload('picture')){
    $uploadData = $this->upload->data();
    $picture = $uploadData['file_name'];
  }else{
    $picture = '';
  }
}else{
  $picture = '';
}


  $partArr = $this->input->post('part_name');
  $qntyArr = $this->input->post('quantity');
  $costArr = $this->input->post('cost');
  if(!empty($partArr)){
    for($i = 0; $i < count($partArr); $i++){
      if(!empty($partArr[$i])){
        $part_name = $partArr[$i];
        $qnty = $qntyArr[$i];
        $cost = $costArr[$i];
        
      }
    }
  }

  $km_reading='';
  $hours='';
  $miles_reading='';
  $internal_provider='';
  $external_provider='';
  if($this->input->post('km_reading')){
   $km_reading = $this->input->post('km_reading');
 }
 if($this->input->post('miles_reading')){
   $miles_reading = $this->input->post('miles_reading');
 }
 if($this->input->post('hours')){
  $hours = $this->input->post('hours');
}
if($this->input->post('internal_provider')){
 $internal_provider= $this->input->post('internal_provider');
}
if($this->input->post('external_provider')){
 $external_provider= $this->input->post('external_provider');
}
//$total_cost=$this->input->post('quantity')*$this->input->post('cost');
$data = array(
 "vehicle_no" => $this->input->post('vehicle_no'),
 "time_in" => $this->input->post('time_in'),
 "km_reading" => $km_reading ,
 "miles_reading" => $miles_reading ,
 "description" => $this->input->post('description'),
 "completion_date" => $this->input->post('completion_date'),
 "fuel_balance" => $this->input->post('fuel_balance'),
 "fuel_balance" => $this->input->post('fuel_balance'),
 "supplier_id" => $this->input->post('supplier_id'),
 "job_type_id" => $this->input->post('job_type_name'),
 "labour" => $this->input->post('labour'),
 "labour_cost" => $this->input->post('labour_cost'),
 "hours" => $hours,
 "time_out" => $this->input->post('time_out'),
 "actual_date" => $this->input->post('actual_date'),
 "track_by" => $this->input->post('track_by'),
 "service_type_id" => $this->input->post('service_type_id'),
 "provider" => $this->input->post('provider'),
 "part_name" => json_encode($partArr),
 "total" =>  0,
 "quantity" => json_encode($qntyArr),
 "cost" => json_encode($costArr),
 "internal_provider" => $internal_provider,
 "external_provider" => $external_provider,
 "picture" => $picture,
);

$data = $this->db->insert('jobs', $data);
$last_id = $this->db->insert_id();
$model = $this->db->query("SELECT assets.code,jobs.* FROM jobs
 LEFT JOIN assets ON assets.id=jobs.vehicle_no WHERE jobs.id=$last_id")->row_array();
$card = array("card_no" => substr('ESL-' . $last_id . '-' . $model['code'], 0, 20));
$mileage=array("km_reading" => $model['km_reading'],"miles_reading" => $model['miles_reading'],
  "machine_hours" => $model['hours']);
$this->db->where('id', $last_id)->update('jobs', $card);
$this->db->where('id', $model['vehicle_no'])->update('assets', $mileage);
return redirect(base_url('preventive'));
}

public function update_checklist(){
 if(!empty($_FILES['picture']['name'])){
  $config['upload_path'] = 'uploads/images/';
  $config['allowed_types'] = 'jpg|jpeg|png|gif|pdf|doc|docx|xls|xlsx|csv|txt|rtf|html|zip|mp3|wma|mpg|flv|avi';
  $config['file_name'] = $_FILES['picture']['name'];

                //Load upload library and initialize configuration
  $this->load->library('upload',$config);
  $this->upload->initialize($config);

  if($this->upload->do_upload('picture')){
    $uploadData = $this->upload->data();
    $picture = $uploadData['file_name'];
  }else{
    $picture = '';
  }
}else{
  $picture = '';
}
$inspection = $this->input->post('inspection_id');
$done_by = $this->input->post('done_by');
$status = $this->input->post('status_id');
$tosave = [];
for ($i = 1; $i <= count($inspection); $i++) {
 array_push($tosave, ['items' => array("inspection_id" => $inspection[$i][0], "user" => $done_by[$i][0], "satus" => $status[$i][0])]);
}
$data=array("application_data" => json_encode($tosave),"status" => "Completed","picture" => $picture);
$this->db->where('id', $this->input->post('id'));
$this->db->update('jobs', $data); 
return redirect(base_url('preventive'));
}

public function job_type_modal()
{
  $view_data['services_dropdown'] = $this->Service_types_model->get_all_where(array("deleted" => 0))->result();
  $view_data['jobs_dropdown'] = $this->Job_services_model->get_all_where(array("deleted" => 0))->result();

  $this->load->view('maintenance/preventive/modal_form', $view_data);
}

public function save_job_type()
{
  $data = array(
    "job_type_name" => $this->input->post('job_type_name'),
    "service_type" => $this->input->post('service_type'),
    "job_id" => $this->input->post('job_id'),
  );
  $this->Job_types_model->save($data);
  return redirect(base_url() . 'preventive');


}

public function show_job($id)
{

   $this->access_only_allowed_members();
  $job_id = $this->input->post('id');
  $view_data['tasks_info'] = $this->Job_tasks_model->get_details();
  $view_data['job_info'] = $this->Jobs_model->get_one($job_id);
  $view_data['services_dropdown'] = $this->Service_types_model->get_all_where(array("deleted" => 0))->result();
  $view_data['service_types_dropdown'] = $this->Job_services_model->get_all_where(array("deleted" => 0))->result();
  $view_data['inspections_dropdown'] = $this->Inspections_model->get_all_where(array("deleted" => 0))->result();
  $view_data['job_types_dropdown'] = $this->Job_types_model->get_all_where(array("deleted" => 0))->result();
  $view_data['vehicles_dropdown'] = $this->Assets_model->get_all_where(array("deleted" => 0))->result();
  $view_data['jobs_status_dropdown'] = $this->Jobs_status_model->get_all_where(array("deleted" => 0))->result();
  
  $view_data['jobs'] = $this->Jobs_model->fetchId($id);
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

  $SAGEQuery = 'SELECT * FROM _btblFAAsset WHERE iAssetTypeNo = 4 AND idAssetNo NOT IN (' . implode(',', $existing) . ')';
  $fromSage = $this->SAGE_DB()
  ->query($SAGEQuery)
  ->result_array();

  $fromSage = array_map(function ($item) {
    return [
      "asset_no" => $item['idAssetNo'],
      "code" => $item['cAssetCode'],
      "description" => $item['cAssetDesc'],
      "location" => $item['iLocationNo'],
      "purchased_date" => $item['dPurchaseDate']
    ];
   }, $fromSage);


  $this->db->insert_batch('assets', $fromSage);
  return redirect(base_url() . '/preventive');
}

public function print_job($id)
{

    $view_data['reports_data']=$this->db->query("SELECT jobs.*,spares.*,assets.code as reg,assets.description as make,employees.name as employee,
    jobs.description as description,assets.km_reading as km_reading,assets.next_time,jobs.created_at as created,parts_suppliers.name as supplier FROM jobs
    LEFT JOIN spares ON spares.job_card_id=jobs.id
    LEFT JOIN assets ON assets.id=jobs.vehicle_no 
    LEFT JOIN employees ON employees.id=assets.driver_id
    LEFT JOIN parts_suppliers ON parts_suppliers.id=jobs.external_provider
    WHERE jobs.id=$id" )->result_array();
  $this->load->library('pdf2');
  $this->pdf2->load_view('maintenance/preventive/print_job', $view_data);
  $this->pdf2->render();
  $this->pdf2->stream('jobcard.pdf');
}

public function employee()
{


  $query = $this->SAGE_DB()->get_where('Client', array(''));
  $res = $query->result_array();
  echo "<pre>";
  var_dump($res);

}

public function supplier()
{
  $sql = "SELECT * FROM _btblFAAsset";
  $results = $this->SAGE_DB()->query($sql)->result_array();
  echo "<pre>";
  var_dump($results);
}

public function asset()
{

  $sql = "SELECT * FROM invnum";
  $query = $this->SAGE_DB()->query($sql)->result_array();
        // $query=$this->SAGE_DB()->get_where('_btblFAAsset',array('iAssetTypeNo' => 1));
        // $result=$query->result_array();
  echo "<pre>";
  var_dump($query);
  die();
        //echo json_encode($result);
}
public function ss(){
 $SAGEQuery = 'SELECT * FROM _btblFAAsset WHERE iAssetTypeNo = 4';
 $fromSage = $query=$this->SAGE_DB()
 ->query($SAGEQuery)
 ->result_array();
 $assets=$this->HR_DB()->query("Select a . idAssetNo , A . cAssetCode , a . cAssetDesc , A . ufFACurrentKMReading , A . ufFAMachineHours , A . ulFATrackBy , A . ucFAChasisnumber , A . ucFAEnginenumber , A . ucFAYearofmake , A . ucFARegyear , A . ucFAMake , A . ucFAModel from [dbo] . [_btblFAAsset] A Inner Join [dbo] . [_btblFAAssetType] B on A . iAssetTypeNo = b . idAssetTypeNo Where B . cAssetTypeCode = 'MC")->result_array();

 echo "<pre>";
 var_dump($assets);
}
public function SAGE_DB()
{
  return $this->load->database('SAGE', TRUE);
}

public function HR_DB()
{
  return $this->load->database('HR', TRUE);
}

function convertToHoursMins($time, $format = '%02d:%02d') {
  if ($time < 1) {
    return;
  }
  $hours = floor($time / 60);
  $minutes = ($time % 60);
  return sprintf($format, $hours, $minutes);
}
public function mytime(){
  $tt=$this->convertToHoursMins(250, '%02d hours %02d minutes'); 
  var_dump($tt);
}

}

