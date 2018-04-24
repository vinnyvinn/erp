<div id="page-content" class="clearfix">
  <div style="max-width: 1000px; margin: auto;">
    <div class="page-title clearfix mt15">
      <h1><?php echo lang('invoice') . ": #" . $invoice_info->id; ?></h1>
      <div class="title-button-group">
        <span class="btn btn-success">
          <?php echo anchor(get_uri("hire_assets/download_pdf/" . $invoice_info->id), "<i class='fa fa-download'></i> " . lang('download_pdf'), array("title" => lang('download_pdf'))); ?>
          
          
        </span>
        
      </div>
    </div>
    
    <div class="mt15">
      <div class="panel panel-default p15 b-t">
        <div class="clearfix mt15">
          <div class="col-sm-6">
            <img src="<?php echo base_url('assets/images/esl.png');?>"  />
            <h4>Express Shipping & Logistics(EA) Limited</h4>
            <p style="font-family: sans-serif;">
              Cannon Towers<br> 
              6th Floor, Moi Avenue Mombasa Kenya<br>
              Email: agency@esl-eastafrica.com<br>
              ops@esl-eastafrica.com<br>
              Web: www.esl-eastafrica.com<br>

            </p>

            <p class="mt15"><b><?php echo $invoice_info->supplier;?> </b></p>
            <?php
            $company_phone = $client_info->telephone;?>
            
            <?php if ($company_phone) { ?>
            <p><?php echo lang("phone") . ": " . $company_phone; ?></p>
            <?php } ?>
            
          </div>
          <div class="col-sm-6 ">
            <div class="text-right mb15">
              <h3 class="uppercase"><?php echo lang("invoice") . " #" . $invoice_info->id; ?></h3>
              <p><?php echo lang("bill_date") . ": " . $invoice_info->created; ?></p>
              
            </div>
            <br><br>
            <p class="b-b b-info">
              <strong><?php echo lang("bill_to"); ?>  </strong>
            </p>
            <p> <b><?php echo $client_info->name;?></b></p>
            
            
          </div>
        </div>

        <div class="table-responsive mt15 pl15 pr15">
          <table id="invoice-item-table" class="display" width="100%">            
          </table>
        </div>

        <div class="clearfix">
          <div class="col-sm-8">

          </div>
          <div class="col-sm-4" id="invoice-total-section">
            <?php $this->load->view("maintenance/services/invoices_section"); ?>
          </div> 
        </div>

        
      </div>
    </div>

    

  </div>
</div>



<script type="text/javascript">
  RELOAD_VIEW_AFTER_UPDATE = true;
  $(document).ready(function () {
    $("#invoice-item-table").appTable({
      source: '<?php echo_uri("hire_assets/item_list_data/" . $invoice_info->id . "/") ?>',
      order: [[0, "asc"]],
      hideTools: true,
      columns: [
      {title: '<?php echo lang("item") ?> '},
      {title: '<?php echo lang("rate") ?>', "class": "text-right w15p"},
      {title: '<?php echo lang("tonnes") ?>', "class": "text-right w15p"},
      {title: '<?php echo lang("hours") ?>', "class": "text-right w15p"},
      {title: '<?php echo lang("total") ?>', "class": "text-right w15p"},
               // {title: '<i class="fa fa-bars"></i>', "class": "text-center option w100"}
               ],
               onDeleteSuccess: function (result) {
                $("#invoice-total-section").html(result.invoice_total_view);
                if (typeof updateInvoiceStatusBar == 'function') {
                  updateInvoiceStatusBar(result.invoice_id);
                }
              },
              onUndoSuccess: function (result) {
                $("#invoice-total-section").html(result.invoice_total_view);
                if (typeof updateInvoiceStatusBar == 'function') {
                  updateInvoiceStatusBar(result.invoice_id);
                }
              }
            });

    $
  });



</script>

<?php
//required to send email 

load_css(array(
  "assets/js/summernote/summernote.css",
));
load_js(array(
  "assets/js/summernote/summernote.min.js",
));
?>

