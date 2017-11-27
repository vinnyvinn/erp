<?php echo form_open(get_uri("invoices/save"), array("id" => "invoice-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">
    <input type="hidden" name="id" value="<?php echo $model_info->id; ?>" />
    <div class="form-group">
        <label for="invoice_bill_date" class=" col-md-3"><?php echo lang('bill_date'); ?></label>
        <div class="col-md-9">
            <?php
            echo form_input(array(
                "id" => "invoice_bill_date",
                "name" => "invoice_bill_date",
                "value" => $model_info->bill_date,
                "class" => "form-control",
                "placeholder" => lang('bill_date'),
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="invoice_due_date" class=" col-md-3"><?php echo lang('due_date'); ?></label>
        <div class="col-md-9">
            <?php
            echo form_input(array(
                "id" => "invoice_due_date",
                "name" => "invoice_due_date",
                "value" => $model_info->due_date,
                "class" => "form-control",
                "placeholder" => lang('due_date'),
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
                "data-rule-greaterThanOrEqual" => "#invoice_bill_date",
                "data-msg-greaterThanOrEqual" => lang("end_date_must_be_equal_or_greater_than_start_date")
            ));
            ?>
        </div>
    </div>
    <?php if ($client_id && !$project_id) { ?>
        <input type="hidden" name="invoice_client_id" value="<?php echo $client_id; ?>" />
    <?php } else { ?>
        <div class="form-group">
            <label for="invoice_client_id" class=" col-md-3"><?php echo lang('client'); ?></label>
            <div class="col-md-9">
                <?php
                echo form_dropdown("invoice_client_id", $clients_dropdown, array($model_info->client_id), "class='select2 validate-hidden' id='invoice_client_id' data-rule-required='true', data-msg-required='" . lang('field_required') . "'");
                ?>
            </div>
        </div>
    <?php } ?>
    <?php if ($project_id) { ?>
        <input type="hidden" name="invoice_project_id" value="<?php echo $project_id; ?>" />
    <?php } else { ?>
        <div class="form-group">
            <label for="invoice_project_id" class=" col-md-3"><?php echo lang('project'); ?></label>
            <div class="col-md-9" id="invoice-porject-dropdown-section">
                <?php
                echo form_input(array(
                    "id" => "invoice_project_id",
                    "name" => "invoice_project_id",
                    "value" => $model_info->project_id,
                    "class" => "form-control",
                    "placeholder" => lang('project')
                ));
                ?>
            </div>
        </div>
    <?php } ?>

    <div class="form-group">
        <label for="tax_id" class=" col-md-3"><?php echo lang('tax'); ?></label>
        <div class="col-md-9">
            <?php
            echo form_dropdown("tax_id", $taxes_dropdown, array($model_info->tax_id), "class='select2 tax-select2'");
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="tax_id" class=" col-md-3"><?php echo lang('second_tax'); ?></label>
        <div class="col-md-9">
            <?php
            echo form_dropdown("tax_id2", $taxes_dropdown, array($model_info->tax_id2), "class='select2 tax-select2'");
            ?>
        </div>
    </div>

    <?php if ($estimate_id) { ?>
        <div class="form-group">
            <label for="estimate_id_checkbox" class=" col-md-12">
                <input type="hidden" name="copy_items_from_estimate" value="<?php echo $estimate_id; ?>" />
                <?php
                echo form_checkbox("estimate_id_checkbox", $estimate_id, true, " class='pull-left' disabled='disabled'");
                ?>    
                <span class="pull-left ml15"> <?php echo lang('include_all_items_of_this_estimate'); ?> </span>
            </label>
        </div>
    <?php } ?>

    <div class="form-group">
        <label for="invoice_note" class=" col-md-12"><?php echo lang('note'); ?></label>
        <div class=" col-md-12">
            <?php
            echo form_textarea(array(
                "id" => "invoice_note",
                "name" => "invoice_note",
                "value" => $model_info->note ? $model_info->note : "",
                "class" => "form-control wysiwyg",
                "placeholder" => lang('note')
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
        if ("<?php echo $estimate_id; ?>") {
            RELOAD_VIEW_AFTER_UPDATE = false; //go to invoice page
        }
        
        $("#invoice-form").appForm({
            onSuccess: function (result) {
                if (typeof RELOAD_VIEW_AFTER_UPDATE !== "undefined" && RELOAD_VIEW_AFTER_UPDATE) {
                    location.reload();
                } else {
                    window.location = "<?php echo site_url('invoices/view'); ?>/" + result.id;
                }
            }
        });
        $("#invoice-form .tax-select2").select2();

        setDatePicker("#invoice_bill_date, #invoice_due_date");

        //load all projects of selected client
        $("#invoice_client_id").select2().on("change", function () {
            var client_id = $(this).val();
            if ($(this).val()) {
                $('#invoice_project_id').select2("destroy");
                $("#invoice_project_id").hide();
                appLoader.show({container: "#invoice-porject-dropdown-section"});
                $.ajax({
                    url: "<?php echo get_uri("invoices/get_project_suggestion") ?>" + "/" + client_id,
                    dataType: "json",
                    success: function (result) {
                        $("#invoice_project_id").show().val("");
                        $('#invoice_project_id').select2({data: result});
                        appLoader.hide();
                    }
                });
            }
        });

        $('#invoice_project_id').select2({data: <?php echo json_encode($projects_suggestion); ?>});

        if ("<?php echo $project_id; ?>") {
            $("#invoice_client_id").select2("readonly", true);
        }

    });
</script>