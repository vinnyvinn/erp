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
            <th>Issued By</th>
            <th>Hire From</th>
            <th>Hire To</th>
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
           <td><?php echo $hire['staff'];?></td>
           <td><?php echo $hire['supplier'];?></td>
           <td><?php echo $hire['client'];?></td>
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
        <th>Issued By</th>
        <th>Hire From</th>
         <th>Hire To</th>
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
          $('[name="staff_id"]').val(data.staff_id);
          $('[name="client_id"]').val(data.client_id);
          $('[name="supplier_id"]').val(data.supplier_id);
          $('[name="tonnes"]').val(data.tonnes);
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
                <label class="control-label col-md-3">Asset</label>
                <div class="col-md-9">
                  <select class="form-control" name="asset" placeholder="Asset" id="asset" required>

                   <?php
                   foreach ($equipments_dropdown as $equipment) {
                    echo "<option value=". $equipment->id . ">" . ucfirst($equipment->description) . "</option>";
                  }
                  ?>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3">Tonnes</label>
              <div class="col-md-9">
                <input name="tonnes" placeholder="Tonnes" class="form-control" type="text">
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
               foreach ($providers_dropdown as $client) {
                echo "<option value=". $client->id . ">" . ucfirst($client->name) . "</option>";
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
</script>