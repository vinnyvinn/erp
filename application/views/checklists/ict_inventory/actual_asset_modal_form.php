<?php echo form_open(get_uri("ict_reports/save_actual_asset"), array("id" => "project-member-form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">

    <div class="form-group">
        <label for="asset code" class=" col-md-3">Asset Code</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "cassetcode",
                "name" => "cassetcode",
                // "value" => $model_info->title,
                "class" => "form-control",
                "placeholder" => 'Asset Code',
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>

    <div class="form-group">
        <label for="title" class=" col-md-3"><?php echo lang('title'); ?></label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "title",
                "name" => "title",
                // "value" => $model_info->title,
                "class" => "form-control",
                "placeholder" => lang('title'),
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>

    <div class="form-group">
        <label for="model_no" class=" col-md-3">Model NO</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "model_no",
                "name" => "model_no",
                // "value" => $model_info->title,
                "class" => "form-control",
                "placeholder" => 'Model NO',
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>

    <div class="form-group">
        <label for="serial" class=" col-md-3">Serial</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "serial",
                "name" => "serial",
                // "value" => $model_info->title,
                "class" => "form-control",
                "placeholder" => 'Serial',
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>

    <div class="form-group">
        <label for="purchase_value" class=" col-md-3">Purchase Value</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "fPurchaseValue",
                "name" => "fPurchaseValue",
                // "value" => $model_info->title,
                "class" => "form-control",
                "placeholder" => 'Purchase Value',
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>

    <div class="form-group">
        <label for="suppliers" class=" col-md-3">Suppliers</label>
        <div class="col-md-9">
            <select class="select2 validate-hidden" name="supplier" id="supplier" required>
              <?php
              foreach ($suppliers_dropdown as $value) {
                  echo "<option value=". $value->DCLink . ">" . ucfirst($value->Account . " : " . $value->Name) . "</option>";
              }
              ?>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label for="location" class=" col-md-3">Location</label>
        <div class="col-md-9">
            <select class="select2 validate-hidden" name="iLocationNo" id="iLocationNo" required>
              <?php
              foreach ($locations_dropdown as $value) {
                  echo "<option value=". $value->idLocationNo . ">" . ucfirst($value->cLocationCode . " : " . $value->cLocationDesc) . "</option>";
              }
              ?>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label for="purchase_date" class=" col-md-3">Purchase Date</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "dPurchaseDate",
                "name" => "dPurchaseDate",
                // "value" => $model_info->start_date * 1 ? $model_info->start_date : "",
                "class" => "form-control",
                "placeholder" => 'Purchase Date'
            ));
            ?>
        </div>
    </div>

    <div class="form-group" style="min-height: 50px">
        <label for="user_id" class=" col-md-3">Custodian</label>
        <div class="col-md-9">
            <?php
            echo form_dropdown("user_id", $users_dropdown, '', "class='select2'");
            ?>
        </div>
    </div>

    <div class="form-group">
        <label for="description" class=" col-md-12"><?php echo lang('description'); ?></label>
        <div class=" col-md-12">
            <?php
            echo form_textarea(array(
                "id" => "description",
                "name" => "description",
                // "value" => $model_info->description,
                "class" => "form-control wysiwyg",
                "placeholder" => lang('description'),
                "style" => "height:150px;",
            ));
            ?>
        </div>
    </div>

</div>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fa fa-close"></span> <?php echo lang('close'); ?></button>
    <button type="submit" class="btn btn-primary"><span class="fa fa-check-circle"></span> <?php echo lang('save'); ?></button>
</div>
<?php echo form_close(); ?>

<script type="text/javascript">
    $(document).ready(function() {
        $("#project-member-form").appForm({
            onSuccess: function(result) {
               setTimeout(function () {
                    window.location.reload();
                }, 100);
            }
        });
        $("#project-member-form .select2").select2();
        setDatePicker("#dPurchaseDate");
    });
</script>    