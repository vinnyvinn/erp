<div class="row">
  <div class="col-sm-12">
    <div class="panel-default">
     <div class="panel-heading">
       <div class="panel-title">Fuel</div>
       <button class="btn btn-success" onclick="add_fuel()" style="float: right;margin-top: -26px;margin-right: 100px"><i class="glyphicon glyphicon-plus"></i> <span style="font-size: 12px">Add Fuel</span></button> 
     </div>
     <div class="panel-body">   
      <br />
      <br />

      <table id="fuels_table" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
          <tr>
            <th>ID</th>
            <th>Supplier</th>
            <th>Vehicle</th>
            <th>Driver</th>
            <th>Litres</th>
            <th>Pump Price</th>
            <th>Cost</th>
            <th style="width:125px;">Action
            </th>
          </tr>
        </thead>
        <tbody>   
          <?php foreach($fuels as $fuel){?>
          <tr>
           <td><?php echo $fuel['id'];?></td>
           <td><?php echo $fuel['supplier'];?></td>
           <td><?php echo $fuel['vehicle'];?></td>
           <td><?php echo $fuel['staff'];?></td>
           <td><?php echo $fuel['litres'];?></td>
           <td><?php echo $fuel['price'];?></td>
           <td><?php echo $fuel['total'];?></td>

           <td>
             <div class="col-xs-6" style="width: 20%;margin-right: -10px;">
              <button class="btn btn-warning edito" onclick="edit_fuel(<?php echo $fuel['id'];?>)" style="font-size: 10px;margin-left: -24px !important;"><i class="glyphicon glyphicon-pencil"></i></button>
            </div>
            <div class="col-xs-6">                   
             <button class="btn btn-danger" onclick="delete_fuel(<?php echo $fuel['id'];?>)" style="font-size: 10px"><i class="glyphicon glyphicon-remove"></i></button>
           </div>

         </td>
       </tr>
       <?php }?>



     </tbody>

     <tfoot>
      <tr>
       <th>ID</th>
       <th>Supplier</th>
       <th>Vehicle</th>
       <th>Driver</th>
       <th>Litres</th>
       <th>Pump Price</th>
       <th>Cost</th>
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
    $('#fuels_table').DataTable();
  } );
    var save_method; //for save method string
    var table;


    function add_fuel()
    {
      save_method = 'add';
      $('#form')[0].reset(); // reset form on modals
      $('#modal_form').modal('show'); // show bootstrap modal
    //$('.modal-title').text('Add Person'); // Set Title to Bootstrap modal title
  }

  function edit_fuel(id)
  {
    save_method = 'update';
      $('#form')[0].reset(); // reset form on modals

      //Ajax Load data from ajax
      $.ajax({
        url : "<?php echo site_url('fuel/fuel_edit/')?>/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {

          $('[name="id"]').val(data.id);
          $('[name="litres"]').val(data.litres);
          $('[name="supplier_id"]').val(data.supplier_id);
          $('[name="staff_id"]').val(data.staff_id);
          $('[name="expense_id"]').val(data.expense_id);
          $('[name="invoice_no"]').val(data.invoice_no);
          $('[name="km_reading"]').val(data.km_reading);          
            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Fuel'); // Set title to Bootstrap modal title

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
        url = "<?php echo site_url('fuel/add_fuel')?>";
      }
      else
      {
        url = "<?php echo site_url('fuel/fuel_update')?>";
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

     function delete_fuel(id)
     {
      if(confirm('Are you sure delete this data?'))
      {
        // ajax delete data from database
        $.ajax({
          url : "<?php echo site_url('fuel/delete')?>/"+id,
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
          <h3 class="modal-title">Fuel Form</h3>
        </div>
        <div class="modal-body form">
          <form action="#" id="form" class="form-horizontal">
            <input type="hidden" value="" name="id"/>
            <div class="form-body">

              <div class="form-group">
                <label class="control-label col-md-3">Litres</label>
                <div class="col-md-9">
                  <input name="litres" placeholder="Litres" class="form-control" type="text">
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-md-3">Invoice No.</label>
                <div class="col-md-9">
                  <input name="invoice_no" placeholder="Invoice No." class="form-control" type="text">
                </div>
              </div>
              
                <div class="form-group">
                  <label class="control-label col-md-3">Vehicle</label>
                  <div class="col-md-9">
                    <select class="form-control" name="vehicle_id" placeholder="Vehicle" id="vehicle_id" required>

                     <?php
                     foreach ($vehicles_dropdown as $vehicle) {
                      echo "<option value=". $vehicle->id . ">" . ucfirst($vehicle->code) . "</option>";
                    }
                    ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-md-3">Previous KM</label>
                <div class="col-md-9">
                 <p id="prevoius_km_reading"></p>
                </div>
                </div>
              <div class="form-group">
                <label class="control-label col-md-3">Current KM Readings</label>
                <div class="col-md-9">
                  <input name="km_reading" placeholder="KM Readings" class="form-control" id="km_reading" type="text">
                </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-md-3">Supplier</label>
                  <div class="col-md-9">
                    <select class="form-control" name="supplier_id" placeholder="Supplier" id="supplier" required>

                     <?php
                     foreach ($suppliers_dropdown as $supplier) {
                      echo "<option value=". $supplier->id . ">" . ucfirst($supplier->name) . "</option>";
                    }
                    ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-md-3">Driver</label>
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
              <label class="control-label col-md-3">Expenses(Optional)</label>
              <div class="col-md-9">
                <select class="form-control" name="expense_id" placeholder="Expenses" id="expense">
                 <option value=""></option>
                 <?php
                 foreach ($expenses_dropdown as $expense) {
                  echo "<option value=". $expense->id . ">" . ucfirst($expense->name) . "</option>";
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
  $('#expense').select2();
  $('#vehicle_id').select2();
</script>
<script type="text/javascript">
             $(document).ready(function() {
             $('select[name="vehicle_id"]').on('change', function() {
            var km_id = $(this).val();
                   var path="<?php echo site_url('fuel/km_reading')?>/" + km_id;
                $.ajax({
                type  : 'ajax',
                url   : path,
                async : false,
                dataType : 'json',
                success : function(data){
                   var html ='<p>'+data+'</p>';
                   $('#prevoius_km_reading').html(html);

                }
 
            });
        });
        });
</script>