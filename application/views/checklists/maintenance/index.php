<div id="page-content" class="p20 clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>ICT Assets Preventive Maintenance</h1>
            <div class="title-button-group">
                <?php
                if ($this->login_user->is_admin) {
                  echo modal_anchor(get_uri("ict_reports/inventory_maintenance_modal_form"), "<i class='fa fa-plus-circle'></i> " . "Schedule Maintenance", array("class" => "btn btn-default", "title" => "Add ICT Assets Preventive Maintainance Schedule"));
                }
                ?>
            </div>
        </div>
        <div class="table-responsive">
            <table id="ict-asset_preventive_maintainance-table" class="display" cellspacing="0" width="100%">            
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        $("#ict-asset_preventive_maintainance-table").appTable({
            source: '<?php echo_uri("ict_reports/preventive_maintainance_list_data") ?>',
            columns: [
            <?php
              if (!$this->login_user->is_admin) {
                echo "{title: 'ID'},
                {title: 'ICT Asset'},
                {title: 'Assigned'},
                {visible: false, searchable: false},
                {title: 'Status'},
                {title: 'Date'},
                {title: '<i class=\"fa fa-bars\"></i>', \"class\": \"text-center option w100\"}";
              } else {
                echo "{title: 'ID'},
                {title: 'ICT Asset'},
                {title: 'Assigned'},
                {title: 'Excalation'},
                {title: 'Status'},
                {title: 'Date'},
                {title: '<i class=\"fa fa-bars\"></i>', \"class\": \"text-center option w100\"}";
              }
            ?>
            ],
            // order: [[1, "desc"]],
            printColumns: [0, 1, 2, 3, 4, 5],
            xlsColumns: [0, 1, 2, 3, 4, 5]
        });
    });
</script>