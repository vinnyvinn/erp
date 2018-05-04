<?php

function convertToHoursMins($time, $format = '%02d:%02d') {
  if ($time < 1) {
    return;
  }
  $hours = floor($time / 60);
  $minutes = ($time % 60);
  return sprintf($format, $hours, $minutes);
}

?>
<div class="row">
  <div class="col-sm-12">
    <div class="panel-default">
     <div class="panel-heading">
       <div class="panel-title">Trimmer Sheets</div>
       <button class="btn btn-success" onclick="add_trimmer()" style="float: right;margin-top: -26px;margin-right: 100px"><i class="glyphicon glyphicon-plus"></i> <span style="font-size: 12px">Hire Trimmer</span></button> 
     </div>
     <div class="panel-body">   
      <br />
      <br />

      <table id="trimmers_table" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
          <tr>
            <th>ID</th>
            <th>Vessel Name</th>
            <th>Trimmer</th>
            <th>Time Taken</th>
            <th>Cost Per Hour</th>
            <th>Total</th>
            
            <th style="width:125px;">Action
            </th>
          </tr>
        </thead>
        <tbody>   
          <?php foreach($trimmer_sheets as $trimmer){?>
          <tr>
           <td><?php echo $trimmer['id'];?></td>
           <td><?php echo $trimmer['name'];?></td>
           <td><?php echo $trimmer['trimmer'];?></td>
           <td><?php 
             $time_in=strtotime($trimmer['time_in']);
             $time_out=strtotime( $trimmer['time_out']);
             $start_date=strtotime($trimmer['start_date']);
             $end_date=strtotime( $trimmer['end_date']);
             echo convertToHoursMins((($time_out+$end_date)-($time_in+$start_date))/60, '%02d hours %02d minutes');?>
           </td>
           <td><?php echo $trimmer['rate'];?></td>
           <td><?php echo $trimmer['total'];?></td>
           <td>
             <div class="col-xs-6" style="width: 20%;margin-right: -10px;">
              <button class="btn btn-warning edito" onclick="edit_trimmer(<?php echo $trimmer['id'];?>)" style="font-size: 10px;margin-left: -24px !important;"><i class="glyphicon glyphicon-pencil"></i></button>
            </div>
            <div class="col-xs-6">                   
             <button class="btn btn-danger" onclick="delete_trimmer(<?php echo $trimmer['id'];?>)" style="font-size: 10px"><i class="glyphicon glyphicon-remove"></i></button>
           </div>

         </td>
       </tr>
       <?php }?>



     </tbody>

     <tfoot>
      <tr>
       <th>ID</th>
       <th>Vessel Name</th>
       <th>Trimmer</th>
       <th>Time Taken</th>
       <th>Cost Per Hour</th>
       <th>Total</th>
       <th>Action</th>
     </tr>
   </tfoot>
 </table>

</div>
</div>
</div>
</div>
</div>
<link rel="stylesheet" href="<?php echo base_url();?>assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<?php echo base_url();?>assets/js/datatable/css/dataTables.bootstrap.min.css">

<script type="text/javascript">
  $(document).ready( function () {
    $('#trimmers_table').DataTable();
  } );
    var save_method; //for save method string
    var table;


    function add_trimmer()
    {
      save_method = 'add';
      $('#form')[0].reset(); // reset form on modals
      $('#modal_form').modal('show'); // show bootstrap modal
    //$('.modal-title').text('Add Person'); // Set Title to Bootstrap modal title
  }

  function edit_trimmer(id)
  {
    save_method = 'update';
      $('#form')[0].reset(); // reset form on modals

      //Ajax Load data from ajax
      $.ajax({
        url : "<?php echo site_url('trimmer_sheets/trimmer_edit/')?>/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {

          $('[name="id"]').val(data.id);
          $('[name="name"]').val(data.name);
          $('[name="trimmer"]').val(data.trimmer);
          $('[name="time_in"]').val(data.time_in);
          $('[name="time_out"]').val(data.time_out);
          $('[name="start_date"]').val(data.start_date);
          $('[name="end_date"]').val(data.end_date);
          $('[name="delayed_hours"]').val(data.delayed_hours);
          $('[name="delayed_minutes"]').val(data.delayed_minutes);
           $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
           $('.modal-title').text('Edit Trimmer'); // Set title to Bootstrap modal title

         },
         error: function (jqXHR, textStatus, errorThrown)
         {
          alert('Error get data from ajax');
        }
      });
    }



    function save()
    {
      var url;
      if(save_method == 'add')
      {
        url = "<?php echo site_url('trimmer_sheets/add_trimmer')?>";
      }
      else
      {
        url = "<?php echo site_url('trimmer_sheets/trimmer_update')?>";
      }

       // ajax adding data to database
       $.ajax({
        url : url,
        type: "POST",
        data: $('#form').serialize(),
        dataType: "JSON",
        success: function(data)
        {
               //if success close modal and reload ajax table
               $('#modal_form').modal('hide');
              location.reload();// for reload a page
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
              alert('Error adding / update data');
            }
          });
     }

     function delete_trimmer(id)
     {
      if(confirm('Are you sure delete this data?'))
      {
        // ajax delete data from database
        $.ajax({
          url : "<?php echo site_url('trimmer_sheets/trimmer_delete')?>/"+id,
          type: "POST",
          dataType: "JSON",
          success: function(data)
          {

           location.reload();
         },
         error: function (jqXHR, textStatus, errorThrown)
         {
          alert('Error deleting data');
        }
      });

      }
    }

  </script>

  <!-- Bootstrap modal -->
  <div class="modal fade" id="modal_form" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h3 class="modal-title">Trimmer Sheets Form</h3>
        </div>
        <div class="modal-body form">
          <form action="#" id="form" class="form-horizontal">
            <input type="hidden" value="" name="id"/>
            <div class="form-body">

              <div class="form-group">
                <label class="control-label col-md-3">Vessel Name</label>
                <div class="col-md-9">
                  <input name="name" placeholder="Vessel Name" class="form-control" type="text">
                </div>
              </div>

              <div class="form-group">
                <label class="control-label col-md-3">Trimmer</label>
                <div class="col-md-9">
                  <select class="form-control" name="trimmer" placeholder="Trimmer" id="trimmer_id" required>
                   <?php
                   foreach ($trimmers_dropdown as $trimmer) {
                    echo "<option value=". $trimmer->id . ">" . ucfirst($trimmer->name) . "</option>";
                  }
                  ?>
                </select>
              </div>
            </div>
            
            <div class="form-group">
              <label class="control-label col-md-3" for="rate"><b><?php echo lang('start_date');?></b></label>
              <div class="col-md-9">
                <input type="text" id="txtFromDate" name="start_date" class="form-control"/>
              </div>
              
            </div>
            
            <div class="form-group">
              <label class="control-label col-md-3" for="hours"><b><?php echo lang('end_date')?></b></label>
              <div class="col-md-9">
                <input type="text" name="end_date" id="txtToDate" name="end_date" class="form-control">
              </div>
              
            </div>

            <div class="form-group">
              <label class="control-label col-md-3">Time In</label>
              <div class="col-md-9">
                <input name="time_in" placeholder="Time In" class="form-control" id="time_in" type="time">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3">Time Out</label>
              <div class="col-md-9">
                <input name="time_out" placeholder="Time Out" class="form-control" id="time_out" type="time">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3">Delayed Hours</label>
              <div class="col-md-9">
                <input name="delayed_hours" placeholder="Delayed Hours" class="form-control" id="delayed_hours" type="number">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3">Delayed Minutes</label>
              <div class="col-md-9">
                <input name="delayed_minutes" placeholder="Delayed Minutes" class="form-control" id="time_out" type="number">
              </div>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" id="btnSave" onclick="save()" class="btn btn-primary">Save</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
  <!-- End Bootstrap modal -->

</body>
<script type="text/javascript">
  $(document).ready(function(){
    $("#txtFromDate").datepicker({
      minDate: 0,
      maxDate: "+60D",
      numberOfMonths: 2,
      onSelect: function(selected) {
        $("#txtToDate").datepicker("option","minDate", selected)
      }
    });
    $("#txtToDate").datepicker({ 
      minDate: 0,
      maxDate:"+60D",
      numberOfMonths: 2,
      onSelect: function(selected) {
       $("#txtFromDate").datepicker("option","maxDate", selected)
     }
   });  
  });

</script>
