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
  public function model($id){
     $spare=$this->db->query("SELECT assets.description as make FROM assets 
      LEFT JOIN  jobs ON jobs.vehicle_no=assets.id WHERE jobs.id=$id")->row()->make;
      echo json_encode($spare);
  }
  public function save_part(){
    $total=$this->input->post('amount')*$this->input->post('quantity');
    $data=array(
     'job_card_id' => $this->input->post('job_card_id'),
     'quantity' => $this->input->post('quantity'),
     'amount' => $this->input->post('amount'),
     'spare_id' => $this->input->post('spare_id'),
     'description' => $this->input->post('description'),
     'total' => $total
    );
    $inserted=$this->db->insert('spares',$data);
    $id=$this->db->insert_id();
    $rand_no=mt_rand(100,999);
    $this->db->where('id',$id);
    $updated=array('requisition_no' => substr('RQ-'.$rand_no,0,7));
    $this->db->update('spares',$updated);
    echo json_encode($inserted);
    }
    public function external_service(){
      $this->External_service_model->get_details();
     $view_data['external_services']=$this->External_service_model->get_details();
      $this->template->rander('maintenance/reactive/external_index',$view_data);
    }
    public function external_service_create(){
      $view_data['jobs_card_dropdown'] = $this->Jobs_model->get_all_where(array("deleted" => 0))->result();
      $view_data['suppliers_dropdown']=$this->Parts_suppliers_model->get_all_where(array("deleted" => 0))->result();
      $this->template->rander('maintenance/reactive/external',$view_data);
    }
    public function save_external_service(){
      $total=$this->input->post('rate')*$this->input->post('hours');
      $data=array(
       'job_card_id' => $this->input->post('job_card_id'),
       'supplier_id' => $this->input->post('supplier_id'),
       'service_type' => $this->input->post('service_type'),
       'rate' => $this->input->post('rate'),
       'hours' => $this->input->post('hours'),
       'total_service' => $total,
       'description' => $this->input->post('description')
      );
      $inserted=$this->db->insert('external_services',$data);
      echo json_encode($inserted);
    }
    public function save_fuel_service(){
      $total_service=$this->input->post('rate')*$this->input->post('hours');
      $total_fuel=$this->input->post('amount')*$this->input->post('quantity');
       $data=array(
       'job_card_id' => $this->input->post('job_card_id'),
       'supplier_id' => $this->input->post('supplier_id'),
       'service_type' => $this->input->post('service_type'),
       'rate' => $this->input->post('rate'),
       'hours' => $this->input->post('hours'),
       'total_service' => $total_service,
       'description' => $this->input->post('description'),
       'amount' => $this->input->post('amount'),
       'total_fuel' => $total_fuel,
       'quantity' => $this->input->post('quantity')
      );
       $inserted=$this->db->insert('fuel_services',$data);
       echo json_encode($inserted);
    }
    public function show_form($id){
      $view_data['external_services']=$this->External_service_model->get_services($id);
      $this->template->rander('maintenance/reactive/show_form',$view_data);
    }
}