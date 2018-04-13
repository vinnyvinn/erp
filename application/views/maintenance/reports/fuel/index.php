<div class="modal-body clearfix">
   <div class="panel panel-default">
    <div class="panel-heading" style="margin-top: -8px">Fuel Reports
        <?php echo anchor(get_uri("fuel_reports/print_report"), "<i class='fa fa-file-pdf-o pdfcolor'></i> " .'Print Report', array("class" => "btn btn-info pull-right rq")); ?>
  </div>
<img src="./assets/images/esl.png"  alt="esl logo" class="pull-right">
<div class="panel-body">
   <div class="row">
    <?php foreach ($all_data as $data) {?>
    <div class="col-sm-12">
        <div class="panel-heading">
            <label>Driver : <?php echo $data['user']['name']; ?>
             
            </label>
            <br>
            <b>Vehicle :
            <?php foreach ($data['vehicle'] as $key => $value) {?>

              <label><?php echo $value['code'];?> </label> 
               
            <?php }?>
        </b>
        </div>
        <table class="table table-striped table-bordered"  style="width: 100%">
           <thead>
             <tr>
               <th>No.</th>
               <th>Date</th>
               <th>Invoice No.</th>
               <th>Litres</th>
               <th>Pump Price</th>
               <th>Cost</th>
               <th>Km Reading</th>
               <th>Others</th>
               <th>Cost</th>

           </tr>
       </thead> 
       <tbody>
          <?php foreach ($data['details'] as $key => $report) {?>
          
          <tr>
           <td><?php echo $report['id']?></td>
           <td><?php echo $report['created']?></td>
           <td><?php echo $report['invoice_no']?></td>
           <td><?php echo $report['litres']?></td>
           <td><?php echo $report['price']?></td>
           <td><?php echo $report['total']?></td>
           <td><?php echo $report['km_reading']?></td>
           <td><?php echo $report['expenses']?></td>
           <td><?php echo $report['expense_cost']?></td>


       </tr>
       <!-- <p>total: <?php //echo $report['totalcost']?></p> -->
       <?php }?>
   </tbody>
   <tfoot>
 <tr>
     <td>Total</td>
     <td></td>
     <td></td>
     <td></td>
     <td></td>
     <td></td>
     <td></td>
     <td></td>
     <td></td>
 </tr>
</tfoot>     
</table>

</div>
<?php }?>
</div>
</div>
</div>
</div>
<link rel="stylesheet" href="<?php echo base_url();?>assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<?php echo base_url();?>assets/js/datatable/css/dataTables.bootstrap.min.css">
<style type="text/css">
.pdfcolor{
    color: red;
}
</style>
