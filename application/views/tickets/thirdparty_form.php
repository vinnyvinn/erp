<div class="modal-body clearfix">
    <div id="new-ticket-dropzone" class="post-dropzone">
        <?php echo form_open(get_uri("tickets/save_thirdparty"), array("id" => "third-form", "class" => "general-form", "role" => "form")); ?>
     <input type="hidden" name="id" value="<?php echo $model_info->id; ?>" />
        <div class="form-group">
            <label for="username" class=" col-md-3">Username</label>
            <div class=" col-md-9">
                <?php
                echo form_input(array(
                    "id" => "username",
                    "name" => "username",
                    "class" => "form-control",
                    "placeholder" => "enter username",
                    "autofocus" => true,
                    "data-rule-required" => true,
                    "data-msg-required" => lang("field_required"),
                ));
                ?>
            </div>
        </div>

            <div class="form-group">
                <label for="phone" class=" col-md-3">Phone No.</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "phone",
                        "name" => "phone",
                        "class" => "form-control",
                        "placeholder" => "Phone no.",
                        "data-rule-required" => true,
                        "data-msg-required" => lang("field_required"),
                    ));
                    ?>
                </div>
            </div>



              <div class="form-group">
                <label for="email" class=" col-md-3">email</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "email",
                        "name" => "email",
                        "class" => "form-control",
                        "placeholder" => "Email"
                    ));
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
</div>



<script type="text/javascript">
    $(document).ready(function () {

          $("#third-form").appForm({
            onSuccess: function (result) {

                    $("#ticket-table").appTable({newData: result.data, dataId: result.id});
              }
        });
        $("#username").focus();



    });

</script>
