<div id="page-content" class="p20 row">

    <div class="col-sm-3 col-lg-2">
        <?php
        $tab_view['active_tab'] = "esc_n_reminders";
        $this->load->view("legal/tabs", $tab_view);
        ?>
    </div>

    <div class="col-sm-9 col-lg-10">
        <div class="panel panel-default">
            <div class="page-title clearfix">
                <h1>Reminders</h1>
                <div class="title-button-group">
                    <small>If you want reminder to run only once set send reminder every and send reminder for to N/A</small>
                    <?php
                    echo modal_anchor(get_uri("legal/reminders_modal_form"), "<i class='fa fa-plus-circle'></i> " . 'Add Reminder', array("class" => "btn btn-default", "title" => 'Add Reminder'));
                    ?>
                </div>
            </div>
            <div class="table-responsive">
                <table id="escalation" class="display" cellspacing="0" width="100%">
                </table>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function() {
            $("#escalation").appTable({
                source: '<?php echo_uri("legal/reminders_list_data") ?>',
                columns: [
                    {title: "<?php echo lang("id") ?>", "class": "text-center w50"},
                    {title: "Name"},
                    {title: "Document Type"},
                    {title: "Team"},
                    {title: "Duration before expiry"},
                    {title: "Send reminder every"},
                    {title: "Send reminder for"},
                    {title: '<i class="fa fa-bars"></i>', "class": "text-center option w100"}
                ],
                printColumns: [0, 1, 2, 3, 4, 5],
                xlsColumns: [0, 1, 2, 3, 4, 5]
            });
        });
    </script>

</div>


