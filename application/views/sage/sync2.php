<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

<div id="page-content" class="p20 row">
    <div class="col-sm-3 col-lg-2">
        <?php
        $tab_view['active_tab'] = "modules";
        $this->load->view("settings/tabs", $tab_view);
        ?>
    </div>

    <div class="col-sm-9 col-lg-10">
        <?php echo form_open(get_uri("settings/save_sync_settings"), array("id" => "sync-settings-form", "class" => "general-form dashed-row", "role" => "form")); ?>
        <div class="panel">
            <div class="panel-default panel-heading" align="center">
                <h4>Manage Synchronization</h4>
                <div>Select the modules you want to sync.</div>
            </div>

            <div class="panel-body">
                <div class="form-group">
                    <label for="module_timeline" class="col-md-2">HR Sync</label>
                    <div class="col-md-10">
                        <input type="checkbox" name="HR_sync" id="HR_sync" checked data-toggle="toggle" data-on="ON" data-off="OFF" data-onstyle="success" data-offstyle="danger">                       
                    </div>
                </div>
            </div>

            <div class="panel-body">
                <div class="form-group">
                    <label for="module_timeline" class="col-md-2">Payroll Sync</label>
                    <div class="col-md-10">
                        <input type="checkbox" name="Payroll_sync" id="Payroll_sync" checked data-toggle="toggle" data-on="ON" data-off="  OFF  " data-onstyle="success" data-offstyle="danger">                       
                    </div>
                </div>
            </div>

            <div class="panel-footer" align="center">
                <button type="submit" class="btn btn-primary"><span class="fa fa-check-circle"></span> <?php echo lang('save'); ?></button>
            </div>
        </div>
        <?php echo form_close(); ?>
    </div>


    <div class="col-sm-9 col-lg-10">
        <?php echo form_open(get_uri("settings/save_cron_settings"), array("id" => "cron-settings-form", "class" => "general-form dashed-row", "role" => "form")); ?>
        <div class="panel">
            <div class="panel-default panel-heading" align="center">
                <h4>Synchronize Tables</h4>
                <div>Select data to sync.</div>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label for="module_timeline" class="col-md-2">Journal Batches</label>
                    <div class="col-md-10">
                        <select class="selectpicker form-control" id="_btblJrBatches" name="_btblJrBatches">
                        </select>
                    </div>
                </div>
            </div>

            <div class="panel-body">
                <div class="form-group">
                    <label for="module_timeline" class="col-md-2">Projects</label>
                    <div class="col-md-10">
                        <select class="selectpicker form-control" id="projects" name="projects"></select>
                    </div>
                </div>
            </div>

<div class="panel-body">
<div class="form-group">
<label for="module_timeline" class="col-md-2">Account Type</label>
<div class="col-md-10">
<select class="selectpicker form-control Account_type" id="Account_type" name="Account_type">
    <option selected disabled>-- Select Account Type --</option>
    <option value="Debit">Debit</option>
    <option value="Credit">Credit</option>
</select>
</div>
</div>
</div>

            <div class="panel-body" id="accounting_type">
                <!-- <div class="form-group">
                    <label for="module_timeline" class="col-md-2">Debit Accounts</label>
                    <div class="col-md-10">
                        <select class="selectpicker form-control Debit_Accounts" id="debit" name="debit"></select>
                    </div>
                </div> -->
            </div>

            <!-- <div class="panel-body">
                <div class="form-group">
                    <label for="module_timeline" class="col-md-2">Credit_Accounts</label>
                    <div class="col-md-10">
                        <select class="selectpicker form-control Credit_Accounts" id="credit" name="credit"></select>
                    </div>
                </div>
            </div> -->
            <div class="panel-footer" align="center">
                <button type="submit" class="btn btn-primary"><span class="fa fa-check-circle"></span> <?php echo lang('save'); ?></button>
            </div>
        </div>
        <?php echo form_close(); ?>
    </div>

</div>




<script type="text/javascript">
    $(document).ready(function () {
        var result = '{"success":true,"message":"The settings has been updated."}';
        $("#sync-settings-form").appForm({
            isModal: true,
            onSuccess: function (result) {
                appAlert.success(result.message, {duration: 10000});
                location.reload();
            }
        });

        $('#HR_sync').bootstrapToggle('<?php echo get_setting("HR_sync"); ?>');
        $('#Payroll_sync').bootstrapToggle('<?php echo get_setting("Payroll_sync"); ?>');

        $.ajax({
            url: '<?php echo get_uri("settings/btblJrBatches"); ?>',
            type: 'GET',
            datatype: 'json',
            success: function(data){
                data=JSON.parse(data);
                var optionList="";

                for (var i = 0; i < data.length; i++){
                    var obj = data[i];
                    optionList += '<option value="'+obj['idBatches']+'">'+obj['cBatchNo']+'</option>';
                }

                $('#_btblJrBatches').html(optionList);
            }
        });

        $.ajax({
            url: '<?php echo get_uri("settings/Projects"); ?>',
            type: 'GET',
            datatype: 'json',
            success: function(data){
                data=JSON.parse(data);
                var optionList="";

                for (var i = 0; i < data.length; i++){
                    var obj = data[i];
                    optionList += '<option value="'+obj['ProjectLink']+'">'+obj['PROJECT']+'</option>';
                }

                $('#projects').html(optionList);

            }
        });

        $('#Account_type').change(function(e) {

            var data = $(this).val();

            $.ajax({
                url: '<?php echo get_uri("settings/Accounts"); ?>',
                type: 'GET',
                datatype: 'json',
                success: function(data){
                    data=JSON.parse(data);
                    var optionList="";

                    for (var i = 0; i < data.length; i++){
                        var obj = data[i];
                        optionList += '<option value="'+obj['AccountLink']+'">'+obj['Master_Sub_Account_Description']+'</option>';
                    }

                    $('.Debit_Accounts').html(optionList);
                    $('.Credit_Accounts').html(optionList);

                }
            });

            if (data == "Debit" || data == "Credit") {

                $('#accounting_type').html('<div class="form-group"><label for="module_timeline" class="col-md-2">'+data+' Accounts</label><div class="col-md-10"><select class="selectpicker form-control '+data+'_Accounts" name="_Accounts"></select></div></div>');

            } else {

                $('#accounting_type').html('');

            }
        });

    });

</script>