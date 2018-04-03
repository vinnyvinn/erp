<div id="page-content" class="p20 row">

    <div class="col-sm-11 col-lg-12">
        <?php echo form_open(get_uri("sage/save_sage_sync"), array("id" => "cron-sage-form", "class" => "general-form dashed-row", "role" => "form")); ?>
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
                    <label for="module_timeline" class="col-md-2">Debit Accounts</label>
                    <div class="col-md-10">
                        <select class="selectpicker form-control Debit_Accounts" id="debit" name="debit"></select>
                    </div>
                </div>
            </div>

            <div class="panel-body">
                <div class="form-group">
                    <label for="module_timeline" class="col-md-2">Credit_Accounts</label>
                    <div class="col-md-10">
                        <select class="selectpicker form-control Credit_Accounts" id="credit" name="credit"></select>
                    </div>
                </div>
            </div>
            <div class="panel-footer" align="center">
                <button type="submit" class="btn btn-primary"><span class="fa fa-check-circle"></span> Process</button>
            </div>
        </div>
        <?php echo form_close(); ?>
    </div>

</div>




<script type="text/javascript">
    $(document).ready(function () {
        $("#sync-sage-form").appForm({
            isModal: false,
            onSuccess: function (result) {
                appAlert.success(result.message, {duration: 10000});
                location.reload();
            }
        });


        $.ajax({
            url: '<?php echo get_uri("sage/btblJrBatches"); ?>',
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
            url: '<?php echo get_uri("sage/Projects"); ?>',
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

        $.ajax({
            url: '<?php echo get_uri("sage/Accounts?Order=ASC"); ?>',
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
                // $('.Credit_Accounts').html(optionList);

            }
        });

        $.ajax({
            url: '<?php echo get_uri("sage/Accounts?Order=DESC"); ?>',
            type: 'GET',
            datatype: 'json',
            success: function(data){
                data=JSON.parse(data);
                var optionList="";

                for (var i = 0; i < data.length; i++){
                    var obj = data[i];
                    optionList += '<option value="'+obj['AccountLink']+'">'+obj['Master_Sub_Account_Description']+'</option>';
                }

                // $('.Debit_Accounts').html(optionList);
                $('.Credit_Accounts').html(optionList);

            }
        });

        $('#debit').change(function(e){
            var data = $(this).val();
            //console.log(data);
            $('#credit option[value="'+data+'"]').attr('disabled', 'disabled');
        });
    });
</script>