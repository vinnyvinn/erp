<?php echo form_open(get_uri("ticket_types/assign_ticket"), array("id" => "comments-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">
    <input type="hidden" name="id"/>
    <div class="form-group">
        <label for="description" class=" col-md-3"><?php echo lang('assign_to'); ?></label>
        <div class=" col-md-9">
            <select class="form-control" name="assign_to" id="assign_to" style="width: 100% !important;">
            
            <?php
            foreach ($ict_memebers_dropdown as $value) {
              echo "<option value=". $value->email . ">" . ucfirst($value->username) . "</option>";
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
        $("#comments-form").appForm({
            onSuccess: function(result) {

            }
        });
        $("#description").focus();
    });

    $("#assign_to").select2();
</script>
