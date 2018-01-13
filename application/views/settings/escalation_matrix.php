<div id="page-content" class="p20 row">

    <div class="col-sm-3 col-lg-2">
        <?php
        $tab_view['active_tab'] = "escalation_matrix";
        $this->load->view("settings/tabs", $tab_view);
        ?>
    </div>

    <div class="col-sm-9 col-lg-10">
        <?php echo form_open(get_uri("settings/save_escalation_matrix_settings"), array("id" => "general-settings-form", "class" => "general-form dashed-row", "role" => "form")); ?>
        <div class="panel">
            <div class="panel-default panel-heading">
                <h4> Escalation settings</h4>
            </div>

            <!-- <div class="form-group">
                <label for="escalation_via_email" class="col-md-2">Send Notification via Email</label>
                <div class="col-md-10">
                    <?php
                    echo form_checkbox("escalation_via_email", "1", get_setting("escalation_via_email") ? true : false, "id='escalation_via_email' class='ml15'");
                    ?>                       
                </div>
            </div> -->

            <div class="form-group">
                <label for="escalation_via_sms" class="col-md-2">Send Notification via SMS</label>
                <div class="col-md-10">
                    <?php
                    echo form_checkbox("escalation_via_sms", "1", get_setting("escalation_via_sms") ? true : false, "id='escalation_via_sms' class='ml15'");
                    ?>                       
                </div>
            </div>

            <div class="panel-body post-dropzone">
                <div class="form-group">
                    <label for="escalation duration" class=" col-md-2">Default Escalation Duration (Min)</label>
                    <div class=" col-md-10">
                        <input type="text" name="escalation_duration" id="escalation_duration" value="<?php echo get_setting('escalation_duration'); ?>" class="form-control" placeholder="e.g 30" data-rule-required="1" data-msg-required="This field is required."  />
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <button type="submit" class="btn btn-primary"><span class="fa fa-check-circle"></span> <?php echo lang('save'); ?></button>
            </div>
        </div>
        <?php echo form_close(); ?>
    </div>



</div>

<?php $this->load->view("includes/cropbox"); ?>

<script type="text/javascript">
    $(document).ready(function () {
        $("#general-settings-form .select2").select2();

        $("#general-settings-form").appForm({
            isModal: false,
            beforeAjaxSubmit: function (data) {
                $.each(data, function (index, obj) {
                    if (obj.name === "invoice_logo" || obj.name === "site_logo") {
                        var image = replaceAll(":", "~", data[index]["value"]);
                        data[index]["value"] = image;
                    }
                });
            },
            onSuccess: function (result) {
                appAlert.success(result.message, {duration: 10000});
                if ($("#site_logo").val() || $("#invoice_logo").val()) {
                    location.reload();
                }
            }
        });

        var uploadUrl = "<?php echo get_uri("expenses/upload_file"); ?>";
        var validationUrl = "<?php echo get_uri("expenses/validate_expense_file"); ?>";

        var dropzone = attachDropzoneWithForm("#general-settings-form", uploadUrl, validationUrl, {maxFiles: 1});


        $(".cropbox-upload").change(function () {
            showCropBox(this);
        });

    });
</script>