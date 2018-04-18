<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Parts_requisition extends Pre_loader {

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

    $this->template->rander('maintenance/reactive/index_requisition',$view_data);
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
  public function createPart(){
    $view_data['jobs_card_dropdown'] = $this->Jobs_model->get_all_where(array("deleted" => 0))->result();
    $view_data['spare_parts_dropdown'] = $this->Equipments_model->get_all_where(array("deleted" => 0))->result();
    $this->template->rander('maintenance/reactive/create_part',$view_data);
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
}