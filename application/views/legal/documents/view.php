<div id="page-content" class="p20 clearfix">
    <div class="panel panel-default">

        <div class="page-title clearfix">
            <h1><?php echo $model_info->name ?></h1>
            <div class="title-button-group p10">

                <span class="dropdown inline-block">
                    <button class="btn btn-default dropdown-toggle  mt0 mb0" type="button" data-toggle="dropdown" aria-expanded="true">
                        <i class='fa fa-cogs'></i> <?php echo lang('actions'); ?>
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu pull-right" role="menu">
                         <li role="presentation">
                                <?php echo modal_anchor(get_uri("legal/form_modal"),
                                    "<i class='fa fa-pencil'></i> " . lang('edit'), array( "title" => lang('ticket'),
                                        "data-post-view" => "details", "data-post-id" => $model_info->id)); ?>
                            </li>

                    </ul>
                </span>
            </div>
        </div>
        <div class="panel-body">

            <div id="comment-form-container" class="pr15">
                <?php echo form_open(get_uri("tickets/save_comment"), array("id" => "comment-form", "class" => "general-form", "role" => "form")); ?>
                <div class="p15 box">
                    <div class="box-content avatar avatar-md pr15">
                        <img src="<?php echo get_avatar($this->login_user->image); ?>" alt="..." />
                    </div>

                    <div id="ticket-comment-dropzone" class="post-dropzone box-content form-group">
                        <input type="hidden" name="ticket_id" value="<?php echo $model_info->id; ?>">
                        <?php
                        echo form_textarea(array(
                            "id" => "description",
                            "name" => "description",
                            "class" => "form-control wysiwyg",
                            "placeholder" => lang('write_a_comment'),
                            "data-rule-required" => true,
                            "data-msg-required" => lang("field_required"),
                        ));
                        ?>
                        <?php $this->load->view("includes/dropzone_preview"); ?>
                        <footer class="panel-footer b-a clearfix ">
                            <button class="btn btn-default upload-file-button pull-left btn-sm round" type="button" style="color:#7988a2"><i class='fa fa-camera'></i> <?php echo lang("upload_file"); ?></button>
                            <button class="btn btn-primary pull-right btn-sm " type="submit"><i class='fa fa-paper-plane'></i> <?php echo lang("post_comment"); ?></button>
                        </footer>
                    </div>

                </div>
                <?php echo form_close(); ?>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    $(document).ready(function () {
        var uploadUrl = "<?php echo get_uri("tickets/upload_file"); ?>";
        var validationUrl = "<?php echo get_uri("tickets/validate_ticket_file"); ?>";

        var dropzone = attachDropzoneWithForm("#ticket-comment-dropzone", uploadUrl, validationUrl);

        $("#comment-form").appForm({
            isModal: false,
            onSuccess: function (result) {
                $("#description").val("");
                $(result.data).insertBefore("#comment-form-container");
                appAlert.success(result.message, {duration: 10000});

                dropzone.removeAllFiles();
            }
        });

    });
</script>
