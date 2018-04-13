<?php echo form_open('"id" = "create-reports-form", "class" = "general-form", "role" = "form"'); ?>
<div class="modal-body clearfix">
     <div class="panel panel-default">
    <div class="panel-heading">
      <a href="#" class="btn btn-default pull-right" style="margin-top: -8px;"><i class="fa fa-book" style="font-size:18px;color: green;"></i>  <b>Resolution Knowledge Database</b></a>
        <div class="row">
          <div class="col-sm-3" style="width: 20%">
             <div class="dropdown pull-right">
    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" style="margin-top: -8px;">
      <i class="fa fa-envelope" style="font-size:18px;color: green;"></i> <b>Support Entries</b>
    <span class="caret"></span></button>
    <ul class="dropdown-menu">
      <li><a href="#">System Support Entries</a></li>
      <li><a href="#">Email Support Entries</a></li>
      <li><a href="#">Call Support Entries</a></li>
      <li><a href="#">Support Escalations</a></li>
      <li><a href="#">Combined Support Entries</a></li>
       </ul>
  </div>
  </div>
  <div class="col-sm-3" style="width: 18%">
  <div class="dropdown pull-right">
    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" style="margin-top: -8px;"> <i class="fa fa-check-circle-o" style="font-size:18px;color: green;"></i> <b>Checklists</b>
    <span class="caret"></span></button>
    <ul class="dropdown-menu">
      <li><a href="#">Checklist Database</a></li>
      <li><a href="#">Daily Task Checklist</a></li>
      <li><a href="#">Daily Task Escalation</a></li>
      <li><a href="#">Monthly Task Checklist Summary</a></li>
      <li><a href="#">Third Level Support </a></li>
       </ul>
  </div>
</div>
<div class="col-sm-3" style="width: 18%">
  <div class="dropdown pull-right">
    <p class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" style="margin-top: -8px;">
      <i class="fa fa-power-off" style="font-size:18px;color: green;"></i> <b>Maintenance</b>
    <span class="caret"></span></button>
    <ul class="dropdown-menu">
      <li><a href="#">Preventive Maintainance Schedule</a></li>
      <li><a href="#">Preventive Maintainance Notifications</a></li>
      <li><a href="#">Preventive Maintanance Checklist</a></li>
      <li><a href="#">Preventive Maintainance List</a></li>
      <li><a href="#">Preventive Maintainance Escalations</a></li>
       </ul>
  </div>
</div>
<div class="col-sm-3" style="width: 18%">
  <div class="dropdown pull-right">
    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" style="margin-top: -8px;">
       <i class="fa fa-building-o" style="font-size:18px;color: green;"></i> <b>ICT Assets</b>
    <span class="caret"></span></button>
    <ul class="dropdown-menu">
      <li><a href="#">ICT Asset Register</a></li>
      <li><a href="#">ICT Assest Disposal Notifications</a></li>
      <li><a href="#">ICT Asset Disposal List</a></li>
      </ul>
  </div>
</div>
</div>
</div>
    </div>
    <div class="panel-body">
     <div class="row">
  <div class="col-sm-12">
    <table class="table table-striped table-bordered" id="ict_reports" style="width: 100%">
     <thead>
       <tr>

         <th>No.</th>
         <th>Name</th>
         <th>Title</th>
         <th>Description</th>
         <th>Actions</th>
         
         </tr>
         </thead> 
     <tbody>
         <tr>
         <td></td>
         <td></td>
         <td></td>
         <td></td>
         <td></td>
        </tr>
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
    $('#ict_reports').DataTable();
} );
</script>

   