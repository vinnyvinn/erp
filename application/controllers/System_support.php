<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once("Pre_loader.php");

class System_support extends Pre_loader {

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
    $view_data['supports']=$this->db->query("SELECT * FROM system_supports")->result_array();
    $this->template->rander("checklists/supports/system/index",$view_data);
  }

  public function add_support()
  {
    $data = array(
     'description' => $this->input->post('description'),
     
   );
    $insert = $this->System_support_model->system_supports($data);
    $spp=$this->db->query("SELECT * FROM system_supports WHERE id=$insert")->row()->id;
     $support=substr('SS-00'.$spp, 0,7);
    $updated = array('support_no' => $support,);
    $this->System_support_model->system_supports_update(array('id' => $insert), $updated);
    echo json_encode(array("status" => TRUE));
  }
  public function support_edit($id)
  {
    $data = $this->System_support_model->get_system_supports_by_id($id);
    echo json_encode($data);
  }
  public function support_update()
  {
    $data = array(
     'description' => $this->input->post('description'),
     'updated_at' => date('Y-m-d H:i:s'),
   );
    $this->System_support_model->system_supports_update(array('id' => $this->input->post('id')), $data);
    $support=$this->db->query("SELECT * FROM system_supports ORDER BY updated_at DESC LIMIT 1")->row();
    $id=$support->id;
    $supp=substr('SS-00'.$id, 0,7);
    $updated = array('support_no' => $supp);
    $this->System_support_model->system_supports_update(array('id' =>$id ), $updated);
    echo json_encode(array("status" => TRUE));
  }

  public function delete($id)
  {
    $this->System_support_model->delete_system_supports($id);
    echo json_encode(array("status" => TRUE));
  }

}