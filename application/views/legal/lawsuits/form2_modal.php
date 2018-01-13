<?php echo form_open(get_uri("lawsuits/save"), array("id" => "lawsuit_form", "class" => "general-form", "role" => "form")); ?>
<div class="modal-body clearfix">
    <input type="hidden" name="data-type" id="data-type">

    <div class="form-widget">
        <div class="widget-title clearfix">
            <div id="general-info-label" class="col-sm-4"><i class="fa fa-circle-o"></i><strong>Case Details</strong>
            </div>
            <div id="job-info-label" class="col-sm-4"><i class="fa fa-circle-o"></i><strong> Procedures</strong></div>
        </div>

        <div class="progress ml15 mr15">
            <div id="form-progress-bar" class="progress-bar progress-bar-success progress-bar-striped"
                 role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 10%">
            </div>
        </div>
    </div>

    <div class="tab-content mt15">
        <div role="tabpanel" class="tab-pane active" id="general-info-tab">
            <div class="form-group">
                <label for="name" class=" col-md-3">Name</label>
                <div class=" col-md-9">
                    <?php
                    echo form_input(array(
                        "id" => "first_name",
                        "name" => "first_name",
                        "class" => "form-control",
                        "placeholder" => 'Name',
                        "autofocus" => true,
                        "data-rule-required" => true,
                        "data-msg-required" => lang("field_required"),
                    ));
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="description" class=" col-md-12">Description</label>
                <div class=" col-md-12">
                    <?php
                    echo form_textarea(array(
                        "id" => "description",
                        "name" => "description",
                        "class" => "form-control wysiwyg",
                        "placeholder" => 'Description',
                        "data-rule-required" => true,
                        "data-msg-required" => lang("field_required"),
                    ));
                    ?>
                </div>
            </div>


            <div class="form-group">
                <label for="case_type" class=" col-md-3">Case Type</label>
                <div class=" col-md-9">


                    <?php
                    foreach ($case_types as $key => $case_type) {
                        echo form_radio(array(
                            "id" => $case_type->name,
                            "name" => "case_type",
                        ), $case_type->id, ($key === 0) ? true : false);

                        echo ' <label for="case_type_male" class="mr15">' . $case_type->name . '</label>';
                    }
                    ?>

                </div>
            </div>
        </div>

        <div role="tabpanel" class="tab-pane" id="job-info-tab">
            <div class="row input-group control-group " id="case_procedures_area">
                <div class="row control-group">
                    <div class="col-md-3">
                        <div class="form-group">
                            <?php
                            echo form_dropdown("procedure[]", $procedure, 1,
                                "id='client_id' class='select2 validate-hidden' data-rule-required='true', data-msg-required='" . lang('field_required') . "'");
                            ?>
                        </div>

                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <?php
                            echo form_dropdown("contact_personnel[]", $users, 1,
                                "id='client_id' class='select2 validate-hidden' data-rule-required='true', data-msg-required='" . lang('field_required') . "'");
                            ?>
                        </div>


                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <?php
                            echo form_input(array(
                                "id" => "date_of_procedure",
                                "name" => "date_of_procedure[]",
                                "class" => "form-control",
                                "placeholder" => 'Date '
                            ));
                            ?>
                        </div>

                    </div>
                    <div class="col-md-3">
                        <div class="input-group-btn">
                            <button class="btn btn-danger remove" type="button" id="remove_procedures"><i
                                        class="glyphicon glyphicon-remove"></i>
                                Remove
                            </button>
                        </div>
                    </div>
                </div>


            </div>

            <div class="row">
                <button class="btn btn-primary add pull-right" id="add_more_procedures" type="button"><i class="glyphicon glyphicon-remove"></i> Add
                    Procedure
                </button>
            </div>
            <div class="copy" id="init_hide">
                <div class="row control-group">
                    <div class="col-md-3">
                        <div class="form-group">
                            <?php
                            echo form_dropdown("procedure[]", $procedure, 1,
                                "class='select2 validate-hidden' data-rule-required='true', data-msg-required='" . lang('field_required') . "'");
                            ?>
                        </div>

                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <?php
                            echo form_dropdown("contact_personnel[]", $users, 1,
                                "class='select2 validate-hidden' data-rule-required='true', data-msg-required='" . lang('field_required') . "'");
                            ?>
                        </div>


                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <?php
                            echo form_input(array(
                                "name" => "date_of_procedure[]",
                                "class" => "form-control procedure_date_here",
                                "placeholder" => 'Date '
                            ));
                            ?>
                        </div>

                    </div>
                    <div class="col-md-3">
                        <div class="input-group-btn">
                            <button class="btn btn-danger remove" type="button" id="remove_procedures"><i
                                        class="glyphicon glyphicon-remove"></i>
                                Remove
                            </button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</div>


<div class="modal-footer">
    <button class="btn btn-default" data-dismiss="modal"><span class="fa fa-close"></span> <?php echo lang('close'); ?>
    </button>
    <button id="form-previous" type="button" class="btn btn-default hide"><span
                class="fa fa-arrow-circle-left"></span> <?php echo lang('previous'); ?></button>
    <button id="form-next" type="button" class="btn btn-info"><span
                class="fa  fa-arrow-circle-right"></span> <?php echo lang('next'); ?></button>
    <button id="form-submit" type="button" class="btn btn-primary hide"><span
                class="fa fa-check-circle"></span> <?php echo lang('save'); ?></button>
</div>
<?php echo form_close(); ?>

<script type="text/javascript">
    $(document).ready(function () {
        setDatePicker("#date_of_procedure");
        //$('#init_hide').hide();

        $("#lawsuit_form").appForm({
            onSuccess: function (result) {
                if (result.success) {
                    if (localStorage.getItem('isPopup') == 'true') {
                        postTask.updateListeners(JSON.parse(result.data));
                        return
                    }
                    $("#team_member-table").appTable({newData: result.data, dataId: result.id});
                }
            },
            onSubmit: function () {
                $("#form-previous").attr('disabled', 'disabled');
            },
            onAjaxSuccess: function () {
                $("#form-previous").removeAttr('disabled');
            }
        });


        $("#first_name").focus();
        $("#lawsuit_form .select2").select2();

        setDatePicker("#date_of_hire");
        setDatePicker(".procedure_date_here");

        $("#form-previous").click(function () {
            var $generalTab = $("#general-info-tab"),
                $jobTab = $("#job-info-tab"),
                $accountTab = $("#account-info-tab"),
                $previousButton = $("#form-previous"),
                $nextButton = $("#form-next"),
                $submitButton = $("#form-submit");

            if ($accountTab.hasClass("active")) {
                $accountTab.removeClass("active");
                $jobTab.addClass("active");
                $nextButton.removeClass("hide");
                $submitButton.addClass("hide");
            } else if ($jobTab.hasClass("active")) {
                $jobTab.removeClass("active");
                $generalTab.addClass("active");
                $previousButton.addClass("hide");
                $nextButton.removeClass("hide");
                $submitButton.addClass("hide");
            }
        });

        $("#form-next").click(function () {
            var $generalTab = $("#general-info-tab"),
                $jobTab = $("#job-info-tab"),
                $accountTab = $("#account-info-tab"),
                $previousButton = $("#form-previous"),
                $nextButton = $("#form-next"),
                $submitButton = $("#form-submit");
            if (!$("#lawsuit_form").valid()) {
                return false;
            }
            if ($generalTab.hasClass("active")) {
                $generalTab.removeClass("active");
                $jobTab.addClass("active");
                $previousButton.removeClass("hide");
                $("#form-progress-bar").width("35%");
                $("#general-info-label").find("i").removeClass("fa-circle-o").addClass("fa-check-circle");
                $("#team_member_id").focus();
            } else if ($jobTab.hasClass("active")) {
                $jobTab.removeClass("active");
                $accountTab.addClass("active");
                $previousButton.removeClass("hide");
                $nextButton.addClass("hide");
                $submitButton.removeClass("hide");
                $("#form-progress-bar").width("72%");
                $("#job-info-label").find("i").removeClass("fa-circle-o").addClass("fa-check-circle");
                $("#username").focus();
            }
        });

        $("#form-submit").click(function () {
            $("#lawsuit_form").trigger('submit');
        });

        $("button#add_more_procedures").click(function () {
            var html = $(".copy").html();
            $("#case_procedures_area").after(html);
        })

        $("button#remove_procedures").click(function () {
            $(this).parents(".control-group").remove();
        });

    });
</script>