<?php echo form_open(get_uri("petty_cash/disapprove"), array("id" => "disapproval-form", "class" => "general-form", "role" => "form")); ?>

<input type="hidden" name="_id" id="_id" value="<?= $_id; ?>" required>

<div class="modal-body clearfix">
    <div class="form-group">
    	<label for="petty cash type" class=" col-md-3">Comment Reason</label>
    	<div class="col-md-9">
    		<?php
            echo form_textarea(array(
                "id" => "disapproval_comment",
                "name" => "disapproval_comment",
                "class" => "form-control",
                "placeholder" => "Enter Reason For Disaproval",
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
                "style" => "height:150px;",
                "required" => true
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
        $("#disapproval-form").appForm({
            onSuccess: function (result) {
                // $("#petty_cash-table").appTable({newData: result.data, dataId: result.id});
                setTimeout(function () {
                    window.location.reload();
                }, 100);
            }
        });

    });
</script>