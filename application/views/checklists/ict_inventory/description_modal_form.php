<div class="modal-body clearfix">
<h3><?php echo $title; ?></h3>
<p><?php echo $model_info->description; ?></p>
</div>

<div class="modal-footer">
    <?php
    if ($this->login_user->is_admin) {
        echo modal_anchor(get_uri("ict_reports/edit_description_modal_form"), "<i class='fa fa-pencil'></i> " . "Edit Asset Description", array("class" => "btn btn-default", "data-post-id" => $model_info->sage_id, "title" => "Edit Asset Description"));
    }
    ?>
    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fa fa-close"></span> <?php echo lang('close'); ?></button>
</div>