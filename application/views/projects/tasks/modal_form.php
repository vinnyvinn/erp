<?php echo form_open(get_uri("projects/save_task"), array("id" => "task-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">
    <input type="hidden" name="id" value="<?php echo $model_info->id; ?>" />
    <?php if($project_id) : ?>
        <input type="hidden" name="project_id" value="<?php echo $project_id; ?>" />
        <div class="form-group" hidden>
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
    <div class="form-group">
        <label for="points" class="col-md-3"><?php echo lang('points'); ?>
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
            <div class="col-md-8">
                <?php
                echo form_dropdown("assigned_to", $assign_to_dropdown, array($model_info->assigned_to), ['class' => 'select2', 'id' => 'assigned_to']);
                ?>
            </div>
            <div class="col-md-1">
                <?php
                if ($this->login_user->is_admin) {
                    echo modal_anchor(get_uri("team_members/modal_form"), "<i class='fa fa-plus-circle'></i>", array("class" => "btn btn-info btn-add", "title" => lang('add_team_member'), "data-is-popup" => '1', 'data-populate' => 'assigned_to'));
                }
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
                    "class" => "form-control tagged",
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
        <label for="project_labels" class=" col-md-3"><?php echo lang('labels'); ?></label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "project_labels",
                "name" => "labels",
                "value" => $model_info->labels,
                "class" => "form-control tagged",
                "placeholder" => lang('labels')
            ));
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="start_date" class=" col-md-3">Max. Allowed Hours</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "max_hours",
                "name" => "max_hours",
                "type" => 'number',
                'min' => 0,
                "value" => $model_info->max_hours * 1 ? $model_info->max_hours : "",
                "class" => "form-control",
                "placeholder" => "Maximum Hours"
            ));
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
        <label for="start_date" class=" col-md-3"><?php echo lang('start_date'); ?></label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "start_date",
                "name" => "start_date",
                "value" => $model_info->start_date * 1 ? $model_info->start_date : "",
                "class" => "form-control",
                "placeholder" => "YYYY-MM-DD"
            ));
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="deadline" class=" col-md-3"><?php echo lang('deadline'); ?></label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "deadline",
                "name" => "deadline",
                "value" => $model_info->deadline * 1 ? $model_info->deadline : "",
                "class" => "form-control",
                "placeholder" => "YYYY-MM-DD"
            ));
            ?>
        </div>
    </div>

    <div class="form-group">
        <label for="description" class=" col-md-12"><?php echo lang('description'); ?></label>
        <div class=" col-md-12">
            <?php
            echo form_textarea(array(
                "id" => "description",
                "name" => "description",
                "value" => $model_info->description,
                "class" => "form-control wysiwyg",
                "placeholder" => lang('description'),
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
        localStorage.setItem('projectLabels', JSON.stringify(<?php echo json_encode($label_suggestions); ?>));
        localStorage.setItem('collaborators', JSON.stringify(<?php echo json_encode($collaborators_dropdown); ?>));
        $("#task-form").appForm({
            onSuccess: function (result) {
                $("#task-table").appTable({newData: result.data, dataId: result.id});
            }
        });
        $("#task-form .select2").select2();
        $("#title").focus();

        setDatePicker("#start_date, #end_date, #deadline");
//        $('#start_date').datepicker()
//            .on('changeDate', function(e) {
//                console.log('changed', e);
//                // `e` here contains the extra attributes
//            });


        $("#project_labels").select2({
            tags: <?php echo json_encode($label_suggestions); ?>
        });

        $("#collaborators").select2({
            tags: <?php echo json_encode($collaborators_dropdown); ?>
        });

        $('[data-toggle="tooltip"]').tooltip();
    });
</script>    