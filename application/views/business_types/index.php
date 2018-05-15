<div id="page-content" class="p20 row">
    <div class="col-sm-3 col-lg-2">
        <?php
        $tab_view['active_tab'] = "business_types";
        $this->load->view("settings/tabs", $tab_view);
        ?>
    </div>

    <div class="col-sm-9 col-lg-10">
        <div class="panel panel-default">
            <div class="page-title clearfix">
                <h1> business Types</h1>
                <div class="title-button-group">
                    <?php echo modal_anchor(get_uri("business_types/modal_form"), "<i class='fa fa-plus-circle'></i> " . 'Add business type', array("class" => "btn btn-default", "title" => 'Add business type')); ?>
                </div>
            </div>
            <div class="table-responsive">
                <table id="business-type-table" class="display" cellspacing="0" width="100%">            
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        $("#business-type-table").appTable({
            source: '<?php echo_uri("business_types/list_data") ?>',
            columns: [
                {title: 'Name'},
                {title: '<i class="fa fa-bars"></i>', "class": "text-center option w100"}
            ],
            printColumns: [0, 1]
        });
    });
</script>