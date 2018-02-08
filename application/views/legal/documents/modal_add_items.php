<?php echo form_open(get_uri("legal/save_modal_items"), array("id" => "legaldocumentsform", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">
    <input type="hidden" name="legal_doc_id" value="<?php echo $model_id; ?>"/>
    <input type="hidden" name="issage" value="0"/>
    <div class="form-group">
        <label for="client_id" class=" col-md-3">Insured Risk</label>
        <div class="col-md-9">
            <?php
            echo form_dropdown("sage_item_id", $sage_data, array(),
                "id='doc_type' class='select2 validate-hidden' data-rule-required='true', data-msg-required='" . lang('field_required') . "'");
            ?>
        </div>
    </div>

    <div class="form-group">
        <label for="client_id" class=" col-md-3">Premium</label>
        <div class="col-md-9">
            <?php
            echo form_input(array(
                "id" => "name",
                "name" => "premium",
                "class" => "form-control",
                "placeholder" => 'Premium',
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>


    </div>

</div>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal"><span
            class="fa fa-close"></span> <?php echo lang('close'); ?></button>
    <button type="submit" class="btn btn-primary"><span class="fa fa-check-circle"></span> <?php echo lang('save'); ?>
    </button>

</div>
<script type="text/javascript">
    $(document).ready(function () {
        //check if its an update hence load the actual value in the area
        $("#legaldocumentsform .select2").select2();

        $("#legaldocumentsform").appForm({
            onSuccess: function (result) {
                window.location.reload();
               },
            onError:function () {
                window.location.reload();
            }
        });

        $("#name").focus();

    });
</script>