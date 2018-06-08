<div id="page-content" class="p20 clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>ICT Asset Register</h1>
            <div class="title-button-group">
                <?php
                if ($this->login_user->is_admin || $this->Team_model->is_ict_member()) {
                  echo modal_anchor(get_uri("ict_reports/actual_asset_modal_form"), "<i class='fa fa-plus-circle'></i> " . "Actual ICT Assets", array("class" => "btn btn-default", "title" => "Add Actual ICT Assets"));
                }
                ?>
            </div>
        </div>
        <div class="table-responsive">
            <table id="ict_inventory-table" class="display" cellspacing="0" width="100%">            
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        $("#ict_inventory-table").appTable({
            source: '<?php echo_uri("ict_reports/inventory_list_data") ?>',
            <?php if ($this->login_user->is_admin || $this->Team_model->is_ict_member()) { ?>
                radioButtons: [{text: 'ALL', name: "category_id", value: "", isChecked: true}, {text: 'Actual Assets', name: "category_id", value: "1", isChecked: false}, {text: 'Sage Assets', name: "category_id", value: "0", isChecked: false}],
            <?php } else { ?>
                radioButtons: [{text: 'ALL', name: "category_id", value: "", isChecked: true}],
            <?php } ?>
            columns: [
                    {title: "Asset NO", "class": "text-center w50"},
                    {title: "Title"},
                    {title: "Model NO"},
                    {title: "Serial NO"},
                    {title: "Location"},
                    {title: "Category"},
                    {title: "Custodian"},
                    {title: "Department"},
                    {title: "Purchase date"},
                    {title: "Purchase cost"},
                    {title: "Supplier"}
                ],
            // order: [[1, "desc"]],
            printColumns: [0, 1, 2, 3, 4, 5],
            xlsColumns: [0, 1, 2, 3, 4, 5]
        });
    });
</script>