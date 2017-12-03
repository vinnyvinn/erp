<div id="page-content" class="p20 clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>Petty Cash</h1>
            <div class="title-button-group">
                <?php
                    echo modal_anchor(get_uri("petty_cash/modal_form"), "<i class='fa fa-plus-circle'></i> " . "Add Petty Cash", array("class" => "btn btn-default", "title" => "Add Petty Cash"));
                ?>
            </div>
        </div>
        <div class="table-responsive">
            <table id="petty_cash-table" class="display" cellspacing="0" width="100%">            
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        $("#petty_cash-table").appTable({
            source: '<?php echo_uri("petty_cash/list_data") ?>',
            columns: [
                {title: 'ID', "class": "w50", "data": "id"},
                {title: 'Petty Cash Type', "class": "w20p", "data": "petty_cash"},
                {title: 'Cost Amount', "class": "w20p", "data": "amount"},
                {title: 'Project', "class": "w20p", "data": "project"},
                {title: 'Request Created', "class": "w20p", "data": "created_at"},
                {title: 'Status', "class": "w20p", "data": "status"}
            ],
            // order: [[1, "desc"]],
            printColumns: [0, 1, 2, 3, 4, 5],
            xlsColumns: [0, 1, 2, 3, 4, 5]
        });
    });
</script>