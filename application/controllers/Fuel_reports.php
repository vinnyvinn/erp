<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Fuel_reports extends Pre_loader
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

    }

    public function index()
    {

      $users = $this->db->query("SELECT * FROM employees")->result_array();
      $arrayData=[];
      foreach ($users as $key => $user) {
        $id=$user['id'];
        $data['user']= $user;
        $data['vehicle']=$this->db->query("SELECT * FROM assets WHERE driver_id=$id")->result_array();
        $data['details']=$this->db->query("SELECT fuels.*,SUM(fuels.total) as totalcost,fuel_suppliers.name as supplier,
          other_expenses.name as expenses FROM fuels
          LEFT JOIN other_expenses ON other_expenses.id=fuels.expense_id
          LEFT JOIN fuel_suppliers ON fuel_suppliers.id=fuels.supplier_id WHERE fuels.staff_id=$id
          GROUP BY fuels.total")->result_array();
        array_push($arrayData,$data);
        
      }
      
      $view_data['all_data']=$arrayData;
      $this->template->rander("maintenance/reports/fuel/index", $view_data);
    }

    public function print_report(){
     $users = $this->db->query("SELECT * FROM employees")->result_array();
     $arrayData=[];
     foreach ($users as $key => $user) {
      $id=$user['id'];
      $data['user']= $user;
      $data['vehicle']=$this->db->query("SELECT * FROM assets WHERE driver_id=$id")->result_array();
      $data['details']=$this->db->query("SELECT fuels.*,SUM(fuels.total) as totalcost,fuel_suppliers.name as supplier,
        other_expenses.name as expenses FROM fuels
        LEFT JOIN other_expenses ON other_expenses.id=fuels.expense_id
        LEFT JOIN fuel_suppliers ON fuel_suppliers.id=fuels.supplier_id WHERE fuels.staff_id=$id
        GROUP BY fuels.total")->result_array();
      array_push($arrayData,$data);
      
    }
    
    $view_data['all_data']=$arrayData;
    $this->load->library('pdf2');
    $this->pdf2->load_view('maintenance/reports/fuel/print_form', $view_data);
    $this->pdf2->render();
    $this->pdf2->stream('fuelreports.pdf');
    
  }
}