<?php echo form_open('"id" = "create-parts-form", "class" = "general-form", "role" = "form"'); ?>
<div class="modal-body clearfix">
 <div class="panel panel-default">
  <div class="panel-heading" style="margin-top: -8px">Checklists
    <?php echo anchor(get_uri("followups/checklist_form"), "<i class='fa fa-plus-circle'></i> " . 'Add Checklist', array("class" => "btn btn-default pull-right rq", "title" => 'Add Checlist')); ?>
    
  </div>
</div>
<div class="panel-body">
 <div class="row">
  <div class="col-sm-12">
    <table class="table table-striped table-bordered" id="jt" style="width: 100%">
     <thead>
       <tr>
         <th>No.</th>
         <th>Vehicle</th>
         <th>Mileage</th>
         <th>Date</th>
         <th>Actions</th>
          </tr>
     </thead> 
     <tbody>
      <?php foreach ($all_details as  $checklist) {?>
        
        <tr>
        <td>
          <?php echo $checklist['id'];?> 
      </td>
      <td><a href="<?php echo base_url('followups/show/'.$checklist['id']);?>"><span class="badge"><?php echo $checklist['code'];?></span></a></td>
      <td><?php echo $checklist['mileage'] .' '. $checklist['measurement'];?></td>
      <td><?php echo $checklist['date'];?></td>
     
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