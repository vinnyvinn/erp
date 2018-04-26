<div id="page-content" class="p20 clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>Support Entries</h1>
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
            source: '<?php echo_uri("ict_reports/support_entries_list_data") ?>',
            radioButtons: [{text: 'System', name: "ticket_type_id", value: "1", isChecked: true}, {text: 'Email', name: "ticket_type_id", value: "2", isChecked: false}, {text: 'Call', name: "ticket_type_id", value: "3", isChecked: false}, {text: 'Visit', name: "ticket_type_id", value: "6", isChecked: false}],
            columns: [
                    {title: "ID", "class": "text-center w50"},
                    {title: "Subject"},
                    {title: "Project"},
                    {title: "Ticket Type"},
                    {title: "Assigned To"},
                    {title: "Status"}
                ],
            // order: [[1, "desc"]],
            printColumns: [0, 1, 2, 3, 4, 5],
            xlsColumns: [0, 1, 2, 3, 4, 5]
        });
    });
</script>