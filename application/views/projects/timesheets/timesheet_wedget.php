<div class="panel panel-default">
    <div class="panel-heading">
        <i class="fa fa-file-text-o"></i>&nbsp; <?php echo lang("timesheet_statistics"); ?>
    </div>
    <div class="panel-body ">
        <div id="timesheet-statistics-flotchart" style="width: 100%; height: 300px;"></div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        var timesheetStatisticsFlotchart = function() {
            var timesheets = <?php echo $timesheets; ?>,
                    ticks = <?php echo $ticks; ?>,
                    dataset = [
                {
                    label: "<?php echo lang('timesheets'); ?>",
                    data: timesheets,
                    color: "rgba(0, 179, 147, 1)",
                    lines: {
                        show: true,
                        fill: 0.2
                    },
                    shadowSize: 0
                }, {
                    data: timesheets,
                    color: "#fff",
                    lines: {
                        show: false
                    },
                    curvedLines: {
                        apply: false
                    },
                    points: {
                        show: true,
                        fill: true,
                        radius: 4,
                        fillColor: "#00B393",
                        lineWidth: 2
                    },
                    shadowSize: 0
                }
            ];

            $.plot("#timesheet-statistics-flotchart", dataset, {
                series: {
                    lines: {
                        show: true,
                        fill: 0.3
                    },
                    shadowSize: 0,
                    curvedLines: {
                        apply: true,
                        active: true
                    }
                },
                legend: {
                    show: true
                },
                yaxis: {
                    min: 0
                },
                xaxis: {
                    ticks: ticks
                },
                grid: {
                    color: "#bbb",
                    hoverable: true,
                    borderWidth: 0,
                    backgroundColor: '#FFF'
                },
                tooltip: true,
                tooltipOpts: {
                    content: function(x, y, z) {
                         return secondsToTimeFormat(z*60);
                    },
                    defaultTheme: false
                }
            });

        };

        timesheetStatisticsFlotchart();
    });
</script>    

