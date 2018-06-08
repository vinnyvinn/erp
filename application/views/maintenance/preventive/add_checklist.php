 <!-- <?php //echo form_open('"id" = "jobs-form", "class" = "general-form", "role" = "form"'); ?> -->
 <form method="POST" action="<?php echo base_url('followups/add') ?>" enctype="multipart/form-data">
  <div class="modal-body clearfix">
   <div class="panel panel-default">
    <div class="panel-heading">New Checklist</div>
    <div class="panel-body">
     <div class="row">
      <div class="col-sm-6">
        <div class="form-group vehicle_sel">
          <label for="vehicle_no"><b><?php echo lang('vehicle_no'); ?></b></label>
          <select class="form-control" name="vehicle_id" id="vehicle_id" class="vehicle" style="width: 100% !important;">
            <option>-- SELECT VEHICLE --</option>
            <?php
            foreach ($vehicles_dropdown as $value) {
              echo "<option value=". $value->id . ">" . ucfirst($value->code) . "</option>";
            }
            ?>
          </select>
          
        </div>
      </div>


      <div class="col-sm-6">
        <div class="form-group">
          <label for="km_reading"><b>Mileage</b></label>

          <?php
          echo form_input(array(
            "id" => "mileage",
            "name" => "mileage",
            "class" => "form-control",
            "required" => "required",
            "type" => "number"
          ));
          ?>
        </div>
      </div>
      <div class="col-sm-6">

          <div class="form-group">
            <label for="actual_km_reading"><b>Date</b></label>
            <input type="text" name="date" id="d_ate" class="form-control">

          </div>
        
        
         
       
     </div>
     <div class="col-sm-6">
     <div class="form-group">
         <label for="supplier_id"><b>Measurement</b></label>
         <select class="form-control" name="measurement" required>
          <option value="hrs">Hours</option>
          <option value="km">Kilometers</option>
          <option value="mi">Miles</option>
        </select>
        
      </div>
     </div>
     <div class="col-sm-6">
       <div class="form-group">
        <label for="client_id" style="color:#7988a2"><b>Upload Checklist</b></label>
        <input type='file' name='picture' size='20' class="btn btn-info"/>
      </div>      
    </div>
  </div>

  <hr>
  <br>
  <div class="form-group">
    <button type="submit" class="btn btn-success" id="gohome" name="submit"><span class="fa fa-check-circle"></span>Save</button>

    <a href="<?php echo base_url();?>followups" class="btn btn-danger" role="button">back</a>
  </div>
</form>
<!-- <?php //echo form_close();?> -->

<?php echo form_close(); ?>


<script type="text/javascript">
 $("#vehicle_id").select2();
 setDatePicker("#d_ate");
</script>

