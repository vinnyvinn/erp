<div id="page-content" class="p20 clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>ICT Assets Maintainance Reports</h1>
        </div>
        <div class="table-responsive">
            <table id="ict_reports_maintainance_data-table" class="display" cellspacing="0" width="100%">            
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        $("#ict_reports_maintainance_data-table").appTable({
            source: '<?php echo_uri("ict_reports/maintainance_reports_list_data") ?>',
            radioButtons: [{text: 'Performed', name: "status", value: "1", isChecked: true}, {text: 'Not Performed', name: "status", value: "0", isChecked: false}],
            columns: [
                    {title: "ID", "class": "text-center w50"},
                    {title: "Item"},
                    {title: "Performed by"},
                    {title: "Date"},
                    {title: "Status"}
                ],
            // order: [[1, "desc"]],
            printColumns: [0, 1, 2, 3, 4],
            xlsColumns: [0, 1, 2, 3, 4]
        });
    });
</script>