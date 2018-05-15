<?php echo form_open(get_uri("inventory_requisitions/save"), array("id" => "project-form", "class" => "general-form", "role" => "form")); ?>

<div class="modal-body clearfix">

    <div class="form-group">
        <label for="project" class=" col-md-3">Project</label>
        <div class="col-md-9">
           <select class="select2 validate-hidden" name="project" id="project" required>
              <?php
              foreach ($projects_dropdown as $value) {
                  echo "<option value=". $value->ProjectLink . ">" . $value->ProjectCode . " : " . $value->ProjectName . "</option>";
              }
              ?>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label for="inventory" class=" col-md-3">Inventory (sage)</label>
        <div class="col-md-9">
           <select class="select2 validate-hidden" name="item" id="item" required>
              <?php
              foreach ($stocks_dropdown as $value) {
                  echo "<option value=". $value->StockLink . ">" . $value->StockItem . " (" . $value->unit_of_measure . ") </option>";
              }
              ?>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label for="quantity" class=" col-md-3">Quantity</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "type" => "number",
                "id" => "quantity",
                "name" => "quantity",
                "class" => "form-control",
                "placeholder" => "Item Quantity",
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>
      <div class="form-group">
        <label for="description" class=" col-md-12"><?php echo lang('description');?></label>
        <div class=" col-md-9">
            <?php
            echo form_textarea(array(
                "id" => "description",
                "name" => "description",
                "class" => "form-control wysiwyg",
                "placeholder" => lang('description'),
            ));
            ?>
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
        $("#project-form").appForm({
            onSuccess: function (result) {
                // $("#inventory_requisitions-table").appTable({newData: result.data, dataId: result.id});
                setTimeout(function () {
                    window.location.reload();
                }, 100);
            }
        });

        $("#project-form .select2").select2();

    });
</script>