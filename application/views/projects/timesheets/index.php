<div class="panel">
    <div class="tab-title clearfix">
        <h4><?php echo lang('timesheets'); ?></h4>
        <div class="title-button-group">
            <?php echo modal_anchor(get_uri("projects/timelog_modal_form"), "<i class='fa fa-plus-circle'></i> " . lang('log_time'), array("class" => "btn btn-default", "title" => lang('log_time'), "data-post-project_id" => $project_id)); ?>
        </div>
    </div>

    <div class="table-responsive">
        <table id="project-timesheet-table" class="display" width="100%">  
            <tfoot>
                <tr>
                    <th colspan="4" class="text-right"><?php echo lang("total") ?>:</th>
                    <th class="text-left" data-current-page="4"></th>
                    <th> </th>
                </tr>
                <tr data-section="all_pages">
                    <th colspan="4" class="text-right"><?php echo lang("total_of_all_pages") ?>:</th>
                    <th class="text-left" data-all-page="4"></th>
                    <th> </th>
                </tr>
            </tfoot>
        </table>
    </div>
</div>


<script type="text/javascript">
    $(document).ready(function() {
        $("#project-timesheet-table").appTable({
            source: '<?php echo_uri("projects/timesheet_list_data/" . $project_id) ?>',
            order: [[1, "desc"]],
            filterDropdown: [{name: "user_id", class: "w200", options: <?php echo $project_members_dropdown; ?>}],
            columns: [
                {title: '<?php echo lang("member") ?>'},
                {title: 'Task'},
                {title: '<?php echo lang("start_time") ?>'},
                {title: '<?php echo lang("end_time") ?>'},
                {title: '<?php echo lang("total") ?>'},
                {title: '<i class="fa fa-bars"></i>', "class": "text-center option w100"}
            ],
            printColumns: [0, 1, 2, 3, 4],
            xlsColumns: [0, 1, 2, 3, 4],
            summation: [{column: 4, dataType: 'time'}]
        });
    });
</script>