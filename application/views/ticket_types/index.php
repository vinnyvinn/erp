<div id="page-content" class="p20 row">
    <div class="col-sm-3 col-lg-2">
        <?php
        $tab_view['active_tab'] = "ticket_types";
        $this->load->view("settings/tabs", $tab_view);
        ?>
    </div>

    <div class="col-sm-9 col-lg-10">
        <div class="panel panel-default">
            <div class="page-title clearfix">
                <h1> <?php echo lang('ticket_types'); ?></h1>
                <div class="title-button-group">
                    <?php echo modal_anchor(get_uri("ticket_types/modal_form"), "<i class='fa fa-plus-circle'></i> " . lang('add_ticket_type'), array("class" => "btn btn-default", "title" => lang('add_ticket_type'))); ?>
                </div>
            </div>
            <div class="table-responsive">
                <table id="ticket-type-table" class="display" cellspacing="0" width="100%">            
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        $("#ticket-type-table").appTable({
            source: '<?php echo_uri("ticket_types/list_data") ?>',
            columns: [
                {title: '<?php echo lang("name"); ?>'},
                {title: '<i class="fa fa-bars"></i>', "class": "text-center option w100"}
            ],
            printColumns: [0, 1]
        });
    });
</script>