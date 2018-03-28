<?php echo form_open(get_uri("lawsuits/close_case_save"),
    array("id" => "legaldocumentsform",
        "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">

    <input type="hidden" name="id" value="<?php echo $case_details->id; ?>"/>

    <div class="form-group">
        <label for="name" class=" col-md-3"> Comment</label>

        <div class=" col-md-9">
            <?php
            echo form_textarea(array(
                "id" => "comment",
                "name" => "comment",
                "class" => "form-control wysiwyg",
                "placeholder" => 'Comment',
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>

    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><span
                class="fa fa-close"></span> <?php echo lang('close'); ?></button>
        <button type="submit" class="btn btn-primary"><span
                class="fa fa-check-circle"></span> <?php echo lang('save'); ?>
        </button>
    </div>
</div>


<?php echo form_close(); ?>
<script type="text/javascript">
    $(document).ready(function () {
        //check if its an update hence load the actual value in the area



        $("#legaldocumentsform").appForm({
            onSuccess: function (result) {
                setTimeout(function () {
                    window.location.reload();
                }, 100);
            }
        });
        $("#name").focus();

    });
</script>