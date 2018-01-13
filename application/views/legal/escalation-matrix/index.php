<div id="page-content" class="p20 row">

    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>Legal Escalation Matrix</h1>
            <div class="title-button-group">
                <?php
                echo modal_anchor(get_uri("legal/escalation_matrix_modal_form"), "<i class='fa fa-plus-circle'></i> " . 'Add Legal Escalation Matrix', array("class" => "btn btn-default", "title" => 'Add Escalation & Reminder'));
                ?>
            </div>
        </div>
        <div class="table-responsive">
            <table id="escalation" class="display" cellspacing="0" width="100%">
            </table>
        </div>
    </div>


    <script type="text/javascript">
        $(document).ready(function () {

            $("#escalation").appTable({
                source: '<?php echo_uri("legal/escalation_matrix_list_data") ?>',
                columns: [
                    {title: "<?php echo lang("id") ?>", "class": "text-center w50"},
                    {title: "Name"},
                    {title: "Duration"},
                    {title: '<i class="fa fa-bars"></i>', "class": "text-center option w100"}
                ],
                printColumns: [0, 1, 2, 3, 4, 5],
                xlsColumns: [0, 1, 2, 3, 4, 5]
            });
        });
    </script>


</div>


