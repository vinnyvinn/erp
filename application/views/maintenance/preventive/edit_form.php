<?php echo form_open(); ?>
        <div class="panel-group">
       <div class="panel panel-default">
      <div class="panel-heading">Job Card #<?php echo $jobs['card_no']?>
         <button class="bt btn-success pull-right"onclick="printPage()" style="height: 26px">Print Page</button>
      </div>

    <div class="panel-body">
     <div class="row">
  <div class="col-sm-4">
    <div class="form-group vehicle_sel">
    <label for="vehicle_no" class="col-sm-10"><b><?php echo lang('vehicle_no'); ?></b></label>
   <select class="form-control" disabled="disabled" name="vehicle_no" id="vehicle_no" class="vehicle" style="width: 100% !important;">
              <option value=""><?php echo $jobs['asset_no'];?></option>
               </select>
      
    </div>
    <br>
   <div class="form-group">

    <label for="job_service" class="col-sm-3"><b><?php echo lang('job_service'); ?></b></label>
             <select class="form-control" name="job_service_id" id="service_type_id" disabled="disabled">
             <option value=""><?php echo $jobs['service_name']?></option>
              
            </select>
                    
</div>

<div class="form-group">
    <label for="description" class="col-sm-3"><b><?php echo lang('description'); ?></b></label>
          <?php
        echo form_textarea(array(
            "id" => "description",
            "name" => "description",
            "class" => "form-control",
            "value" => $jobs['explanation'],
            'rows' => '5',
            'cols' => '40',
            'disabled' => 'disabled',


        ));
        ?>
 </div>
</div>
<div class="col-sm-4">
<div class="form-group">
    <label for="job_type" class="col-sm-10"><b>Job Type</b></label>
    <select class="form-control" name="job_type_name" id="job_typo" disabled="disabled">
            <option value=""><?php echo $jobs['job_type']?></option>     
            </select>
    
</div>
<br>
<div class="form-group">
    <label for="completion_date"><b><?php echo lang('completion_date'); ?></b></label>
    
        <?php
        echo form_input(array(
            "id" => "completion_date",
            "name" => "completion_date",
            "value" => $jobs['completion_date'],
            "class" => "form-control",
            "disabled" => "disabled",
           
        ));
        ?>
    </div>
   <div class="form-group">
    <label for="driver" class="col-sm-3"><b><?php echo lang('driver'); ?></b></label>
    <p id="driver"><?php echo $jobs['driver'];?></p>
   
    </div> 
</div>

<div class="col-sm-4">
  <div class="form-group">
    <b><?php echo lang('make_model'); ?></b>
    <br>
     <p id="model"><?php echo $jobs['code'];?></p>      
</div>
<br><br>
<div class="form-group">
    <label for="time_in" class="col-sm-3"><b><?php echo lang('time_in'); ?></b></label>
 
        <?php
        echo form_input(array(
            "id" => "time_in",
            "name" => "time_in",
            "value" => $jobs['time_in'],
            "class" => "form-control",
            "type"  => "time",
            "disabled" => "disabled",
           
        ));
        ?>
   
</div>
<div class="form-group input-group-sm">
    <label for="km_reading" class="col-sm-10"><b><?php echo lang('km_reading'); ?></b></label>
    
        <?php
        echo form_input(array(
            "id" => "km_reading",
            "name" => "km_reading",
            "value" => $jobs['km_reading'],
            "class" => "form-control",
            "disabled" => "disabled",
           
        ));
        ?>
    </div>

<div class="form-group">
    <label for="fuel_balance " class="col-sm-8"><b><?php echo lang('fuel_balance'); ?></b></label>
    
        <?php
        echo form_input(array(
            "id" => "fuel_balance",
            "name" => "fuel_balance",
            "value" => $jobs['fuel_balance'],
            "class" => "form-control",
            "disabled" => "disabled",
           
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
        <td> <select  name="inspection_id[]" class="form-control" disabled="disabled">

          <option value=""><?php foreach ($inspection as $inpect) {
            echo implode(',',array($inpect['type']));
          }?></option>
          </select>

        </td>
         </div>
         <div class="row">
         <div class="col-sm-4">
        <td>
        <select name="done_by[]" class="form-control" disabled="disabled">
          <option value=""><?php foreach ($drivers as $drive) {
            echo implode(',',array($drive['name']));
          };?></option>
             </select>
        </td>
      </div>
    </div>
      <div class="col-sm-4">
        <td> 
        <select class="form-control" name="status_id[]" id="status" disabled="disabled">
          <option value=""><?php foreach ($status as $state) {
            echo implode(',',array($state['name']));
          };?></option>
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
<?php echo form_open(); ?>
<div class="row">
    <div class="col-sm-5">
    <div class="form-group">
         <label for="service_type_id" class="col-sm-6"><b><?php echo lang('operation_name'); ?></b></label>
          <select class="form-control" name="service_type_id" id="service_types"  required>
              <option value=""></option>
              <?php
              foreach ($services_dropdown as $service_typo) {
                  echo "<option value=". $service_typo->id . ">" . ucfirst($service_typo->description) . "</option>";
              }
              ?>
           </select>
         </div>
         <div class="col-sm-6">
      <div class="form-group">
    <label for="assigned_to" class="col-sm-8"><b><?php echo lang('assigned_to'); ?></b></label>
    
     <select class="form-control" name="assigned_to" id="assigned_to" required>
      <option value=""></option>
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
      <option value=""></option>
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
    <label for="start_date " class="col-sm-6"><b><?php echo lang('start_date'); ?></b></label>
    
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
           <tbody>
            <?php foreach ($tasks as $task) {?>
            <tr>
              <td>
                <select class="form-control" disabled="">
                  <option value=""> <?php echo $task->description?></option>
                </select>
               </td>
              <td><?php echo $task->work?></td>
              <td>
                <select class="form-control" disabled="disabled">
                <option value=""><?php echo $task->employee?>
                  </option>
                </select>
              </td>
              <td><?php echo $task->start_date?></td>
              <td><?php echo $task->job_time_in?></td>
              
            </tr>
           <?php }?>
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

</div></div>
</div>

 <script src="<?php echo base_url();?>assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
        $("#service_type").select2();
        $("#job_type").select2();
        $("#vehicle_no").select2();
        $("#done_by").select2();
        $("#status").select2();
        $("#inspection_id").select2();
            $("#assigned_to").select2();
        $("#activity").select2();
        setDatePicker("#completion_date,#start_date");

   
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
<script>
function printPage() {
    window.print();
}
</script>
<style type="text/css">
  
</style>