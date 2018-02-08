<div id="page-content" class="p20 clearfix">
    <div class="panel panel-default">

        <div class="page-title clearfix">


            <h1 class="pull-right">List of Documents added to <?php echo $model_info->name ?></h1>
            <div class="title-button-group p10 pull-left">

                <span class="dropdown inline-block">
                    <a href="/legal/documents" class="btn btn-default dropdown-toggle  mt0 mb0">
                         <i class='fa fa-backward'></i> Back
                    </a>
                </span>
            </div>
        </div>
        <div class="panel-body">
            <div class="row">

                <?php
                echo modal_anchor(get_uri("legal/modal_add_items/".$model_info->id), "<i class='fa fa-plus-circle'></i> Add Items ",
                    array("class" => "btn btn-success pull-right", "title" => 'Insuared Risk'));
                ?>

            </div>
            <div class="table-responsive">
                <table id="documents" class="display" cellspacing="0" width="100%">
                </table>
            </div>

        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        $("#documents").appTable({
            source: '<?php echo_uri("legal/sage_table_items/".$model_info->id) ?>',
            columns: [
                {title: "<?php echo lang("id") ?>", "class": "text-center w50"},
                {title: "Asset Code"},
                {title: "Description"},
                {title: "Sum Insuared"},
                {title: "Premium"}
            ],
            printColumns: [0, 1, 2, 3, 4, 5],
            xlsColumns: [0, 1, 2, 3, 4, 5]
        });
    });
</script>
