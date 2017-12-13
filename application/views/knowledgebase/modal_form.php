<?php echo form_open(get_uri("knowledge_base/save_form_data"),
    array("id" => "legaldocumenttypesform",
        "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">

    <input type="hidden" name="id" value="<?php echo ($model_info)?$model_info->id:''; ?>"/>
    <div class="form-group">
        <label for="name" class=" col-md-3">Title</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "name",
                "name" => "title",
                "value" => ($model_info)?$model_info->title:'',
                "class" => "form-control",
                "placeholder" => lang('name'),
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="client_id" class=" col-md-3">Type</label>
        <div class="col-md-9">

            <?php
            echo form_dropdown("type_id", $types, ($model_info)?$model_info->type_id:'',
                "id='client_id' class='select2 validate-hidden' data-rule-required='true', data-msg-required='" . lang('field_required') . "'");
            ?>
        </div>
    </div>


    <div class="form-group">
        <label for="name" class=" col-md-3">Solution</label>
        <div class=" col-md-9">
            <?php
            echo form_textarea(array(
                "id" => "description",
                "name" => "solution",
                "class" => "form-control wysiwyg",
                "placeholder" => 'Solution',
                "data-rule-required" => true,
                "value" => ($model_info)?$model_info->solution:'',
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>

    <div class="form-group">
        <label for="client_id" class=" col-md-3">Upload File</label>
        <div class="col-md-9">
            <div id="ticket-comment-dropzone" class="post-dropzone box-content form-group">
                <?php $this->load->view("includes/dropzone_preview"); ?>
                <footer class="panel-footer b-a clearfix ">
                    <button class="btn btn-default upload-file-button pull-left btn-sm round" type="button"
                            style="color:#7988a2"><i class='fa fa-camera'></i> <?php echo lang("upload_file"); ?></button>

                </footer>
            </div>
        </div>
    </div>


</div>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal"><span
                class="fa fa-close"></span> <?php echo lang('close'); ?></button>
    <button type="submit" class="btn btn-primary"><span class="fa fa-check-circle"></span> <?php echo lang('save'); ?>
    </button>

</div>
<?php echo form_close(); ?>

<script type="text/javascript">
    $(document).ready(function () {
        $("#legaldocumentsform .select2").select2();
        $("#legaldocumenttypesform").appForm({
            onSuccess: function (result) {
                setTimeout(function () {
                    window.location.reload();
                }, 100);
            }
        });
        $("#name").focus();

    });
</script>