<?php echo form_open(get_uri("ict_reports/inventory_maintenance_save"), array("id" => "preventive_maintainance-form", "class" => "general-form", "role" => "form")); ?>

<div class="modal-body clearfix">

    <div class="form-group">
        <label for="ict asset" class=" col-md-3">ICT Asset</label>
        <div class="col-md-9">
           <select class="select2 validate-hidden" name="ict_assets" id="ict_assets" required>
              <?php
              foreach ($ict_assets_dropdown as $value) {
                  echo "<option value=\"{$value->idAssetNo}\">{$value->cAssetCode} : {$value->cAssetDesc}</option>";
              }
              ?>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label for="maintainance_date" class=" col-md-3">Maintainance Date</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "maintainance_date",
                "name" => "maintainance_date",
                "data-date-start-date" => "1d",
                "class" => "form-control",
                "placeholder" => "Maintainance Date"
            ));
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="inventory" class=" col-md-3">Assign</label>
        <div class="col-md-9">
           <select class="select2 validate-hidden" name="assign" id="assign" required>
              <?php
              foreach ($assign_dropdown as $value) {
                  echo "<option value=\"{$value->id}\">{$value->first_name}</option>";
              }
              ?>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label for="inventory" class=" col-md-3">Excalation</label>
        <div class="col-md-9">
           <select class="select2 validate-hidden" name="excalation" id="excalation" required>
              <?php
              foreach ($excalation_dropdown as $value) {
                  echo "<option value=\"{$value->id}\">{$value->escalation_matrix}</option>";
              }
              ?>
            </select>
        </div>
    </div>
</div>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fa fa-close"></span> <?php echo lang('close'); ?></button>
    <button type="submit" class="btn btn-primary"><span class="fa fa-check-circle"></span> Send Request</button>
</div>
<?php echo form_close(); ?>

<script type="text/javascript">
    $(document).ready(function () {
        $("#preventive_maintainance-form").appForm({
            onSuccess: function (result) {
                // $("#inventory_requisitions-table").appTable({newData: result.data, dataId: result.id});
                setTimeout(function () {
                    window.location.reload();
                }, 100);
            }
        });

        $("#preventive_maintainance-form .select2").select2();

        setDatePicker("#maintainance_date");

    });
</script>