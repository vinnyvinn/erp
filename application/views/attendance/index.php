<div id="page-content" class="m20 clearfix">

    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1><?php echo lang('attendance'); ?></h1>
            <div class="title-button-group">
                <?php echo modal_anchor(get_uri("attendance/modal_form"), "<i class='fa fa-plus-circle'></i> " . lang('add_attendance'), array("class" => "btn btn-default", "title" => lang('add_attendance'))); ?>
            </div>
        </div>
        <div class="table-responsive">
            <table id="attendance-table" class="display" cellspacing="0" width="100%">            
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
        </div>
    </div>

</div>


<script type="text/javascript">
    $(document).ready(function() {
        $("#attendance-table").appTable({
            source: '<?php echo_uri("attendance/list_data"); ?>',
            order: [[2, "asc"]],
            dateRangeType: "daily",
            columns: [
                {title: "<?php echo lang("team_member"); ?>", "class": "w15p"},
                {title: "Project (Task)", "class": "w15p"},
                {title: "<?php echo lang("in_date"); ?>", "class": "w15p"},
                {title: "<?php echo lang("in_time"); ?>", "class": "w10p"},
                {title: "<?php echo lang("out_date"); ?>", "class": "w15p"},
                {title: "<?php echo lang("out_time"); ?>", "class": "w10p"},
                {title: "<?php echo lang("duration"); ?>"},
                {title: '<i class="fa fa-bars"></i>', "class": "text-center option w100"}
            ],
            printColumns: [0, 1, 2, 3, 4, 5, 6],
            xlsColumns: [0, 1, 2, 3, 4, 5, 6],
            summation: [{column: 6, dataType: 'time'}]
        });
    });
</script>    
