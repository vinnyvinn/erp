<div class="panel clearfix <?php
if (isset($page_type) && $page_type === "full") {
    echo "m20";
}
?>">

    <?php if ($user_id === $this->login_user->id) : ?>
    <div class="title-button-group" style="margin: 20px">
        <?php echo modal_anchor(get_uri("attendance/modal_form"), "<i class='fa fa-plus-circle'></i> " . lang('add_attendance'), array("class" => "btn btn-default", "title" => lang('add_attendance'))); ?>
    </div>
    <?php endif; ?>
    <ul data-toggle="ajax-tab" class="nav nav-tabs bg-white inner" role="tablist">
        <li class="title-tab"><h4 class="pl15 pt5 pr15"><?php
                if ($user_id === $this->login_user->id) {
                    echo lang("my_time_cards");
                } else {
                    echo lang("attendance");
                }
                ?></h4></li>
        <li><a id="monthly-attendance-button"  role="presentation" class="active" href="javascript:;" data-target="#team_member-monthly-attendance"><?php echo lang("monthly"); ?></a></li>
        <li><a role="presentation" href="<?php echo_uri("team_members/weekly_attendance/"); ?>" data-target="#team_member-weekly-attendance"><?php echo lang('weekly'); ?></a></li>
        <li><a role="presentation" href="<?php echo_uri("team_members/daily_attendance/"); ?>" data-target="#team_member-daily-attendance"><?php echo lang('daily'); ?></a></li>    </ul>
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane fade" id="team_member-monthly-attendance">
            <table id="monthly-attendance-table" class="display" cellspacing="0" width="100%">    
                <tfoot>
                    <tr>
                        <th colspan="6" class="text-right"><?php echo lang("total") ?>:</th>
                        <th data-current-page="6"></th>
                        <th> </th>
                    </tr>
                    <tr data-section="all_pages">
                        <th colspan="6" class="text-right"><?php echo lang("total_of_all_pages") ?>:</th>
                        <th data-all-page="6"></th>
                        <th> </th>
                    </tr>
                </tfoot>
            </table>
            <script type="text/javascript">
                loadMembersAttendanceTable = function(selector, dateRange) {
                    $(selector).appTable({
                        source: '<?php echo_uri("attendance/list_data/"); ?>',
                        order: [[2, "desc"]],
                        dateRangeType: dateRange,
                        filterParams: {user_id: "<?php echo $user_id; ?>"},
                        columns: [
                            {targets: [1], visible: false, searchable: false},
                            {title: "Project (Task)", "class": "w15p"},
                            {title: "<?php echo lang("in_date"); ?>", "class": "w15p"},
                            {title: "<?php echo lang("in_time"); ?>", "class": "w10p"},
                            {title: "<?php echo lang("out_date"); ?>", "class": "w15p"},
                            {title: "<?php echo lang("out_time"); ?>", "class": "w10p"},
                            {title: "<?php echo lang("duration"); ?>"},
                            {title: '<i class="fa fa-bars"></i>', "class": "text-center option w100"}
                        ],
                        printColumns: [1, 2, 3, 4, 5, 6],
                        xlsColumns: [1, 2, 3, 4, 5, 6],
                        summation: [{column: 6, dataType: 'time'}]
                    });
                };

                $(document).ready(function() {
                    $("#monthly-attendance-button").trigger("click");
                    loadMembersAttendanceTable("#monthly-attendance-table", "monthly");
                });
            </script>
        </div>
        <div role="tabpanel" class="tab-pane fade" id="team_member-weekly-attendance"></div>
        <div role="tabpanel" class="tab-pane fade" id="team_member-daily-attendance"></div>
    </div>
</div>