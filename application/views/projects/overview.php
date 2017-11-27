<div class="clearfix bg-white">

    <div class="row" style="background-color:#E5E9EC;">
        <div class="col-md-6">
            <div class="row">
                <div class="col-md-6 col-sm-12">
                      <?php $this->load->view("projects/project_progress_chart_info"); ?>
                </div>
                <div class="col-md-6 col-sm-12">
                    <div class="panel">
                        <div class="panel-body">
                            <div id="task-status-pai" class="p15" style="width: 100%; height: 220px;"></div>
                        </div>

                    </div>
                </div>

                <div class="col-md-12 col-sm-12">
                    <?php $this->load->view("projects/project_members/index"); ?>
                </div>  

                <div class="col-md-12 col-sm-12">
                       <?php $this->load->view("projects/project_description"); ?>
                </div>

            </div>
        </div>
        <div class="col-md-6">
            <div class="panel">
                <div class="tab-title clearfix">
                    <h4><?php echo lang('activity'); ?></h4>
                </div>
                <?php $this->load->view("projects/history/index"); ?>
            </div>
        </div>
    </div>
</div>

<?php
load_js(array(
    "assets/js/flot/jquery.flot.min.js",
    "assets/js/flot/jquery.flot.pie.min.js",
    "assets/js/flot/jquery.flot.resize.min.js",
    "assets/js/flot/curvedLines.js",
    "assets/js/flot/jquery.flot.tooltip.min.js",
));
?>
<script>
    $(function() {
        $('.chart').easyPieChart({
            trackColor: "#f2f2f2",
            lineWidth: 3, lineCap: 'butt',
            onStep: function(from, to, percent) {
                $(this.el).find('.percent').text(Math.round(percent) + "%");
            }
        });

        var taskData = [
            {label: "TODO - 0%", data: <?php echo $taskStatus['to_do - 0%']; ?>, color: "#f9531d"},
            {label: "In Progress - 25%", data: <?php echo $taskStatus['in_progress - 25%']; ?>, color: "#d0c953"},
            {label: "In Progress - 50%", data: <?php echo $taskStatus['in_progress - 50%']; ?>, color: "#9e33f9"},
            {label: "In Progress - 75%", data: <?php echo $taskStatus['in_progress - 75%']; ?>, color: "#0ff9c9"},
            {label: "Complete - 100%", data: <?php echo $taskStatus['done - 100%']; ?>, color: "#60dd00"}
        ];

        $.plot('#task-status-pai', taskData, {
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
