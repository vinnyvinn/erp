
<div id="page-content" class="clearfix">
    <div style="max-width: 1000px; margin: auto;">
        <div class="page-title clearfix mt15">
            <h1><?php echo lang('estimate') . ": #" . $estimate_info->id; ?></h1>
            <div class="title-button-group">
                <span class="dropdown inline-block">
                    <button class="btn btn-info dropdown-toggle  mt0 mb0" type="button" data-toggle="dropdown" aria-expanded="true">
                        <i class='fa fa-cogs'></i> <?php echo lang('actions'); ?>
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                        <li role="presentation"><?php echo anchor(get_uri("estimates/download_pdf/" . $estimate_info->id), "<i class='fa fa-download'></i> " . lang('download_pdf'), array("title" => lang('download_pdf'))); ?> </li>
                        <li role="presentation"><?php echo anchor(get_uri("estimates/preview/" . $estimate_info->id . "/1"), "<i class='fa fa-search'></i> " . lang('estimate_preview'), array("title" => lang('estimate_preview')), array("target" => "_blank")); ?> </li>
                        <li role="presentation" class="divider"></li>
                        <li role="presentation"><?php echo modal_anchor(get_uri("estimates/modal_form"), "<i class='fa fa-edit'></i> " . lang('edit_estimate'), array("title" => lang('edit_estimate'), "data-post-id" => $estimate_info->id, "role" => "menuitem", "tabindex" => "-1")); ?> </li>

                        <?php
                        if ($estimate_status == "draft") {
                            ?>
                            <li role="presentation"><?php echo ajax_anchor(get_uri("estimates/update_estimate_status/" . $estimate_info->id . "/sent"), "<i class='fa fa-send'></i> " . lang('mark_as_sent'), array("data-reload-on-success" => "1")); ?> </li>
                        <?php } else if ($estimate_status == "sent") { ?>
                            <li role="presentation"><?php echo ajax_anchor(get_uri("estimates/update_estimate_status/" . $estimate_info->id . "/accepted"), "<i class='fa fa-check-circle'></i> " . lang('mark_as_accepted'), array("data-reload-on-success" => "1")); ?> </li>
                            <li role="presentation"><?php echo ajax_anchor(get_uri("estimates/update_estimate_status/" . $estimate_info->id . "/declined"), "<i class='fa fa-times-circle-o'></i> " . lang('mark_as_declined'), array("data-reload-on-success" => "1")); ?> </li>
                        <?php } else if ($estimate_status == "accepted") { ?>
                            <li role="presentation"><?php echo ajax_anchor(get_uri("estimates/update_estimate_status/" . $estimate_info->id . "/declined"), "<i class='fa fa-times-circle-o'></i> " . lang('mark_as_declined'), array("data-reload-on-success" => "1")); ?> </li>
                        <?php } else if ($estimate_status == "declined") { ?>
                            <li role="presentation"><?php echo ajax_anchor(get_uri("estimates/update_estimate_status/" . $estimate_info->id . "/accepted"), "<i class='fa fa-check-circle'></i> " . lang('mark_as_accepted'), array("data-reload-on-success" => "1")); ?> </li>
                        <?php } ?>

                        <?php
                        if ($estimate_status == "accepted" && $show_invoice_option) {
                            ?>
                            <li role="presentation" class="divider"></li>
                            <li role="presentation"><?php echo modal_anchor(get_uri("invoices/modal_form"), "<i class='fa fa-refresh'></i> " . lang('create_invoice'), array("title" => lang("create_invoice"), "data-post-estimate_id"=>$estimate_info->id )); ?> </li>
                        <?php } ?>
                    </ul>
                </span>
                <?php echo modal_anchor(get_uri("estimates/item_modal_form"), "<i class='fa fa-plus-circle'></i> " . lang('add_item'), array("class" => "btn btn-default", "title" => lang('add_item'), "data-post-estimate_id" => $estimate_info->id)); ?>
            </div>
        </div>
        <div id="estimate-status-bar">
            <?php $this->load->view("estimates/estimate_status_bar"); ?>
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
                            <h3 class="uppercase"><?php echo lang("estimate") . " #" . $estimate_info->id; ?></h3>
                            <p><?php echo lang("estimate_date") . ": " . $estimate_info->estimate_date; ?></p>
                            <p><?php echo lang("valid_until") . ": " . $estimate_info->valid_until; ?></p>
                        </div>
                        <p class="b-b b-info">
                            <strong><?php echo lang("estimate_to"); ?>  </strong>
                        </p>
                        <p> <b><?php echo anchor(get_uri("clients/view/" . $estimate_info->client_id), $client_info->company_name); ?></b></p>
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
                    <table id="estimate-item-table" class="display" width="100%">            
                    </table>
                </div>

                <div class="clearfix">
                    <div class="col-sm-8">

                    </div>
                    <div class="col-sm-4" id="estimate-total-section">
                        <?php $this->load->view("estimates/estimate_total_section"); ?>
                    </div>
                </div>

                <p class="b-t b-info pt10 m15"><?php echo nl2br($estimate_info->note); ?></p>

            </div>
        </div>

    </div>
</div>



<script type="text/javascript">
    RELOAD_VIEW_AFTER_UPDATE = true;
    $(document).ready(function () {
        $("#estimate-item-table").appTable({
            source: '<?php echo_uri("estimates/item_list_data/" . $estimate_info->id . "/") ?>',
            order: [[0, "asc"]],
            hideTools: true,
            columns: [
                {title: "<?php echo lang("item") ?> "},
                {title: "<?php echo lang("quantity") ?>", "class": "text-right w15p"},
                {title: "<?php echo lang("rate") ?>", "class": "text-right w15p"},
                {title: "<?php echo lang("total") ?>", "class": "text-right w15p"},
                {title: "<i class='fa fa-bars'></i>", "class": "text-center option w100"}
            ],
            onDeleteSuccess: function (result) {
                $("#estimate-total-section").html(result.estimate_total_view);
                if (typeof updateInvoiceStatusBar == 'function') {
                    updateInvoiceStatusBar(result.estimate_id);
                }
            },
            onUndoSuccess: function (result) {
                $("#estimate-total-section").html(result.estimate_total_view);
                if (typeof updateInvoiceStatusBar == 'function') {
                    updateInvoiceStatusBar(result.estimate_id);
                }
            }
        });
    });

    updateInvoiceStatusBar = function (estimateId) {
        $.ajax({
            url: "<?php echo get_uri("estimates/get_estimate_status_bar"); ?>/" + estimateId,
            success: function (result) {
                if (result) {
                    $("#estimate-status-bar").html(result);
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
