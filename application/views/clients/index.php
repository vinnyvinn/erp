<div id="page-content" class="p20 clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1><?php echo lang('clients'); ?></h1>
            <div class="title-button-group">
                <?php echo modal_anchor(get_uri("clients/"), "<i class='fa fa-plus-circle'></i> " . lang('add_client'), array("class" => "btn btn-default", "title" => lang('add_client'))); ?>
            </div>
        </div>
        <div class="table-responsive">
            <table id="client-table" class="display" cellspacing="0" width="100%">
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        var showInvoiceInfo = true;
        if(!"<?php echo $show_invoice_info; ?>") {
            showInvoiceInfo = false;
        }

        $("#client-table").appTable({
            source: '<?php echo_uri("clients/list_data") ?>',
            columns: [
                {title: "<?php echo lang("id") ?>", "class": "text-center w50"},
                {title: "<?php echo lang("company_name") ?>"},
                {title: "<?php echo lang("primary_contact") ?>"},
                 {title: "<?php echo lang("description") ?>"},
                /*{title: "<?php echo lang("projects") ?>"},
                {visible: showInvoiceInfo, searchable: false, title: "<?php echo lang("invoice_value") ?>"},
                {visible: showInvoiceInfo, searchable: false, title: "<?php echo lang("payment_received") ?>"},*/
                {title: "Status"},
                <?php
                if ($this->login_user->is_admin) {
                    echo "{title: '<i class=\"fa fa-bars\"></i>', \"class\": \"text-center option w100\"}";
                }
                ?>
            ],
            printColumns: [0, 1, 2, 3, 4, 5],
            xlsColumns: [0, 1, 2, 3, 4, 5]
        });
    });
</script>