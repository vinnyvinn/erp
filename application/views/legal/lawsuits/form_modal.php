<?php echo form_open(get_uri("lawsuits/save"),
    array("id" => "legaldocumentsform",
        "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">
    <input type="hidden" name="id" value="<?php echo $model_info->id; ?>"/>
    <div class="form-group">
        <label for="name" class=" col-md-3"> Name</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "name",
                "name" => "name",
                "class" => "form-control",
                "placeholder" => 'Name',
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="client_id" class=" col-md-3">Description</label>
        <div class="col-md-9">
            <?php
            echo form_textarea(array(
                "id" => "description",
                "name" => "description",
                "class" => "form-control wysiwyg",
                "placeholder" => 'Description',
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="case_type" class=" col-md-3">Case Type</label>
        <div class=" col-md-9">


            <?php
            foreach ($case_types as $key => $case_type) {
                echo form_radio(array(
                    "id" => $case_type->name,
                    "name" => "case_type",
                ), $case_type->id, ($key === 0) ? true : false);

                echo ' <label for="case_type_male" class="mr15">' . $case_type->name . '</label>';
            }
            ?>

        </div>
    </div>
    <div class="form-group">
        <label for="client_id" class=" col-md-3">Initial Procedure</label>

        <div class="col-md-9">
            <div class="row control-group">
                <div class="col-md-4">
                    <div class="form-group">
                        <?php
                        echo form_dropdown("procedure", $procedures, 1,
                            "id='client_id' class='select2 validate-hidden' data-rule-required='true', data-msg-required='" . lang('field_required') . "'");
                        ?>
                    </div>

                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <?php
                        echo form_dropdown("assigned", $users, 1,
                            "id='client_id' class='select2 validate-hidden' data-rule-required='true', data-msg-required='" . lang('field_required') . "'");
                        ?>
                    </div>


                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <?php
                        echo form_input(array(
                            "id" => "procedure_date",
                            "name" => "procedure_date",
                            "class" => "form-control",
                            "placeholder" => 'Date '
                        ));
                        ?>
                    </div>

                </div>

            </div>


        </div>
    </div>

    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><span
                    class="fa fa-close"></span> <?php echo lang('close'); ?></button>
        <button type="submit" class="btn btn-primary"><span
                    class="fa fa-check-circle"></span> <?php echo lang('save'); ?>
        </button>
    </div>
</div>


<?php echo form_close(); ?>
<script type="text/javascript">
    $(document).ready(function () {
        //check if its an update hence load the actual value in the area
        $("#legaldocumentsform .select2").select2();
        setDatePicker("#procedure_date");


        $("#legaldocumentsform").appForm({
            onSuccess: function (result) {
                setTimeout(function () {
                    window.location.reload();
                }, 100);
            }
        });
        $("#name").focus();

    });
</script>