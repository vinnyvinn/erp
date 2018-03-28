<div class="panel">
    <div class="panel-heading bg-info p30">
        <br />
    </div>
    <div class="clearfix text-center">
        <div class="mt-50 chart-circle">
            <span class="chart" data-size="100" data-percent="<?php echo $project_progress; ?>"  data-scale-color="transparent" data-bar-color="#16AAD8" >
                <span class="percent chart-label" style="width: 100px; margin-top: 40px;"></span>
            </span>
        </div>
    </div>

    <div class="p10 b-t b-b">
        <?php echo lang("start_date"); ?>: <span class="pull-right"><?php echo $project_info->start_date * 1 ? format_to_date($project_info->start_date) : "-"; ?></span>
    </div>
    <div class="p10 b-b">
        <?php echo lang("deadline"); ?>: <span class="pull-right"><?php echo $project_info->deadline * 1 ? format_to_date($project_info->deadline) : "-"; ?></span>
    </div>
    <div class="p10 b-b">
        Project Value: <span class="pull-right"><?php echo get_setting('currency_symbol') . number_format($project_info->price, 2); ?></span>
    </div>
    <?php if ($this->login_user->user_type === "staff") { ?>
        <div class="p10 b-b">
            Current Resource Cost: <span class="pull-right"><?php echo get_setting('currency_symbol') . number_format($resourceCost, 2); ?></span>
        </div>
        <div class="p10 b-b">
            Current Expenses: <span class="pull-right"><?php echo get_setting('currency_symbol') . number_format($expenses, 2); ?></span>
        </div>
        <div class="p10 b-b">
            <strong>Total Cost: <span class="pull-right"><?php echo get_setting('currency_symbol') . number_format($totalCost, 2); ?></span></strong>
        </div>
        <div class="p10 b-b">
            <strong>Estimated Cost: <span class="pull-right"><?php echo get_setting('currency_symbol') . number_format($estimateCost, 2); ?></span></strong>
        </div>
        <?php if ($costVariance < 0) : ?>
            <div class="p10 b-b bg-danger">
                <strong>Current Loss: <span class="pull-right">(<?php echo get_setting('currency_symbol') . number_format($costVariance * -1, 2); ?>)</span></strong>
            </div>
        <?php else : ?>
            <div class="p10 b-b bg-success">
                <strong>Current Saving: <span class="pull-right"><?php echo get_setting('currency_symbol') . number_format($costVariance, 2); ?></span></strong>
            </div>
        <?php endif; ?>

        <div class="p10">
            <?php echo lang("client"); ?>: <span class="pull-right"><?php echo anchor(get_uri("clients/view/" . $project_info->client_id), $project_info->company_name); ?></span>
        </div>
    <?php } ?>
</div>


<?php
load_js(array(
    "assets/js/easypiechart/jquery.easypiechart.min.js"));
?>

<script>
    $(function () {
        $('.chart').easyPieChart({
            trackColor: "#f2f2f2",
            lineWidth: 3, lineCap: 'butt',
            onStep: function (from, to, percent) {
                $(this.el).find('.percent').text(Math.round(percent) + "%");
            }
        });
    });
</script>
