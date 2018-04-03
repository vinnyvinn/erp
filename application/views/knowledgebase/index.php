<div id="page-content" class="p20 row">



    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="page-title clearfix">
                <h1>Knowledge Base</h1>
                <div class="title-button-group">
                    <?php
                    echo modal_anchor(get_uri("knowledge_base/knowledge_base_modal_form"), "<i class='fa fa-plus-circle'></i> Add Solutions ", array("class" => "btn btn-default", "title" => 'Add Solutions'));
                    ?>
                    <?php
                    echo modal_anchor(get_uri("knowledge_base/knowledge_base_types_modal_form"), "<i class='fa fa-plus-circle'></i> Add Types ", array("class" => "btn btn-default", "title" => 'Add Types'));
                    ?>
                </div>
            </div>
            <div class="table-responsive">
                <table id="documents" class="display" cellspacing="0" width="100%">
                </table>
            </div>
        </div>
    </div>
    <?php
    ?>

    <script type="text/javascript">

        $(document).ready(function() {
            var types = <?php echo json_encode($types); ?>;
                const radioButtons = [];
                types.forEach(function(type,index){
                    radioButtons.push({text:type.name, value:type.id, isChecked:index === 0})

             })

            $("#documents").appTable({
                source: '<?php echo_uri("knowledge_base/list_data") ?>',
                radioButtons: radioButtons,
                columns: [
                    {title: "<?php echo lang("id") ?>", "class": "text-center w50"},
                    {title: "Title"},
                    {title: "Type"},
                    {title: "Solution"},
                    {title: '<i class="fa fa-bars"></i>', "class": "text-center option w100"}
                ],
                printColumns: [0, 1, 2, 3, 4, 5],
                xlsColumns: [0, 1, 2, 3, 4, 5]
            });
        });
    </script>




</div>


