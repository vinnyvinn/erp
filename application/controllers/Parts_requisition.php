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
     $view_data['stocks_dropdown'] =$this->SAGE_DB()->query("SELECT StkItem . StockLink AS Stk_ID , WhseMst . WhseLink AS Whse_ID , StkItem . Code AS Stk_Code , StkItem . Description_1 AS Stk_Name , StkItem . ItemGroup AS Stk_Grp , StkItem . AveUCst AS Avg_Cost , StkItem . Qty_On_Hand , 
WhseMst . Code AS Whse_Code , WhseMst . Name AS Whse_Name , WhseStk . WHQtyOnHand AS Qty_In_Whse , StkItem . iUOMStockingUnitID AS Item_Unit
FROM WhseStk INNER JOIN
WhseMst ON WhseStk . WHWhseID = WhseMst . WhseLink INNER JOIN
StkItem ON WhseStk . WHStockLink = StkItem . StockLink
WHERE ( StkItem . ItemActive = 1 ) AND ( StkItem . ServiceItem = 0 )")->result();

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
    LEFT JOIN equipments ON equipments.id=spares.stock_id
    WHERE spares.id=$id")->result_array();

  $this->template->rander('maintenance/reactive/show_form',$view_data);
}

 public function save_part(){
  $stock_id=$this->input->post('stock_id');
 
  $stocks=$this->SAGE_DB()->query("SELECT StkItem . StockLink AS Stk_ID , WhseMst . WhseLink AS Whse_ID , StkItem . Code AS Stk_Code , StkItem . Description_1 AS Stk_Name , StkItem . ItemGroup AS Stk_Grp , StkItem . AveUCst AS Avg_Cost , StkItem . Qty_On_Hand , 
WhseMst . Code AS Whse_Code , WhseMst . Name AS Whse_Name , WhseStk . WHQtyOnHand AS Qty_In_Whse , StkItem . iUOMStockingUnitID AS Item_Unit
FROM WhseStk INNER JOIN
WhseMst ON WhseStk . WHWhseID = WhseMst . WhseLink INNER JOIN
StkItem ON WhseStk . WHStockLink = StkItem . StockLink
WHERE ( StkItem . ItemActive = 1 ) AND ( StkItem . ServiceItem = 0 ) AND ( StkItem . StockLink = $stock_id)")->result_array();
  
 $data=array(
   'job_card_id' => $this->input->post('job_card_id'),
   'qnty_out' => $this->input->post('qnty_out'),
   'stock_id' => $stock_id,
   'description' => 'Req by: '.$this->login_user->first_name,
   'warehouse_id' => $stocks[0]['Whse_ID'],
   'stock_name' => $stocks[0]['Stk_Name'],
   'code_id' => $stocks[0]['Stk_Code'],
   'uom' => $stocks[0]['Item_Unit'],
   'category_id' => 1,
   'stocking_id' => $stocks[0]['Item_Unit'],
   'avg_cost' => $stocks[0]['Avg_Cost'],
   'qnty_in' => $stocks[0]['Qty_In_Whse'],
 );
  $inserted=$this->db->insert('spares',$data);
  $id=$this->db->insert_id();
  $this->db->where('id',$id);
  $items=$this->db->query("SELECT spares.*,jobs.card_no FROM spares
  LEFT JOIN jobs ON jobs.id=spares.job_card_id WHERE spares.id=$id")->row();
  $total=$items->qnty_out*$items->avg_cost;
  $updated=array('requisition_no' => substr('RQ-0'.$id,0,8),'total'=>$total,);
  $this->db->update('spares',$updated);
  $batchlines=array(
   'iInvJrBatchID' => 7,
   'iStockID' => $items->stock_id,
   'iWarehouseID' => $items->warehouse_id,
   'cDescription' =>'Req by: '.$this->login_user->first_name,
   'dTrDate' => date('Y-m-d H:i:s'),
   'iTrCodeID' => 37,
   'iGLContraID' => 86,
   'cReference' => $items->card_no,
   'fQtyIn' => 0,
   'fQtyOut' => $items->qnty_out,
   'fNewCost' => $items->avg_cost,
   'iUnitsOfMeasureStockingID' => $items->stock_id,
   'iUnitsOfMeasureCategoryID' => $items->stock_id,
   'iUnitsOfMeasureID' => $items->stock_id,
  );
  $this->SAGE_DB()->insert('_etblInvJrBatchlines',$batchlines);
  return redirect(base_url('parts_requisition'));
  //echo json_encode($inserted);
}
public function inventory(){
  echo "<pre>";
  var_dump($this->SAGE_DB()->query("SELECT * FROM _etblInvJrBatchlines")->result_array());

}
public function SAGE_DB(){
  return $this->load->database('SAGE',TRUE);
}
}