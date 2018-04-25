<?php echo form_open('"id" = "create-parts-form", "class" = "general-form", "role" = "form"'); ?>

<div class="modal-body clearfix">
     <div class="panel panel-default">
    <div class="panel-heading" style="margin-top: -8px">Parts Requisitions
     
   <?php echo anchor(get_uri("parts_requisition/createPart"), "<i class='fa fa-plus-circle'></i> " . lang('new_requisition'), array("class" => "btn btn-default pull-right rq", "title" => lang('new_requisition'))); ?>
            </div>
    </div>
    <div class="panel-body">
     <div class="row">
  <div class="col-sm-12">
    <table class="table table-striped table-bordered" id="spares" style="width: 100%">
     <thead>
       <tr>

         <th>No.</th>
         <th>Requisition #</th>
         <th>Card #</th>
         <th>Spare part</th>
         <th>Quantity</th>
         <th>Code</th>
         <th>Description</th>
         <th>Vehicle</th>
         <th>Total Amount</th>
         <th>Requested On</th>
         </tr>
         </thead> 
     <tbody>
      <?php foreach ($spares as $spare) {?>

         <tr>
         <td><?php echo $spare['spID']?></td>
         <td><a href="<?php echo base_url('parts_requisition/show_form/'.$spare['spID'])?>"><?php echo $spare['requisition_no']?></a>
          </td>
         <td><?php echo $spare['card_no']?></td>
         <td><?php echo $spare['stock_name']?></td>
         <td><?php echo $spare['qnty_out']?></td>
         <td><?php echo $spare['code_id']?></td>
         <td><?php echo $spare['description']?></td>
         <td><?php echo $spare['vehicle']?></td>
         <td><?php echo $spare['total']?></td>
         <td><?php echo $spare['created']?></td>
       </tr>
       <?php }?>
     </tbody>     
    </table>

    </div>
  </div>
</div>
</div>
</div>
<link rel="stylesheet" href="<?php echo base_url();?>assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<?php echo base_url();?>assets/js/datatable/css/dataTables.bootstrap.min.css">

<script type="text/javascript">
  $(document).ready(function() {
    $('#spares').DataTable();
} );
</script>


    