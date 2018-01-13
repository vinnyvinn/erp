<div class="tab-content">
    <?php echo form_open(get_uri("team_members/save_job_info"), array("id" => "job-info-form", "class" => "general-form dashed-row white", "role" => "form")); ?>

    <input name="user_id" type="hidden" value="<?php echo $user_id; ?>" />
    <div class="panel">
        <div class="panel-default panel-heading">
            <h4><?php echo lang('job_info'); ?></h4>
        </div>
        <div class="panel-body">
            <div class="form-group">
                <label for="job_title" class=" col-md-2"><?php echo lang('job_title'); ?></label>
                <div class="col-md-10">
                    <?php
                    echo form_input(array(
                        "id" => "job_title",
                        "name" => "job_title",
                        "value" => $job_info->job_title,
                        "class" => "form-control",
                        "placeholder" => lang('job_title')
                    ));
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="salary" class=" col-md-2">Monthly <?php echo lang('salary'); ?></label>
                <div class="col-md-10">
                    <?php
                        echo form_input(array(
                            "id" => "salary",
                            "name" => "salary",
                            'type' => 'number',
                            "value" => $job_info->salary ? $job_info->salary : "",
                            "class" => "form-control rate-cal",
                            "placeholder" => lang('salary')
                        ));
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="salary" class=" col-md-2">Monthly Working Hours</label>
                <div class=" col-md-10">
                    <?php
                    echo form_input(array(
                        "id" => "working_hours",
                        "name" => "working_hours",
                        "value" => $job_info->working_hours ? to_decimal_format($job_info->working_hours) : "",
                        "class" => "form-control rate-cal",
                        "type" => 'number',
                        "min" => '1',
                        "max" => '744',
                        "placeholder" => 'Monthly Working Hours'
                    ));
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="salary" class=" col-md-2">Personal Hourly Rate</label>
                <div class="col-md-10">
                    <strong><?php echo get_setting("currency_symbol"); ?> <span id="rate">
                            <?php
                                echo $job_info->hourly_rate ? to_decimal_format($job_info->hourly_rate) : "";
                            ?>
                    </span></strong>
                </div>
            </div>
            <div class="form-group">
                <label for="salary" class=" col-md-2">Administrative Hourly Cost</label>
                <div class="col-md-10">
                    <strong><?php echo get_setting("currency_symbol"); ?> <span id="admin-rate" data-value="<?= $rate ?>">
                            <?php
                                echo $rate ? number_format($rate, 2) : '0.00';
                            ?>
                    </span></strong>
                </div>
            </div>
            <div class="form-group">
                <label for="salary" class=" col-md-2">Total Hourly Rate</label>
                <div class="col-md-10">
                    <strong><?php echo get_setting("currency_symbol"); ?> <span id="total-rate">
                            <?php
                                echo $job_info->hourly_rate ? number_format($job_info->hourly_rate + $rate, 2) : number_format($rate, 2);
                            ?>
                    </span></strong>
                </div>
            </div>
            <div class="form-group">
                <label for="salary_term" class=" col-md-2"><?php echo lang('salary_term'); ?></label>
                <div class="col-md-10">
                    <?php
                    echo form_input(array(
                        "id" => "salary_term",
                        "name" => "salary_term",
                        "value" => $job_info->salary_term,
                        "class" => "form-control",
                        "placeholder" => lang('salary_term')
                    ));
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="date_of_hire" class=" col-md-2"><?php echo lang('date_of_hire'); ?></label>
                <div class="col-md-10">
                    <?php
                    echo form_input(array(
                        "id" => "date_of_hire",
                        "name" => "date_of_hire",
                        "value" => $job_info->date_of_hire,
                        "class" => "form-control",
                        "placeholder" => lang('date_of_hire')
                    ));
                    ?>
                </div>
            </div>
        </div>

        <?php if ($this->login_user->is_admin) { ?>
            <div class="panel-footer">
                <button type="submit" class="btn btn-primary"><span class="fa fa-check-circle"></span> <?php echo lang('save'); ?></button>
            </div>
        <?php } ?>

    </div>
    <?php echo form_close(); ?>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        $('.rate-cal').on('keyup', function () {
            var sal = parseFloat($('#salary').val().replace(',', '')) || 0;
            var monthHours = parseFloat($('#working_hours').val().replace(',', '')) || 0;
            var adminRate = parseFloat($('#admin-rate').data('value'));
            var rate = (Math.round((sal/monthHours) * 100)) / 100;


            $('#rate').html(rate.toLocaleString());
            $('#total-rate').html((rate + adminRate).toLocaleString());
        });
        $("#job-info-form").appForm({
            isModal: false,
            onSuccess: function(result) {
                appAlert.success(result.message, {duration: 10000});
            }
        });
        $("#job-info-form .select2").select2();

        setDatePicker("#date_of_hire");

    });
</script>    