<div id="page-content" class="p20 clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>Inventory Requisitions</h1>
            <div class="title-button-group">
                <?php
                    echo modal_anchor(get_uri("inventory_requisitions/modal_form"), "<i class='fa fa-plus-circle'></i> " . "Add Inventory Requisitions", array("class" => "btn btn-default", "title" => "Add Inventory Requisitions"));
                ?>
            </div>
        </div>
        <div class="table-responsive">
            <table id="inventory_requisitions-table" class="display" cellspacing="0" width="100%">            
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        $("#inventory_requisitions-table").appTable({
            source: '<?php echo_uri("inventory_requisitions/list_data") ?>',
            columns: [
                {title: 'ID', "class": "w50", "data": "id"},
                {title: 'Stock Item', "class": "w20p", "data": "item_name"},
                {title: 'Quantity', "class": "w20p", "data": "item_quantity"},
                {title: 'Cost Amount', "class": "w20p", "data": "item_cost"},
                {title: 'Request Created', "class": "w20p", "data": "created_at"},
                {title: 'Status', "class": "w20p", "data": "status"}
            ],
            // order: [[1, "desc"]],
            printColumns: [0, 1, 2, 3, 4, 5],
            xlsColumns: [0, 1, 2, 3, 4, 5]
        });
    });
</script>