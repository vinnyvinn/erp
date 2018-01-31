<div class="modal-body clearfix">
    <div id="new-ticket-dropzone" class="post-dropzone">
        <?php echo form_open(get_uri("tickets/save_mark_solved"), array("id" => "ticket-form", "class" => "general-form", "role" => "form")); ?>
             
       
       
            <div class="form-group">
                <label for="description" class=" col-md-12"><?php echo lang('description'); ?></label>
                <div class=" col-md-12">
                    <?php
                    echo form_textarea(array(
                        "id" => "description",
                        "name" => "description",
                        "class" => "form-control wysiwyg",
                        "placeholder" => "type message",
                        "data-rule-required" => true,
                        "data-msg-required" => lang("field_required"),
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

        

        $("#ticket-form").appForm({
            onSuccess: function (result) {
               

            }
        });
        $("#title").focus();
        $("#ticket-form .select2").select2();

        $("#ticket_labels").select2({
            tags: <?php echo json_encode($label_suggestions); ?>
        });
    });

</script>