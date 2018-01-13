
<?php echo form_open(get_uri("announcements/save"), array("id" => "announcement-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">
    <input type="hidden" name="id" value="<?php echo $model_info->id; ?>" />
    <div class="form-group">
        <label for="title" class="col-md-12"><?php echo lang('title'); ?></label>
        <div class=" col-md-12">
            <?php
            echo form_input(array(
                "id" => "title",
                "name" => "title",
                "value" => $model_info->title,
                "class" => "form-control",
                "placeholder" => lang('title'),
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>

    <div class="clearfix">
        <label for="start_date" class="col-md-2"><?php echo lang('start_date'); ?></label>
        <div class="form-group col-md-4">
            <?php
            echo form_input(array(
                "id" => "start_date",
                "name" => "start_date",
                "value" => $model_info->start_date,
                "class" => "form-control",
                "placeholder" => "YYYY-MM-DD",
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required")
            ));
            ?>
        </div>

        <label for="end_date" class="col-md-2"><?php echo lang('end_date'); ?></label>
        <div class="form-group col-md-4">
            <?php
            echo form_input(array(
                "id" => "end_date",
                "name" => "end_date",
                "value" => $model_info->end_date,
                "class" => "form-control",
                "placeholder" => "YYYY-MM-DD",
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
                "data-rule-greaterThanOrEqual" => "#start_date",
                "data-msg-greaterThanOrEqual" => lang("end_date_must_be_equal_or_greater_than_start_date")
            ));
            ?>
        </div>
    </div>

    <div class="form-group">
        <label for="share_with" class=" col-md-2"><?php echo lang('share_with'); ?></label>
        <div class="col-md-10">
            <div>
                <?php
                echo form_checkbox(array(
                    "id" => "share_with_members",
                    "name" => "share_with[]",
                    "value" => "all_members",
                        ), $model_info->share_with, (in_array("all_members", $share_with)) ? true : false);
                ?>
                <label for="share_with_members"><?php echo lang("all_team_members"); ?> </label>
            </div>
            <div>
                <?php
                echo form_checkbox(array(
                    "id" => "share_with_clients",
                    "name" => "share_with[]",
                    "value" => "all_clients",
                        ), $model_info->share_with, (in_array("all_clients", $share_with)) ? true : false);
                ?>
                <label for="share_with_clients"><?php echo lang("all_team_clients"); ?></label>
            </div>
        </div>
    </div>

    <div class="form-group">

        <div class=" col-md-12">
            <?php
            echo form_textarea(array(
                "id" => "description",
                "name" => "description",
                "value" => $model_info->description,
                "placeholder" => lang('description'),
                "class" => "form-control"
            ));
            ?>
        </div>
    </div>

</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fa fa-close"></span> <?php echo lang('close'); ?></button>
    <button type="submit" class="btn btn-primary"><span class="fa fa-check-circle"></span> <?php echo lang('save'); ?></button>
</div>
<?php echo form_close(); ?>
<script type="text/javascript">
    $(document).ready(function () {
        $("#announcement-form").appForm({
            beforeAjaxSubmit: function (data) {
                var description = encodeAjaxPostData(getWYSIWYGEditorHTML("#description"));
                $.each(data, function (index, obj) {
                    if (obj.name === "description") {
                        data[index]["value"] = description;
                    }
                });
            },
            onSuccess: function (result) {
                $("#announcement-table").appTable({newData: result.data, dataId: result.id});
            }
        });
        $("#title").focus();
        initWYSIWYGEditor("#description", {height: 250});


        setDatePicker("#start_date, #end_date");
    });
</script>    