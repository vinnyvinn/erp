<?php echo form_open('"id" = "create-parts-form", "class" = "general-form", "role" = "form"'); ?>

<div class="modal-body clearfix">
     <div class="panel panel-default">
    <div class="panel-heading" style="margin-top: -8px">Preventive Maintenance
  <?php echo anchor(get_uri("preventive/jobs_form"), "<i class='fa fa-plus-circle'></i> " . lang('add_card'), array("class" => "btn btn-default pull-right rq", "title" => lang('add_card'))); ?>
            </div>
    </div>
    <div class="panel-body">
     <div class="row">
  <div class="col-sm-12">
    <table class="table table-striped table-bordered" id="jt" style="width: 100%">
     <thead>
       <tr>
         <th>No.</th>
        <th>Card #</th>
         <th>Type</th>
         <th>Vehicle</th>
         <th>Driver Name</th>
         <th>Job Type</th>
         <th>Description</th>
         <th>Actions</th>
         
         </tr>
     </thead> 
     <tbody>
      <?php foreach ($all_details as $asset) {?>
         <tr>
         <td><?php echo $asset['id']?></td>
         <td><a href="<?php echo base_url('preventive/show_job/'.$asset['id'])?>"><?php echo $asset['card_no']?></a></td>
            <td><?php echo $asset['service_name']?></td>
             <td><?php echo $asset['code']?></td>
             <td><?php echo $asset['driver']?></td>
             <td><?php echo $asset['job_type']?></td>
            <td><?php echo $asset['description']?></td>
            <td>
            </td>
      
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
    $('#jt').DataTable();
} );
</script>


    