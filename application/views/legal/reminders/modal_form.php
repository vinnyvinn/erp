<?php echo form_open(get_uri("legal/reminders_save"),
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
                "placeholder" => 'Name',
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
            echo form_dropdown("doc_type", $doc_types, array($model_info->doc_type),
                "id='client_id' class='select2 validate-hidden' data-rule-required='true', data-msg-required='" . lang('field_required') . "'");
            ?>
        </div>
    </div>

    <div class="form-group">
        <label for="client_id" class=" col-md-3">Team</label>
        <div class="col-md-9">
            <?php
            echo form_dropdown("reminder_to", $teams, array($model_info->reminder_to),
                "id='client_id' class='select2 validate-hidden' data-rule-required='true', data-msg-required='" . lang('field_required') . "'");
            ?>
        </div>
    </div>

    <div class="form-group">
        <label for="client_id" class=" col-md-3">Duration before expiry</label>
        <div class="col-md-9">
            <?php
            echo form_dropdown("duration_before", $durations, array($model_info->duration_before),
                "id='client_id' class='select2 validate-hidden' data-rule-required='true', data-msg-required='" . lang('field_required') . "'");
            ?>
        </div>
    </div>

    <div class="form-group">
        <label for="client_id" class=" col-md-3">Reminder every</label>
        <div class="col-md-9">
            <?php
            echo form_dropdown("reminder_every", $durations, array($model_info->reminder_every),
                "id='client_id' class='select2 validate-hidden' data-rule-required='true', data-msg-required='" . lang('field_required') . "'");
            ?>
        </div>
    </div>

    <div class="form-group">
        <label for="client_id" class=" col-md-3">Reminder For</label>
        <div class="col-md-9">
            <?php
            echo form_dropdown("reminder_for", $durations, array($model_info->reminder_for),
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