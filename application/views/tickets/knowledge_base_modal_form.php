<?php echo form_open(get_uri("tickets/knowledge_base_save"), array("id" => "project-form", "class" => "general-form", "role" => "form")); ?>

<div class="modal-body clearfix">
    
    <input type="hidden" name="id" value="<?php echo $id; ?>" />

    <div class="form-group">
        <label for="petty cash type name" class=" col-md-3">Issue Subject / Title</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "issue_subject",
                "name" => "issue_subject",
                "value" => $issue_subject,
                "class" => "form-control",
                "placeholder" => "Enter an Issue Subject",
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>

    <div class="form-group">
        <label for="project" class=" col-md-3">Knowledge Base Type</label>
        <div class="col-md-9">
              <?php
              echo form_dropdown("knowledge_base_types_dropdown", $knowledge_base_types_dropdown , "knowledge_base_types_dropdown", "class='select2'");
              ?>
        </div>
    </div>

    <div class="form-group">
        <label for="petty cash type name" class=" col-md-3">Issue Solution</label>
        <div class=" col-md-9">
            <?php
            echo form_textarea(array(
                "id" => "issue_solution",
                "name" => "issue_solution",
                "class" => "form-control",
                "placeholder" => "Enter Issue Solution",
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