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