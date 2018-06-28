<div id="page-content" class="p20 clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1><?php echo lang('ticket') . ": #" . $ticket_info->id . " - " . $ticket_info->title ?></h1>
            <div class="title-button-group p10">
                            
                <span class="dropdown inline-block">
                    <button class="btn btn-default dropdown-toggle  mt0 mb0" type="button" data-toggle="dropdown" aria-expanded="true">
                        <i class='fa fa-cogs'></i> <?php echo lang('actions');?>
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu pull-right" role="menu">
                        <?php if ($this->login_user->user_type == "staff") { ?>
                            <li role="presentation">
                                <?php
                                if ($this->login_user->is_admin) {
                                    echo modal_anchor(get_uri("tickets/modal_form"), "<i class='fa fa-pencil'></i> " . lang('edit'), array( "title" => lang('ticket'), "data-post-view" => "details", "data-post-id" => $ticket_info->id));
                                }
                                ?>
                            </li>
                        <?php } ?>
                        <?php if ($ticket_info->status === "closed" ) { ?>
                            <li role="presentation"><?php echo ajax_anchor(get_uri("tickets/save_ticket_status/$ticket_info->id/open"), "<i class='fa fa-check-circle'></i> " . lang('mark_as_open'), array("class" => "", "title" => lang('mark_as_open'), "data-reload-on-success" => "1")); ?> </li>
                        <?php } else { ?>
                            <li role="presentation">
                                <?php
                                echo modal_anchor(get_uri("tickets/third_partyusers_modal_form"), "<i class='fa fa-stack-overflow'></i> Add to Third Party", array( "title" => "Add to Third Party", "data-post-view" => "details", "data-post-id" => $ticket_info->id));

                                //echo modal_anchor(get_uri("tickets/observation_modal"), "<i class='fa fa-eye'></i> Add Issues", array( "title" => lang('Add observations noted'), "data-post-view" => "details", "data-post-id" => $ticket_info->id));
                                if($assgn_status==1){
                                echo modal_anchor(get_uri("tickets/knowledge_base_modal_form"), "<i class='fa fa-stethoscope'></i> Add knowledge base", array( "title" => "Add knowledge base", "data-post-view" => "details", "data-post-id" => $ticket_info->id));
                                 }
                                 echo anchor(get_uri("tickets/ticket_solved_email"), "<i class='fa fa-stack-exchange'></i> Mark as Done", array( "title" => "Mark as Done", "data-post-view" => "details", "data-post-id" => $ticket_info->id));

                                  echo modal_anchor(get_uri("tickets/mark_solved_modal"), "<i class='fa fa-stack-exchange'></i> Mark as Solved", array( "title" => "Mark as Solved", "data-post-view" => "details", "data-post-id" => $ticket_info->id));

                                ?>

                            </li>


                            <?php if($status==1) {?>

                              <li role="presentation"><?php echo modal_anchor(get_uri("ticket_types/model_comment"), "<i class='fa fa-check-circle'></i> " . lang('mark_as_closed'), array("class" => "", "title" => 'Add Comment Before Closing', "data-reload-on-success" => "1")); ?> </li>

                        <?php }} ?>
                    </ul>
                </span>
            </div>
        </div>
        <div class="panel-body">
            <div id="ticket-title-section">
                <?php $this->load->view("tickets/ticket_sub_title"); ?>
            </div>

            <?php foreach ($comments as $comment) { ?>
                <?php $this->load->view("tickets/comment_row", array("comment" => $comment)); ?>
            <?php } ?>

            <div id="comment-form-container" class="pr15 <?php if ($ticket_info->status === "closed") { echo "hidden"; } ?>">
                <?php echo form_open(get_uri("tickets/save_comment"), array("id" => "comment-form", "class" => "general-form", "role" => "form")); ?>
                <div class="p15 box">
                    <div class="box-content avatar avatar-md pr15">
                        <img src="<?php echo get_avatar($this->login_user->image); ?>" alt="..." />
                    </div>

                    <div id="ticket-comment-dropzone" class="post-dropzone box-content form-group">
                        <input type="hidden" name="ticket_id" value="<?php echo $ticket_info->id; ?>">
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
