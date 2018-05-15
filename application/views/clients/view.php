<div class="page-title clearfix">
    <h1><?php echo "Prospecting client details" . " - " . $client_info->company_name ?></h1>
    <div class="title-button-group">
        <?php echo modal_anchor(get_uri("clients/modal_form"), "<i class='fa fa-pencil'></i> " . lang('edit'), array("class" => "btn btn-default", "title" => "Edit Serves Provider", "data-post-view" => "details", "data-post-id" => $client_info->id)); ?>
    </div>
</div>

<div id="page-content" class="clearfix">
    <div class="mt15">
        <?php //$this->load->view("clients/info_widgets"); ?>
    </div>

    <ul data-toggle="ajax-tab" class="nav nav-tabs" role="tablist">
        <li><a  role="presentation" href="<?php echo_uri("clients/contacts/" . $client_info->id); ?>" data-target="#client-contacts"> <?php echo lang('contacts'); ?></a></li>
        <!-- <li><a  role="presentation" class="active" href="<?php echo_uri("clients/projects/" . $client_info->id); ?>" data-target="#client-projects"><?php echo lang('projects'); ?></a></li>
        <?php if ($show_invoice_info) { ?>
            <li><a  role="presentation" href="<?php echo_uri("clients/invoices/" . $client_info->id); ?>" data-target="#client-invoices"> <?php echo lang('invoices'); ?></a></li>
            <li><a  role="presentation" href="<?php echo_uri("clients/payments/" . $client_info->id); ?>" data-target="#client-payments"> <?php echo lang('payments'); ?></a></li>
        <?php } ?>
        <?php if ($show_estimate_info) { ?>
            <li><a  role="presentation" href="<?php echo_uri("clients/estimates/" . $client_info->id); ?>" data-target="#client-estimates"> <?php echo lang('estimates'); ?></a></li>
        <?php } ?>
        <?php if ($show_estimate_request_info) { ?>
            <li><a  role="presentation" href="<?php echo_uri("clients/estimate_requests/" . $client_info->id); ?>" data-target="#client-estimate-requests"> <?php echo lang('estimate_requests'); ?></a></li>
        <?php } ?>
        <?php if ($show_ticket_info) { ?>
            <li><a  role="presentation" href="<?php echo_uri("clients/tickets/" . $client_info->id); ?>" data-target="#client-tickets"> <?php echo lang('tickets'); ?></a></li>
        <?php } ?>
        <li><a  role="presentation" href="<?php echo_uri("clients/notes/" . $client_info->id); ?>" data-target="#client-notes"> <?php echo lang('notes'); ?></a></li> -->
    </ul>
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane fade active" id="client-projects"></div>
        <div role="tabpanel" class="tab-pane fade" id="client-contacts"></div>
        <div role="tabpanel" class="tab-pane fade" id="client-invoices"></div>
        <div role="tabpanel" class="tab-pane fade" id="client-payments"></div>
        <div role="tabpanel" class="tab-pane fade" id="client-estimates"></div>
        <div role="tabpanel" class="tab-pane fade" id="client-estimate-requests"></div>
        <div role="tabpanel" class="tab-pane fade" id="client-tickets"></div>
        <div role="tabpanel" class="tab-pane fade" id="client-notes"></div>
    </div>
</div>