<?php echo form_open('"id" = "jobs-form", "class" = "general-form", "role" = "form"'); ?>
  <input type="hidden" name="id" value="<?php echo $job_info->id; ?>" />
<div class="modal-body clearfix">
     <div class="panel panel-default">
    <div class="panel-heading">New Job Card</div>
    <div class="panel-body">
     <div class="row">
  <div class="col-sm-4">
    <div class="form-group vehicle_sel">
    <label for="vehicle_no" class="col-sm-10"><b><?php echo lang('vehicle_no'); ?></b></label>
   <select class="form-control" name="vehicle_no" id="vehicle_no" class="vehicle" style="width: 100% !important;">
              <option>-- SESLECT VEHICLE --</option>
              <?php
              foreach ($vehicles_dropdown as $value) {
                  echo "<option value=". $value->id . ">" . ucfirst($value->code) . "</option>";
              }
              ?>
           </select>
      
    </div>
    <br>
   <div class="form-group">

    <label for="job_service" class="col-sm-3"><b><?php echo lang('job_service'); ?></b></label>
             <select class="form-control" name="job_service_id" id="service_type_id" required>
             <option value="">--- Select Job/Service ---</option>
              <?php
              foreach ($service_types_dropdown as $value) {
                  echo "<option value=". $value->id . ">" . ucfirst($value->service_name) . "</option>";
              }
              ?>
            </select>
                    
</div>

<div class="form-group">
    <label for="description" class="col-sm-3"><b><?php echo lang('description'); ?></b></label>
          <?php
        echo form_textarea(array(
            "id" => "description",
            "name" => "description",
            "class" => "form-control",
            'rows' => '5',
            'cols' => '40',


        ));
        ?>
 </div>
</div>
<div class="col-sm-4">
<div class="form-group">
    <label for="job_type" class="col-sm-10"><b>Job Type</b></label>
    <select class="form-control" name="job_type_name" id="job_typo" required>
            <option value="">--- Select Job Service first ---</option>     
            </select>
    
</div>
<br>
<div class="form-group">
    <label for="completion_date"><b><?php echo lang('completion_date'); ?></b></label>
    
        <?php
        echo form_input(array(
            "id" => "completion_date",
            "name" => "completion_date",
            "class" => "form-control",
           
        ));
        ?>
    </div>
   <div class="form-group">
    <label for="driver" class="col-sm-3"><b><?php echo lang('driver'); ?></b></label>
    <p id="driver"></p>
    </div> 
</div>

<div class="col-sm-4">
  <div class="form-group">
    <b><?php echo lang('make_model'); ?></b>
    <br>
     <p id="model"></p>      
</div>
<br><br>
<div class="form-group">
    <label for="time_in" class="col-sm-3"><b><?php echo lang('time_in'); ?></b></label>
 
        <?php
        echo form_input(array(
            "id" => "time_in",
            "name" => "time_in",
            "class" => "form-control",
            "type"  => "time",
           
        ));
        ?>
   
</div>
<div class="form-group input-group-sm">
    <label for="km_reading" class="col-sm-10"><b><?php echo lang('km_reading'); ?></b></label>
    
        <?php
        echo form_input(array(
            "id" => "km_reading",
            "name" => "km_reading",
            "class" => "form-control",
           
        ));
        ?>
    </div>

<div class="form-group">
    <label for="fuel_balance " class="col-sm-8"><b><?php echo lang('fuel_balance'); ?></b></label>
    
        <?php
        echo form_input(array(
            "id" => "fuel_balance",
            "name" => "fuel_balance",
            "class" => "form-control",
           
        ));
        ?>
   </div>
</div>
</div>
<hr>

<div class="row">
    <div class="col-sm-12">
<table class="table table-striped">
    <thead>
      <tr>
        
        <th><?php echo lang('inspection'); ?></th>
        <th><?php echo lang('done_by'); ?></th>
        <th><?php echo lang('status'); ?></th>
       
      </tr>
    </thead>
    <tbody>
      <tr>
        <div class="col-sm-4">
        <td> <select  name="inspection_id[]" id="inspection_id" class="form-control" multiple>
              <?php
              foreach ($inspections_dropdown as $value) {
                  echo "<option value=". $value->id . ">" . ucfirst($value->type) . "</option>";
              }
              ?>
           </select></td>
         </div>
         <div class="row">
         <div class="col-sm-4">
        <td>
        <select name="done_by[]" id="done_by" class="form-control" multiple>
              <?php
              foreach ($sage_staff_dropdown as $value) {
                  echo "<option value=". $value->id . ">" . ucfirst($value->name) . "</option>";
              }
              ?>
           </select>
        </td>
      </div>
    </div>
      <div class="col-sm-4">
        <td> 
        <select class="form-control" name="status_id[]" id="status" multiple>
              <?php
              foreach ($jobs_status_dropdown as $value) {
                  echo "<option value=". $value->id . ">" . ucfirst($value->name) . "</option>";
              }
              ?>
           </select>
       </td>
     </div>
      </tr>
      </tbody>
  </table>
</div>

</div>
<?php echo form_close();?>
<hr>
<?php echo form_open('"id" = "jobs-forms" "class" = "tasks-form" "role" = "form"'); ?>
<div class="row">
    <div class="col-sm-5">
<div class="form-group">
    <label for="service_type_id" class="col-sm-6"><b><?php echo lang('operation_name'); ?></b></label>
          <select class="form-control" name="service_type_id" id="service_types"  required>
              <?php
              foreach ($services_dropdown as $service_type) {
                  echo "<option value=". $service_type->id . ">" . ucfirst($service_type->description) . "</option>";
              }
              ?>
           </select>
         </div>
         <div class="col-sm-6">
         <div class="form-group">
    <label for="assigned_to" class="col-sm-10"><b><?php echo lang('assigned_to'); ?></b></label>
    
     <select class="form-control" name="assigned_to" id="assigned_to" required>
              <?php
              foreach ($sage_staff_dropdown as $staff) {
                  echo "<option value=". $staff->id . ">" . ucfirst($staff->name) . "</option>";
              }
              ?>
           </select>
          </div>
        </div>
          <div class="col-sm-6">
          <div class="form-group">
    <label for="jobs_type_id" class="col-sm-8"><b>Job Type</b></label>
    
     <select class="form-control" name="jobs_type_id" id="activity" required>
              <?php
              foreach ($job_types_dropdown as $job_type) {
                  echo "<option value=". $job_type->id . ">" . ucfirst($job_type->job_type_name) . "</option>";
              }
              ?>
           </select>
         </div>
          </div>
</div>
<div class="col-sm-5">
<div class="form-group">
    <label for="tasks" class="col-sm-6"><b><?php echo lang('tasks'); ?></b></label>
    
        <?php
        echo form_input(array(
            "id" => "tasks",
            "name" => "tasks",
            "class" => "form-control",
            
        ));
        ?>
    </div>
    <div class="col-sm-6">
      <div class="form-group">
    <label for="start_date " class="col-sm-10"><b><?php echo lang('start_date'); ?></b></label>
    
        <?php
        echo form_input(array(
            "id" => "start_date",
            "name" => "start_date",
            "class" => "form-control",
            
        ));
        ?>
    </div>
    </div>
    <div class="col-sm-6">
      <div class="form-group">
    <label for="time_in " class="col-sm-6"><b><?php echo lang('time_in'); ?></b></label>
    
        <?php
        echo form_input(array(
            "id" => "job_time_in",
            "name" => "job_time_in",
            "class" => "form-control",
            "type"  => "time",
          
        ));
        ?>
        
    </div>
    </div>
</div>
<br><br><br>
<div class="col-sm-2">
<button type="submit" class="btn btn-success btn-block" id="submit_btn">Add Task</button>
</div>  
</div>
  
<?php echo form_close();?>
<div class="row">
 <div class="col-sm-12">
    <table class="table table-striped">
        <thead>
            <tr>
                
                
            <th>Operation</th>
            <th>Action</th>
            <th>Allocated To</th>
            <th>Start Date</th>
            <th>Start Time</th>
            
            </tr>
            </thead>
           <tbody id="show_data">
        
           </tbody>
          
            </tr>
        
       </table>
</div>
</div>
<br>
<div class="form-group">
  <button type="submit" class="btn btn-success" id="saved_data"><span class="fa fa-check-circle"></span>Process</button>
  <a href="<?php echo base_url();?>preventive" class="btn btn-danger" role="button">back</a>
</div>
<?php echo form_close(); ?>


<script type="text/javascript">
   $(document).ready(function() {
        $('select[name="job_service_id"]').on('change', function() {
            var serviceID = $(this).val();
           
           //console.log(serviceID);
            var path = "<?php echo site_url('preventive/serviceTypesAjax')?>/" + serviceID;
                   
            if(serviceID) {
                $.ajax({
                    url: path,
                    type: "GET",
                    dataType: "json",
                    success:function(data) {
                       $('select[name="job_type_name"]').empty();
                        $.each(data, function(key, value) {
                          //console.log(value.id);
                           
                            $('select[name="job_type_name"]').append('<option value="'+ value.id +'">'+ value.job_type_name +'</option>');
                        });
                    }
                });
            }else{
                $('select[name="job_type_name"]').empty();
            }
        });
    });
 
</script>

<script type="text/javascript">
        $("#service_type").select2();
        $("#job_type").select2();
        $("#vehicle_no").select2();
        $("#done_by").select2();
        $("#status").select2();
        $("#inspection_id").select2();
        $("#service_type").select2();
        $("#assigned_to").select2();
        $("#activity").select2();
        setDatePicker("#completion_date,#start_date");

   
</script>
<script type="text/javascript">
             $(document).ready(function() {
             $('select[name="job_type_name"]').on('change', function() {
               var check_id = $(this).val();
           console.log(check_id);
           var path="<?php echo site_url('preventive/DisplayServiceType')?>/" + check_id;
           console.log(path);
            $.ajax({
                type  : 'ajax',
                url   : "<?php echo site_url('preventive/DisplayServiceType')?>/" + check_id,
                async : false,
                dataType : 'json',
                success : function(data){
                   console.log(data);
                   var html = '';
                    var i;
                    for(i=0; i<data.length; i++){
                        html += '<tr>'+
                                '<td>'+data[i]['explanation']+'</td>'+
                                '<td>'+data[i]['tasks']+'</td>'+
                                '<td>'+data[i]['employee']+'</td>'+
                                '<td>'+data[i]['start_date']+'</td>'+
                                '<td>'+data[i]['job_time_in']+'</td>'+
                                  '</tr>';
                    }
                    $('#show_data').html(html);
                }
 
            });
        });
        });
</script>
<script type="text/javascript">
             $(document).ready(function() {
             $('select[name="vehicle_no"]').on('change', function() {
            var model_id = $(this).val();
               var path="<?php echo site_url('preventive/model')?>/" + model_id;
                $.ajax({
                type  : 'ajax',
                url   : path,
                async : false,
                dataType : 'json',
                success : function(data){
                   var html ='<p>'+data+'</p>';
                   $('#model').html(html);

                }
 
            });
        });
        });
</script>
<script type="text/javascript">   
             $(document).ready(function() {

             $('select[name="vehicle_no"]').on('change', function() {
            var driver_id = $(this).val();
           var path="<?php echo site_url('preventive/driver')?>/" + driver_id;
                 $.ajax({
                type  : 'ajax',
                url   : path,
                async : false,
                dataType : 'json',
                success : function(data){
                   console.log(data);
                   var html ='<p>'+data+'</p>';
                   $('#driver').html(html);
                }
 
            });
        });
        });
</script>
<script type="text/javascript">
   //Save product
        $('#submit_btn').on('click',function(){
            var operation_name = $('#service_types').val();
            var start_date = $('#start_date').val();
            var assigned_to = $('#assigned_to').val();
            var job_time_in = $('#job_time_in').val();
            var tasks       = $('#tasks').val();
            var activity       = $('#activity').val();
            $.ajax({
                type : "POST",
                url  : "<?php echo site_url('preventive/save_task')?>",
                dataType : "JSON",
                data : {service_type_id:operation_name, start_date:start_date, assigned_to:assigned_to,job_time_in:job_time_in,tasks:tasks,jobs_type_id:activity},
                success: function(data){
                    $('[name="service_type_id"]').val("");
                    $('[name="start_date"]').val("");
                    $('[name="assigned_to"]').val("");
                    $('[name="job_time_in"]').val("");
                    $('[name="tasks"]').val("");
                    $('[name="jobs_type_id"]').val("");
                   
                }
            });
            return false;
        });
 
</script>
<script type="text/javascript">
        $('#saved_data').on('click',function(){
            var job_service_id = $('#service_type_id').val();
            var job_type_id = $('#job_typo').val();
            var vehicle_no = $('#vehicle_no').val();
            var time_in = $('#time_in').val();
            var km_reading       = $('#km_reading').val();
            var description = $('#description').val();
            var completion_date = $('#completion_date').val();
            var fuel_balance = $('#fuel_balance').val();
            var inspection_id = $('#inspection_id').val();
            var done_by       = $('#done_by').val();
            var status_id     = $('#status').val();
            var mechanic_findings = $('#findings').val();
            $.ajax({
                type : "POST",
                url  : "<?php echo site_url('preventive/save')?>",
                dataType : "JSON",
                data : {job_service_id:job_service_id, job_type_id:job_type_id, vehicle_no:vehicle_no,time_in:time_in,km_reading:km_reading,
                  description:description,completion_date:completion_date,fuel_balance:fuel_balance,inspection_id:inspection_id,done_by:done_by,status_id:status_id,mechanic_findings:mechanic_findings},
                success: function(data){
                    $('[name="job_service_id"]').val("");
                    $('[name="job_type_id"]').val("");
                    $('[name="vehicle_no"]').val("");
                    $('[name="time_in"]').val("");
                    $('[name="km_reading"]').val("");
                    $('[name="description"]').val("");
                    $('[name="completion_date"]').val("");
                    $('[name="fuel_balance"]').val("");
                    $('[name="inspection_id"]').val("");
                    $('[name="done_by"]').val("");
                    $('[name="status_id"]').val("");
                    $('[name="mechanic_findings"]').val("");
                    window.location = "<?php echo site_url('preventive')?>";
                }
            });
            return false;
        });  
</script>
<script type="text/javascript">
             $(document).ready(function() {
             $('select[name="vehicle_no"]').on('change', function() {
            var warranty_id = $(this).val();
            console.log(warranty_id)
           var path="<?php echo site_url('preventive/warrantyCheck')?>/" + warranty_id;
                $.ajax({
                type  : 'ajax',
                url   : path,
                async : false,
                dataType : 'json',
                success : function(data){
                  console.log(data)
               if (!data.length){ 
               alert('sorry,this vehicle is still under warranty');
               window.location.replace('jobs_form');
                }
                else{
                  return;
                }
              }
 
            });
        });
        });
</script>
    