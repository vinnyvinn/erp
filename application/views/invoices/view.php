<div id="page-content" class="clearfix">
    <div style="max-width: 1000px; margin: auto;">
        <div class="page-title clearfix mt15">
            <h1><?php echo lang('invoice') . ": #" . $invoice_info->id; ?></h1>
            <div class="title-button-group">
                <span class="dropdown inline-block">
                    <button class="btn btn-info dropdown-toggle  mt0 mb0" type="button" data-toggle="dropdown" aria-expanded="true">
                        <i class='fa fa-cogs'></i> <?php echo lang('actions'); ?>
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                        <li role="presentation"><?php echo modal_anchor(get_uri("invoices/send_invoice_modal_form/" . $invoice_info->id), "<i class='fa fa-envelope-o'></i> " . lang('email_invoice_to_client'), array("title" => lang('email_invoice_to_client'), "data-post-id" => $invoice_info->id, "role" => "menuitem", "tabindex" => "-1")); ?> </li>
                        <li role="presentation"><?php echo anchor(get_uri("invoices/download_pdf/" . $invoice_info->id), "<i class='fa fa-download'></i> " . lang('download_pdf'), array("title" => lang('download_pdf'))); ?> </li>
                        <li role="presentation"><?php echo anchor(get_uri("invoices/preview/" . $invoice_info->id . "/1"), "<i class='fa fa-search'></i> " . lang('invoice_preview'), array("title" => lang('invoice_preview')), array("target" => "_blank")); ?> </li>
                        <li role="presentation" class="divider"></li>
                        <li role="presentation"><?php echo modal_anchor(get_uri("invoices/modal_form"), "<i class='fa fa-edit'></i> " . lang('edit_invoice'), array("title" => lang('edit_invoice'), "data-post-id" => $invoice_info->id, "role" => "menuitem", "tabindex" => "-1")); ?> </li>

                        <?php if ($invoice_status == "draft") { ?>
                            <li role="presentation"><?php echo ajax_anchor(get_uri("invoices/set_invoice_status_to_not_paid/" . $invoice_info->id), "<i class='fa fa-check'></i> " . lang('mark_invoice_as_not_paid'), array("data-reload-on-success" => "1")); ?> </li>
                        <?php } ?>
                    </ul>
                </span>
                <?php echo modal_anchor(get_uri("invoices/item_modal_form"), "<i class='fa fa-plus-circle'></i> " . lang('add_item'), array("class" => "btn btn-default", "title" => lang('add_item'), "data-post-invoice_id" => $invoice_info->id)); ?>
                <?php echo modal_anchor(get_uri("invoice_payments/payment_modal_form"), "<i class='fa fa-plus-circle'></i> " . lang('add_payment'), array("class" => "btn btn-default", "title" => lang('add_payment'), "data-post-invoice_id" => $invoice_info->id)); ?>
            </div>
        </div>

        <div id="invoice-status-bar">
            <?php $this->load->view("invoices/invoice_status_bar"); ?>
        </div>
        <div class="mt15">
            <div class="panel panel-default p15 b-t">
                <div class="clearfix mt15">
                    <div class="col-sm-6">
                        <img src="<?php echo get_file_uri(get_setting("system_file_path") . get_setting("invoice_logo")); ?>"  />

                        <p class="mt15"><b><?php echo get_setting("company_name"); ?></b></p>
                        <?php
                        $company_address = nl2br(get_setting("company_address"));
                        $company_phone = get_setting("company_phone");
                        $company_website = get_setting("company_website");
                        if ($company_address) {
                            ?>
                            <p><?php echo $company_address; ?></p>
                        <?php } ?>

                        <?php if ($company_phone) { ?>
                            <p><?php echo lang("phone") . ": " . $company_phone; ?></p>
                        <?php } ?>
                        <?php if ($company_website) { ?>
                            <p><?php echo lang("website") . ": " . $company_website; ?></p>
                        <?php } ?>
                    </div>
                    <div class="col-sm-6 ">
                        <div class="text-right mb15">
                            <h3 class="uppercase"><?php echo lang("invoice") . " #" . $invoice_info->id; ?></h3>
                            <p><?php echo lang("bill_date") . ": " . $invoice_info->bill_date; ?></p>
                            <p><?php echo lang("due_date") . ": " . $invoice_info->due_date; ?></p>
                        </div>
                        <p class="b-b b-info">
                            <strong><?php echo lang("bill_to"); ?>  </strong>
                        </p>
                        <p> <b><?php echo anchor(get_uri("clients/view/" . $invoice_info->client_id), $client_info->company_name); ?></b></p>
                        <?php if ($client_info->address) { ?>
                            <p><?php echo nl2br($client_info->address); ?>
                                <?php if ($client_info->city) { ?>
                                    <br /><?php echo $client_info->city; ?>
                                <?php } ?>
                                <?php if ($client_info->state) { ?>
                                    <br /><?php echo $client_info->state; ?>
                                <?php } ?>
                                <?php if ($client_info->zip) { ?>
                                    <br /><?php echo $client_info->zip; ?>
                                <?php } ?>
                                <?php if ($client_info->country) { ?>
                                    <br /><?php echo $client_info->country; ?>
                                <?php } ?>
                                <?php if ($client_info->vat_number) { ?>
                                    <br /><?php echo lang("vat_number") . ": " . $client_info->vat_number; ?>
                                <?php } ?>
                            </p>
                        <?php } ?>
                    </div>
                </div>

                <div class="table-responsive mt15 pl15 pr15">
                    <table id="invoice-item-table" class="display" width="100%">            
                    </table>
                </div>

                <div class="clearfix">
                    <div class="col-sm-8">

                    </div>
                    <div class="col-sm-4" id="invoice-total-section">
                        <?php $this->load->view("invoices/invoice_total_section"); ?>
                    </div>
                </div>

                <p class="b-t b-info pt10 m15"><?php echo nl2br($invoice_info->note); ?></p>

            </div>
        </div>



        <div class="panel panel-default">
            <div class="panel-heading">
                <?php echo lang('invoice_payment_list'); ?>
            </div>
            <div class="table-responsive">
                <table id="invoice-payment-table" class="display" cellspacing="0" width="100%">            
                </table>
            </div>
        </div>

    </div>
</div>



<script type="text/javascript">
    RELOAD_VIEW_AFTER_UPDATE = true;
    $(document).ready(function () {
        $("#invoice-item-table").appTable({
            source: '<?php echo_uri("invoices/item_list_data/" . $invoice_info->id . "/") ?>',
            order: [[0, "asc"]],
            hideTools: true,
            columns: [
                {title: '<?php echo lang("item") ?> '},
                {title: '<?php echo lang("quantity") ?>', "class": "text-right w15p"},
                {title: '<?php echo lang("rate") ?>', "class": "text-right w15p"},
                {title: '<?php echo lang("total") ?>', "class": "text-right w15p"},
                {title: '<i class="fa fa-bars"></i>', "class": "text-center option w100"}
            ],
            onDeleteSuccess: function (result) {
                $("#invoice-total-section").html(result.invoice_total_view);
                if (typeof updateInvoiceStatusBar == 'function') {
                    updateInvoiceStatusBar(result.invoice_id);
                }
            },
            onUndoSuccess: function (result) {
                $("#invoice-total-section").html(result.invoice_total_view);
                if (typeof updateInvoiceStatusBar == 'function') {
                    updateInvoiceStatusBar(result.invoice_id);
                }
            }
        });

        $("#invoice-payment-table").appTable({
            source: '<?php echo_uri("invoice_payments/payment_list_data/" . $invoice_info->id . "/") ?>',
            order: [[0, "asc"]],
            columns: [
                {targets: [0], visible: false, searchable: false},
                {title: '<?php echo lang("payment_date") ?> ', "class": "w15p"},
                {title: '<?php echo lang("payment_method") ?>', "class": "w15p"},
                {title: '<?php echo lang("note") ?>'},
                {title: '<?php echo lang("amount") ?>', "class": "text-right w15p"},
                {title: '<i class="fa fa-bars"></i>', "class": "text-center option w100"}
            ],
            onDeleteSuccess: function (result) {
                updateInvoiceStatusBar();
                $("#invoice-total-section").html(result.invoice_total_view);
                if (typeof updateInvoiceStatusBar == 'function') {
                    updateInvoiceStatusBar(result.invoice_id);
                }
            },
            onUndoSuccess: function (result) {
                updateInvoiceStatusBar();
                $("#invoice-total-section").html(result.invoice_total_view);
                if (typeof updateInvoiceStatusBar == 'function') {
                    updateInvoiceStatusBar(result.invoice_id);
                }
            }
        });
    });

    updateInvoiceStatusBar = function (invoiceId) {
        $.ajax({
            url: "<?php echo get_uri("invoices/get_invoice_status_bar"); ?>/" + invoiceId,
            success: function (result) {
                if (result) {
                    $("#invoice-status-bar").html(result);
                }
            }
        });
    };

</script>

<?php
//required to send email 

load_css(array(
    "assets/js/summernote/summernote.css",
));
load_js(array(
    "assets/js/summernote/summernote.min.js",
));
?>

