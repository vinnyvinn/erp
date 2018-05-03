<div class="modal-body clearfix">
    <div id="new-ticket-dropzone" class="post-dropzone">
        <?php echo form_open(get_uri("ict_reports/support_tickets_save"), array("id" => "ticket-form", "class" => "general-form", "role" => "form")); ?>
        <input type="hidden" name="id" value="<?php echo $model_info->id; ?>" />
        <input type="hidden" name="team_id" value="3"/>

        <div class="form-group">
            <label for="ticket_type_id" class=" col-md-3"><?php echo lang('ticket_type'); ?></label>
            <div class="col-md-9">
                <?php
                echo form_dropdown("ticket_type_id", $ticket_types_dropdown, array(""), "class='select2'");
                ?>
            </div>
        </div>

        <div class="form-group">
            <label for="title" class=" col-md-3"><?php echo lang('subject'); ?></label>
            <div class=" col-md-9">
                <?php
                echo form_input(array(
                    "id" => "title",
                    "name" => "title",
                    "value" => $model_info->title,
                    "class" => "form-control",
                    "placeholder" => lang('subject'),
                    "autofocus" => true,
                    "data-rule-required" => true,
                    "data-msg-required" => lang("field_required"),
                ));
                ?>
            </div>
        </div>

                <!-- Assign to only visible to team members -->
        <?php if ($this->login_user->user_type == "staff") { ?>
            <div class="form-group">
                <label for="ticket_labels" class=" col-md-3"><?php echo lang('labels'); ?></label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "ticket_labels",
                        "name" => "labels",
                        "value" => $model_info->labels,
                        "class" => "form-control",
                        "placeholder" => lang('labels')
                    ));
                    ?>
                </div>
            </div>
        <?php } ?>

        <?php if (!$model_info->id) { ?>
            <!-- description can't be changed during editing -->
            <div class="form-group">
                <label for="description" class=" col-md-12"><?php echo lang('description'); ?></label>
                <div class=" col-md-12">
                    <?php
                    echo form_textarea(array(
                        "id" => "description",
                        "name" => "description",
                        "class" => "form-control wysiwyg",
                        "placeholder" => lang('description'),
                        "data-rule-required" => true,
                        "data-msg-required" => lang("field_required"),
                    ));
                    ?>
                </div>
            </div>
        <?php } ?>

        <?php $this->load->view("includes/dropzone_preview"); ?>

        <div class="row">
            <div class="modal-footer">

                <!-- file can't be uploaded during editing -->
                <button class="btn btn-default upload-file-button pull-left btn-sm round  <?php
                if ($model_info->id) {
                    echo "hide";
                }
                ?>" type="button" style="color:#7988a2"><i class='fa fa-camera'></i> <?php echo lang("upload_file"); ?></button>


                <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fa fa-close"></span> <?php echo lang('close'); ?></button>
                <button type="submit" class="btn btn-primary"><span class="fa fa-check-circle"></span> <?php echo lang('save'); ?></button>
            </div>
        </div>

        <?php echo form_close(); ?>
    </div>
</div>



<script type="text/javascript">
    $(document).ready(function () {

        var uploadUrl = "<?php echo get_uri("tickets/upload_file"); ?>";
        var validationUrl = "<?php echo get_uri("tickets/validate_ticket_file"); ?>";
        var editMode = "<?php echo $model_info->id; ?>";

        var dropzone = attachDropzoneWithForm("#new-ticket-dropzone", uploadUrl, validationUrl);

        $("#ticket-form").appForm({
            onSuccess: function (result) {
                if (editMode) {
                    appAlert.success(result.message, {duration: 10000});
                    location.reload();
                } else {
                    $("#ticket-table").appTable({newData: result.data, dataId: result.id});
                }

            }
        });
        $("#title").focus();
        $("#ticket-form .select2").select2();

        $("#ticket_labels").select2({
            tags: <?php echo json_encode($label_suggestions); ?>
        });
    });

</script>