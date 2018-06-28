<?php echo form_open(get_uri("ticket_types/save_ticket_status"), array("id" => "comments-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">
    <input type="hidden" name="id"/>
    <div class="form-group">
        <label for="description" class=" col-md-3">Add Comment</label>
        <div class=" col-md-9">
            <?php
            echo form_textarea(array(
                "id" => "description",
                "name" => "description",
              "class" => "form-control",
                "rows"  => "5",
                 "cols" => "10",
                "placeholder" => "your comment",
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
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
</script>
