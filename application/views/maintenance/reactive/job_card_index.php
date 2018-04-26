<?php echo form_open('"id" = "create-parts-form", "class" = "general-form", "role" = "form"'); ?>
<div class="modal-body clearfix">
   <div class="panel panel-default">
    <div class="panel-heading" style="margin-top: -8px">Reactive Maintenance
      <?php echo anchor(get_uri("reactive/job_card"), "<i class='fa fa-plus-circle'></i> " . lang('add_card'), array("class" => "btn btn-default pull-right rq", "title" => lang('add_card'))); ?>
      <?php echo anchor(get_uri("reactive/external_service"), "<i class='fa fa-asterisk'></i> " . lang('external_services'), array("class" => "btn btn-info pull-right rq", "title" => lang('external_services'))); ?>
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
        <th>Job Type</th>
        <th>Vehicle</th>
         <th>Driver Name</th>
         <th>Description</th>
          <th>Spare part</th>
         <th>Actions</th>
         
         </tr>
     </thead> 
     <tbody>
      <?php foreach ($all_details as $asset) {?>
         <tr>
         <td><?php echo $asset['id']?></td>
         <td>
          <?php if ($asset['status'] == 'In Progress'){?>
         <a href="<?php echo base_url('reactive/show_job/'.$asset['id'])?>"><?php echo $asset['card_no']?></a>
          <?php } elseif($asset['status'] == 'Completed') {?>
          <a href="<?php echo base_url('preventive/process_form/'.$asset['id'])?>"><?php echo $asset['card_no']?></a>
          <?php }?>
          </td>
           <td><?php echo $asset['job_type_id']?></td>
            <td><?php echo $asset['code']?></td>
             <td><?php echo $asset['driver']?></td>
              <td><?php echo $asset['description']?></td>
              <td><?php if($asset['stock']) {
                echo $asset['stock'];
              }
              elseif($asset['part_name']){
                echo $asset['part_name'];
              }
              ?>
                
              </td>
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