<?php echo form_open(get_uri("events/save"), array("id" => "event-form", "class" => "general-form", "role" => "form", "enctype" => "multipart/form-data")); ?>
<div class="modal-body clearfix">
    <input type="hidden" name="id" value="<?php echo $model_info->id; ?>" />
    <div class="form-group">
        <label for="title" class=" col-md-3"><?php echo lang('title'); ?></label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "title",
                "name" => "title",
                "value" => $model_info->title,
                "class" => "form-control",
                "placeholder" => lang('title'),
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>

    <div class="form-group clients">
        <label for="client : contact person" class=" col-md-3">Clients</label>
        <div class="col-md-9">
          <select class="select2 validate-hidden" name="client_contact_persons" id="client_contact_persons" required>
          <option value="0" selected> None</option>
              <?php
              foreach ($client_contact_persons_dropdown as $value) {
                  echo "<option value=". $value->DCLink . ">" . ucfirst($value->Contact_Person . " : " . $value->Name) . "</option>";
              }
              ?>
            </select>
        </div>
    </div>

    <div class="form-group leads">
        <label for="prospect : contact person" class=" col-md-3"> Leads</label>
        <div class="col-md-9">
          <select class="select2 validate-hidden" name="lead_contact_persons" id="lead_contact_persons" required>
          <option value="0" selected> None</option>
              <?php
              foreach ($lead_contact_persons_dropdown as $value) {
                  echo "<option value=". $value->IDProspect . ">" . ucfirst($value->cCompanyName) . "</option>";
              }
              ?>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label for="business type" class=" col-md-3">Business Type</label>
        <div class="col-md-9">
          <select class="select2 validate-hidden" name="business_type" id="business_type" required>
              <?php
              foreach ($business_type_dropdown as $value) {
                  echo "<option value=". $value->id . ">" . ucfirst($value->title) . "</option>";
              }
              ?>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label for="call type" class=" col-md-3">Call Type</label>
        <div class="col-md-9">
          <select class="select2 validate-hidden" name="call_type" id="call_type" required>
              <?php
              foreach ($call_types_dropdown as $value) {
                  echo "<option value=". $value->id . ">" . ucfirst($value->title) . "</option>";
              }
              ?>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label for="objective" class=" col-md-3">Objective</label>
        <div class="col-md-9">
          <select class="select2 validate-hidden" name="objective" id="objective" required>
              <?php
              foreach ($objectives_dropdown as $value) {
                  echo "<option value=". $value->id . ">" . ucfirst($value->title) . "</option>";
              }
              ?>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label for="pipeline stage" class=" col-md-3">Pipeline Stage</label>
        <div class="col-md-9">
          <select class="select2 validate-hidden" name="pipeline_stage" id="pipeline_stage" required>
              <?php
              foreach ($pipeline_stage_dropdown as $value) {
                  echo "<option value=". $value->IDOpportunityStage . ">" . ucfirst($value->cStageName) . "</option>";
              }
              ?>
            </select>
        </div>
    </div>

    <div class="clearfix">
        <label for="start_date" class=" col-md-3 col-sm-3"><?php echo lang('start_date'); ?></label>
        <div class="col-md-4 col-sm-4 form-group">
            <?php
            echo form_input(array(
                "id" => "start_date",
                "name" => "start_date",
                "value" => $model_info->start_date,
                "class" => "form-control",
                "placeholder" => lang('start_date'),
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
        <label for="start_time" class=" col-md-2 col-sm-2"><?php echo lang('start_time'); ?></label>
        <div class=" col-md-3 col-sm-3">
            <?php
            $start_time = $model_info->start_time * 1 ? $model_info->start_time : "";

            if ($time_format_24_hours) {
                $start_time = $start_time ? date("H:i", strtotime($start_time)) : "";
            } else {
                $start_time = $start_time ? convert_time_to_12hours_format(date("H:i:s", strtotime($start_time))) : "";
            }

            echo form_input(array(
                "id" => "start_time",
                "name" => "start_time",
                "value" => $start_time,
                "class" => "form-control",
                "placeholder" => lang('start_time'),
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required")
            ));
            ?>
        </div>
    </div>

    <div class="clearfix">
        <label for="end_date" class=" col-md-3 col-sm-3"><?php echo lang('end_date'); ?></label>
        <div class=" col-md-4 col-sm-4 form-group">
            <?php
            echo form_input(array(
                "id" => "end_date",
                "name" => "end_date",
                "value" => $model_info->end_date,
                "class" => "form-control",
                "placeholder" => lang('end_date'),
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
                "data-rule-greaterThanOrEqual" => "#start_date",
                "data-msg-greaterThanOrEqual" => lang("end_date_must_be_equal_or_greater_than_start_date")
            ));
            ?>
        </div>
        <label for="end_time" class=" col-md-2 col-sm-2"><?php echo lang('end_time'); ?></label>
        <div class=" col-md-3 col-sm-3">
            <?php
            $end_time = $model_info->end_time * 1 ? $model_info->end_time : "";

            if ($time_format_24_hours) {
                $end_time = $end_time ? date("H:i", strtotime($end_time)) : "";
            } else {
                $end_time = $end_time ? convert_time_to_12hours_format(date("H:i:s", strtotime($end_time))) : "";
            }

            echo form_input(array(
                "id" => "end_time",
                "name" => "end_time",
                "value" => $end_time,
                "class" => "form-control",
                "placeholder" => lang('end_time'),
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required")
            ));
            ?>
        </div>
    </div>

    <div class="form-group">
        <label for="location" class=" col-md-3"><?php echo lang('location'); ?></label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "location",
                "name" => "location",
                "value" => $model_info->location,
                "class" => "form-control",
                "placeholder" => lang('location'),
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required")
            ));
            ?>
        </div>
    </div>

    <div class="form-group">
        <label for="share_with" class=" col-md-3"><?php echo lang('share_with'); ?></label>
        <div class=" col-md-9">
            <div>
                <?php
                echo form_radio(array(
                    "id" => "only_me",
                    "name" => "share_with",
                    "value" => "",
                    "class" => "toggle_specific",
                        ), $model_info->share_with, ($model_info->share_with === "") ? true : false);
                ?>
                <label for="only_me"><?php echo lang("only_me"); ?></label>

            </div>
            <div>
                <?php
                echo form_radio(array(
                    "id" => "share_with_all",
                    "name" => "share_with",
                    "value" => "all",
                    "class" => "toggle_specific",
                        ), $model_info->share_with, ($model_info->share_with === "all") ? true : false);
                ?>
                <label for="share_with_all"><?php echo lang("all_team_members"); ?></label>
            </div>

            <div class="form-group">
                <?php
                echo form_radio(array(
                    "id" => "share_with_specific_radio_button",
                    "name" => "share_with",
                    "value" => "specific",
                    "class" => "toggle_specific",
                        ), $model_info->share_with, ($model_info->share_with && $model_info->share_with != "all") ? true : false);
                ?>
                <label for="share_with_specific_radio_button"><?php echo lang("specific_members_and_teams"); ?>:</label>
                <div class="specific_dropdown" style="display: none;">
                    <input type="text" value="<?php echo ($model_info->share_with && $model_info->share_with != "all") ? $model_info->share_with : ""; ?>" name="share_with_specific" id="share_with_specific" class="w100p validate-hidden"  data-rule-required="true" data-msg-required="<?php echo lang('field_required'); ?>" placeholder="<?php echo lang('choose_members_and_or_teams'); ?>"  />
                </div>
            </div>
        </div>

    </div>

    <div class="form-group">
        <label for="description" class=" col-md-12">Comment</label>
        <div class=" col-md-12">
            <?php
            echo form_textarea(array(
                "id" => "description",
                "name" => "description",
                "value" => $model_info->description,
                "class" => "form-control wysiwyg",
                "placeholder" => lang('description'),
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>

    <div class="form-group">
        <label for="upload file" class=" col-md-3">Upload File</label>
        <div class="col-md-9">
            <div id="event-dropzone" class="post-dropzone box-content form-group">
                <?php $this->load->view("includes/dropzone_preview"); ?>
                    <button class="btn btn-default upload-file-button pull-left btn-sm round" type="button"
                            style="color:#7988a2"><i class='fa fa-camera'></i> <?php echo lang("upload_file"); ?></button>
            </div>
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

        var uploadUrl = "<?php echo get_uri("events/upload_file"); ?>";
        var validationUrl = "<?php echo get_uri("events/validate_file"); ?>";

        var dropzone = attachDropzoneWithForm("#event-dropzone", uploadUrl, validationUrl);

        $("#event-form .select2").select2();
        $("#event-form").appForm({
            onSuccess: function (result) {
                $("#event-calendar").fullCalendar('refetchEvents');
            }
        });
        setDatePicker("#start_date, #end_date");

        setTimePicker("#start_time, #end_time");

        $(".color-palet span").click(function () {
            $(".color-palet").find(".active").removeClass("active");
            $(this).addClass("active");
            $("#color").val($(this).attr("data-color"));
        });

        $("#title").focus();

        setTimeout(function () {
            $("#share_with_specific").select2({
                multiple: true,
                formatResult: teamAndMemberSelect2Format,
                formatSelection: teamAndMemberSelect2Format,
                data: <?php echo ($members_and_teams_dropdown); ?>
            });
        }, 100);


        $(".toggle_specific").click(function () {
            toggle_specific_dropdown();
        });
        toggle_specific_dropdown();

        function toggle_specific_dropdown() {
            var $element = $(".toggle_specific:checked");
            if ($element.val() === "specific") {
                $(".specific_dropdown").show().find("input").addClass("validate-hidden");
            } else {
                $(".specific_dropdown").hide().find("input").removeClass("validate-hidden");
            }
        }

        $('#client_contact_persons').change(function(){ 
            $('.leads').remove()
        });

        $('#lead_contact_persons').change(function(){ 
            $('.clients').remove()
        });

    });

