<div class="modal-body clearfix general-form ">
    <div class="p10 clearfix">
        <div class="media m0 bg-white">
            <div class="media-left">
                <span class="avatar avatar-sm">
                    <img src="<?php echo get_avatar($model_info->assigned_to_avatar); ?>" alt="..." />
                </span>
            </div>
            <div class="media-body w100p pt5">
                <div class="media-heading m0">
                    <?php echo $model_info->assigned_to_user; ?>
                </div>
                <p> 
                    <span class='label label-light mr5' title='Point'><?php echo $model_info->points; ?></span>
                    <?php
                    $status_class = "";
                    if ($model_info->status === "to_do - 0%") {
                        $status_class = "label-warning";
                    } /*else if (strpos($new_status, "in_progress") != false) {
                        $status_class = "label-primary";
                    }*/ else {
                        $status_class = "label-success";
                    }
                    ?>
                    <?php echo $labels . " " . "<span class='label $status_class'>" . lang($model_info->status) . "</span>"; ?>
                </p>
            </div>
        </div>
    </div>

    <div class="form-group clearfix">
        <div  class="col-md-12 mb15">
            <strong><?php echo $model_info->title; ?></strong>
        </div>

        <div class="col-md-12 mb15">
            <?php echo $model_info->description ? nl2br(link_it($model_info->description)) : "-"; ?>
        </div>

        <?php if ($model_info->milestone_title) { ?>
            <div class="col-md-12 mb15">
                <strong><?php echo lang('milestone') . ": "; ?></strong> <?php echo $model_info->milestone_title; ?>
            </div>
        <?php } ?>

        <?php if ($model_info->start_date * 1) { ?>
            <div class="col-md-12 mb15">
                <strong><?php echo lang('start_date') . ": "; ?></strong> <?php echo format_to_date($model_info->start_date); ?>
            </div>
        <?php } ?>
        <div class="col-md-12 mb15">
            <strong><?php echo lang('deadline') . ": "; ?></strong> <?php echo format_to_date($model_info->deadline); ?>
        </div>
        <?php if ($collaborators) { ?>
            <div class="col-md-12 mb15">
                <strong><?php echo lang('collaborators') . ": "; ?> </strong> <?php echo $collaborators; ?>
            </div>
        <?php } ?>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 b-t pt10">
            <?php if ($can_comment_on_tasks) { ?>
                <?php $this->load->view("projects/comments/comment_form"); ?>
            <?php } ?>
            <?php $this->load->view("projects/comments/comment_list"); ?>
        </div>
    </div>

    <div class="pl15 pr15 mt15">
        <?php echo activity_logs_widget(array("limit" => 1000, "offset" => 0, "log_type" => "task", "log_type_id" => $model_info->id)); ?>
    </div>

</div>

<div class="modal-footer">
    <?php
    if ($can_edit_tasks) {
        echo modal_anchor(get_uri("projects/task_modal_form"), "<i class='fa fa-pencil'></i> " . lang('edit_task'), array("class" => "btn btn-default", "data-post-id" => $model_info->id, "title" => lang('edit_task')));
    }
    ?>
    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fa fa-close"></span> <?php echo lang('close'); ?></button>
</div>