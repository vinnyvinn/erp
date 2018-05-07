<?php echo form_open(get_uri("ict_reports/save_depertment"), array("id" => "project-member-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">
    <input type="hidden" name="id" value="<?php echo $model_info->id; ?>" />
    <input type="hidden" name="sage_id" value="<?php echo $sage_id; ?>" />
    <div class="form-group" style="min-height: 50px">
        <label for="sage_dept" class=" col-md-3">Department</label>
        <div class="col-md-9">
             <select class="select2 validate-hidden" name="sage_dept" id="sage_dept" required>
              <?php
              foreach ($depertments_dropdown as $value) {
                  echo "<option value=". $value->id . ">" . ucfirst($value->name) . "</option>";
              }
              ?>
            </select>
        </div>
    </div>
</div>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fa fa-close"></span> <?php echo lang('close'); ?></button>
    <button type="submit" class="btn btn-primary"><span class="fa fa-check-circle"></span> <?php echo lang('save'); ?></button>
</div>
<?php echo form_close(); ?>

<script type="text/javascript">
    $(document).ready(function() {
        $("#project-member-form").appForm({
            onSuccess: function(result) {
               setTimeout(function () {
                    window.location.reload();
                }, 100);
            }
        });
        $("#project-member-form .select2").select2();
    });
</script>    