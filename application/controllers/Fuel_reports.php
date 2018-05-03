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
      $this->init_permission_checker("technical");
      $this->load->helper(array('form', 'url'));
    }
    public function index()
    {
      $this->access_only_allowed_members();
      $users = $this->db->query("SELECT * FROM employees")->result_array();
      $arrayData=[];
      foreach ($users as $key => $user) {
        $id=$user['id'];
        $data['user']= $user;
        //$data['vehicle']=$this->db->query("SELECT * FROM assets WHERE driver_id=$id")->result_array();
        $data['details']=$this->db->query("SELECT fuels.*,parts_suppliers.name as supplier,jobs.*,assets.*,spares.*,spares.stock_name as stock,
          other_expenses.name as expenses,assets.code as vehicle FROM fuels
          LEFT JOIN other_expenses ON other_expenses.id=fuels.expense_id
          LEFT JOIN assets ON assets.id=fuels.vehicle_id
          LEFT JOIN parts_suppliers ON parts_suppliers.id=fuels.supplier_id 
          LEFT JOIN jobs ON jobs.vehicle_no=fuels.vehicle_id
          LEFT JOIN spares ON spares.job_card_id=jobs.id 
          WHERE fuels.staff_id=$id
          GROUP BY fuels.total")->result_array();
        $total = $this->db->query("SELECT fuels.*,SUM(fuels.total) as totalcost,parts_suppliers.name as supplier,
          other_expenses.name as expenses,assets.code as vehicle,SUM(fuels.expense_cost) as totalexpense FROM fuels
          LEFT JOIN other_expenses ON other_expenses.id=fuels.expense_id
          LEFT JOIN assets ON assets.id=fuels.vehicle_id
          LEFT JOIN parts_suppliers ON parts_suppliers.id=fuels.supplier_id WHERE fuels.staff_id=$id
          GROUP BY fuels.staff_id")->row_array();
          
        $data['totalvalue']=$total['totalcost'];
        $data['totalexpense']=$total['totalexpense'];
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
       $data['details']=$this->db->query("SELECT fuels.*,parts_suppliers.name as supplier,
          other_expenses.name as expenses,assets.code as vehicle FROM fuels
          LEFT JOIN other_expenses ON other_expenses.id=fuels.expense_id
          LEFT JOIN assets ON assets.id=fuels.vehicle_id
          LEFT JOIN parts_suppliers ON parts_suppliers.id=fuels.supplier_id WHERE fuels.staff_id=$id
          GROUP BY fuels.total")->result_array();
        $total=$this->db->query("SELECT fuels.*,SUM(fuels.total) as totalcost,parts_suppliers.name as supplier,
          other_expenses.name as expenses,assets.code as vehicle,SUM(fuels.expense_cost) as totalexpense FROM fuels
          LEFT JOIN other_expenses ON other_expenses.id=fuels.expense_id
          LEFT JOIN assets ON assets.id=fuels.vehicle_id
          LEFT JOIN parts_suppliers ON parts_suppliers.id=fuels.supplier_id WHERE fuels.staff_id=$id
          GROUP BY fuels.staff_id")->row_array();
         $data['totalvalue']=$total['totalcost'];
        $data['totalexpense']=$total['totalexpense'];
        
      array_push($arrayData,$data);
      
    }
    
    $view_data['all_data']=$arrayData;
    $this->load->library('pdf2');
    $this->pdf2->load_view('maintenance/reports/fuel/print_form', $view_data);
    $this->pdf2->render();
    $this->pdf2->stream('fuelreports.pdf');
    
  }
}
