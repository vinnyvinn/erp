<?php echo form_open(get_uri("technical/save_service"), array("id" => "business-type-form", "class" => "general-form", "role" => "form")); ?>
<div class="panel panel-default">
<div class="panel-body">
      <div class="form-group" style="min-height: 60px;">
        <label for="title" class=" col-md-3"><?php echo lang('name'); ?></label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "name",
                "name" => "name",
                "class" => "form-control",
                "placeholder" => lang('name'),
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>
     <div class="form-group" style="min-height: 60px;">
        <label for="title" class=" col-md-3"><?php echo lang('description'); ?></label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "description",
                "name" => "description",
                "class" => "form-control",
                "placeholder" => lang('description'),
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>
</div>

<div class="modal-footer">
    
    <button type="submit" class="btn btn-success"><span class="fa fa-check-circle"></span> <?php echo lang('save');?></button>
    <a href="<?php echo base_url();?>technical/services" class="btn btn-danger">back</a>
</div>
<?php echo form_close(); ?>

<script type="text/javascript">
    $(document).ready(function() {
        $("#business-type-form").appForm({
            onSuccess: function(result) {
                $("#business-type-table").appTable({newData: result.data, dataId: result.id});
            }
        });
        $("#title").focus();
    });
</script>