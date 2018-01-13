
<div id="estimate-form-preview" class="panel panel-default  p15 no-border clearfix" style="max-width: 1000px; margin: auto;">

    <h3 id="estimate-form-title" class=" pl10 pr10"> <?php echo $model_info->title; ?></h3>

    <div class="pl10 pr10"><?php echo nl2br($model_info->description); ?></div>
    <div class=" pt10 mt15">
        <div class="table-responsive general-form ">
            <table id="estimate-form-table" class="display b-t no-thead b-b-only no-hover" cellspacing="0" width="100%">            
            </table>
        </div>

    </div>

    <div class="p15 pt0"> 
        <button type="submit" class="btn btn-primary"><span class="fa fa-send"></span> <?php echo lang('request_an_estimate'); ?></button>
    </div>
</div>


<script type="text/javascript">
    $(document).ready(function () {
        $("#estimate-form-table").appTable({
            source: '<?php echo_uri("estimate_requests/estimate_form_filed_list_data/" . $model_info->id) ?>',
            order: [[1, "asc"]],
            hideTools: true,
            displayLength: 100,
            columns: [
                {title: "<?php echo lang("title") ?>"},
                {visible: false},
                {visible: false}
            ],
            onInitComplete: function () {
                $(".dataTables_empty").hide();
            }
        });
    });
</script>
