<div class="row">
  <div class="col-sm-12">
    <div class="panel-default">
     <div class="panel-heading">
       <div class="panel-title">Assets</div>
       <button class="btn btn-success" onclick="add_asset()" style="float: right;margin-top: -26px;margin-right: 100px"><i class="glyphicon glyphicon-plus"></i> <span style="font-size: 12px">Hire Asset</span></button> 
     </div>
     <div class="panel-body">   
      <br />
      <br />

      <table id="hire_table" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
          <tr>
            <th>ID</th>
            <th>Asset</th>
            <th>Tonnes</th>
            <th>Hours</th>
            <th>Issued By</th>
            <th>Hire From</th>
            <th>Hire To</th>
            <th>Measurement</th>
            <th>Rate</th>
            <th>Total</th>
            <th style="width:125px;">Action
            </th>
          </tr>
        </thead>
        <tbody>   
         <?php foreach($hires as $hire){?>
         <tr>
           <td><?php echo $hire['id'];?></td>
           <td><?php echo $hire['equipment'];?></td>
           <td><?php echo $hire['tonnes'];?></td>
           <td><?php echo $hire['hours'];?></td>
           <td><?php echo $hire['staff'];?></td>
           <td><a href="<?php echo base_url('hire_assets/view_invoice/'.$hire['id'])?>"><?php echo $hire['supplier']?></a>
           </td>
           <td><?php echo $hire['client'];?></td>
           <td><?php echo $hire['measurement'];?></td>
           <td><?php echo $hire['rate'];?></td>
           <td><?php echo $hire['total'];?></td>
         

           <td>
             <div class="col-xs-6" style="width: 20%;margin-right: -10px;">
              <button class="btn btn-warning edito" onclick="edit_asset(<?php echo $hire['id'];?>)" style="font-size: 10px;margin-left: -24px !important;"><i class="glyphicon glyphicon-pencil"></i></button>
            </div>
            <div class="col-xs-6">                   
             <button class="btn btn-danger" onclick="delete_asset(<?php echo $hire['id'];?>)" style="font-size: 10px"><i class="glyphicon glyphicon-remove"></i></button>
           </div>

         </td>
       </tr>
       <?php }?>



     </tbody>

     <tfoot>
      <tr>
        <th>ID</th>
        <th>Asset</th>
        <th>Tonnes</th>
        <th>Hours</th>
        <th>Issued By</th>
        <th>Hire From</th>
        <th>Hire To</th>
        <th>Measurement</th>
        <th>Rate</th>
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
    $('#hire_table').DataTable();
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
        url : "<?php echo site_url('hire_assets/asset_edit/')?>/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {

          $('[name="id"]').val(data.id);
          $('[name="asset"]').val(data.asset);
          $('[name="source"]').val(data.source);
          $('[name="staff_id"]').val(data.staff_id);
          $('[name="client_id"]').val(data.client_id);
          $('[name="supplier_id"]').val(data.supplier_id);
          $('[name="tonnes"]').val(data.tonnes);
          $('[name="hours"]').val(data.hours);
          $('[name="rate"]').val(data.rate);
          $('[name="currency"]').val(data.currency);
          $('[name="measurement"]').val(data.measurement);
          $('[name="project_id"]').val(data.project_id);
            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Hired Asset'); // Set title to Bootstrap modal title

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
        url = "<?php echo site_url('hire_assets/add_asset')?>";
      }
      else
      {
        url = "<?php echo site_url('hire_assets/asset_update')?>";
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
          url : "<?php echo site_url('hire_assets/delete')?>/"+id,
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
          <h3 class="modal-title">Hire Assets Form</h3>
        </div>
        <div class="modal-body form">
          <form action="#" id="form" class="form-horizontal">
            <input type="hidden" value="" name="id"/>
            <div class="form-body">


              <div class="form-group">
                <label class="control-label col-md-3">Source</label>
                <div class="col-md-9">
                  <select name="source" id="partsselected" class="form-control">
                    <option value="">-- Select Source --</option>
                    <option value="inhouse">In House</option> 
                    <option value="outsourced">Out Sourced</option>
                  </select> 

                </div>
              </div>

              <div id="inhouse" class="sources inhouse" style="display: none;">
                <div class="form-group">
                  <label class="control-label col-md-3">Asset</label>
                  <div class="col-md-9">
                    <select class="form-control" name="asset_inhouse" placeholder="Asset" id="asset_inhouse">

                     <?php
                     foreach ($hires_dropdown as $hire) {
                      echo "<option value=". $hire->idAssetNo . ">" . ucfirst($hire->cAssetDesc) . "</option>";
                    }
                    ?>
                  </select>
                </div>
              </div>
            </div>
            <div id="outsourced" class="sources outsourced">
              <div class="form-group">
                <label class="control-label col-md-3">Asset</label>
                <div class="col-md-9">
                  <select class="form-control" name="asset_outsourced" placeholder="Asset" id="asset_outsourced" required>

                   <?php
                   foreach ($outsource_dropdown as $outs) {
                    echo "<option value=". $outs->id . ">" . ucfirst($outs->description) . "</option>";
                  }
                  ?>
                </select>
              </div>
            </div>
          </div>

          <div class="form-group">
            <label class="control-label col-md-3">Measurement</label>
            <div class="col-md-9">
              <select name="measurement" id="partselected" class="form-control">
                <option value="">-- Select Measurement --</option>
                <option value="tonnes">Tonnes</option> 
                <option value="hours">Hours</option>
              </select> 

            </div>
          </div>
          <div id="tonnes" class="services tonnes" style="display: none;">
            <div class="form-group">
              <label class="control-label col-md-3">No of Tonnes</label>
              <div class="col-md-9">
                <input name="tonnes" placeholder="Tonnes" class="form-control" type="number">
              </div>
            </div>
          </div>
          <div id="hours" class="services hours">
            <div class="form-group">
              <label class="control-label col-md-3">Hours</label>
              <div class="col-md-9">
                <input name="hours" placeholder="Hours" class="form-control" type="text">
              </div>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-3">Rate</label>
            <div class="col-md-9">
              <input name="rate" placeholder="Rate" class="form-control" type="text">
            </div>
          </div>

          <div class="form-group">
            <label class="control-label col-md-3">Currency</label>
            <div class="col-md-9">
              <select name="currency" class="form-control" id="currency">
                <option value="">--Select Currency--</option>
                <option value="USD">USD</option>
                <option value="KSH">KSH</option>
              </select>
              </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-3">Issued By</label>
            <div class="col-md-9">
              <select class="form-control" name="staff_id" placeholder="Staff" id="staff" required>

               <?php
               foreach ($staffs_dropdown as $staff) {
                echo "<option value=". $staff->id . ">" . ucfirst($staff->name) . "</option>";
              }
              ?>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-md-3">Hire From</label>
          <div class="col-md-9">
            <select class="form-control" name="supplier_id" placeholder="supplier" id="supplier_id" required>

             <?php
             foreach ($providers_dropdown as $provider) {
              echo "<option value=". $provider->id . ">" . ucfirst($provider->name) . "</option>";
            }
            ?>
          </select>
        </div>
      </div>
      <div class="form-group">
        <label class="control-label col-md-3">Hire To</label>
        <div class="col-md-9">
          <select class="form-control" name="client_id" placeholder="Client" id="client_id" required>

           <?php
           foreach ($clients_dropdown as $client) {
            echo "<option value=". $client->id . ">" . ucfirst($client->name) . "</option>";
          }
          ?>
        </select>
      </div>
    </div>

<div class="form-group">
        <label class="control-label col-md-3">Add Project</label>
        <div class="col-md-9">
          <select class="form-control" name="project_id" placeholder="Project" id="project_id" required>

           <?php
           foreach ($projects_dropdown as $project) {
            echo "<option value=". $project->ProjectLink . ">" . ucfirst($project->ProjectName) . "</option>";
          }
          ?>
        </select>
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
  $('#supplier').select2();
  $('#staff').select2();
  $('#client_id').select2();
  $('#supplier_id').select2();
  $('#asset_inhouse').select2();
  $('#project_id').select2();
</script>
<script type="text/javascript">
  $(function() {
    $('#partselected').change(function(){
      $('.services').hide();
      $('#' + $(this).val()).show();
    });
  });
</script>
<script type="text/javascript">
  $(function() {
    $('#partsselected').change(function(){
      $('.sources').hide();
      $('#' + $(this).val()).show();
    });
  });
</script>