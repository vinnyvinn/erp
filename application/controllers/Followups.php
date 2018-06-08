<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Followups extends Pre_loader
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
      
      $view_data['all_details'] = $this->Followups_model->getDetails();
      $this->template->rander("maintenance/preventive/follow_index",$view_data);
    }

    public function checklist_form(){
      $picture='';
    $view_data['vehicles_dropdown'] = $this->Assets_model->get_all_where(array("deleted" => 0))->result();
    $this->template->rander("maintenance/preventive/add_checklist",$view_data);
    }

    public function add(){
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

      $data=array(
      'mileage' => $this->input->post('mileage'),
      'date' => $this->input->post('date'),
      'vehicle_id' => $this->input->post('vehicle_id'),
      'measurement' => $this->input->post('measurement'),
      'checklist' => $picture,
      );
      $this->Followups_model->add_followups($data);
      return redirect(base_url().'followups','refresh');
    }
    public function show($id){
       $view_data['followups']=$this->Followups_model->details($id);
       $this->template->rander('maintenance/preventive/show_checklist',$view_data);
    }
}