<?php echo form_open(get_uri("legal/save"),
    array("id" => "legaldocumentsform",
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
        <label for="client_id" class=" col-md-3">Document Type</label>
        <div class="col-md-9">
            <?php
            echo form_dropdown("document_type", $doc_types, array($model_info->document_type),
                "id='client_id' class='select2 validate-hidden' data-rule-required='true', data-msg-required='" . lang('field_required') . "'");
            ?>
        </div>



    </div>


    <div class="form-group">
        <label for="deadline" class=" col-md-3"><?php echo lang('covered_from'); ?></label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "covered_from",
                "name" => "covered_from",
                "value" => $model_info->covered_from * 1 ? $model_info->covered_from : "",
                "class" => "form-control",
                "placeholder" => lang('covered_from'),
                "data-date-start-date" => "+1d"
            ));
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="deadline" class=" col-md-3"><?php echo lang('covered_to'); ?></label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "covered_to",
                "name" => "covered_to",
                "value" => $model_info->covered_to * 1 ? $model_info->covered_to : "",
                "class" => "form-control",
                "placeholder" => lang('covered_to'),
                "data-date-start-date" => "+1d"
            ));
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="client_id" class=" col-md-3">Contact Personnel</label>
        <div class="col-md-9">
            <?php
            echo form_dropdown("contact_personnel", $users, array($model_info->user_responsible),
                "id='client_id' class='select2 validate-hidden' data-rule-required='true', data-msg-required='" . lang('field_required') . "'");
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
        setDatePicker("#covered_from, #covered_to");
        $("#legaldocumentsform .select2").select2();
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