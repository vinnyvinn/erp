<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Reactive extends Pre_loader {

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
    $view_data['spares']=$this->db->query("SELECT spares.*,spares.id as spID,
      assets.code as vehicle,jobs.card_no FROM spares
      LEFT JOIN jobs ON jobs.id=spares.job_card_id 
      LEFT JOIN assets ON assets.id=jobs.vehicle_no")->result_array();

    $this->template->rander('maintenance/reactive/index',$view_data);
  }

  public function createPart(){
    $view_data['jobs_card_dropdown'] = $this->Jobs_model->get_all_where(array("deleted" => 0))->result();
    $view_data['spare_parts_dropdown'] = $this->Equipments_model->get_all_where(array("deleted" => 0))->result();
    $this->template->rander('maintenance/reactive/create_part',$view_data);
  }
  public function spare($id){
   $spare=$this->db->query("SELECT assets.code as vehicle FROM assets 
    LEFT JOIN  jobs ON jobs.vehicle_no=assets.id WHERE jobs.id=$id")->row()->vehicle;
   echo json_encode($spare);
 }
 public function description($id){
   $description=$this->db->query("SELECT jobs.description FROM jobs 
    LEFT JOIN  external_services ON external_services.job_card_id=jobs.id WHERE jobs.id=$id")->row()->description;
   echo json_encode($description);
 }
 public function model($id){
   $spare=$this->db->query("SELECT assets.description as make FROM assets 
    LEFT JOIN  jobs ON jobs.vehicle_no=assets.id WHERE jobs.id=$id")->row()->make;
   echo json_encode($spare);
 }
 public function save_part(){
  $data=array(
   'job_card_id' => $this->input->post('job_card_id'),
   'quantity' => $this->input->post('quantity'),
   'spare_id' => $this->input->post('spare_id'),
   'description' => $this->input->post('description'),
 );
  $inserted=$this->db->insert('spares',$data);
  $id=$this->db->insert_id();
  $this->db->where('id',$id);
  $items=$this->db->query("SELECT spare_id,quantity FROM spares WHERE id=$id")->row();
  $sp_id=$items->spare_id;
  $spare_price=$this->db->query("SELECT purchase_price FROM equipments WHERE id=$sp_id")->row()->purchase_price;
  $total=$items->quantity*$spare_price;
  $updated=array('requisition_no' => substr('RQ-0'.$id,0,8),'total'=>$total,'amount'=>$spare_price);
  $this->db->update('spares',$updated);
  echo json_encode($inserted);
}
public function external_service(){
 $this->External_service_model->get_details();

 $view_data['external_services']=$this->External_service_model->get_details();
 $this->template->rander('maintenance/reactive/external_index',$view_data);
}
public function external_service_create(){
  $view_data['extended_services_dropdown'] = $this->Extended_service_model->get_all_where(array("deleted" => 0))->result();
  $view_data['jobs_card_dropdown'] = $this->Jobs_model->get_all_where(array("deleted" => 0))->result();
  $view_data['suppliers_dropdown']=$this->Parts_suppliers_model->get_all_where(array("deleted" => 0))->result();
  $view_data['service_providers_dropdown']=$this->Service_providers_model->get_all_where(array("deleted" => 0))->result();
  $this->template->rander('maintenance/reactive/external',$view_data);
}
public function view_external($id){
  $view_data['services']=$this->db->query("SELECT external_services.* ,providers.name as provider,assets.code as vehicle,
    jobs.card_no,jobs.id as jID,parts_suppliers.name as supplier,assets.description as make,
    parts_suppliers.id as sID,jobs.description FROM external_services
    LEFT JOIN jobs ON jobs.id=external_services.job_card_id
    LEFT JOIN assets ON assets.id=jobs.vehicle_no
    LEFT JOIN parts_suppliers ON parts_suppliers.id=external_services.supplier_id
    LEFT JOIN providers ON external_services.service_provider_id=providers.id
    WHERE external_services.id=$id")->result_array();
  $view_data['jobs_card_dropdown'] = $this->Jobs_model->get_all_where(array("deleted" => 0))->result();
  $view_data['suppliers_dropdown']=$this->Parts_suppliers_model->get_all_where(array("deleted" => 0))->result();
  $this->template->rander('maintenance/reactive/show_external',$view_data);
}
public function save_labour_service(){
  $amount=$this->db->query("SELECT * FROM rates_perhour LIMIT 1")->row()->amount;
  $start_date=$this->input->post('start_date');
  $end_date=$this->input->post('end_date');
  $datediff =strtotime($end_date)/(60*60*24)-strtotime($start_date)/(60*60*24);
  $total=$datediff*$amount;
  $data=array(
   'job_card_id' => $this->input->post('job_card_id'),
   'service_provider_id' => $this->input->post('service_provider_id'),
   'service_type' => $this->input->post('service_type'),
   'description' => $this->input->post('description'),
   'end_date' => $this->input->post('end_date'),
   'start_date' => $this->input->post('start_date'),
   'total_service' => $total
 );

  $inserted=$this->db->insert('external_services',$data);
  $id=$this->db->insert_id();
  $this->db->where('id',$id);
  $updated=array('service_no' => substr('ES-00'.$id,0,8));
  $this->db->update('external_services',$updated);
  echo json_encode($inserted);
}
public function save_parts_service(){
 $total_fuel=$this->input->post('amount')*$this->input->post('quantity');
 $data=array(
   'job_card_id' => $this->input->post('job_card_id'),
   'service_type' => $this->input->post('service_type'),
   'amount' => $this->input->post('amount'),
   'description' => $this->input->post('description'),
   'total_fuel' => $total_fuel,
   'quantity' => $this->input->post('quantity'),
   'supplier_id' => $this->input->post('supplier_id')

 );
 $inserted=$this->db->insert('external_services',$data);
 $id=$this->db->insert_id();
 $this->db->where('id',$id);
 $updated=array('service_no' => substr('ES-00'.$id,0,8));
 $this->db->update('external_services',$updated);
 echo json_encode($inserted);
}
public function show_form($id){
  $view_data['jobs_card_dropdown'] = $this->Jobs_model->get_all_where(array("deleted" => 0))->result();
  $view_data['spare_parts_dropdown'] = $this->Equipments_model->get_all_where(array("deleted" => 0))->result();
  $view_data['services']=$this->db->query("SELECT spares.*,assets.code,jobs.card_no,
    equipments.description as spare,jobs.description FROM spares
    LEFT JOIN jobs ON jobs.id=spares.job_card_id 
    LEFT JOIN assets ON assets.id=jobs.vehicle_no
    LEFT JOIN equipments ON equipments.id=spares.spare_id
    WHERE spares.id=$id")->result_array();

  $this->template->rander('maintenance/reactive/show_form',$view_data);
}
public function print_external($id){
  $view_data['jobs_card_dropdown'] = $this->Jobs_model->get_all_where(array("deleted" => 0))->result();
  $view_data['spare_parts_dropdown'] = $this->Equipments_model->get_all_where(array("deleted" => 0))->result();
  $view_data['services']=$this->db->query("SELECT spares.*,assets.code,jobs.card_no,
    equipments.description as spare,jobs.description FROM spares
    LEFT JOIN jobs ON jobs.id=spares.job_card_id 
    LEFT JOIN assets ON assets.id=jobs.vehicle_no
    LEFT JOIN equipments ON equipments.id=spares.spare_id
    WHERE spares.id=$id")->result_array();
   $this->load->library('pdf2');
   $this->pdf2->load_view('maintenance/reactive/print_external',$view_data);
  $this->pdf2->render();
  $this->pdf2->stream('external-service.pdf');
}
public function printService($id){
 $view_data['services']=$this->db->query("SELECT external_services.* ,assets.code as vehicle,
  jobs.card_no,jobs.id as jID,parts_suppliers.name as supplier,assets.description as make,
  parts_suppliers.id as sID,jobs.description FROM external_services
  LEFT JOIN jobs ON jobs.id=external_services.job_card_id
  LEFT JOIN assets ON assets.id=jobs.vehicle_no
  LEFT JOIN parts_suppliers ON parts_suppliers.id=external_services.supplier_id
  WHERE external_services.id=$id")->result_array();
 $view_data['jobs_card_dropdown'] = $this->Jobs_model->get_all_where(array("deleted" => 0))->result();
 $view_data['suppliers_dropdown']=$this->Parts_suppliers_model->get_all_where(array("deleted" => 0))->result();
 $this->template->rander('maintenance/reactive/print_service',$view_data);
}
public function print_form($id){
  $view_data['jobs_card_dropdown'] = $this->Jobs_model->get_all_where(array("deleted" => 0))->result();
  $view_data['spare_parts_dropdown'] = $this->Equipments_model->get_all_where(array("deleted" => 0))->result();
  $view_data['services']=$this->db->query("SELECT spares.*,assets.code,jobs.card_no,
    equipments.description as spare,jobs.description FROM spares
    LEFT JOIN jobs ON jobs.id=spares.job_card_id 
    LEFT JOIN assets ON assets.id=jobs.vehicle_no
    LEFT JOIN equipments ON equipments.id=spares.spare_id
    WHERE spares.id=$id")->result_array();
  $this->template->rander('maintenance/reactive/print_form',$view_data); 
}
}