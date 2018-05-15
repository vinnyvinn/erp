<div id="page-content" class="p20 row">

    <div class="col-sm-3 col-lg-2">
        <?php
        $tab_view['active_tab'] = "general";
        $this->load->view("settings/tabs", $tab_view);
        ?>
    </div>

    <div class="col-sm-9 col-lg-10">
        <?php echo form_open(get_uri("settings/save_general_settings"), array("id" => "general-settings-form", "class" => "general-form dashed-row", "role" => "form")); ?>
        <div class="panel">
            <div class="panel-default panel-heading">
                <h4><?php echo lang("general_settings"); ?></h4>
            </div>
            <div class="panel-body post-dropzone">
                <div class="form-group">
                    <label for="logo" class=" col-md-2"><?php echo lang('invoice_logo'); ?></label>
                    <div class=" col-md-10">
                        <div class="pull-left mr15">
                            <img id="invoice-logo-preview" src="<?php echo get_file_uri(get_setting("system_file_path") . get_setting("invoice_logo")); ?>" alt="..." />
                        </div>
                        <div class="pull-left file-upload btn btn-default btn-xs">
                            <span>...</span>
                            <input id="invoice_logo_file" class="cropbox-upload upload" name="invoice_logo_file" type="file" data-height="100" data-width="300" data-preview-container="#invoice-logo-preview" data-input-field="#invoice_logo" />
                        </div>
                        <input type="hidden" id="invoice_logo" name="invoice_logo" value=""  />
                    </div>
                </div>
                <div class="form-group">
                    <label class=" col-md-2"><?php echo lang('signin_page_background'); ?></label>
                    <div class=" col-md-10">
                        <div class="pull-left mr15">
                            <img id="signin-background-preview" style="max-width: 100px; max-height: 80px;" src="<?php echo get_file_uri(get_setting("system_file_path") . "sigin-background-image.jpg"); ?>" alt="..." />
                        </div>
                        <div class="pull-left mr15">
                            <?php $this->load->view("includes/dropzone_preview"); ?>    
                        </div>
                        <div class="pull-left upload-file-button btn btn-default btn-xs">
                            <span>...</span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="language" class=" col-md-2"><?php echo lang('language'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_dropdown(
                                "language", $language_dropdown, get_setting('language'), "class='select2 mini'"
                        );
                        ?>
                    </div>
                </div>
                <div class="form-group">
                    <label for="timezone" class=" col-md-2"><?php echo lang('timezone'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_dropdown(
                                "timezone", $timezone_dropdown, get_setting('timezone'), "class='select2 mini'"
                        );
                        ?>
                    </div>
                </div>
                <div class="form-group">
                    <label for="date_format" class=" col-md-2"><?php echo lang('date_format'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_dropdown(
                                "date_format", array(
                            "d F Y" => 'd F Y',
                            "d, F Y" => 'd, F Y',
                            "d M Y" => 'd M Y',
                            "d, M Y" => 'd, M Y',
                            "d-m-Y" => "d-m-Y",
                            "m-d-Y" => "m-d-Y",
                            "Y-m-d" => "Y-m-d",
                            "d/m/Y" => "d/m/Y",
                            "m/d/Y" => "m/d/Y",
                            "Y/m/d" => "Y/m/d",
                            "d.m.Y" => "d.m.Y",
                            "m.d.Y" => "m.d.Y",
                            "Y.m.d" => "Y.m.d",
                                ), get_setting('date_format'), "class='select2 mini'"
                        );
                        ?>
                    </div>
                </div>
                <div class="form-group">
                    <label for="time_format" class=" col-md-2"><?php echo lang('time_format'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_dropdown(
                                "time_format", array(
                            "capital" => "12 AM",
                            "small" => "12 am",
                            "24_hours" => "24 hours"
                                ), get_setting('time_format'), "class='select2 mini'"
                        );
                        ?>
                    </div>
                </div>

                <div class="form-group">
                    <label for="first_day_of_week" class=" col-md-2"><?php echo lang('first_day_of_week'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_dropdown(
                                "first_day_of_week", array(
                            "0" => "Sunday",
                            "1" => "Monday",
                            "2" => "Tuesday",
                            "3" => "Wednesday",
                            "4" => "Thursday",
                            "5" => "Friday",
                            "6" => "Saturday"
                                ), get_setting('first_day_of_week'), "class='select2 mini'"
                        );
                        ?>
                    </div>
                </div>
                <div class="form-group">
                    <label for="default_currency" class=" col-md-2"><?php echo lang('currency'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_dropdown(
                                "default_currency", $currency_dropdown, get_setting('default_currency'), "class='select2 mini'"
                        );
                        ?>
                    </div>
                </div>
                <div class="form-group">
                    <label for="currency_symbol" class=" col-md-2"><?php echo lang('currency_symbol'); ?></label>
                    <div class=" col-md-10">
                        <?php
                        echo form_input(array(
                            "id" => "currency_symbol",
                            "name" => "currency_symbol",
                            "value" => get_setting('currency_symbol'),
                            "class" => "form-control",
                            "placeholder" => lang('currency_symbol'),
                            "data-rule-required" => true,
                            "data-msg-required" => lang("field_required"),
                        ));
                        ?>
                    </div>
                </div>
                <div class="form-group">
                    <label for="decimal_separator" class=" col-md-2"><?php echo lang('decimal_separator'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_dropdown(
                                "decimal_separator", array("." => "Dot (.)", "," => "Comma (,)"), get_setting('decimal_separator'), "class='select2 mini'"
                        );
                        ?>
                    </div>
                </div>
                <div class="form-group">
                    <label for="accepted_file_formats" class=" col-md-2"><?php echo lang('accepted_file_format'); ?></label>
                    <div class=" col-md-10">
                        <?php
                        echo form_input(array(
                            "id" => "accepted_file_formats",
                            "name" => "accepted_file_formats",
                            "value" => get_setting('accepted_file_formats'),
                            "class" => "form-control",
                            "placeholder" => lang('comma_separated'),
                            "data-rule-required" => true,
                            "data-msg-required" => lang("field_required"),
                        ));
                        ?>
                    </div>
                </div>
                <div class="form-group">
                    <label for="rows_per_page" class=" col-md-2"><?php echo lang('rows_per_page'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_dropdown(
                                "rows_per_page", array(
                            "10" => "10",
                            "25" => "25",
                            "50" => "50",
                            "100" => "100",
                                ), get_setting('rows_per_page'), "class='select2 mini'"
                        );
                        ?>
                    </div>
                </div>
                <div class="form-group">
                    <label for="product serial" class=" col-md-2">Product Serial</label>
                    <div class="col-md-10">
                        <select name="product_serial" class='select2 mini'>
                            <option value="auto">Automatic</option>
                            <option value="manual">Manual</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="Serial Prefix" class=" col-md-2">Serial Prefix</label>
                    <div class=" col-md-10">
                        <input type="text" name="serial_prefix" id="serial_prefix" value="<?php echo get_setting('serial_prefix'); ?>" class="form-control" placeholder="e.g SN" data-rule-required="1" data-msg-required="This field is required."  />
                    </div>
                </div>
                <div class="form-group">
                    <label for="Order Tasks" class=" col-md-2">Order Tasks (Descending by)</label>
                    <div class="col-md-10">
                        <select name="order_project_tasks" class='select2 mini'>
                            <option value="title">Task Title</option>
                            <option value="start_date">Task Start Date</option>
                            <option value="deadline">Task Deadline Date</option>
                            <option value="project_title">Project Task Title</option>
                            <option value="assigned_to_user ">Task Assigned To</option>
                            <option value="priority">Task Priority</option>
                            <option value="status">Task Status</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="Add Project sub-tasks from Excel" class=" col-md-2">Add Project sub-tasks from Excel</label>
                    <div class="col-md-10">
                        <select name="add_projects_from_excel" class='select2 mini'>
                            <option value="YES">Yes</option>
                            <option value="NO">No</option>
                        </select>
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