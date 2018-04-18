   <!-- <?php //echo form_open('"id" = "jobs-form", "class" = "general-form", "role" = "form"'); ?> -->
   <form method="POST" action="<?php echo base_url('reactive/save') ?>" enctype="multipart/form-data">
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
                <option>-- SELECT VEHICLE --</option>
                <?php
                foreach ($vehicles_dropdown as $value) {
                  echo "<option value=". $value->id . ">" . ucfirst($value->code) . "</option>";
                }
                ?>
              </select>
              
            </div>
            <br>
            <div class="form-group">
             <label for="supplier_id" class="col-sm-10"><b><?php echo lang('service_provider'); ?></b></label>
             <select class="form-control" name="supplier_id" id="supplier_id" required>
              <?php
              foreach ($providers_dropdown as $provider) {
                echo "<option value=". $provider->id . ">" . ucfirst($provider->name) . "</option>";
              }
              ?>
            </select>
            
          </div>

          <br>
          <div class="form-group">

            <label for="job_service" class="col-sm-10"><b>Service Type</b></label>
            <select class="form-control" name="service_type_id" id="s_type_id" disabled="disabled">
            </select>
            
          </div>
          <br>
          <div class="form-group">
            <label for="client_id" style="color:#7988a2"><?php echo lang("upload_file"); ?>
             <input type='file' name='picture' size='20' />
           </label>
           
         </div>
         <br>

       </div>
       <div class="col-sm-4">
        <div class="form-group">
          <label for="job_type" class="col-sm-10"><b>Job Type</b></label>
          <input type="text" class="form-control" name="job_type_name" id="job_typo">
          
        </div>

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
          <label for="driver"><b><?php echo lang('assigned_to'); ?></b></label>
          <p id="driver"></p>
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
        <div class="col-sm-6">
          <div class="form-group">
            <label for="previous_km_reading"><b><?php echo lang('previous_km_reading'); ?></b></label>
            <p id="previous_km_reading">
            </p>
          </div>
        </div>

        <div class="col-sm-6">
          <div class="form-group">
            <label for="km_reading"><b><?php echo lang('km_reading'); ?></b></label>
            
            <?php
            echo form_input(array(
              "id" => "km_reading",
              "name" => "km_reading",
              "class" => "form-control",

            ));
            ?>
          </div>
        </div>

        <div class="form-group input-group-sm">
          <label for="actual_km_reading"><b>Actual KM Covered</b></label>
          <p id="km_id"></p>
          
        </div>
        <div class="form-group">
          <label for="hours " class="col-sm-8"><b>Hours</b></label>
          <input type="text"  class="form-control" name="hours" id="hours" >
        </div>

        <div class="form-group">
          <label for="hours " class="col-sm-8"><b>Miles</b></label>
          <input type="text"  class="form-control" name="miles" id="miles" >
        </div>

        <div class="form-group">
          <label for="fuel_balance " class="col-sm-8"><b><?php echo lang('fuel_balance'); ?></b></label>
          <select class="form-control" name="fuel_balance" id="fuel_balance" required>
            <?php
            foreach ($fuel_dropdown as $fuel) {
              echo "<option value=". $fuel->id . ">" . ucfirst($fuel->description) . "</option>";
            }
            ?>
          </select>
        </div>
      </div>
    </div>
    <hr>

    <div class="row">
      <div class="col-sm-12">
        <table class="table table-striped" id="items_table">
          <thead>
            <tr>
              
              <th><?php echo lang('inspection'); ?></th>
              <th><?php echo lang('done_by'); ?></th>
              <th><?php echo lang('status'); ?></th>
              <th><button type="button" name="add" class="btn btn-success btn-sm add"><span class="glyphicon glyphicon-plus"></span></button></th>
              
            </tr>
          </thead>
          <tbody>
            
          </tbody>
        </table>
      </div>

    </div>
    <br>
    <div class="form-group">
      <button type="submit" class="btn btn-success" id="gohome" name="submit"><span class="fa fa-check-circle"></span>Process</button>

      <a href="<?php echo base_url();?>preventive" class="btn btn-danger" role="button">back</a>
    </div>
  </form>
  <!-- <?php //echo form_close();?> -->
  <hr>
  <?php echo form_close();?>
  <div class="row">
   <div class="col-sm-12">
    <table class="table table-striped" style="display: none;">
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
  $("#status_id").select2();
  $("#inspection_id").select2();
  $("#service_type").select2();
  $("#assigned_to").select2();
  $("#activity").select2();
  $("#supplier_id").select2();
  
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
    var km_id = $(this).val();
    var path="<?php echo site_url('preventive/km_reading')?>/" + km_id;
    $.ajax({
      type  : 'ajax',
      url   : path,
      async : false,
      dataType : 'json',
      success : function(data){
        localStorage.setItem('km_r', data);
        var html ='<p>'+data+'</p>';
        $('#previous_km_reading').html(html);

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
    var activity    = $('#activity').val();
    $.ajax({
      type : "POST",
      url  : "<?php echo site_url('preventive/save_task')?>",
      dataType : "json",
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
  var inputid=0;
  $(document).on('click', '.add', function(){
    inputid ++;
    var status_data="<?php echo site_url('preventive/status_data')?>";
    $.ajax({
      type: "GET",
      url: status_data,
      dataType: "json",
      success: function (status_data) {
        var value = status_data;
        
        var html = '';
        html += '<tr>';
        html += '<td>'+ '<select name="inspection_id['+inputid+'][]" class="form-control" id="inspection_id" onchange="myFunction()">';
        $.each(status_data['inspect'], function(value,ins)
        {
          html += '<option value="'+ ins['id'] +'">'+ ins['type'] +'</option>' ;
        }); 
        html +=  '</select></td>';
        html += '<td>'+ '<select name="done_by['+inputid+'][]" class="form-control" id="done_by">';
        $.each(status_data['emp'], function(value,empl)
        {
         
          html += '<option value="'+ empl['id'] +'">'+ empl['name'] +'</option>' ;
        }); 
        html +=  '</select></td>';
        html += '<td>'+ '<select name="status_id['+inputid+'][]" class="form-control" id="status_id">';
        $.each(status_data['status'], function(value,item)
        {
          
          html += '<option value="'+ item['id'] +'">'+ item['name'] +'</option>' ;
        });
        
        html +=  '</select></td>'; 
        html += '<td><button type="button" name="remove" class="btn btn-danger btn-sm remove"><span class="glyphicon glyphicon-minus"></span></button></td></tr>';
        $('#items_table').append(html);
        
      }
    });
  });
  
  $(document).on('click', '.remove', function(){
    $(this).closest('tr').remove();
  });

  $('#gohome').on('submit',function(){
    var inspection= $('#inspection_id').val();
    console.log(inspection);

    var  who= $('#done_by').val();
    console.log('abcd');
    var status= $('#status_id').val();
 //                $.ajax({
 //                type : "post",
 //                url  : "<?php echo site_url('preventive/save')?>",
 //                dataType : "json",
 //                 data:{inspection_id:inspection,done_by:who,status_id:status},
 //                    success: function(data){
 //                      console.log('thank  you'+data);
 
 //   }
 
 // });
});

</script>
<script>
  function myFunction() {
    $('#inspection_id').each(function(){
     console.log($(this).val());
   }
   );
  }
</script>
<script type="text/javascript">
 $(document).ready(function() {
   $('select[name="vehicle_no"]').on('change', function() {
    var warranty_id = $(this).val();
    var path="<?php echo site_url('preventive/warrantyCheck')?>/" + warranty_id;
    $.ajax({
      type  : 'ajax',
      url   : path,
      async : false,
      dataType : 'json',
      success : function(data){
        
       if (!data.length){ 
         alert('sorry,this vehicle is still under warranty');
         window.location.replace('job_card');
       }
       else{
        return;
      }
    }
    
  });
  });
 });
</script>
<script type="text/javascript">
  $('#km_reading').on('keyup',function(){
   var km = $(this).val();
   var km_rd=localStorage.getItem("km_r");
   $("#km_id").html(km-km_rd);
 });
</script>

<script type="text/javascript">
 $(document).ready(function() {
  $('select[name="vehicle_no"]').on('change', function() {
    var id = $(this).val();
    var path = "<?php echo site_url('preventive/selectedService')?>/" + id;
    console.log(path)
    if(id) {
      $.ajax({
        url: path,
        type: "GET",
        dataType: "json",
        success:function(data) {
                      // $('select[name="job_type_name"]').empty();
                      $.each(data, function(key, value) {
                        console.log(value.name);
                        $('select[name="service_type_id"]').append('<option value="'+ value.id +'">'+ value.name +'</option>');
                      });
                      
                      
                    }
                  });
    }else{
      $('select[name="service_type_id"]').empty();
    }
  });
});
 
</script>