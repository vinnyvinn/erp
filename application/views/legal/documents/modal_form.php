<?php echo form_open(get_uri("legal/save"),
    array("id" => "legaldocumentsform",
        "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">
    <input type="hidden" name="id" value="<?php echo $model_info->id; ?>"/>
    <div class="form-group">
        <label for="name" class=" col-md-3"> Name</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "name",
                "name" => "name",
                "value" => $model_info->name,
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
        <label for="client_id" class=" col-md-3">Notification</label>
        <div class="col-md-9">
            <?php
            echo form_dropdown("reminder", $reminders, array($model_info->reminder),
                "id='client_id' class='select2 validate-hidden' data-rule-required='true', data-msg-required='" . lang('field_required') . "'");
            ?>
        </div>


    </div>
    <div class="form-group">
        <label for="client_id" class=" col-md-3">Document Type</label>
        <div class="col-md-9">
            <?php
            echo form_dropdown("document_type", $doc_types, array($model_info->document_type),
                "id='doc_type' class='select2 validate-hidden' data-rule-required='true', data-msg-required='" . lang('field_required') . "'");
            ?>
        </div>
    </div>
    <div id="from_to">
        <div class="form-group">
            <label for="deadline" class=" col-md-3"><?php echo lang('covered_from'); ?></label>
            <div class=" col-md-9">
                <?php
                echo form_input(array(
                    "id" => "covered_from",
                    "name" => "covered_from",
                    "value" => $model_info->covered_from * 1 ? $model_info->covered_from : "",
                    "class" => "form-control",
                    "placeholder" => lang('covered_from'),
                    "data-date-start-date" => "+1d"
                ));
                ?>
            </div>
        </div>
        <div class="form-group">
            <label for="deadline" class=" col-md-3"><?php echo lang('covered_to'); ?></label>
            <div class=" col-md-9">
                <?php
                echo form_input(array(
                    "id" => "covered_to",
                    "name" => "covered_to",
                    "value" => $model_info->covered_to * 1 ? $model_info->covered_to : "",
                    "class" => "form-control",
                    "placeholder" => lang('covered_to'),
                    "data-date-start-date" => "+1d"
                ));
                ?>
            </div>
        </div>

    </div>
    <div class="form-group">
        <label for="client_id" class=" col-md-3">Contact Personnel</label>
        <div class="col-md-9">
            <?php
            echo form_dropdown("contact_personnel", $users, array($model_info->user_responsible),
                "id='client_id' class='select2 validate-hidden' data-rule-required='true', data-msg-required='" . lang('field_required') . "'");
            ?>
        </div>


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
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal"><span
                class="fa fa-close"></span> <?php echo lang('close'); ?></button>
    <button type="submit" class="btn btn-primary"><span class="fa fa-check-circle"></span> <?php echo lang('save'); ?>
    </button>

</div>


<?php echo form_close(); ?>
<?php
echo '<script> var all_docs = ' . json_encode($all_docs_types) . ';</script>';
echo '<script> var modelinfo = ' . json_encode($model_info) . ';</script>';
?>
<script type="text/javascript">
    $(document).ready(function () {
        //check if its an update hence load the actual value in the area
        var uploadUrl = "<?php echo get_uri("legal/upload_file"); ?>";
        var validationUrl = "<?php echo get_uri("legal/validate_file"); ?>";

        var dropzone = attachDropzoneWithForm("#ticket-comment-dropzone", uploadUrl, validationUrl);

        if (modelinfo) {
            if (modelinfo.id !== '') {
                console.log("doctype", +modelinfo.document_type);

                all_docs.forEach(function (doc) {
                    console.log(doc);
                    if (+doc.id === +modelinfo.document_type) {
                        //set the value of selected to true or false
                        console.log("has expiry value is ", +doc.has_expiry);
                        console.log("document type is ", +modelinfo.document_type);
                        if (+doc.has_expiry === 0) {
                            console.log("update has expiry ", true)
                            $("div#from_to").hide();
                        } else if (+doc.has_expiry === 1) {
                            $("div#from_to").show();
                            console.log("update has expiry of false")

                        }

                    }
                });
            } else {
                if (all_docs.length > 0) { //get the first element
                    var doc = all_docs[0];
                    if (+doc.has_expiry === 0) {
                        $("div#from_to").hide();
                    } else if (+doc.has_expiry === 1) {
                        $("div#from_to").show();
                    }
                }
            }
        }


        setDatePicker("#covered_from, #covered_to");
        $("#legaldocumentsform .select2").select2();


        $("select#doc_type").change('change', function (event) {
            var idselected = event.added.id;

            //check if it has expiry or doc upload
            all_docs.forEach(function (doc) {
                if (doc.id === event.added.id) {
                    //set the value of selected to true or false
                    if (+doc.has_expiry === 0) {
                        $("div#from_to").hide();
                    } else if (+doc.has_expiry === 1) {
                        $("div#from_to").show();
                    }

                }
            });
            console.log("opened", event.added.id);
        });
        $("#legaldocumentsform").appForm({
            onSuccess: function (result) {
                setTimeout(function () {
                    window.location.reload();
                }, 100);
            }
        });
        $("#name").focus();

    });
</script>