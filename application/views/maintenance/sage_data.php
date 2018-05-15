<div id="page-content" class="p20 row">
    <div class="col-sm-3 col-lg-2">
        <?php
        $tab_view['active_tab'] = "technical";
        $this->load->view("settings/tabs", $tab_view);
        ?>
    </div>

    <div class="col-sm-9 col-lg-10">
        <div class="panel panel-default">
          <div class="panel-body">
            <div class="panel-heading">
            <div class="page-title clearfix">
                    <div class="title-button-group">
                    <?php echo anchor(get_uri("inspection_types"), "<i class='fa fa-certificate'></i> " . ' Inspections', array("class" => "btn btn-info", "title" => 'Inspections')); ?>
                </div>
                <div class="title-button-group">
                    <?php echo anchor(get_uri("job_services"), "<i class='fa fa-certificate'></i> " . 'Job Services', array("class" => "btn btn-success", "title" => 'Job Services')); ?>
                </div>
                <div class="title-button-group">
                    <?php echo anchor(get_uri("technical/services"), "<i class='fa fa-certificate'></i> " . 'Service Types', array("class" => "btn btn-default", "title" => 'Service Types')); ?>
                </div>
                <div class="title-button-group">
                    <?php echo anchor(get_uri("job_types"), "<i class='fa fa-certificate'></i> " . 'Job Types', array("class" => "btn btn-primary", "title" => 'Job Types')); ?>
                </div>
                <div class="title-button-group">
                    <?php echo anchor(get_uri("assets_types"), "<i class='fa fa-certificate'></i> " . 'Assets', array("class" => "btn btn-info", "title" => 'Assets')); ?>
                </div>
                 <div class="title-button-group">
                    <?php echo anchor(get_uri("employees_types"), "<i class='fa fa-certificate'></i> " . 'Staff', array("class" => "btn btn-success", "title" => 'Staff')); ?>
                </div>
                <div class="title-button-group">
                    <?php echo anchor(get_uri("equipments"), "<i class='fa fa-certificate'></i> " . 'Equipments', array("class" => "btn btn-success", "title" => 'Equipments')); ?>
                </div>
                 <div class="title-button-group">
                    <?php echo anchor(get_uri("partsSuppliers"), "<i class='fa fa-certificate'></i> " . 'Suppliers', array("class" => "btn btn-default", "title" => 'Suppliers')); ?>
                </div>
                 <div class="title-button-group">
                    <?php echo anchor(get_uri("extended_services"), "<i class='fa fa-certificate'></i> " . 'External Services', array("class" => "btn btn-info", "title" => 'External Services')); ?>
                </div>
                 <div class="title-button-group">
                    <?php echo anchor(get_uri("rates"), "<i class='fa fa-certificate'></i> " . 'Rates Per Hour', array("class" => "btn btn-default", "title" => 'Rates Per Hour')); ?>
                </div>
                 <div class="title-button-group">
                    <?php echo anchor(get_uri("service_providers"), "<i class='fa fa-certiClientsficate'></i> " . 'Service Providers', array("class" => "btn btn-warning", "title" => 'Service Providers')); ?>
                </div>
                 <div class="title-button-group">
                    <?php echo anchor(get_uri("fuel_suppliers"), "<i class='fa fa-certificate'></i> " . 'Fuel Suppliers', array("class" => "btn btn-info", "title" => 'Fuel Suppliers')); ?>
                </div>
                <div class="title-button-group">
                    <?php echo anchor(get_uri("sage_clients"), "<i class='fa fa-certificate'></i> " . 'Customers ', array("class" => "btn btn-default", "title" => 'Customers')); ?>
                </div>
                 <div class="title-button-group">
                    <?php echo anchor(get_uri("other_expenses"), "<i class='fa fa-certificate'></i> " . 'Expenses ', array("class" => "btn btn-warning", "title" => 'Expenses')); ?>
                </div>
                <div class="title-button-group">
                    <?php echo anchor(get_uri("trimmers"), "<i class='fa fa-certificate'></i> " . 'Trimmers ', array("class" => "btn btn-default", "title" => 'Trimmers')); ?>
                </div>
              </div>
                
            </div>
            <div class="table-responsive">
                <table id="business-type-table" class="display" cellspacing="0" width="100%">            
                </table>
            </div>
        </div>
    </div>
</div>
</div>
<script type="text/javascript">
   
</script>