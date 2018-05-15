<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Trimmer_sheets extends Pre_loader {

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

   $view_data['trimmers_dropdown'] = $this->Trimmers_model->get_all_where(array("deleted" => 0))->result();
   $view_data['trimmer_sheets']=$this->db->query("SELECT trimmer_sheets.*,trimmers.name as trimmer FROM trimmer_sheets
    LEFT JOIN trimmers ON trimmers.id=trimmer_sheets.trimmer")->result_array();
   $this->template->rander("maintenance/services/trimmer_sheets_form",$view_data);
 }

 public function add_trimmer()
 {
   $data = array(
     'name' => $this->input->post('name'),
     'trimmer' => $this->input->post('trimmer'),
     'time_in' => $this->input->post('time_in'),
     'time_out' => $this->input->post('time_out'),
     'start_date' => $this->input->post('start_date'),
     'end_date' => $this->input->post('end_date'),
     'delayed_hours' => $this->input->post('delayed_hours'),
     'delayed_minutes' => $this->input->post('delayed_minutes'),
     );
   $inserted=$this->Trimmer_sheets_model->add_trimmers($data);
   $trimmer=$this->db->query("SELECT * from trimmer_sheets WHERE id=$inserted")->row_array();
   $tr_id=$trimmer['trimmer'];
   $time_in=strtotime($trimmer['time_in']);
   $time_out=strtotime($trimmer['time_out']);
   $start_date=strtotime($trimmer['start_date']);
   $end_date=strtotime($trimmer['end_date']);
   $delayed_time=($trimmer['delayed_hours'] *60 *60) + ($trimmer['delayed_minutes'] * 60);
   $time_taken=ceil(($time_out+$end_date)/(60*60)-($time_in+$start_date-$delayed_time)/(60*60));
   $queryTrimmer=$this->db->query("SELECT * FROM trimmers WHERE id=$tr_id")->row_array();
   $total=$queryTrimmer['rate']*$time_taken;
   $updated=array('rate' => $queryTrimmer['rate'],'total' => $total);
   $this->Trimmer_sheets_model->trimmers_update(array('id' => $inserted),$updated);
   echo json_encode(array("status" => TRUE));

 }

 public function trimmer_edit($id)
 {
  $data = $this->Trimmer_sheets_model->get_trimmers_by_id($id);
  echo json_encode($data);
}
public function trimmer_update()
{
  $data = array(
   'name' => $this->input->post('name'),
   'trimmer' => $this->input->post('trimmer'),
   'time_in' => $this->input->post('time_in'),
   'time_out' => $this->input->post('time_out'),
   'start_date' => $this->input->post('start_date'),
   'end_date' => $this->input->post('end_date'),
   'delayed_hours' => $this->input->post('delayed_hours'),
   'delayed_minutes' => $this->input->post('delayed_minutes'),
   'updated' => date("Y-m-d H:i:s"),
   );

  $this->Trimmer_sheets_model->trimmers_update(array('id' => $this->input->post('id')), $data);
  $trimmer=$this->db->query("SELECT * from trimmer_sheets ORDER BY updated DESC LIMIT 1")->row_array();
  $updated_id=$trimmer['id'];
  $tr_id=$trimmer['trimmer'];
  $time_in=strtotime($trimmer['time_in']);
  $time_out=strtotime($trimmer['time_out']);
  $start_date=strtotime($trimmer['start_date']);
  $end_date=strtotime($trimmer['end_date']);

  $delayed_time=($trimmer['delayed_hours'] *60 *60) + ($trimmer['delayed_minutes'] * 60);
  $time_taken=ceil(($time_out+$end_date)/(60*60)-($time_in+$start_date-$delayed_time)/(60*60));
  $query=$this->db->query("SELECT * FROM trimmers WHERE id=$tr_id")->row_array();
  $total=$query['rate']*$time_taken;
  $updated=array('rate' => $query['rate'],'total' => $total);
  $this->Trimmer_sheets_model->trimmers_update(array('id' => $updated_id),$updated);
  echo json_encode(array("status" => TRUE));
}

public function trimmer_delete($id)
{
  $this->Trimmer_sheets_model->delete_trimmer($id);
  echo json_encode(array("status" => TRUE));
}

}