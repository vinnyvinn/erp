<?php echo form_open(get_uri("petty_cash/save"), array("id" => "project-form", "class" => "general-form", "role" => "form")); ?>

<div class="modal-body clearfix">
    <div class="form-group">
        <label for="petty cash type" class=" col-md-3">Petty Cash Type</label>
        <div class="col-md-9">
          <select class="select2 validate-hidden" name="petty_cash_type" id="petty_cash_type" required>
              <?php
              foreach ($petty_cash_types_dropdown as $value) {
                  echo "<option value=". $value->id . ">" . ucfirst($value->name_type) . "</option>";
              }
              ?>
            </select>
        </div>
       <!-- <div class="col-md-1">
            <?php echo modal_anchor(get_uri("petty_cash/modal_form_types"), "<i class='fa fa-plus-circle'></i>", array("data-is-popup" => '1', 'data-populate' => 'client_id', "class" => "btn btn-info btn-add", "title" => "Add PettyCash Types")); ?>
        </div> -->
    </div>

    <div class="form-group">
        <label for="project" class=" col-md-3">Sage Project</label>
        <div class="col-md-9">
          <select class="select2 validate-hidden" name="project" id="project" required>
              <?php
              foreach ($projects_dropdown as $value) {
                  echo "<option value=". $value->ProjectLink . ">" . ucfirst($value->PROJECT) . "</option>";
              }
              ?>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label for="cost amount" class=" col-md-3">Cost Amount</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "type" => "number",
                "id" => "cost_amount",
                "name" => "cost_amount",
                "class" => "form-control",
                "placeholder" => "Cost Amount",
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>

    <div class="form-group">
        <label for="description" class=" col-md-3">Description</label>
        <div class=" col-md-9">
            <?php
            echo form_textarea(array(
                "type" => "text",
                "id" => "description",
                "name" => "description",
                "class" => "form-control",
                "placeholder" => "Description",
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
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
    $(document).ready(function () {
        $("#project-form").appForm({
            onSuccess: function (result) {
                // $("#petty_cash-table").appTable({newData: result.data, dataId: result.id});
                setTimeout(function () {
                    window.location.reload();
                }, 100);
            }
        });

        $("#project-form .select2").select2();

    });
</script>