<div id="page-content" class="p20 row">

    <div class="col-sm-3 col-lg-2">
        <?php
        $tab_view['active_tab'] = "documents";
        $this->load->view("legal/tabs", $tab_view);
        ?>
    </div>

    <div class="col-sm-9 col-lg-10">
        <div class="panel panel-default">
            <div class="page-title clearfix">
                <h1><?php echo lang('documents'); ?></h1>
                <div class="title-button-group">
                    <?php
                    echo modal_anchor(get_uri("legal/form_modal"), "<i class='fa fa-plus-circle'></i> " . lang('add_documents'), array("class" => "btn btn-default", "title" => lang('add_documents')));
                    ?>
                </div>
            </div>
            <div class="table-responsive">
                <table id="documents" class="display" cellspacing="0" width="100%">
                </table>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function() {

            $("#documents").appTable({
                source: '<?php echo_uri("legal/list_data") ?>',
                radioButtons: [
                        {text: 'Active', name: "status", value: 1, isChecked: true},
                        {text: 'Expired', name: "status", value: 2, isChecked: false},
                    ],
                columns: [
                    {title: "<?php echo lang("id") ?>", "class": "text-center w50"},
                    {title: "name"},
                    {title: "<?php echo lang("doc_type") ?>"},
                    {title: "<?php echo lang("covered_from") ?>"},
                    {title: "<?php echo lang("covered_to") ?>"},
                    {title: "<?php echo lang("user_responsible") ?>"},
                    {title: '<i class="fa fa-bars"></i>', "class": "text-center option w100"}
                ],
                printColumns: [0, 1, 2, 3, 4, 5],
                xlsColumns: [0, 1, 2, 3, 4, 5]
            });
        });
    </script>




</div>


