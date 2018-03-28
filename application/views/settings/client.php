<div id="page-content" class="p20 row">
    <div class="col-sm-3 col-lg-2">
        <?php
        $tab_view['active_tab'] = "client";
        $this->load->view("settings/tabs", $tab_view);
        ?>
    </div>

    <div class="col-sm-9 col-lg-10">
        <?php echo form_open(get_uri("settings/save_client_settings"), array("id" => "client-settings-form", "class" => "general-form dashed-row", "role" => "form")); ?>
        <div class="panel">
            <div class="panel-default panel-heading">
                <h4><?php echo lang("client_settings"); ?></h4>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label for="disable_client_signup" class="col-md-2"><?php echo lang('disable_client_signup'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_checkbox("disable_client_signup", "1", get_setting("disable_client_signup") ? true : false, "id='disable_client_signup' class='ml15'");
                        ?>
                    </div>
                </div>
                <div class="form-group">
                    <label for="disable_client_login" class="col-md-2"><?php echo lang('disable_client_login'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_checkbox("disable_client_login", "1", get_setting("disable_client_login") ? true : false, "id='disable_client_login' class='ml15'");
                        ?>
                    </div>
                </div>

                <div class="form-group">
                    <label for="client_message_users" class=" col-md-2"><?php echo lang('who_can_send_or_receive_message_to_or_from_clients'); ?></label>
                    <div class=" col-md-9">
                        <?php
                        echo form_input(array(
                            "id" => "client_message_users",
                            "name" => "client_message_users",
                            "value" => get_setting("client_message_users"),
                            "class" => "form-control",
                            "placeholder" => lang('team_members')
                        ));
                        ?>
                    </div>
                </div>
                <div class="form-group">
                    <label for="client_can_view_tasks" class="col-md-2"><?php echo lang('client_can_view_tasks'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_checkbox("client_can_view_tasks", "1", get_setting("client_can_view_tasks") ? true : false, "id='client_can_view_tasks' class='ml15'");
                        ?>                       
                    </div>
                </div>
                <div class="form-group">
                    <label for="client_can_create_tasks" class="col-md-2"><?php echo lang('client_can_create_tasks'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_checkbox("client_can_create_tasks", "1", get_setting("client_can_create_tasks") ? true : false, "id='client_can_create_tasks' class='ml15'");
                        ?>                       
                    </div>
                </div>
                <div class="form-group">
                    <label for="client_can_edit_tasks" class="col-md-2"><?php echo lang('client_can_edit_tasks'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_checkbox("client_can_edit_tasks", "1", get_setting("client_can_edit_tasks") ? true : false, "id='client_can_edit_tasks' class='ml15'");
                        ?>                       
                    </div>
                </div>
                <div class="form-group">
                    <label for="client_can_comment_on_tasks" class="col-md-2"><?php echo lang('client_can_comment_on_tasks'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_checkbox("client_can_comment_on_tasks", "1", get_setting("client_can_comment_on_tasks") ? true : false, "id='client_can_comment_on_tasks' class='ml15'");
                        ?>                       
                    </div>
                </div>
                <div class="form-group">
                    <label for="client_can_view_project_files" class="col-md-2"><?php echo lang('client_can_view_project_files'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_checkbox("client_can_view_project_files", "1", get_setting("client_can_view_project_files") ? true : false, "id='client_can_view_project_files' class='ml15'");
                        ?>                       
                    </div>
                </div>
                <div class="form-group">
                    <label for="client_can_add_project_files" class="col-md-2"><?php echo lang('client_can_add_project_files'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_checkbox("client_can_add_project_files", "1", get_setting("client_can_add_project_files") ? true : false, "id='client_can_add_project_files' class='ml15'");
                        ?>                       
                    </div>
                </div>
                <div class="form-group">
                    <label for="client_can_comment_on_files" class="col-md-2"><?php echo lang('client_can_comment_on_files'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_checkbox("client_can_comment_on_files", "1", get_setting("client_can_comment_on_files") ? true : false, "id='client_can_comment_on_files' class='ml15'");
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
        $("#client-settings-form").appForm({
            isModal: false,
            onSuccess: function (result) {
                appAlert.success(result.message, {duration: 10000});
            }
        });
        $("#client_message_users").select2({
            multiple: true,
            data: <?php echo ($members_dropdown); ?>
        });
    });
</script>