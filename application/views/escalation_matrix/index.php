<div id="page-content" class="p20 clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>Escalation Matrix</h1>
            <div class="title-button-group">
                <?php echo modal_anchor(get_uri("escalation_matrix/modal_form"), "<i class='fa fa-plus-circle'></i> " . 'Add Escalation Matrix', array("class" => "btn btn-default", "title" => 'Add Escalation Matrix')); ?>
            </div>
        </div>
        <div class="table-responsive">
            <table id="escalation_matrix_table" class="display" cellspacing="0" width="100%">            
            </table>
            <!-- <table id="example" class="display" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Escalation Matrix</th>
                        <th>Agent Name</th>
                        <th>Escalation</th>
                    </tr>
                </thead>
                <tfoot>
                </tfoot>
            </table> -->
        </div>
    </div>
</div>

<!-- <script type="text/javascript">
$(document).ready(function() {
$('#example').DataTable({

"ajax": '<?php echo (get_uri("escalation_matrix/list_data")); ?>',

"columns": [
            { "data": "id" },
            { "data": "escalation_matrix" },
            { "data": "agent_name" },
            { "data": "escalation" }
        ]
});
});
</script> -->
<script type="text/javascript">
    $(document).ready(function () {

        $("#escalation_matrix_table").appTable({
            source: '<?php echo_uri("escalation_matrix/list_data") ?>',
            columns: [
                {title: 'ID', "class": "w50", "data": "id"},
                {title: 'Escalation Matrix', "data": "escalation_matrix"},
                // {title: 'Agents', "class": "w20p", "data": "count"},
                {title: 'Escalation Duration (Min)', "class": "w20p", "data": "escalation"},
            ],
            // order: [[1, "desc"]],
            printColumns: [0, 1, 2, 3],
            xlsColumns: [0, 1, 2, 3]
        });
    });
</script>