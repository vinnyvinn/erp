 <!-- <?php //echo form_open('"id" = "jobs-form", "class" = "general-form", "role" = "form"'); ?> -->
 <form method="POST" action="<?php echo base_url('followups/add') ?>" enctype="multipart/form-data">
  <div class="modal-body clearfix">
   <div class="panel panel-default">
    <div class="panel-heading">Checklist</div>
    <div class="panel-body">
     <div class="row">
      <div class="col-sm-12" style="width: 50%">
        
        <div class="form-group vehicle_sel">
          <label for="vehicle_no"><b><?php echo lang('vehicle_no'); ?></b></label>
          <select class="form-control" name="vehicle_id" id="vehicle_id" class="vehicle" style="width: 100% !important;" disabled>
            <option value="<?php echo $followups['code'];?>"><?php echo $followups['code'];?></option>
            
          </select>
          
        </div>
      </div>
        </div>
        
          <div class="row">
            <div class="col-sm-12" style="width: 50%">
              <div class="form-group">
                <label for="km_reading"><b>Mileage</b></label>
                <input type="text" name="mileage" value="<?php echo $followups['mileage'].' '. $followups['measurement']?>" class="form-control" disabled>
                
                </div>
              </div>
            </div>
            <div class="row">
            <div class="col-sm-12" style="width: 50%">
              <div class="form-group">
                <label for="actual_km_reading"><b>Date</b></label>
                <input type="text" name="date" id="d_ate" class="form-control" value="<?php echo $followups['date']?>" disabled>
                
              </div>
            </div>
</div>
            <div class="form-group">
          <?php if(!empty($followups['checklist'])){?>
          <a href="<?php echo base_url().'uploads/images/'.$followups['checklist']; ?>" class="fa fa-download fa-2x">Download Checklist</a>
          <?php }?>
        </div>
      </div>

      <hr>
      <br>
    </form>
    <!-- <?php //echo form_close();?> -->
    
  <?php echo form_close(); ?>


<script type="text/javascript">
   $("#vehicle_id").select2();
   setDatePicker("#d_ate");
</script>

