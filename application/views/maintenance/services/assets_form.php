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
                    <th>Asset Code</th>
                    <th>Description</th>
                    <th>Assigned To</th>
                    <th>Warranty Expiry</th>
                    <th>Location</th>
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
                           <td><?php echo $asset['location'];?></td>
                          <td><?php echo $asset['next_time'];?></td>                            
                            <td>
                           <button class="btn btn-warning" onclick="edit_asset(<?php echo $asset['asset_ID'];?>)" style="font-size: 10px"><i class="glyphicon glyphicon-pencil"></i></button>

                           <button class="btn btn-danger" onclick="delete_asset(<?php echo $asset['asset_ID'];?>)" style="font-size: 10px"><i class="glyphicon glyphicon-remove"></i></button>


                                </td>
                      </tr>
                     <?php }?>



      </tbody>

      <tfoot>
        <tr>
         <th>ID</th>
         <th>Asset Code</th>
         <th>Description</th>
         <th>Assigned To</th>
         <th>Warranty Expiry</th>
         <th>Location</th>
         <th>Next Time</th>
         <th>Action</th>
        </tr>
      </tfoot>
    </table>

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
            $('[name="description"]').val(data.description);
            $('[name="driver_id"]').val(data.driver_id);
            $('[name="warranty"]').val(data.warranty);
            $('[name="next_time"]').val(data.next_time);
            $('[name="location"]').val(data.location); 
             $('[name="km_reading"]').val(data.km_reading);       
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
            
            <div class="form-group">
              <label class="control-label col-md-3">Asset Code</label>
              <div class="col-md-9">
                <input name="code" placeholder="Code" class="form-control" type="text">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3">Description</label>
              <div class="col-md-9">
                <input name="description" placeholder="Description" class="form-control" type="text">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3">Current KM Readings</label>
              <div class="col-md-9">
                <input name="km_reading" placeholder="Current KM Readings" class="form-control" type="text">
              </div>
            </div>
             <div class="form-group">
              <label class="control-label col-md-3">Assigned To</label>
              <div class="col-md-9">
            <select class="form-control" name="driver_id" id="driver_id" placeholder="Assigned To" required>
                 <?php
              foreach ($drivers_dropdown as $driver) {
                  echo "<option value=". $driver->id . ">" . ucfirst($driver->name) . "</option>";
              }
              ?>
            </select>
          </div>
        </div>
            <div class="form-group">
              <label class="control-label col-md-3">Warranty Expiry</label>
              <div class="col-md-9">
                <input name="warranty" placeholder="Warranty" class="form-control" type="date">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3">Location</label>
              <div class="col-md-9">
                <input name="location" placeholder="Location" class="form-control" type="text">
              </div>
            </div>
              <div class="form-group">
              <label class="control-label col-md-3">Next Maintenance Date</label>
              <div class="col-md-9">
                <input name="next_time" placeholder="Next visit time" class="form-control" type="date">
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