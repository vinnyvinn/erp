<div class="modal-body clearfix">

    <?php echo form_open(get_uri("estimate_requests/save_estimate_form_field"), array("id" => "estimate-form", "class" => "general-form", "role" => "form")); ?>
    <input type="hidden" name="id" value="<?php echo $model_info->id; ?>" />
    <input type="hidden" name="estimate_form_id" value="<?php echo $estimate_form_id; ?>" />


    <div class="form-group">
        <label for="title" class=" col-md-3"><?php echo lang('title'); ?></label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "title",
                "name" => "title",
                "value" => $model_info->title,
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
        <label for="placeholder" class=" col-md-3"><?php echo lang('placeholder'); ?></label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "placeholder",
                "name" => "placeholder",
                "value" => $model_info->placeholder,
                "class" => "form-control",
                "placeholder" => lang('placeholder')
            ));
            ?>
        </div>
    </div>


    <div class="form-group">
        <label for="field_type" class=" col-md-3"><?php echo lang('field_type'); ?></label>
        <div class="col-md-9">
            <?php
            $disabled = "";
            if ($model_info->id) {
                $disabled = " disabled='disabled'";
            }

            $field_type_dropdown = array("text" => lang("field_type_text"), "textarea" => lang("field_type_textarea"), "select" => lang("field_type_select"), "multi_select" => lang("field_type_multi_select"));
            echo form_dropdown("field_type", $field_type_dropdown, $model_info->field_type, "class='select2' id='field_type' $disabled");
            ?>
        </div>
    </div>

    <div id="options_container" class="form-group">
        <label for="options" class=" col-md-3"><?php echo lang('options'); ?></label>
        <div class=" col-md-9">
            <?php
            $labels = explode(",", $model_info->options);
            $opton_suggestions = array();
            foreach ($labels as $label) {
                if ($label && !in_array($label, $opton_suggestions)) {
                    $opton_suggestions[] = $label;
                }
            }
            if (!count($opton_suggestions)) {
                $opton_suggestions = array("0" => "");
            }


            echo form_input(array(
                "id" => "options",
                "name" => "options",
                "value" => $model_info->options,
                "class" => "form-control",
                "placeholder" => lang('options')
            ));
            ?>
        </div>
    </div>

    <div class="form-group">
        <label for="required" class=" col-md-3"><?php echo lang('required'); ?></label>
        <div class="col-md-9">
            <?php
            echo form_checkbox(
                    "required", "1", $model_info->required, "id='required'"
            );
            ?>
        </div>
    </div>

    <div class="row">
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fa fa-close"></span> <?php echo lang('close'); ?></button>
            <button type="submit" class="btn btn-primary"><span class="fa fa-check-circle"></span> <?php echo lang('save'); ?></button>
        </div>
    </div>

    <?php echo form_close(); ?>

</div>



<script type="text/javascript">
    $(document).ready(function () {

        $("#estimate-form").appForm({
            onSuccess: function (result) {
                location.reload();
            }
        });

        $("#field_type").select2().change(function () {
            showHideFieldOptions($(this).val());
        });

        showHideFieldOptions("<?php echo $model_info->field_type; ?>");
        
        $("#options").select2({
            tags: <?php echo json_encode($opton_suggestions); ?>
        });



    });

    //show the options field only for slect/multi_select type fields
    function showHideFieldOptions(fieldType) {
        if (fieldType === "select" || fieldType === "multi_select") {
            $("#options_container").show();
        } else {
            $("#options_container").hide();
        }
    }


</script>