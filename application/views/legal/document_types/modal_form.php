<?php echo form_open(get_uri("document_types/save"),
    array("id" => "legaldocumenttypesform",
        "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">
    <input type="hidden" name="id" value="<?php echo $model_info->id; ?>"/>
    <div class="form-group">
        <label for="name" class=" col-md-3"><?php echo lang('name'); ?></label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "name",
                "name" => "name",
                "value" => $model_info->name,
                "class" => "form-control",
                "placeholder" => lang('name'),
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="name" class=" col-md-3">Has Covered from and Covered to</label>
        <div class=" col-md-9">
            <?php
            $options = array(
                '1'         => 'Yes',
                '0'           => 'No',
            );
            echo form_dropdown('has_expiry', $options,$model_info->has_expiry);
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="name" class=" col-md-3">Requires Document Upload</label>
        <div class=" col-md-9">
            <?php
            $options = array(
                '0'           => 'No',
                '1'         => 'Yes',
            );
              echo form_dropdown('can_upload', $options, $model_info->can_upload);
            ?>
        </div>
    </div>

</div>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal"><span
                class="fa fa-close"></span> <?php echo lang('close'); ?></button>
    <button type="submit" class="btn btn-primary"><span class="fa fa-check-circle"></span> <?php echo lang('save'); ?>
    </button>

</div>
<?php echo form_close(); ?>

<script type="text/javascript">
    $(document).ready(function () {
        $('#can_upload').prop('checked', function(){
            console.log("checked ")

        });
        $("#legaldocumenttypesform").appForm({
            onSuccess: function (result) {
                setTimeout(function () {
                    window.location.reload();
                }, 100);
            }
        });
        $("#name").focus();

    });
</script>