 <!-- <?php //echo form_open('"id" = "jobs-form", "class" = "general-form", "role" = "form"'); ?> -->
 <script type="text/javascript" src="<?php echo base_url('/bower_components/moment/min/moment.min.js');?>"></script>
 <script type="text/javascript" src="<?php echo base_url('/bower_components/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js');?>"></script>
  <link rel="stylesheet" href="<?php echo base_url('/bower_components/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css');?>" />
 
 <form method="POST" action="<?php echo base_url('fuel/add_other_fuel') ?>">
  <div class="modal-body clearfix">
   <div class="panel panel-default">
    <div class="panel-heading">Other Fuel Form</div>
    <div class="panel-body">
     <div class="row">
      <div class="col-sm-4">
       <div class="form-group">
            <label class="control-label">Litres</label>
          <input name="litres" placeholder="Litres" class="form-control" type="number">
             </div>
      </div>


      <div class="col-sm-4">
                <div class="form-group">
                  <label class="control-label">Fuel Type</label>
                  <select class="form-control" name="fuel_id" placeholder="Fuel Type" id="fuel_id" required>
                   <option value="petrol">Petrol</option>
                   <option value="diesel">Diesel</option>
                 </select>
               </div>
      </div>
      <div class="col-sm-4">

          <div class="form-group">
      
            <label class="control-label">Date</label>
                <input name="invoice_no" placeholder="Invoice No." class="form-control" type="text">
          </div>
        
        
              
           </div>
         </div>

         <div class="row">
        <div class="col-sm-4">
           <div class="form-group">
           <label class="control-label">Currency</label>
                <select class="form-control" name="currency" placeholder="Currency">
                  <option value="">--Choose Currency--</option>
                  <option value="USD">USD</option>
                  <option value="KSH">KSH</option>

                </select>
        
      </div>
     </div>

     <div class="col-sm-4">
       <div class="form-group">
         <label class="control-label">Vehicle</label>
              <input type="text"  class="form-control" name="vehicle_id" placeholder="Vehicle" id="vehicleid" >
      </div>      
    </div>
  
  <div class="col-sm-4">

          <div class="form-group">
      
           <label class="control-label">Current KM Readings</label>

            <input name="km_reading" placeholder="KM Readings" class="form-control" id="kmreading" type="number">
          </div>
                 
       
           </div>
         </div>

          <div class="row">
        <div class="col-sm-4">
            <div class="form-group">
          <label class="control-label">Supplier</label>
          <select class="form-control" name="supplier_id" placeholder="Supplier" id="supplier"  required>
           <?php
           foreach ($suppliers_dropdown as $supplier) {
            echo "<option value=". $supplier->id . ">" . ucfirst($supplier->name) . "</option>";
          }
          ?>
        </select>
      </div>
     </div>

     <div class="col-sm-4">
       <div class="form-group">
       <label class="control-label">Driver</label>
        <input type="text" name="staff_id" placeholder="Staff" id="driver_id" class="form-control">
      </div>      
    </div>
    <div class="col-sm-4">
        <div class="form-group">
          <label class="control-label"  style="margin-left: 10px;">Expenses(Optional)</label>
          <select class="form-control" name="expense_id" placeholder="Expenses" id="expense_id" style="width: 90%;margin-left: 8px;">
           <option value="">--Choose Expenses--</option>
           <?php
           foreach ($expenses_dropdown as $expense) {
            echo "<option value=". $expense->id . ">" . ucfirst($expense->name) . "</option>";
          }
          ?>
        </select>
      </div>

           
           
    </div>

  </div>
  <div class="row" style="width: 25%">
    <label style="margin-left: 15px;">Date</label>
    <div class="col-sm-12">
    <div class="form-group">
                <div class='input-group date' id='datetimepicker1'>
                    <input type='text' class="form-control" name="done_on" />
                    <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
    </div>
  </div>
  </div>
  </div>
 
  <div class="form-group" style="margin-left: 10%">
    <button type="submit" class="btn btn-success" id="gohome" name="submit"><span class="fa fa-check-circle"></span>Save</button>

    <a href="<?php echo base_url();?>followups" class="btn btn-danger" role="button">back</a>
  </div>
</form>
<!-- <?php //echo form_close();?> -->

<?php echo form_close(); ?>


<script type="text/javascript">
 $("#vehicle_id").select2();
 setDatePicker("#d_ate");
 $(function () {
            $('#datetimepicker1').datetimepicker();
            });
</script>

