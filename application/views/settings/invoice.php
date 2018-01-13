<div id="page-content" class="p20 row">
    <div class="col-sm-3 col-lg-2">
        <?php
        $tab_view['active_tab'] = "invoice";
        $this->load->view("settings/tabs", $tab_view);
        ?>
    </div>

    <div class="col-sm-9 col-lg-10">
        <?php echo form_open(get_uri("settings/save_invoice_settings"), array("id" => "invoice-settings-form", "class" => "general-form dashed-row", "role" => "form")); ?>
        <div class="panel">
            <div class="panel-default panel-heading">
                <h4><?php echo lang("invoice_settings"); ?></h4>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label for="allow_partial_invoice_payment_from_clients" class=" col-md-2"><?php echo lang('allow_partial_invoice_payment_from_clients'); ?></label>

                    <div class="col-md-10">
                        <?php
                        echo form_dropdown(
                                "allow_partial_invoice_payment_from_clients", array("1" => lang("yes"), "0" => lang("no")), get_setting('allow_partial_invoice_payment_from_clients'), "class='select2 mini'"
                        );
                        ?>
                    </div>
                </div>
                <div class="form-group">
                    <label for="send_bcc_to" class=" col-md-2"><?php echo lang('send_bcc_to'); ?></label>
                    <div class=" col-md-10">
                        <?php
                        echo form_input(array(
                            "id" => "send_bcc_to",
                            "name" => "send_bcc_to",
                            "value" => get_setting("send_bcc_to"),
                            "class" => "form-control",
                            "placeholder" => lang("email")
                        ));
                        ?>
                    </div>
                </div>
                <div class="form-group">
                    <label for="invoice_color" class=" col-md-2"><?php echo lang('invoice_color'); ?></label>
                    <div class=" col-md-10">
                        <?php
                        echo form_input(array(
                            "id" => "invoice_color",
                            "name" => "invoice_color",
                            "value" => get_setting("invoice_color"),
                            "class" => "form-control",
                            "placeholder" => "Ex. #e2e2e2"
                        ));
                        ?>
                    </div>
                </div>

                <div class="form-group">
                    <label for="invoice_footer" class=" col-md-12"><?php echo lang('invoice_footer'); ?></label>
                    <div class=" col-md-12">
                        <?php
                        echo form_textarea(array(
                            "id" => "invoice_footer",
                            "name" => "invoice_footer",
                            "value" => get_setting("invoice_footer"),
                            "class" => "form-control wysiwyg"
                        ));
                        ?>
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
</div>
<?php
load_css(array(
    "assets/js/summernote/summernote.css",
    "assets/js/summernote/summernote-bs3.css"
));
load_js(array(
    "assets/js/summernote/summernote.min.js",
    "assets/js/bootstrap-confirmation/bootstrap-confirmation.js",
));
?>
<script type="text/javascript">
    $(document).ready(function () {
        $("#invoice-settings-form").appForm({
            isModal: false,
            beforeAjaxSubmit: function (data) {
                $.each(data, function (index, obj) {
                    if (obj.name === "invoice_footer") {
                        data[index]["value"] = encodeAjaxPostData(getWYSIWYGEditorHTML("#invoice_footer"));
                    }
                });
            },
            onSuccess: function (result) {
                if (result.success) {
                    appAlert.success(result.message, {duration: 10000});
                } else {
                    appAlert.error(result.message);
                }
            }
        });
        $("#invoice-settings-form .select2").select2();

        initWYSIWYGEditor("#invoice_footer", {height: 100});
    });
</script>