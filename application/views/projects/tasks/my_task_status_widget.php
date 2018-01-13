<div class="panel panel-default">
    <div class="panel-heading">
        <i class="fa fa-tasks"></i>&nbsp;<?php echo lang("task_status"); ?>
    </div>
    <div class="panel-body ">
        <div id="my-task-status-pai" style="width: 100%; height: 250px;"></div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        var taskData = [
            {label: "TODO - 0%", data: <?php echo $taskStatus['to_do - 0%']; ?>, color: "#f9531d"},
            {label: "In Progress - 25%", data: <?php echo $taskStatus['in_progress - 25%']; ?>, color: "#d7d055"},
            {label: "In Progress - 50%", data: <?php echo $taskStatus['in_progress - 50%']; ?>, color: "#9e33f9"},
            {label: "In Progress - 75%", data: <?php echo $taskStatus['in_progress - 75%']; ?>, color: "#0ff9c9"},
            {label: "Complete - 100%", data: <?php echo $taskStatus['done - 100%']; ?>, color: "#60dd00"}
        ];

        $.plot('#my-task-status-pai', taskData, {
            series: {
                pie: {
                    show: true,
                    innerRadius: 0.5
                }
            },
            legend: {
                show: true
            },
            grid: {
                hoverable: true
            },
            tooltip: {
                show: true,
                content: "%s: %p.0%, %n", // show percentages, rounding to 2 decimal places
                shifts: {
                    x: 20,
                    y: 0
                },
                defaultTheme: false
            }
        });
    });
</script>    