<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Escalation_matrix extends Pre_loader {

   /**
    * Get All Data from this method.
    *
    * @return Response
   */

  public function __construct() {
      parent::__construct();
      $this->load->helper(array('form', 'url'));
  }

  public function SAGE_DB() {
    return $this->load->database('SAGE', TRUE);
  }

  public function index() {

    $this->template->rander("escalation_matrix/index");

  }

  public function get_user_info($value) {
    // $agents[] = explode(',', $value);
    $users = [];
    foreach ((explode(',', $value)) as $user_id) {
      $users[] = $user_id; 
    }

    $list_data = [];
    foreach ($users as $data) {
      $list_data[] = $this->Users_model->get_all_where(array("id" => $data, "deleted" => 0))->result();
    }

    $return = [];
    for ($i=0; $i < count($list_data); $i++) { 
      foreach ($list_data[$i] as $_listdata) {
        $return[] = ($i + 1) . " " .ucwords($_listdata->first_name . " " . $_listdata->first_name);
      }
    }

    return json_encode($return);
  }

  public function list_data() {

    $query = $this->db->get('escalation_matrix');

    $return = [];
    // $getCount = [];
    foreach ($query->result() as $row) {
      // $getCount[] = $row->escalation_matrix;
      $return[] = ["id" => $row->id, "escalation_matrix" => $row->escalation_matrix, "Agents" => implode('<br>', json_decode($this->get_user_info($row->agent_name))), "escalation" => $row->escalation];
    }

    /*foreach ($getCount as $key => $value) {

      $count_query = $this->db->query("SELECT `agent_name` FROM `escalation_matrix` WHERE `escalation_matrix` = ?", array($value));

      $data = [];
      foreach ($count_query->result() as $row) {
        $data[] = explode(',', $row->agent_name);
      }

      $count = NULL;
      foreach ($data as $_count) {
        $count = count($_count);
      }

      array_push($return, ["count" => $count]);
    }*/

    // $halved = array_chunk($return, ceil(count($return)/2));

    echo json_encode(array("data" => $return));
  }

    

    $project_members = $this->Users_model->all_dropdown()->result();
    $collaborators_dropdown = array();
    foreach ($project_members as $member) {
      $collaborators_dropdown[] = array("id" => $member->user_id, "text" => $member->member_name);
    }
    $view_data['collaborators_dropdown'] = $collaborators_dropdown;

    $this->load->view('escalation_matrix/modal_form', $view_data);
  }

  function save() {
    
    $data = array(
      "escalation_matrix" => $this->input->post('profile_name'),
      "agent_name" => $this->input->post('collaborators'),
      "escalation" => $this->input->post('duration')
    );

    $save_id = $this->Escalation_matrix_model->save($data);

      if ($save_id) {
          echo json_encode(array("success" => true, 'message' => lang('record_saved')));
      } else {
        echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
      }
  }


}


/* End of file Escalation_matrix.php */
/* Location: ./application/controllers/Escalation_matrix.php */