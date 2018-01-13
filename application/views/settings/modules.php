<div id="page-content" class="p20 row">
    <div class="col-sm-3 col-lg-2">
        <?php
        $tab_view['active_tab'] = "modules";
        $this->load->view("settings/tabs", $tab_view);
        ?>
    </div>

    <div class="col-sm-9 col-lg-10">
        <?php echo form_open(get_uri("settings/save_module_settings"), array("id" => "module-settings-form", "class" => "general-form dashed-row", "role" => "form")); ?>
        <div class="panel">
            <div class="panel-default panel-heading">
                <h4><?php echo lang("manage_modules"); ?></h4>
                <div><?php echo lang("module_settings_instructions"); ?></div>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label for="module_timeline" class="col-md-2"><?php echo lang('timeline'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_checkbox("module_timeline", "1", get_setting("module_timeline") ? true : false, "id='module_timeline' class='ml15'");
                        ?>                       
                    </div>
                </div>
                <div class="form-group">
                    <label for="module_event" class="col-md-2"><?php echo lang('event'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_checkbox("module_event", "1", get_setting("module_event") ? true : false, "id='module_event' class='ml15'");
                        ?>                       
                    </div>
                </div>

                <div class="form-group">
                    <label for="module_note" class="col-md-2"><?php echo lang('note'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_checkbox("module_note", "1", get_setting("module_note") ? true : false, "id='module_note' class='ml15'");
                        ?>                       
                    </div>
                </div>
                <div class="form-group">
                    <label for="module_message" class="col-md-2"><?php echo lang('message'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_checkbox("module_message", "1", get_setting("module_message") ? true : false, "id='module_message' class='ml15'");
                        ?>                       
                    </div>
                </div>
                <div class="form-group">
                    <label for="module_invoice" class="col-md-2"><?php echo lang('invoice'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_checkbox("module_invoice", "1", get_setting("module_invoice") ? true : false, "id='module_invoice' class='ml15'");
                        ?>                       
                    </div>
                </div>    
                <div class="form-group">
                    <label for="module_expense" class="col-md-2"><?php echo lang('expense'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_checkbox("module_expense", "1", get_setting("module_expense") ? true : false, "id='module_expense' class='ml15'");
                        ?>                       
                    </div>
                </div>  
                <div class="form-group">
                    <label for="module_attendance" class="col-md-2"><?php echo lang('attendance'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_checkbox("module_attendance", "1", get_setting("module_attendance") ? true : false, "id='module_attendance' class='ml15'");
                        ?>                       
                    </div>
                </div>  
                <div class="form-group">
                    <label for="module_leave" class="col-md-2"><?php echo lang('leave'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_checkbox("module_leave", "1", get_setting("module_leave") ? true : false, "id='module_leave' class='ml15'");
                        ?>                       
                    </div>
                </div>
                <div class="form-group">
                    <label for="module_estimate" class="col-md-2"><?php echo lang('estimate'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_checkbox("module_estimate", "1", get_setting("module_estimate") ? true : false, "id='module_estimate' class='ml15'");
                        ?>                       
                    </div>
                </div>
                <div class="form-group">
                    <label for="module_estimate_request" class="col-md-2"><?php echo lang('estimate_request'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_checkbox("module_estimate_request", "1", get_setting("module_estimate_request") ? true : false, "id='module_estimate_request' class='ml15'");
                        ?>                       
                    </div>
                </div>
                <div class="form-group">
                    <label for="module_ticket" class="col-md-2"><?php echo lang('ticket'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_checkbox("module_ticket", "1", get_setting("module_ticket") ? true : false, "id='module_ticket' class='ml15'");
                        ?>                       
                    </div>
                </div>
                <div class="form-group">
                    <label for="module_announcement" class="col-md-2"><?php echo lang('announcement'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_checkbox("module_announcement", "1", get_setting("module_announcement") ? true : false, "id='module_announcement' class='ml15'");
                        ?>                       
                    </div>
                </div>

                <div class="form-group">
                    <label for="module_sage" class="col-md-2">Sage</label>
                    <div class="col-md-10">
                        <?php
                        echo form_checkbox("module_sage", "1", get_setting("module_sage") ? true : false, "id='module_sage' class='ml15'");
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

<script type="text/javascript">
    $(document).ready(function () {
        $("#module-settings-form").appForm({
            isModal: false,
            onSuccess: function (result) {
                appAlert.success(result.message, {duration: 10000});
                location.reload();
            }
        });
    });
</script>