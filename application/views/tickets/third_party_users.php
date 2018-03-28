
<?php echo form_open(get_uri("tickets/save_thirdparty_issues"), array("id" => "thirdusers-form", "class" => "general-form", "role" => "form")); ?>

<div class="modal-body clearfix">
   <input type="hidden" name="id" value="<?php echo $id; ?>" />
   
          <div class="form-group">
        <label for="username" class=" col-md-3">Third Party Username</label>
        <div class="col-md-8">
              <?php
              echo form_dropdown("thirdparty_users_dropdown", $thirdparty_users_dropdown , "thirdparty_users_dropdown", "class='select2'");
              ?>
        </div>
        <div class="col-md-1">
<?php

echo modal_anchor(get_uri("tickets/thirdparty_form"), "<i class='fa fa-plus-circle'></i>", array("class" => "btn btn-info btn-add", "title" => lang('add_project'), "data-is-popup" => '1', 'data-populate' => 'add_third_party'));
?>
</div>
    </div>

    <div class="form-group">
        <label for="Problem to be Solved" class=" col-md-3">Problem to be Solved </label>
        <div class=" col-md-9">
            <?php
            echo form_textarea(array(
                "id" => "message",
                "name" => "message",
                "class" => "form-control",
                "placeholder" => "Enter Issue",
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
        $("#thirdusers-form").appForm({
            onSuccess: function (result) {
                // $("#petty_cash-table").appTable({newData: result.data, dataId: result.id});
                setTimeout(function () {
                    window.location.reload();
                }, 100);
            }
        });

        $("#thirdusers-form .select2").select2();

    });
</script>
