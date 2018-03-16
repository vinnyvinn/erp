<?php echo form_open('"id" = "create-parts-form", "class" = "general-form", "role" = "form"'); ?>

<div class="modal-body clearfix">
     <div class="panel panel-default">
    <div class="panel-heading" style="margin-top: -8px">External Services 
  <?php echo anchor(get_uri("reactive/external_service_create"), "<i class='fa fa-plus-circle'></i> " . lang('request_service'), array("class" => "btn btn-default pull-right rq", "title" => lang('request_service'))); ?>
  
            </div>
    </div>
    <div class="panel-body">
     <div class="row">
  <div class="col-sm-12">
    <table class="table table-striped table-bordered" id="external_service" style="width: 100%">
     <thead>
       <tr>
         <th>No.</th>
         <th>Card #</th>
         <th>Vehicle</th>
          <th>Requested On</th>
         </tr>
     </thead> 
     <tbody>
      <?php foreach ($external_services as $service) {?>
         <tr>
         <td><?php echo $service['id']?></td>
          <td><?php echo $service['card_no']?></td>
         <td><?php echo $service['code']?></td>
            <td><?php echo $service['created']?></td>
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
    $('#external_service').DataTable();
} );
</script>


    