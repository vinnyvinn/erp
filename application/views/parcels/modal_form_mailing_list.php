<?php echo form_open(get_uri("parcels/save_mailing_list"), array("id" => "mailing_list-form", "class" => "general-form", "role" => "form")); ?>

<div class="modal-body clearfix">

    <div class="form-group">
        <label for="title" class=" col-md-3">Title</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "type" => "text",
                "id" => "title",
                "name" => "title",
                "class" => "form-control",
                "placeholder" => "Title",
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>

    <div class="form-group">
        <label for="address" class=" col-md-3">Address</label>
        <div class=" col-md-9">
            <?php
            echo form_textarea(array(
                "type" => "text",
                "id" => "address",
                "name" => "address",
                "class" => "form-control",
                "placeholder" => "Address",
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
        $("#mailing_list-form").appForm({
            onSuccess: function (result) {
                // $("#parcels-table").appTable({newData: result.data, dataId: result.id});
                setTimeout(function () {
                    window.location.reload();
                }, 100);
            }
        });
    });
</script>