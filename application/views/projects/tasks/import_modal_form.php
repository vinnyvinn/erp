<?php echo form_open(get_uri("projects/save_xlsx"), array("id" => "task-form", "class" => "general-form", "role" => "form", 'enctype' => 'multipart/form-data')); ?>
<div class="modal-body clearfix">
    <input type="hidden" name="id" value="<?php echo $model_info->id; ?>" />
    <?php if($project_id) : ?>
    <input type="hidden" name="project_id" value="<?php echo $project_id; ?>" />

    <div class="form-group">
        <label for="title" class=" col-md-3">Main Task <small>(Optional)</small></label>
        <div class=" col-md-8">
            <select name="parent_id" id="parent_id" class="form-control select2">
                <option value="0" <?= $model_info->parent_id == 0 || is_null($model_info->parent_id) ? ' selected' : ''; ?>>None / Default</option>
                <?php foreach ($tasks_dropdown as $task) : ?>
                    <option<?= $model_info->parent_id == $task->id ? ' selected' : ''; ?> value="<?= $task->id; ?>"><?= $task->title; ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="col-md-1">

            <?php
            echo modal_anchor(get_uri("projects/main_task_modal_form"), "<i class='fa fa-plus-circle'></i>", array("class" => "btn btn-info btn-add", "title" => 'Add Main Task', "data-is-popup" => '1', 'data-populate' => 'parent_id', "data-post-project_id" => $project_id));
            ?>
        </div>
    </div>

    <?php else : ?>
        <div class="form-group">
            <label for="title" class=" col-md-3"><?php echo lang('title'); ?></label>
            <div class=" col-md-9">
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
    <?php endif; ?>
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
    <input type="hidden" name="milestone_id" value="0">

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

    <div class="form-group">
        <label for="priority" class=" col-md-3">Priority</label>
        <div class="col-md-9">
            <select name="priority" id="priority" class="select2">
                <option<?= $model_info->priority == 'High' ? ' selected' : '' ?> value="High">High</option>
                <option<?= $model_info->priority == 'Normal' || $model_info->priority == '' ? ' selected' : '' ?> value="Normal">Normal</option>
                <option<?= $model_info->priority == 'Low' ? ' selected' : '' ?> value="Low">Low</option>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label for="import_file" class=" col-md-3">Sample File</label>
        <div class="file-upload btn btn-default btn-md">
            <a href="../../files/import_template/Import.xlsx">Download</a>
        </div>
    </div>


    <div class="form-group">
        <label for="import_file" class=" col-md-3">Select File</label>
        <div class="file-upload btn btn-info btn-md cropbox-upload upload">
            <span>Select Import File</span>
            <!-- <input type="file" name="import_file" id="import_file" required accept=".xls,.xl,.xlsx"> -->
            <input id="xlsx_file" class="cropbox-upload upload" name="xlsx_file" type="file" data-height="100" data-width="300" data-preview-container="#xlsx-logo-preview" data-input-field="#xlsx" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel">
        </div>
    </div>

</div>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fa fa-close"></span> <?php echo lang('close'); ?></button>
    <button type="submit" class="btn btn-primary"><span class="fa fa-check-circle"></span> Import</button>
</div>
<?php echo form_close(); ?>

<script type="text/javascript">
    $(document).ready(function () {

        $("#task-form").appForm({
            onSuccess: function (result) {
                setTimeout(function () {
                    window.location.reload();
                }, 1000);
            }
        });
        $("#task-form .select2").select2();
        $("#title").focus();

        setDatePicker("#start_date, #end_date, #deadline");

        $("#collaborators").select2({
            tags: <?php echo json_encode($collaborators_dropdown); ?>
        });

        $('[data-toggle="tooltip"]').tooltip();

    });
</script>    