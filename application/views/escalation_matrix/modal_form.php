<?php echo form_open(get_uri("escalation_matrix/save"), array("id" => "project-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">
    <div class="form-group">
        <label for="profile name" class=" col-md-3">Profile Name</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "profile_name",
                "name" => "profile_name",
                "class" => "form-control",
                "placeholder" => "Enter Profile Name",
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>

        <div class="form-group">
            <label for="agent name" class=" col-md-3">Agent Name</label>
            <div class="col-md-9">
                <?php
                echo form_input(array(
                    "id" => "collaborators",
                    "name" => "collaborators",
                    "value" => $model_info->collaborators,
                    "class" => "form-control tagged",
                    "placeholder" => "Enter Agent Name"
                ));
                ?>
            </div>
        </div>

    <div class="form-group">
        <label for="duration time" class=" col-md-3">Duration Time (Min)</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "duration",
                "name" => "duration",
                "value" => get_setting('escalation_duration'),
                "class" => "form-control",
                "placeholder" => 'Enter Duration Time',
                "readonly" => "true",
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required")
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
        localStorage.setItem('collaborators', JSON.stringify(<?php echo json_encode($collaborators_dropdown); ?>));

        $("#project-form").appForm({
            onSuccess: function (result) {
                // $("#escalation_matrix_table").appTable({newData: result.data, dataId: result.id});
            }
        });

        $("#project-form .select2").select2();

        $("#collaborators").select2({
            tags: <?php echo json_encode($collaborators_dropdown); ?>
        });

    });
</script>