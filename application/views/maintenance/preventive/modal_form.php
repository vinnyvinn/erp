<?php echo form_open(get_uri("preventive/save_job_type"), array("id" => "job_types-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">
      <div id="expense-dropzone" class="post-dropzone">
      
        <div class=" form-group">
            <label for="name" class=" col-md-3"><?php echo lang('name'); ?></label>
            <div class="col-md-9">
                <?php
                echo form_input(array(
                    "id" => "job_type_name",
                    "name" => "job_type_name",
                    "class" => "form-control",
                    "placeholder" => "Enter description name",
                    "data-rule-required" => true,
                    "data-msg-required" => lang("field_required"),
                ));
                ?>
            </div>
        </div>
        <div class="form-group">
            <label for="service_type" class=" col-md-3"><?php echo lang('service_type'); ?></label>
            <div class=" col-md-9">
                <select class="form-control" name="service_type" id="service_type" required>
                 <?php
              foreach ($services_dropdown as $value) {
                  echo "<option value=". $value->id . ">" . ucfirst($value->name) . "</option>";
              }
              ?>
           </select>
            </div>
        </div>
        <div class="form-group">
            <label for="job_id" class=" col-md-3"><?php echo lang('job_type'); ?></label>
            <div class=" col-md-9">
                 <select class="form-control" name="job_id" id="job_id" required>
                 <?php
              foreach ($jobs_dropdown as $value) {
                  echo "<option value=". $value->id . ">" . ucfirst($value->service_name) . "</option>";
              }
              ?>
           </select>
              
            </div>
        </div>
        

        <div class="modal-footer">
            <div class="row">
                <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fa fa-close"></span> <?php echo lang('close'); ?></button>
                <button type="submit" class="btn btn-primary"><span class="fa fa-check-circle"></span> <?php echo lang('save'); ?></button>
            </div>
        </div>
        <?php echo form_close(); ?>
    </div>
</div>

<script type="text/javascript">
    
</script>