<div class="panel panel-default">
    <div class="panel-heading">
        <i class="fa fa fa-file-text-o"></i>&nbsp; <?php echo lang("invoice_statistics"); ?>
    </div>
    <div class="panel-body ">
        <div id="timesheet-statistics-flotchart" style="width: 100%; height: 300px;"></div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        var invoiceStatisticsFlotchart = function () {
            var invoices =<?php echo $invoices; ?>,
                    payments = <?php echo $payments; ?>,
                    dataset = [
                        {label: "<?php echo lang('invoice'); ?>",
                            data: invoices,
                            color: "rgba(220,220,220,1)",
                            lines: {
                                show: true,
                                fill: 0.2
                            },
                            shadowSize: 0
                        },
                        {
                            data: invoices,
                            color: "#fff",
                            lines: {
                                show: false
                            },
                            points: {
                                show: true,
                                fill: true,
                                radius: 4,
                                fillColor: "rgba(210,210,220,1)",
                                lineWidth: 2
                            },
                            curvedLines: {
                                apply: false
                            },
                            shadowSize: 0
                        },
                        {
                            label: "<?php echo lang('payment'); ?>",
                            data: payments,
                            color: "rgba(0, 179, 147, 1)",
                            lines: {
                                show: true,
                                fill: 0.2
                            },
                            shadowSize: 0
                        }, {
                            data: payments,
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
                    ticks: [[1, "<?php echo lang('short_january'); ?>"], [2, "<?php echo lang('short_february'); ?>"], [3, "<?php echo lang('short_march'); ?>"], [4, "<?php echo lang('short_april'); ?>"], [5, "<?php echo lang('short_may'); ?>"], [6, "<?php echo lang('short_june'); ?>"], [7, "<?php echo lang('short_july'); ?>"], [8, "<?php echo lang('short_august'); ?>"], [9, "<?php echo lang('short_september'); ?>"], [10, "<?php echo lang('short_october'); ?>"], [11, "<?php echo lang('short_november'); ?>"], [12, "<?php echo lang('short_december'); ?>"]]
                },
                grid: {
                    color: "#bbb",
                    hoverable: true,
                    borderWidth: 0,
                    backgroundColor: '#FFF'
                },
                tooltip: true,
                tooltipOpts: {
                    content: function (x, y, z) {
                        if (x) {
                            return "%s: " + toCurrency(z);
                        } else {
                            return  toCurrency(z);
                        }
                    },
                    defaultTheme: false
                }
            });

        };

        invoiceStatisticsFlotchart();
    });
</script>    

