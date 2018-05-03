<div class="container">
 <form method="POST" action="<?php echo base_url('preventive/update_checklist') ?>" enctype="multipart/form-data">
  <div class="modal-body clearfix">
   <div class="panel panel-default">
    <input type="hidden" name="id" value="<?php echo $jobs[0]['id'];?>">
    <div class="panel-heading">Job Card #<?php echo $jobs[0]['card_no']?>
     <a href="<?php echo base_url('preventive/print_job/'.$jobs[0]['id']);?>" class="btn btn-success pull-right">Download Page <i class="fa fa-download" aria-hidden="true"></i></a>
   </div>
   <div class="panel-body">
     <div class="row">
      <div class="col-sm-4">
        <div class="form-group vehicle_sel">
          <label for="vehicle_no" class="col-sm-10"><b><?php echo lang('vehicle_no'); ?></b></label>
          <select class="form-control" name="vehicle_no" id="vehicle_no" class="vehicle" style="width: 100% !important;" disabled>
            <option value=""><?php echo $jobs[0]['code'];?></option>
            <?php
            foreach ($vehicles_dropdown as $value) {
              echo "<option value=". $value->id . ">" . ucfirst($value->code) . "</option>";
            }
            ?>
          </select>

        </div>
        <br>
        <div class="form-group">

          <label for="job_service" class="col-sm-3"><b><?php echo lang('job_type'); ?></b></label>
          <input type="text" class="form-control" name="job_type_name" value="<?php echo $jobs[0]['job_type_id'];?>" disabled>

        </div>
        <div class="form-group">

          <label for="job_service"><b><?php echo lang('service_type'); ?></b></label>
          <input type="text" class="form-control" name="job_type_name" value="<?php echo $jobs[0]['service'];?>" disabled>

        </div>

        <div class="form-group">
          <label for="description" class="col-sm-3"><b><?php echo lang('description'); ?></b></label>
          <?php
          echo form_textarea(array(
            "id" => "description",
            "name" => "description",
            "value" => $jobs[0]['explanation'],
            "class" => "form-control",
            'rows' => '5',
            'cols' => '40',
            "disabled" => "disabled",
          ));
          ?>
        </div>
         
        <table style="width: 100%">
          <tr>
            <th>Spare Parts</th>
            <th>Quantity</th>
            <th>Cost</th>
          </tr>

          <?php

          $parts=json_decode($jobs[0]['part_name']);
          $quantity=json_decode($jobs[0]['quantity']);
          $cost=json_decode($jobs[0]['cost']);

          ?>

          <?php foreach ($parts as $key => $value): ?>

            <tr>
              <td><?= $value ?></td>
              <td><?= isset($quantity[$key]) ? number_format((int) $quantity[$key], 0) : '' ?></td>
              <td><?= isset($cost[$key]) ? number_format((int) $cost[$key], 2) : '' ?></td>
            </tr>

          <?php endforeach; ?>


        </table>
       
        <br>
        <div class="form-group">
          <?php if(!empty($jobs[0]['picture'])){?>
          <a href="<?php echo base_url().'uploads/images/'.$jobs[0]['picture']; ?>" class="fa fa-download fa-2x">Download Checklist</a>
          <?php }?>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="form-group">
          <label for="job_type" class="col-sm-10"><b>Service Provider</b></label>
          <select class="form-control" name="job_type_name" id="job_typo" required disabled>
            <option value=""><?php echo $jobs[0]['provider'] ? $jobs[0]['provider'] : $jobs[0]['internal_provider'] ?></option>     
          </select>

        </div>
      <div class="form-group">
          <label for="actual_date"><b>Actual Date</b></label>

          <?php
          echo form_input(array(
            "id" => "completion_date",
            "name" => "completion_date",
            "value" => $jobs[0]['actual_date'],
            "class" => "form-control",
            "disabled" => "disabled",

          ));
          ?>
        </div>
        <div class="form-group">
          <label for="completion_date"><b>Actual Completion Date</b></label>

          <?php
          echo form_input(array(
            "id" => "completion_date",
            "name" => "completion_date",
            "value" => $jobs[0]['completion_date'],
            "class" => "form-control",
            "disabled" => "disabled",

          ));
          ?>
        </div>
       
        <div class="form-group">
          <label for="driver"><b><?php echo lang('assigned_to'); ?></b></label>
          <p id="driver"><?php echo $jobs[0]['driver'];?></p>
        </div> 
        <?php if(!empty($jobs[0]['labour'])){?>
        <div class="col-sm-6">
        <div class="form-group">
          <label for="driver"><b>Labour</b></label>
          <p id="driver"><?php echo $jobs[0]['labour'];?></p>
        </div> 
      </div>
      <div class="col-sm-6">
        <div class="form-group">
          <label for="driver"><b>Cost</b></label>
          <p id="driver"><?php echo $jobs[0]['labour_cost'];?></p>
        </div> 
      </div>
      <?php }?>
      </div>

      <div class="col-sm-4">
        <div class="form-group">
          <b><?php echo lang('make_model'); ?></b>
          <br>
          <p id="model"><?php echo $jobs[0]['code'];?></p>      
        </div>
        <br><br>
        <div class="col-sm-6">
          <div class="form-group">
            <label for="time_in"><b><?php echo lang('time_in'); ?></b></label>

            <?php
            echo form_input(array(
              "id" => "time_in",
              "name" => "time_in",
              "value" => $jobs[0]['time_in'],
              "class" => "form-control",
              "type"  => "time",
              "disabled" => "disabled",

            ));
            ?>

          </div>
        </div>
        <div class="col-sm-6">
         <div class="form-group">
          <label for="time_out"><b>Time Out</b></label>

          <?php
          echo form_input(array(
            "id" => "time_in",
            "name" => "time_in",
            "value" => $jobs[0]['time_out'],
            "class" => "form-control",
            "type"  => "time",
            "disabled" => "disabled",

          ));
          ?>

        </div>
      </div>

      <div class="form-group">
        <label for="km_reading"><b><?php echo lang('km_reading'); ?></b></label>

        <?php
        echo form_input(array(
          "id" => "km_reading",
          "name" => "km_reading",
          "value" => number_format($jobs[0]['km_reading'],2),
          "class" => "form-control",
          "disabled" => "disabled",

        ));
        ?>
      </div>
      <div class="form-group">
        <label for="km_reading"><b>Miles</b></label>

        <?php
        echo form_input(array(
          "id" => "km_reading",
          "name" => "km_reading",
          "value" => number_format(($jobs[0]['km_reading']*0.621371),2),
          "class" => "form-control",
          "disabled" => "disabled",

        ));
        ?>
      </div>
      <div class="form-group">
        <label for="km_reading"><b>Hours</b></label>

        <?php
        echo form_input(array(
          "id" => "km_reading",
          "name" => "km_reading",
          "value" => $jobs[0]['hours'],
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
          "value" => $jobs[0]['balance'],
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
      <table class="table table-striped" id="items_table">
        <thead>
          <tr>

            <th><?php echo lang('inspection'); ?></th>
            <th><?php echo lang('done_by'); ?></th>
            <th><?php echo lang('status'); ?></th>

          </tr>
        </thead>
        <tbody>

          <tr>
            <td> 
              <?php
              if($inspections['inspect']){
                foreach ($inspections['inspect'] as $key => $value) { ?>
                <select  name="inspection_id" class="form-control" disabled="true">


                  <option value="">
                    <?php  echo $value[0]->type; ?>
                  </option>
                </select>
                <?php
              } }
              ?>
            </td>

            <td>
              <?php
              foreach ($inspections['emp'] as $key => $value) { ?>
              <select  name="inspection_id" class="form-control" disabled="true">


                <option value="">
                  <?php  echo $value[0]['name'];?>
                </option>
              </select>
              <?php
            }
            ?>
          </td>
          <td>
            <?php
            foreach ($inspections['status'] as $key => $value) { ?>
            <select  name="inspection_id" class="form-control" disabled="true">


              <option value="">
                <?php  echo $value[0]->name; ?>
              </option>
            </select>
            <?php
          }
          ?>
        </td>
      </tr>

    </tbody>
  </table>
</div>

</div>
<br>
</form>
</div></div></div></div>

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
 $('#gohome').on('click',function(){
  var job_service_id = $('#service_type_id').val();
  var job_typo = $('#job_typo').val();
  var vehicle_no = $('#vehicle_no').val();
  var time_in = $('#time_in').val();
  var km_reading      = $('#km_reading').val();
  var description       = $('#description').val();
  var completion_date = $('#completion_date').val();
  var status      = $('#status').val();
  var inspection       = $('#inspection_id').val();
  var fuel_balance       = $('#fuel_balance').val();
  var who = $('#done_by').val();
  $.ajax({
    type : "post",
    url  : "<?php echo site_url('preventive/save')?>",
    dataType : "json",
    data:{job_service_id:job_service_id, job_type_name:job_typo, vehicle_no:vehicle_no,km_reading:km_reading,time_in:time_in,description:description,completion_date:completion_date,
      status_id:status,inspection_id:inspection,done_by:who,fuel_balance:fuel_balance},
      success: function(data){
        console.log(data);
        $('[name="job_service_id"]').val("");
        $('[name="job_type_name"]').val("");
        $('[name="vehicle_no"]').val("");
        $('[name="km_reading"]').val("");
        $('[name="time_in"]').val("");
        $('[name="description"]').val("");
        $('[name="completion_date"]').val("");
        $('[name="status_id"]').val("");
        $('[name="inspection_id"]').val("");
        $('[name="done_by"]').val("");
        $('[name="fuel_balance"]').val("");
        window.location.href="<?php echo site_url('preventive')?>";
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
<script type="text/javascript">
  $('#km_reading').on('keyup',function(){
   var km = $(this).val();
   var km_rd=localStorage.getItem("km_r");
   $("#km_id").html(km-km_rd);
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
<link type="text/css" media="print" rel="stylesheet" href="assets/css/printstyle.css">