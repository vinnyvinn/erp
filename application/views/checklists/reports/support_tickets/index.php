<div id="page-content" class="p20 clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>ICT Support Tickets</h1>
            <div class="title-button-group">
                <?php
                // if ($this->login_user->is_admin || $this->Team_model->is_ict_member()) {
                    echo modal_anchor(get_uri("ict_reports/support_tickets_modal_form"), "<i class='fa fa-plus-circle'></i> " . lang('add_ticket'), array("class" => "btn btn-default", "title" => lang('add_ticket')));
                // }
                ?>
            </div>
        </div>
        <div class="table-responsive">
            <table id="ict_reports_support_entries-table" class="display" cellspacing="0" width="100%">            
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        $("#ict_reports_support_entries-table").appTable({
            source: '<?php echo_uri("ict_reports/support_tickets_list_data") ?>',
            <?php if ($this->login_user->is_admin || $this->Team_model->is_ict_member()) { ?>
            radioButtons: [{text: 'System', name: "ticket_type_id", value: "1", isChecked: true}, {text: 'Email', name: "ticket_type_id", value: "2", isChecked: false}, {text: 'Call', name: "ticket_type_id", value: "3", isChecked: false}, {text: 'Visit', name: "ticket_type_id", value: "6", isChecked: false}],
            <?php } ?>
            columns: [
                    {title: "ID", "class": "text-center w50"},
                    {title: "Subject"},
                    {title: "Ticket Type"},
                    {title: "Created By"},
                    // {title: "Assigned To"},
                    {title: '<?php echo lang("last_activity") ?>', "iDataSort": 5, "class": "w10p"},
                    {title: "Status"},
                    <?php
                    if ($this->login_user->is_admin || $this->Team_model->is_ict_member()) {
                        echo '{title: \'<i class="fa fa-bars"></i>\', "class": "text-center option w80"}';
                    }
                    ?>
                ],
            // order: [[1, "desc"]],
            printColumns: [0, 1, 2, 3, 4, 5],
            xlsColumns: [0, 1, 2, 3, 4, 5]
        });
    });
</script>