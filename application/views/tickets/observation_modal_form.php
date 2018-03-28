<div class="modal-body clearfix">
    <div id="new-ticket-dropzone" class="post-dropzone">
        <?php echo form_open(get_uri("tickets/save_observations"), array("id" => "observation-form", "class" => "general-form", "role" => "form")); ?>
        <input type="hidden" name="id" value="<?php echo $id; ?>" />

        <div class="form-group observation-group">
            <label for="title" class="col-sm-8">Issue</label>
            <label for="title" class="col-sm-3">Type</label>
            <label for="title" class="col-sm-1"></label>
        </div>

        <div id="issueGroup">
            <div class="form-group observation-group">
                <div class=" col-sm-8">
                    <input type="text" class="form-control observations" name="observations[]" required>
                </div>
                <div class="col-sm-3">
                    <select name="observationTypes[]" class="form-control">
                        <option value="Bug">Bug</option>
                        <option value="Improvement">Improvement</option>
                        <option value="Other">Other</option>
                    </select>
                </div>
                <div class="col-md-1">
                    <a href="#" class="btn btn-info btn-add observation-add" title="Add Observation">
                        <i class='fa fa-plus-circle'></i>
                    </a>
                </div>
            </div>
        </div>

        <?php $this->load->view("includes/dropzone_preview"); ?>
        <div class="row">
            <div class="modal-footer">

                <!-- file can't be uploaded during editing -->
                <button class="btn btn-default upload-file-button pull-left btn-sm round" type="button" style="color:#7988a2">
                    <i class='fa fa-camera'></i> <?php echo lang("upload_file"); ?>
                </button>

                <button type="button" class="btn btn-default" data-dismiss="modal">
                    <span class="fa fa-close"></span> <?php echo lang('close'); ?>
                </button>
                <button type="submit" class="btn btn-primary">
                    <span class="fa fa-check-circle"></span> <?php echo lang('save'); ?>
                </button>
            </div>
        </div>

        <?php echo form_close(); ?>
    </div>
</div>



<script type="text/javascript">
    $(document).ready(function () {

        var uploadUrl = "<?php echo get_uri("tickets/upload_file"); ?>";
        var validationUrl = "<?php echo get_uri("tickets/validate_ticket_file"); ?>";

        var dropzone = attachDropzoneWithForm("#new-ticket-dropzone", uploadUrl, validationUrl);

        $("#observation-form").appForm({
            onSuccess: function (result) {
                appAlert.success(result.message, {duration: 10000});
            }
        });

        $('.observation-add').on('click', addObservation);

        function addObservation(e) {
            e.preventDefault();
            var issueGroup = $('#issueGroup');
            var observations = issueGroup.find('.observation-group');
            var template = $(observations[observations.length - 1]).clone();
            template.find('.observations').val('');
            issueGroup.append(template);
            $(this).removeClass('observation-add').removeClass('btn-info').addClass('observation-remove btn-danger');
            $(this).find('.fa-plus-circle').removeClass('fa-plus-circle').addClass('fa-minus-circle');
            $('.observation-add').off().on('click', addObservation);
            $('.observation-remove').off().on('click', removeObservation);
        }
        function removeObservation(e) {
            e.preventDefault();
            $(this).closest('.observation-group').remove();
        }
    });

</script>