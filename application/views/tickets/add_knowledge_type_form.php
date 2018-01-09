<?php echo form_open(get_uri("tickets/save_knowledge_type"), array("id" => "project-form", "class" => "general-form", "role" => "form")); ?>

<div class="modal-body clearfix">
    
       <div class="form-group">
        <label for="petty cash type name" class=" col-md-3">Knowledge base type</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "name",
                "name" => "name",
                "class" => "form-control",
                "placeholder" => "Enter knowledge base type",
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