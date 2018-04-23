
<div id="page-content" class="p20 row">
  <div class="col-sm-3 col-lg-2">
    <?php
    $tab_view['active_tab'] = "technical";
    $this->load->view("settings/tabs", $tab_view);
    ?>
  </div>
  <div class="col-sm-9 col-lg-10">
    <div class="panel-default">
     <div class="panel-heading">
       <div class="panel-title">Assets</div>
       <a href="<?php echo base_url();?>assets_types/import_assets" class="btn btn-info" style="float: right;margin-top: -26px;margin-left: 100px"><i class="glyphicon glyphicon-upload"></i> <span style="font-size: 12px">Import From Sage</span></a>	
       <button class="btn btn-success" onclick="add_asset()" style="float: right;margin-top: -26px;margin-right: 100px"><i class="glyphicon glyphicon-plus"></i> <span style="font-size: 12px">Add Asset</span></button> 
     </div>
     <div class="panel-body">   
      <br />
      <br />

      <table id="jobs_table" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
          <tr>
            <th>ID</th>
            <th>Code</th>
            <th>Description</th>
            <th>Assigned To</th>
            <th>Warranty Expiry</th>
            <th>KM Reading</th>
            <th>Machine Hours</th>
            <th>Next Maintenance Date</th>
            <th style="width:125px;">Action
            </th>
          </tr>
        </thead>
        <tbody>   
          <?php foreach($assets as $asset){?>
          <tr>
           <td><?php echo $asset['id'];?></td>
           <td><?php echo $asset['code'];?></td>
           <td><?php echo $asset['description'];?></td>
           <td><?php echo $asset['name'];?></td>
           <td><?php echo $asset['warranty'];?></td>
           <td><?php echo $asset['km_reading'];?></td>
           <td><?php echo $asset['machine_hours'];?></td>
           <td><?php echo $asset['next_time'];?></td>                            
           <td>
             <div class="col-xs-6" style="width: 20%;margin-right: -10px;">
              <button class="btn btn-warning edito" onclick="edit_asset(<?php echo $asset['asset_ID'];?>)" style="font-size: 10px;margin-left: -24px !important;"><i class="glyphicon glyphicon-pencil"></i></button>
            </div>
            <div class="col-xs-6">                   
             <button class="btn btn-danger" onclick="delete_asset(<?php echo $asset['asset_ID'];?>)" style="font-size: 10px"><i class="glyphicon glyphicon-remove"></i></button>
           </div>

         </td>
       </tr>
       <?php }?>



     </tbody>

     <tfoot>
      <tr>
       <th>ID</th>
       <th>Code</th>
       <th>Description</th>
       <th>Assigned To</th>
       <th>Warranty Expiry</th>
       <th>KM Reading</th>
       <th>Machine Hours</th>
       <th>Next Maintenance Date</th>
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
    $('#jobs_table').DataTable();
  } );
    var save_method; //for save method string
    var table;


    function add_asset()
    {
      save_method = 'add';
      $('#form')[0].reset(); // reset form on modals
      $('#modal_form').modal('show'); // show bootstrap modal
    //$('.modal-title').text('Add Person'); // Set Title to Bootstrap modal title
  }

  function edit_asset(id)
  {
    save_method = 'update';
      $('#form')[0].reset(); // reset form on modals

      //Ajax Load data from ajax
      $.ajax({
        url : "<?php echo site_url('assets_types/asset_edit/')?>/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {

          $('[name="id"]').val(data.id);
          $('[name="code"]').val(data.code);
          $('[name="chasis_no"]').val(data.chasis_no);
          $('[name="year_of_make"]').val(data.year_of_make);
          $('[name="year_of_reg"]').val(data.year_of_reg);
          $('[name="engine_no"]').val(data.engine_no);
          $('[name="description"]').val(data.description);
          $('[name="driver_id"]').val(data.driver_id);
          $('[name="warranty"]').val(data.warranty);
          $('[name="next_time"]').val(data.next_time);
          $('[name="make"]').val(data.make); 
          $('[name="km_reading"]').val(data.km_reading);
          $('[name="hours"]').val(data.machine_hours);
            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Asset'); // Set title to Bootstrap modal title

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
        url = "<?php echo site_url('assets_types/add_asset')?>";
      }
      else
      {
        url = "<?php echo site_url('assets_types/asset_update')?>";
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

     function delete_asset(id)
     {
      if(confirm('Are you sure delete this data?'))
      {
        // ajax delete data from database
        $.ajax({
          url : "<?php echo site_url('assets_types/asset_delete')?>/"+id,
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
          <h3 class="modal-title">Assets Types Form</h3>
        </div>
        <div class="modal-body form">
          <form action="#" id="form" class="form-horizontal">
            <input type="hidden" value="" name="id"/>
            <div class="form-body">
              <div class="row">
                <div class="col-md-6" style="width: 45%;">
                  <div class="form-group">
                    <label class="control-label" style="margin-left: 10px;">Asset Code</label>
                    <input name="code" placeholder="Code" class="form-control" type="text" style="width: 90%;margin-left: 8px;">

                  </div>

                </div>

                <div class="col-md-6" style="width: 45%;">
                  <div class="form-group">
                    <label class="control-label">Description</label>
                    <input name="description" placeholder="Description" class="form-control" type="text">

                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6" style="width: 45%;">
                  <div class="form-group">
                    <label class="control-label" style="margin-left: 10px;">Chasis No.</label>
                    <input name="chasis_no" placeholder="Chasis No." class="form-control" type="text" style="width: 90%;margin-left: 8px;">

                  </div>
                </div>
                <div class="col-md-6" style="width: 45%;">
                  <div class="form-group">
                    <label class="control-label">Engine No.</label>
                    <input name="engine_no" placeholder="Engine No." class="form-control" type="text">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6" style="width: 45%;">
                  <div class="form-group">
                    <label class="control-label" style="margin-left: 10px;">Year of Make</label>
                    <input name="year_of_make" placeholder="Year of Make" class="form-control" type="date" style="width: 90%;margin-left: 8px;">
                  </div>
                </div>
                <div class="col-md-6" style="width: 45%;">
                  <div class="form-group">
                    <label class="control-label">Year of Registration</label>
                    <input name="year_of_reg" placeholder="Registration year" class="form-control" type="date">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6" style="width: 45%;">
                  <div class="form-group">
                    <label class="control-label" style="margin-left: 10px;">Hours</label>
                    <input name="hours" placeholder="Hours" class="form-control" 
                    type="text" style="width: 90%;margin-left: 8px;">
                  </div>
                </div>
                <div class="col-md-6" style="width: 45%;">
                  <div class="form-group">
                    <label class="control-label">Current KM Readings</label>
                    <input name="km_reading" placeholder="Current KM Readings" class="form-control" onmouseleave="kmReading()" 
                    type="text">
                  </div>
                </div>
              </div>

              <div class="row"> 
                <div class="col-md-6" style="width: 45%;">
                 <div class="form-group">
                  <label class="control-label" style="background-color: white;margin-left: 10px;">Assigned To</label>
                  <select class="form-control" name="driver_id" id="driver_id" placeholder="Assigned To" required">
                  <option value="">--Select Staff--</option>
                   <?php
                   foreach ($drivers_dropdown as $driver) {
                    echo "<option value=". $driver->id . ">" . ucfirst($driver->name) . "</option>";
                  }
                  ?>
                </select>
              </div>
            </div>
            <div class="col-md-6" style="width: 45%">
              <div class="form-group">
                <label class="control-label">Warranty Expiry</label>
                <input name="warranty" placeholder="Warranty" class="form-control" type="date">
              </div>
            </div>
          </div>

          <div class="row">

            <div class="col-md-6" style="width: 45%">
              <div class="form-group">
                <label class="control-label" style="margin-left: 10px;">Make</label>
                <input name="make" placeholder="Make" class="form-control" type="text" style="width: 90%;margin-left: 8px;">
              </div>
            </div>
            <div class="col-md-6" style="width: 45%">
              <div class="form-group">
                <label class="control-label" style="margin-left: 10px;">Next Maintenance Date</label>
                <input name="next_time" placeholder="Next visit time" class="form-control" type="date" style="width: 90%;margin-left: 8px;">
              </div>
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
 $("#driver_id").select2();
 function kmReading(){
  console.log('km Readings')
}
</script>

