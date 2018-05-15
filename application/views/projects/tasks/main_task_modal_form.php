<?php echo form_open(get_uri("projects/save_main_task"), array("id" => "main-task-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">
    <input type="hidden" name="project_id" value="<?php echo $project_id; ?>" />
    <input type="hidden" name="data-type" id="data-type">
    <div class="form-group">
        <label for="title" class=" col-md-3"><?php echo lang('title'); ?></label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "title",
                "name" => "title",
                "class" => "form-control",
                "placeholder" => lang('title'),
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="description" class=" col-md-12"><?php echo lang('description'); ?></label>
        <div class=" col-md-12">
            <?php
            echo form_textarea(array(
                "id" => "description",
                "name" => "description",
                "class" => "form-control wysiwyg",
                "placeholder" => lang('description'),
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
    $(document).ready(function () {
        $('#data-type').val(localStorage.getItem('isPopup') == 'true' ? 'plain' : 'normal');
        $("#main-task-form").appForm({
            onSuccess: function (result) {
                if (localStorage.getItem('isPopup') == 'true') {
                    postTask.updateListeners(JSON.parse(result.data));
                }
            }
        });

        $("#title").focus();

        $('[data-toggle="tooltip"]').tooltip();
    });
</script>    