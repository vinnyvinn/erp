<div class="panel">
    <div class="tab-title clearfix">
        <h4><?php echo lang('tasks'); ?></h4>
        <div class="title-button-group">
            <?php
            if ($can_create_tasks) {
                if (get_setting('tasks_excel') == "yes") {
                    echo modal_anchor(get_uri("projects/task_import_modal_form"), "<i class='fa fa-plus-circle'></i> Import Excel Tasks", array("class" => "btn btn-default", "title" => 'Import Excel Tasks', "data-post-project_id" => $project_id));
                }
                echo modal_anchor(get_uri("projects/task_modal_form"), "<i class='fa fa-plus-circle'></i> " . lang('add_task'), array("class" => "btn btn-default", "title" => lang('add_task'), "data-post-project_id" => $project_id));
            }
            ?>
        </div>
    </div>
    <div class="table-responsive">
        <table id="task-table" class="display" width="100%">
<!--            <tfoot>-->
<!--            <tr>-->
<!--                <th colspan="2" class="text-right">--><?php //echo lang("total") ?><!--:</th>-->
<!--                <th data-current-page="2"></th>-->
<!--                <th data-current-page="4"></th>-->
<!--                <th></th>-->
<!--            </tr>-->
<!--            </tfoot>-->
        </table>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        var userType = "<?php echo $this->login_user->user_type; ?>";

        var optionVisibility = false;
        if ("<?php echo ($can_edit_tasks || $can_delete_tasks); ?>") {
            optionVisibility = true;
        }

        if (userType === "client") {
            //don't show assignee and options to clients
            $("#task-table").appTable({
                source: '<?php echo_uri("projects/tasks_list_data/" . $project_id) ?>',
                order: [[0, "desc"]],
                filterDropdown: [{name: "milestone_id", class: "w200", options: <?php echo $milestone_dropdown; ?>}],
                checkBoxes: [
                    {text: 'ToDo', name: "status", value: "to_do - 0%", isChecked: true},
                    {text: '25%', name: "status", value: "in_progress - 25%", isChecked: true},
                    {text: '50%', name: "status", value: "in_progress - 50%", isChecked: true},
                    {text: '75%', name: "status", value: "in_progress - 75%", isChecked: true},
                    {text: 'Done', name: "status", value: "done - 100%", isChecked: false}
                ],
                columns: [
                    {title: ''},
                    {visible: false, searchable: false},
                    {title: '<?php echo lang("title") ?>'},
                    {visible: false, searchable: false},
                    {visible: false, searchable: false},
                    {visible: false, searchable: false},
                    {visible: false, searchable: false},
                    {title: '<?php echo lang("start_date") ?>', "iDataSort": 2},
                    {visible: false, searchable: false},
                    {title: '<?php echo lang("deadline") ?>', "iDataSort": 4},
                    {visible: false, searchable: false},
                    {visible: false, searchable: false},
                    {visible: false, searchable: false},
                    {title: '<?php echo lang("status") ?>'},
                    {visible: false, searchable: false},
                    {title: '<i class="fa fa-bars"></i>', visible: optionVisibility, "class": "text-center option w100"}
                ],
                printColumns: [0, 1, 3, 6],
                xlsColumns: [0, 1, 3, 6],
                rowCallback: function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
                    $('td:eq(0)', nRow).addClass(aData[16]);
                }
            });
        } else {
            $("#task-table").appTable({
                source: '<?php echo_uri("projects/tasks_list_data/" . $project_id) ?>',
                order: [[0, "desc"]],
                filterDropdown: [{name: "milestone_id", class: "w200", options: <?php echo $milestone_dropdown; ?>}, {name: "assigned_to", class: "w200", options: <?php echo $assigned_to_dropdown; ?>}, {name: "task_date", class: "w200", options: <?php echo $dates_dropdown; ?>}],
                checkBoxes: [
                    {text: 'ToDo', name: "status", value: "to_do - 0%", isChecked: true},
                    {text: '25%', name: "status", value: "in_progress - 25%", isChecked: true},
                    {text: '50%', name: "status", value: "in_progress - 50%", isChecked: true},
                    {text: '75%', name: "status", value: "in_progress - 75%", isChecked: true},
                    {text: 'Done', name: "status", value: "done - 100%", isChecked: true}
                ],
                columns: [
                    {title: ''},
                    {visible: false, searchable: false},
                    {title: '<?php echo lang("title") ?>', "class": "w150"},
                    {visible: false, searchable: false},
                    {title: 'Actual (Max) Hrs.', 'class': 'text-center'},
                    {visible: false, searchable: false},
                    {visible: false, searchable: false},
                    {title: '<?php echo lang("start_date") ?>', "iDataSort": 2},
                    {visible: false, searchable: false},
                    {title: '<?php echo lang("deadline") ?>', "iDataSort": 4},
                    {visible: false, searchable: false},
                    {title: '<?php echo lang("assigned_to") ?>', "class": "min-w150"},
                    {title: 'Priority'},
                    {title: '<?php echo lang("status") ?>', "class": "w100"},
                    {title: 'Date Created'},
                    {title: '<i class="fa fa-bars"></i>', visible: optionVisibility, "class": "text-center option w80"}
                ],
                printColumns: [0, 1, 2, 3, 5, 7, 9],
                xlsColumns: [0, 1, 2, 3, 5, 7, 9],
//                summation: [{column: 4, dataType: 'float'}],
                rowCallback: function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
                    $('td:eq(0)', nRow).addClass(aData[16]);
                },
                "drawCallback": function () {
                    var api = this.api();
                    var rows = api.rows( {page:'current'} ).nodes();
                    var last=null;

                    api.column(1, {page:'current'} ).data().each( function ( group, i ) {
                        if ( last !== group ) {
                            $(rows).eq( i ).before(
                                '<tr class="group"><td colspan="10"><strong>'+group+'</strong></td></tr>'
                            );
                            last = group;
                        }
                    } );
                }
            });

            var table = $("#task-table").DataTable();
            $('#task-table tbody').on( 'click', 'tr.group', function () {
                var currentOrder = table.order()[0];
                console.log(currentOrder);
                if (currentOrder[0] === 1 && currentOrder[1] === 'asc' ) {
                    table.order([1, 'desc']).draw();
                }
                else {
                    table.order([1, 'asc']).draw();
                }
            });
        }
    });
</script>

<?php $this->load->view("projects/tasks/update_task_script"); ?>