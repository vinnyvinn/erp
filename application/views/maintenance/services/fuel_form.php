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
            <th>Mileage(KM)</th>
            <th>Driver</th>
            <th>Fuel Type</th>
            <th>Litres</th>
            <th>Pump Price</th>
            <th>Cost</th>
            <th>Date</th>
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
           <td><?php echo $fuel['mileage'];?></td>
           <td><?php echo $fuel['staff'];?></td>
           <td><?php echo $fuel['fuel_id'];?></td>
           <td><?php echo $fuel['litres'];?></td>
           <td><?php echo $fuel['price'];?></td>
           <td><?php echo $fuel['total'];?></td>
           <td><?php echo $fuel['done_on'];?></td>

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
       <th>Mileage(KM)</th>
       <th>Driver</th>
       <th>Fuel Type</th>
       <th>Litres</th>
       <th>Pump Price</th>
       <th>Cost</th>
       <th>Date</th>
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
          $('[name="done_on"]').val(data.done_on);   
          $('[name="currency"]').val(data.currency);  
          $('[name="fuel_id"]').val(data.fuel_id);     
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
              <div class="row">
                <div class="col-md-6" style="width: 45%;">
                  <div class="form-group">
                    <label class="control-label"  style="margin-left: 10px;">Litres</label>
                    <input name="litres" placeholder="Litres" class="form-control" type="number" style="width: 90%;margin-left: 8px;">
                  </div>
                </div>
                <div class="col-md-6" style="width: 45%;">
                 <div class="form-group">
                  <label class="control-label">Fuel Type</label>
                  <select class="form-control" name="fuel_id" placeholder="Fuel Type" id="fuel_id" required>
                   <option value="petrol">Petrol</option>
                   <option value="diesel">Diesel</option>
                </select>
              </div>
            </div>
          </div>

          <div class="row">
           <div class="col-md-6" style="width: 45%;">
            <div class="form-group">
              <label class="control-label" style="margin-left: 10px;">Invoice No.</label>
              <input name="invoice_no" placeholder="Invoice No." class="form-control" type="text" style="width: 90%;margin-left: 8px;">
            </div>
          </div>

          <div class="col-md-6" style="width: 45%;">
            <div class="form-group">
              <label class="control-label">Currency</label>
              <select class="form-control" name="currency" placeholder="Currency">
                <option value="">--Choose Currency--</option>
                <option value="USD">USD</option>
                <option value="KSH">KSH</option>

              </select>
            </div>
          </div>
        </div>

        <div class="row">
         <div class="col-md-6" style="width: 45%;">
          <div class="form-group">
            <label class="control-label" style="margin-left: 10px;">Vehicle</label>
            <select class="form-control" name="vehicle_id" placeholder="Vehicle" id="vehicle_id" style="width: 90%;margin-left: 8px;" required>
              <option value="">--Choose Vehicle--</option>
              <?php
              foreach ($vehicles_dropdown as $vehicle) {
                echo "<option value=". $vehicle->id . ">" . ucfirst($vehicle->code) . "</option>";
              }
              ?>
            </select>
          </div>
        </div>

        <div class="col-md-6" style="width: 45%;">
          <div class="form-group">
            <label class="control-label">Previous KM</label>
            <p id="prevoius_km_reading"></p>
          </div>
        </div>
      </div>
      <div class="form-group">
        <label class="control-label" style="margin-left: 10px;">Current KM Readings</label>

        <input name="km_reading" placeholder="KM Readings" class="form-control" id="km_reading" type="text" style="width: 90%;margin-left: 8px;">
      </div>
    </div>

    <div class="row">
     <div class="col-md-6" style="width: 45%;">
      <div class="form-group">
        <label class="control-label" style="margin-left: 10px;">Supplier</label>
        <select class="form-control" name="supplier_id" placeholder="Supplier" id="supplier" style="width: 90%;margin-left: 8px;" required>
         <?php
         foreach ($suppliers_dropdown as $supplier) {
          echo "<option value=". $supplier->id . ">" . ucfirst($supplier->name) . "</option>";
        }
        ?>
      </select>
    </div>
  </div>
  <div class="col-md-6" style="width: 45%;">
    <div class="form-group">
      <label class="control-label">Driver</label>
      <select class="form-control" name="staff_id" placeholder="Staff" id="staff" required>

       <?php
       foreach ($staffs_dropdown as $staff) {
        echo "<option value=". $staff->id . ">" . ucfirst($staff->name) . "</option>";
      }
      ?>
    </select>
  </div>
</div>
</div>

<div class="row">
  <div class="col-md-6"  style="width: 45%;">
    <div class="form-group">
      <label class="control-label"  style="margin-left: 10px;">Expenses(Optional)</label>
      <select class="form-control" name="expense_id" placeholder="Expenses" id="expense" style="width: 90%;margin-left: 8px;">
       <option value="">--Choose Expenses--</option>
       <?php
       foreach ($expenses_dropdown as $expense) {
        echo "<option value=". $expense->id . ">" . ucfirst($expense->name) . "</option>";
      }
      ?>
    </select>
  </div>
</div>
<div class="col-md-6" style="width: 45%;">
  <div class="form-group">
    <label class="control-label">Date</label>
    <input name="done_on" placeholder="Fueled On" class="form-control" id="done_on" type="text">
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
  $('#supplier').select2();
  $('#staff').select2();
  $('#expense').select2();
  $('#vehicle_id').select2();
  setDatePicker('#done_on');
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