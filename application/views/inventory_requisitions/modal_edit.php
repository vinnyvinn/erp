<?php echo form_open(get_uri("inventory_requisitions/save"), array("id" => "edit-form", "class" => "general-form", "role" => "form")); ?>

<input type="hidden" name="_id" id="_id" value="<?= $_id; ?>" required>

<div class="modal-body clearfix">
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
</div>

    <div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fa fa-close"></span> <?php echo lang('close'); ?></button>
    <button type="submit" class="btn btn-primary"><span class="fa fa-check-circle"></span> <?php echo lang('save'); ?></button>
</div>
<?php echo form_close(); ?>

<script type="text/javascript">
    $(document).ready(function () {
        $("#edit-form").appForm({
            onSuccess: function (result) {
                // $("#petty_cash-table").appTable({newData: result.data, dataId: result.id});
                setTimeout(function () {
                    window.location.reload();
                }, 100);
            }
        });

    });
</script>