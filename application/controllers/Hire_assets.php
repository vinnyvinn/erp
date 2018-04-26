<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Hire_assets extends Pre_loader {

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
   
    $view_data['equipments_dropdown'] = $this->Equipments_model->get_all_where(array("deleted" => 0,"forhire_group" => 1))->result();  
    $view_data['staffs_dropdown'] = $this->Employees_model->get_all_where(array("deleted" => 0))->result();
    $view_data['providers_dropdown'] = $this->Parts_suppliers_model->get_all_where(array("deleted" => 0))->result(); 
    $view_data['clients_dropdown'] = $this->Sage_clients_model->get_all_where(array("deleted" => 0))->result();
    $view_data['outsource_dropdown'] = $this->Equipments_model->get_all_where(array("deleted" => 0))->result();
    $view_data['hires_dropdown']=$this->SAGE_DB()->query("SELECT cAssetCode,cAssetDesc, ubFAForHire,ulFAHireItemGroup,idAssetNo,fPurchaseValue FROM _btblFAAsset")->result();
    $view_data['hires']=$this->db->query("SELECT hire_assets.*,employees.name as staff,parts_suppliers.name as supplier,
      sage_clients.name as client,equipments.description as equipment FROM hire_assets
      LEFT JOIN employees ON employees.id=hire_assets.staff_id
      LEFT JOIN sage_clients ON sage_clients.id=hire_assets.client_id
      LEFT JOIN equipments ON equipments.id=hire_assets.asset
      LEFT JOIN parts_suppliers ON parts_suppliers.id=hire_assets.supplier_id")->result_array();
     $this->template->rander("maintenance/services/hire_form",$view_data);
  }

  public function add_asset()
  {
  
    $tonnes='';
    $hours=''; 
    $asset='';
    
    if($this->input->post('asset_inhouse')){
      $asset=$this->input->post('asset_inhouse');
    }
     elseif($this->input->post('asset_outsourced')){
      $asset=$this->input->post('asset_outsourced');
    }
     if($this->input->post('tonnes')){
      $tonnes=$this->input->post('tonnes');
      }
     
    elseif($this->input->post('hours')){
      $hours=$this->input->post('hours');
    }
    $data = array(
     'tonnes' => $tonnes,
     'staff_id' => $this->input->post('staff_id'),
     'client_id' => $this->input->post('client_id'),
     'supplier_id' => $this->input->post('supplier_id'),
     'hours' => $hours,
     'rate' => $this->input->post('rate'),
     'currency' => $this->input->post('currency'),
     'measurement' => $this->input->post('measurement'),
     'asset' =>$asset,
     'source' => $this->input->post('source')

   );
    $insert = $this->Hire_assets_model->hire_assets_add($data);
    $query=$this->db->query("SELECT * FROM hire_assets WHERE id=$insert")->row();
    $client_id=$query->client_id;
    $total='';
    if($query->hours){
    $total=$query->rate*$query->hours;
  }
  elseif ($query->tonnes) {
   $total=$query->rate*$query->tonnes;
  }
    $updated = array('total'=>$total);
    $this->Hire_assets_model->hire_assets_update(array('id' => $insert), $updated);
    $match_client=$this->db->query("SELECT * FROM sage_clients WHERE id=$query->id")->row()->name;
    $details = $this->SAGE_DB()->query("SELECT * FROM Client WHERE Name LIKE '%$match_client%'")->row();
    $client_details=array(
       //sage customer details
                'AccountID' =>$details->DCLink,
                'Address1' => $details->Physical1,
                'Address2' => $details->Physical2,
                'Address3' => $details->Physical3,
                'Address4' => $details->Physical3,
                'Address5' => $details->Physical4,
                'Address6' => $details->Physical5,
                
                
//            'DelMethodID',
                'DeliveryDate' => date('Y-m-d H:i:s'),
//            'DeliveryNote',
//Invoice description and unprocessed
                'Description' => 'Invoice ',
                'DocFlag' => 0,
                'DocRepID' => 0,
                'DocState' => 1,
                'DocType' => 0,
                'DocVersion' => 1,
                'DueDate' =>  date('Y-m-d H:i:s'),
//            'Email_Sent',
//            'ExtOrderNum',
                //from client TODO:client iccurency id
            'ForeignCurrencyID' => 1,
//            'GrvSplitFixedAmnt',
//            'GrvSplitFixedCost',
              'InvDate' =>  date('Y-m-d H:i:s'),
//            'InvDisc',
//            'InvDiscAmnt',
//            'InvDiscAmntEx',
//            'InvDiscReasonID',
//            'InvNum_Checksum',
//            'InvNum_dCreatedDate',
//            'InvNum_dModifiedDate',
//            'InvNum_iBranchID',
//            'InvNum_iChangeSetID',
//            'InvNum_iCreatedAgentID',
//            'InvNum_iCreatedBranchID',
//            'InvNum_iModifiedAgentID',
//            'InvNum_iModifiedBranchID',
                'InvNumber' => substr('INV00-'.$query->id, 0,8),
                //total invoice line
                'InvTotExcl' => 2500,
                'InvTotExclDEx' => 2500,
                'InvTotIncl' => 0,
                'InvTotInclDEx' => 2500,
                'InvTotInclExRounding' => 2500,
//            'InvTotRounding',
                'InvTotTax' => 0,
                'InvTotTaxDEx' => 0,
//            'KeepAsideCollectionDate',
//            'KeepAsideExpiryDate',
//            'Message1',
//            'Message2',
//            'Message3',
//            'OrdDiscAmnt',
//            'OrdDiscAmntEx',
                'OrdTotExcl' => 2500,
                'OrdTotExclDEx' => 2500,
                'OrdTotIncl' => 2500,
                'OrdTotInclDEx' => 2500,
                'OrdTotInclExRounding' => 2500,
//            'OrdTotRounding',
                'OrdTotTax' => 0,
                'OrdTotTaxDEx' => 0,
                'OrderDate' => date('Y-m-d H:i:s'),
//            'OrderNum',
//            'OrderPriorityID',
//            'OrderStatusID',
                'OrigDocID' => 0,
                'PAddress1' => $details->Physical1,
                'PAddress2' => $details->Physical2,
                'PAddress3' => $details->Physical3,
                'PAddress4' => $details->Physical4,
                'PAddress5' => $details->Physical5,
                'PAddress6' => $details->Physical5,
//            'POSAmntTendered',
//            'POSChange',
                'ProjectID' => 0,
                'TaxInclusive' => 0,
//            'TillID',
                'bInvRounding' => 1,
//            'bIsDCOrder',
//            'bLinkedTemplate',
                'bTaxPerLine' => 1,
//            'bUseFixedPrices',
                'cAccountName' => $details->Name,
//            'cAuthorisedBy',
//            'cCellular',
//            'cClaimNumber',
//            'cContact',
//            'cEmail',
//            'cExcessAccCont1',
//            'cExcessAccCont2',
//            'cExcessAccName',
//            'cFax',
//            'cGIVNumber',
//            'cPolicyNumber',
//            'cSettlementTermInvMsg',
//            client pin number
//            'cTaxNumber',
//            'cTelephone',
//            'dIncidentDate',
//            'fAddChargeExclusive',
//            'fAddChargeExclusiveForeign',
//            'fAddChargeInclusive',
//            'fAddChargeInclusiveForeign',
//            'fAddChargeTax',
//            'fAddChargeTaxForeign',
//            'fDepositAmountForeign',
//            'fDepositAmountNew',
//            'fDepositAmountTotal',
//            'fDepositAmountTotalForeign',
//            'fDepositAmountUnallocated',
//            'fDepositAmountUnallocatedForeign',
//            'fExcessAmt',
//            'fExcessExclusive',
//            'fExcessInclusive',
//            'fExcessPct',
//            'fExcessTax',
                'fExchangeRate' => 103,
//            'fGrvSplitFixedAmntForeign',
//            'fInvDiscAmntExForeign',
//            'fInvDiscAmntForeign',
                'fInvTotExclDExForeign' => 2500,
                'fInvTotExclForeign' => 2500,
//            'fInvTotForeignRounding',
                'fInvTotInclDExForeign' => 2500,
                'fInvTotInclForeign' => 2500,
//            'fInvTotInclForeignExRounding',
                'fInvTotTaxDExForeign' => 0,
                'fInvTotTaxForeign' => 0,
//            'fOrdAddChargeExclusive',
//            'fOrdAddChargeExclusiveForeign',
//            'fOrdAddChargeInclusive',
//            'fOrdAddChargeInclusiveForeign',
//            'fOrdAddChargeTax',
//            'fOrdAddChargeTaxForeign',
//            'fOrdDiscAmntExForeign',
//            'fOrdDiscAmntForeign',
                'fOrdTotExclDExForeign' => 2500,
                'fOrdTotExclForeign' => 2500,
//            'fOrdTotForeignRounding',
                'fOrdTotInclDExForeign' => 2500,
                'fOrdTotInclForeign' => 2500,
//            'fOrdTotInclForeignExRounding',
                'fOrdTotTaxDExForeign' => 0,
                'fOrdTotTaxForeign' => 0,
//            'fRefundAmount',
//            'fRefundAmountForeign',
//            'iDCBranchID',
//            'iDocEmailed',
//            'iDocPrinted',
//            'iEUNoTCID',
                'iINVNUMAgentID' => 1,
//            'iInsuranceState',
//            'iInvSettlementTermsID',
//            'iInvoiceSplitDocID',
//            'iLinkedDocID',
//            'iMergedDocID',
//            'iOpportunityID',
//            'iOrderCancelReasonID',
//            'iPOAuthStatus',
//            'iPOIncidentID',
//            'iProspectID',
//            'iSalesBranchID',
//            'iSupervisorID',
//            'imgOrderSignature'
    );
$this->SAGE_DB()->insert('invnum',$client_details);
$inv_id=$this->SAGE_DB()->query("SELECT * FROM invnum ORDER BY OrderDate DESC")->row_array();
    $invoice_details=array(
//            '_btblInvoiceLines_Checksum',
//            '_btblInvoiceLines_dCreatedDate',
//            '_btblInvoiceLines_dModifiedDate',
//            '_btblInvoiceLines_iBranchID',
//            '_btblInvoiceLines_iChangeSetID',
//            '_btblInvoiceLines_iCreatedAgentID',
//            '_btblInvoiceLines_iCreatedBranchID',
//            '_btblInvoiceLines_iModifiedAgentID',
//            '_btblInvoiceLines_iModifiedBranchID',
                'bChargeCom' => 1,
//            'bIsLotItem',
//            'bIsSerialItem',
//            'bIsWhseItem',
//            'bPromotionApplied',
                'cDescription' => $details->Name,
//            'cLineNotes',
//            'cLotNumber',
//            'cPromotionCode',
//            'cTradeinItem',
                'dDeliveryDate' => date('Y-m-d H:i:s'),
//            'dLotExpiryDate',
//            'fAddCost',
//            'fAddCostForeign',
//            'fHeight',
//            'fLength',
//            'fLineDiscount',
//            'fPromotionPriceExcl',
//            'fPromotionPriceIncl',
//            'fQtyChange',
//            'fQtyChangeLineTaxAmount',
//            'fQtyChangeLineTaxAmountForeign',
//            'fQtyChangeLineTaxAmountNoDisc',
//            'fQtyChangeLineTaxAmountNoDiscForeign',
//            'fQtyChangeLineTotExcl',
//            'fQtyChangeLineTotExclForeign',
//            'fQtyChangeLineTotExclNoDisc',
//            'fQtyChangeLineTotExclNoDiscForeign',
//            'fQtyChangeLineTotIncl',
//            'fQtyChangeLineTotInclForeign',
//            'fQtyChangeLineTotInclNoDisc',
//            'fQtyChangeLineTotInclNoDiscForeign',
//            'fQtyChangeUR',
                'fQtyDeliver'=>100,
                'fQtyDeliverUR'=>100,
                'fQtyForDelivery' => 100,
                'fQtyForDeliveryUR' => 100,
                //qty
                'fQtyLastProcess' => 100,
                'fQtyLastProcessLineTaxAmount' => 0,
                'fQtyLastProcessLineTaxAmountForeign'=>0,
                'fQtyLastProcessLineTaxAmountNoDisc' => 0,
                'fQtyLastProcessLineTaxAmountNoDiscForeign'=>0,
                'fQtyLastProcessLineTotExcl' => (2500 * 10),
                'fQtyLastProcessLineTotExclForeign' =>(2500 * 15),
                'fQtyLastProcessLineTotExclNoDisc' => (2500 * 18),
                'fQtyLastProcessLineTotExclNoDiscForeign' => (2500* 10),
                'fQtyLastProcessLineTotIncl' => (2500 * 13) ,
                'fQtyLastProcessLineTotInclForeign' => (2500 * 18) + 0,
                'fQtyLastProcessLineTotInclNoDisc' => (2500 * 24) ,
                'fQtyLastProcessLineTotInclNoDiscForeign' => (2500 * 9),
                'fQtyLastProcessUR' => 100,
                'fQtyLinkedUsed' => 100,
                'fQtyLinkedUsedUR' => 100,
                //qty
                'fQtyProcessed' => 100,
                'fQtyProcessedLineTaxAmount' => 0,
                'fQtyProcessedLineTaxAmountForeign' => 0,
                'fQtyProcessedLineTaxAmountNoDisc' => 0,
                'fQtyProcessedLineTaxAmountNoDiscForeign' => 0,
                'fQtyProcessedLineTotExcl' => (2500 * 12),
                'fQtyProcessedLineTotExclForeign' => (2500 * 15),
                'fQtyProcessedLineTotExclNoDisc' => (2500 * 16),
                'fQtyProcessedLineTotExclNoDiscForeign' => (2500 * 13),
                'fQtyProcessedLineTotIncl' => (2500 * 12),
                'fQtyProcessedLineTotInclForeign' =>(2500 * 18) ,
                'fQtyProcessedLineTotInclNoDisc' => (2500 * 23),
                'fQtyProcessedLineTotInclNoDiscForeign' => (2500 * 16),
                'fQtyProcessedUR' => 100,
//            'fQtyReserved',
//            'fQtyReservedChange',
//            'fQtyReservedChangeUR',
//            'fQtyReservedUR',
//            'fQtyToProcess',
                'fQtyToProcessLineTaxAmount' =>0,
                'fQtyToProcessLineTaxAmountForeign' => 0,
                'fQtyToProcessLineTaxAmountNoDisc' => 0,
                'fQtyToProcessLineTaxAmountNoDiscForeign' => 0,
                'fQtyToProcessLineTotExcl' => (2500 * 20),
                'fQtyToProcessLineTotExclForeign' => (2500 * 18),
                'fQtyToProcessLineTotExclNoDisc' => (2500 * 12),
                'fQtyToProcessLineTotExclNoDiscForeign' => (2500 * 14),
                'fQtyToProcessLineTotIncl' => (1500 * 24),
                'fQtyToProcessLineTotInclForeign' => (2500 * 24),
                'fQtyToProcessLineTotInclNoDisc' => (2500 * 16),
                'fQtyToProcessLineTotInclNoDiscForeign' => (2500 * 17),
                'fQtyToProcessUR' => 100,
                //quantity
                'fQuantity' => 100,
                'fQuantityLineTaxAmount' => 0,
                'fQuantityLineTaxAmountForeign' => 0,
                'fQuantityLineTaxAmountNoDisc' => 0,
                'fQuantityLineTaxAmountNoDiscForeign' => 0,
                'fQuantityLineTotExcl' => (1500 * 15),
                'fQuantityLineTotExclForeign' => (2500 * 27),
                'fQuantityLineTotExclNoDisc' => (2500 * 17),
                'fQuantityLineTotExclNoDiscForeign' => (1500 * 18),
                'fQuantityLineTotIncl' => ((1500 * 15)),
                'fQuantityLineTotInclForeign' => (1500 * 19),
                'fQuantityLineTotInclNoDisc' => (1400 * 21),
                'fQuantityLineTotInclNoDiscForeign' => (1700 * 17),
                'fQuantityUR' => 200,
                'fTaxRate' => 0,
                'fUnitCost' =>100,
                'fUnitCostForeign' => 2500,
                //price single
                'fUnitPriceExcl' => 2560,
                'fUnitPriceExclForeign' => 2580,
//            'fUnitPriceExclForeignOrig',
//            'fUnitPriceExclOrig',
                'fUnitPriceIncl' => (25900),
                'fUnitPriceInclForeign' => 16000,
//            'fUnitPriceInclForeignOrig',
//            'fUnitPriceInclOrig',
//            'fWidth',
//            'iDeliveryMethodID',
//            'iDeliveryStatus',
//            'iGrvLineID',
                'iInvoiceID' =>$inv_id['AutoIndex'],
//            'iJobID',
//            'iLedgerAccountID',
//            'iLineDiscountReasonID',
//            'iLineDocketMode',
                'iLineID' => 1,
                'iLineProjectID' => 1,
                'iLineRepID' => 1,
//            'iLinkedLineID',
//            'iLotID',
//            'iMFPID',
                'iModule' => 0,
//            'iOrigLineID',
//            'iPieces',
//            'iPiecesDeliver',
//            'iPiecesForDelivery',
//            'iPiecesLastProcess',
//            'iPiecesLinkedUsed',
//            'iPiecesProcessed',
//            'iPiecesReserved',
//            'iPiecesToProcess',
//            'iPriceListNameID' => ,
//            'iReturnReasonID',
//            'iSOLinkedPOLineID',
//            'iSalesWhseID',
                //item id9
                'iStockCodeID' => $query->id,
                'iTaxTypeID' => $query->id,
//            'iUnitPriceOverrideReasonID',
//            'iUnitsOfMeasureCategoryID',
//            'iUnitsOfMeasureID',
//            'iUnitsOfMeasureStockingID',
//            'iWarehouseID',
);
$this->SAGE_DB()->insert('_btblinvoicelines',$invoice_details);
    echo json_encode(array("status" => TRUE));
  }
  public function asset_edit($id)
  {
    $data = $this->Hire_assets_model->get_hire_assets_by_id($id);
    echo json_encode($data);
  }
  public function asset_update()
  {
    $tonnes='';
    $hours=''; 
    $asset='';
    
    if($this->input->post('asset_inhouse')){
      $asset=$this->input->post('asset_inhouse');
    }
     elseif($this->input->post('asset_outsourced')){
      $asset=$this->input->post('asset_outsourced');
    }
     if($this->input->post('tonnes')){
      $tonnes=$this->input->post('tonnes');
      }
     
    elseif($this->input->post('hours')){
      $hours=$this->input->post('hours');
    }
    $data = array(
     'tonnes' => $tonnes,
     'staff_id' => $this->input->post('staff_id'),
     'client_id' => $this->input->post('client_id'),
     'supplier_id' => $this->input->post('supplier_id'),
     'hours' => $hours,
     'rate' => $this->input->post('rate'),
     'currency' => $this->input->post('currency'),
     'measurement' => $this->input->post('measurement'),
     'asset' =>$asset,
     'source' => $this->input->post('source')

   );
    $this->Hire_assets_model->hire_assets_update(array('id' => $this->input->post('id')), $data);
    $hire=$this->db->query("SELECT * FROM hire_assets ORDER BY updated_at DESC LIMIT 1")->row();
    $id=$hire->id;
 
    //$price=$this->db->query("SELECT * FROM equipments WHERE id=$asset_id")->row()->purchase_price;
     $total='';
    if($hire->hours){
    $total=$hire->rate*$hire->hours;
  }
  elseif ($hire->tonnes) {
   $total=$hire->rate*$hire->tonnes;
  }
    $updated = array('total'=>$total);
    $this->Hire_assets_model->hire_assets_update(array('id' => $id), $updated);
    echo json_encode(array("status" => TRUE));
  }

  public function delete($id)
  {
    $this->Hire_assets_model->delete_hire_asset($id);
    echo json_encode(array("status" => TRUE));
  }

  public function SAGE_DB(){
    return $this->load->database('SAGE',TRUE);
    }
function download_pdf($invoice_id = 0) {

        if ($invoice_id) {
            $this->_prepare_invoice($invoice_id, "download");
        } else {
            show_404();
        }
    }

    private function _prepare_invoice($invoice_id, $mode = "download", &$data = array()) {
        $this->load->library('pdf');
        $this->pdf->setPrintHeader(false);
        $this->pdf->setPrintFooter(false);
        $this->pdf->SetCellPadding(1.5);
        $this->pdf->setImageScale(1.42);
        $this->pdf->AddPage();

        if ($invoice_id) {

            $view_data = get_invoice_data($invoice_id);

            //check for valid invoice
            if (!$view_data) {
                show_404();
            }

            //check for security
            $invoice_info = get_array_value($view_data, "invoice_info");
                      //so, we have a valid invoice data. Prepare the view.

            $view_data["mode"] = $mode;

            $html = $this->load->view("maintenance/services/invoice_pdf", $view_data, true);

            if ($mode != "html") {
                $this->pdf->writeHTML($html, true, false, true, false, '');
            }

            $data = $view_data; //return back the data

            if ($mode === "download") {
                $this->pdf->Output("Invoice-$invoice_id.pdf", "D");
            } else if ($mode === "send_email") {
                $temp_download_path = getcwd() . "/" . get_setting("temp_file_path") . "Invoice-$invoice_id.pdf";
                $this->pdf->Output($temp_download_path, "F");
                return $temp_download_path;
            } else if ($mode === "view") {
                $this->pdf->Output("Invoice-$invoice_id.pdf", "I");
            } else if ($mode === "html") {
                return $html;
            }
        }
    }

    public function view_invoice($invoice_id){
        $invoice_info = $this->db->query("SELECT hire_assets.*,parts_suppliers.name as supplier FROM hire_assets
        LEFT JOIN parts_suppliers ON parts_suppliers.id=hire_assets.supplier_id WHERE hire_assets.id=$invoice_id")->row();
               if ($invoice_info) {
                $view_data['invoice_info'] = $invoice_info;
                $view_data['client_info'] = $this->Sage_clients_model->get_one($view_data['invoice_info']->client_id);
                $invoice_items_options = array("invoice_id" => $invoice_id);

               
               $this->template->rander("maintenance/services/assets_invoice", $view_data);

            }
     
    }
     /* list of invoice items, prepared for datatable  */

    function item_list_data($invoice_id) {
         $list_data = $this->db->query("SELECT hire_assets.*,employees.name as staff,parts_suppliers.name as supplier,
      sage_clients.name as client,equipments.description as equipment FROM hire_assets
      LEFT JOIN employees ON employees.id=hire_assets.staff_id
      LEFT JOIN sage_clients ON sage_clients.id=hire_assets.client_id
      LEFT JOIN equipments ON equipments.id=hire_assets.asset
      LEFT JOIN parts_suppliers ON parts_suppliers.id=hire_assets.supplier_id WHERE hire_assets.id=$invoice_id")->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_item_row($data);
        }
        echo json_encode(array("data" => $result));
    }

    /* prepare a row of invoice item list table */

    private function _make_item_row($data) {
        // $item = "<b>$data->title</b>";
        // if ($data->description) {
        //     $item.="<br /><span>" . nl2br($data->description) . "</span>";
        // }
        $hours='';
        $tonnes='';
        if($data->rate){
          $tonnes=$data->tonnes;
        }
        if($data->hours){
          $hours=$data->hours;
        }

        return array(
            $data->equipment,
            to_decimal_format($data->rate),
            $tonnes,
            $hours,
            to_currency($data->total),
           );
    }

 //prepare invoice status label 
    private function _get_invoice_status_label($data, $return_html = true) {
        return get_invoice_status_label($data, $return_html);
    }
}