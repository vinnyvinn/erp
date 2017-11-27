<div class="panel">
    <div class="tab-title clearfix">
        <h4><?php echo lang('invoices'); ?></h4>
        <div class="title-button-group">
            <?php echo modal_anchor(get_uri("invoices/modal_form"), "<i class='fa fa-plus-circle'></i> " . lang('add_invoice'), array("class" => "btn btn-default", "title" => lang('add_invoice'), "data-post-project_id" => $project_id)); ?>
        </div>
    </div>

    <div class="table-responsive">
        <table id="invoice-table" class="display" width="100%">       
            <tfoot>
                <tr>
                    <th colspan="5" class="text-right"><?php echo lang("total") ?>:</th>
                    <th class="text-right" data-current-page="5"></th>
                    <th class="text-right" data-current-page="6"></th>
                    <th> </th>
                </tr>
                <tr data-section="all_pages">
                    <th colspan="5" class="text-right"><?php echo lang("total_of_all_pages") ?>:</th>
                    <th class="text-right" data-all-page="5"></th>
                    <th class="text-right" data-all-page="6"></th>
                    <th> </th>
                </tr>
            </tfoot>
        </table>
    </div>
</div>


<script type="text/javascript">
    $(document).ready(function() {
        var currencySymbol = "<?php echo $project_info->currency_symbol; ?>";
        $("#invoice-table").appTable({
            source: '<?php echo_uri("invoices/invoice_list_data_of_project/" . $project_id) ?>',
            order: [[0, "desc"]],
            filterDropdown: [{name: "status", class: "w150", options: <?php $this->load->view("invoices/invoice_statuses_dropdown"); ?>}],
            columns: [
                {title: "<?php echo lang("invoice_id") ?>", "class": "w10p"},
                {targets: [1], visible: false, searchable: false},
                {targets: [2], visible: false, searchable: false},
                {title: "<?php echo lang("bill_date") ?>", "class": "w10p"},
                {title: "<?php echo lang("due_date") ?>", "class": "w10p"},
                {title: "<?php echo lang("invoice_value") ?>", "class": "w10p text-right"},
                {title: "<?php echo lang("payment_received") ?>", "class": "w10p text-right"},
                {title: "<?php echo lang("status") ?>", "class": "w10p text-center"}
            ],
            printColumns: [0, 3, 4, 5, 6, 7],
            xlsColumns: [0, 3, 4, 5, 6, 7],
            summation: [{column: 5, dataType: 'currency', currencySymbol: currencySymbol}, {column: 6, dataType: 'currency', currencySymbol: currencySymbol}]

        });
    });
</script>