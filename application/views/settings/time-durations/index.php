<div id="page-content" class="p20 row">

    <div class="col-sm-3 col-lg-2">
        <?php
        $tab_view['active_tab'] = "time-duations";
        $this->load->view("settings/tabs", $tab_view);
        ?>
    </div>

    <div class="col-sm-9 col-lg-10">
        <div class="panel panel-default">
            <div class="page-title clearfix">
                <h1>Time Durations</h1>
                <div class="title-button-group">
                    <?php
                    echo modal_anchor(get_uri("settings/time_duration_modal"), "<i class='fa fa-plus-circle'></i> " . lang('add_time_durations'), array("class" => "btn btn-default", "title" => lang('add_time_durations')));
                    ?>
                </div>
            </div>
            <div class="table-responsive">
                <table id="timedurations" class="display" cellspacing="0" width="100%">
                </table>
            </div>
        </div>
    </div>



</div>

<script type="text/javascript">
    $(document).ready(function() {

        $("#timedurations").appTable({
            source: '<?php echo_uri("settings/time_duration_list_data") ?>',
            columns: [
                {title: "<?php echo lang("id") ?>", "class": "text-center w50"},
                {title: "Name"},
                {title: "Seconds"},
                {title: '<i class="fa fa-bars"></i>', "class": "text-center option w100"}
            ],
            printColumns: [0, 1, 2, 3, 4, 5],
            xlsColumns: [0, 1, 2, 3, 4, 5]
        });
    });
</script>