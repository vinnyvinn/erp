<?php echo form_open_multipart(get_uri("projects/save_xlsx"), array("id" => "task-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body">
    <input type="hidden" name="id" value="<?php echo $model_info->id; ?>" />
    <input type="hidden" name="project_id" value="<?php echo $project_id; ?>" />
    <div class="form-group">
        <label for="Sub-Task Of" class=" col-md-3">Sub-Task Of</label>
        <div class="col-md-9">
            <select name="parent_id" id="parent_id" class="select2" required>
                <?php foreach ($tasks_dropdown as $task) : ?>
                    <option value="<?= $task->id; ?>"><?= $task->title; ?></option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label for="points" class="col-md-3">Points Per Task
            <span class="help" data-toggle="tooltip" title="<?php echo lang('task_point_help_text'); ?>"><i class="fa fa-question-circle"></i></span>
        </label>
        <div class="col-md-9">
            <?php
                echo form_dropdown("points", $points_dropdown, array($model_info->points), "class='select2'");
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="milestone_id" class=" col-md-3"><?php echo lang('milestone'); ?></label>
        <div class="col-md-8">
            <?php
            echo form_dropdown("milestone_id", $milestones_dropdown, array($model_info->milestone_id), ['class' => 'select2', 'id' => 'milestone_id']);
            ?>
        </div>
        <div class="col-md-1">
            <?php
            if ($can_create_milestones) {
                echo modal_anchor(get_uri("projects/milestone_modal_form"), "<i class='fa fa-plus-circle'></i>", array("class" => "btn btn-info btn-add", "title" => lang('add_milestone'), "data-post-project_id" => $project_id, "data-is-popup" => '1', 'data-populate' => 'milestone_id'));
            }
            ?>
        </div>
    </div>
    <?php if ($show_assign_to_dropdown) { ?>
    <div class="form-group">
        <label for="assigned_to" class=" col-md-3"><?php echo lang('assign_to'); ?></label>
        <div class="col-md-9">
            <?php
            echo form_dropdown("assigned_to", $assign_to_dropdown, array($model_info->assigned_to), "class='select2'");
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="collaborators" class=" col-md-3"><?php echo lang('collaborators'); ?></label>
        <div class="col-md-9">
            <?php
            echo form_input(array(
                "id" => "collaborators",
                "name" => "collaborators",
                "value" => $model_info->collaborators,
                "class" => "form-control",
                "placeholder" => lang('collaborators')
            ));
            ?>
        </div>
    </div>
    <?php } ?>
    <div class="form-group">
        <label for="status" class=" col-md-3"><?php echo lang('status'); ?></label>
        <div class="col-md-9">
            <?php
            $task_status = [
            'to_do - 0%' => 'ToDo - 0% Complete',
            'in_progress - 25%' => 'In Progress - 25% Complete',
            'in_progress - 50%' => 'In Progress - 50% Complete',
            'in_progress - 75%' => 'In Progress - 75% Complete',
            'done - 100%' => 'Done - 100% Complete'
            ];
            echo form_dropdown("status", $task_status, array($model_info->status), "class='select2'");
            ?>
        </div>
    </div>
    <!-- <div class="form-group">
        <label for="project_labels" class=" col-md-3"><?php echo lang('labels'); ?></label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "project_labels",
                "name" => "labels",
                "value" => $model_info->labels,
                "class" => "form-control",
                "placeholder" => lang('labels')
            ));
            ?>
        </div>
    </div> -->
    <div class="form-group">
        <label for="priority" class="col-md-3">Priority</label>
        <div class="col-md-9">
            <select name="priority" id="priority" class="form-control">
                <option <?= $model_info->priority == 'High' ? ' selected' : '' ?> value="High">High</option>
                <option <?= $model_info->priority == 'Normal' || $model_info->priority == '' ? ' selected' : '' ?> value="Normal">Normal</option>
                <option <?= $model_info->priority == 'Low' ? ' selected' : '' ?> value="Low">Low</option>
            </select>
        </div>
    </div>
    <div>
        <div class="col-md-2"></div>
        <div class="container-fluid col-md-9">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <a href="<?php echo $import; ?>">
                            <div class="pull-left file-upload btn btn-default btn-md">
                                <div align="center"><span>Download Sample</span></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-6 text-right">
                    <div class="pull-right file-upload btn btn-primary btn-md">
                        <div align="center"><span>Select Import File</span></div>
                        <input id="xlsx_file" class="cropbox-upload upload" name="xlsx_file" type="file" data-height="100" data-width="300" data-preview-container="#xlsx-logo-preview" data-input-field="#xlsx" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="clearfix"></div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fa fa-close"></span> <?php echo lang('close'); ?></button>
    <button type="submit" class="btn btn-primary"><span class="fa fa-check-circle"></span> Import</button>
</div>
<?php echo form_close(); ?>

<script type="text/javascript">
    $(document).ready(function () {
        // $.ajax({
        //     url: '/modules/token',
        //     success: function (response) {
        //         $('#token').val(response);
        //     }
        // });
        // $("#task-form").appForm({
        //     onSuccess: function (result) {
        //         setTimeout(function () {
        //             window.location.reload();
        //         }, 1000);
        //     }
        // });
        $("#task-form .select2").select2();
        $("#title").focus();

        setDatePicker("#start_date, #end_date, #deadline");

        $("#project_labels").select2({
            tags: <?php echo json_encode($label_suggestions); ?>
        });

        $("#collaborators").select2({
            tags: <?php echo json_encode($collaborators_dropdown); ?>
        });

        $('[data-toggle="tooltip"]').tooltip();

    });
</script>    