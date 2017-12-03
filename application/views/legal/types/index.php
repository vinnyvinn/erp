<div id="page-content" class="p20 row">

    <div class="col-sm-3 col-lg-2">
        <?php
        $tab_view['active_tab'] = "types";
        $this->load->view("legal/lawsuits/tabs", $tab_view);
        ?>
    </div>

    <div class="col-sm-9 col-lg-10">
        <div class="panel panel-default">
            <div class="page-title clearfix">
                <h1>Law Suits Types</h1>
                <div class="title-button-group">
                    <?php
                    echo modal_anchor(get_uri("lawsuits/types_modal"), "<i class='fa fa-plus-circle'></i> " . lang('add_law_suits_types'), array("class" => "btn btn-default", "title" => lang('add_law_suits_types')));
                    ?>
                </div>
            </div>
            <div class="table-responsive">
                <table id="doctypes-table" class="display" cellspacing="0" width="100%">
                </table>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function() {

            $("#doctypes-table").appTable({
                source: '<?php echo_uri("lawsuits/types_list_data") ?>',
                columns: [
                    {title: "<?php echo lang("id") ?>", "class": "text-center w50"},
                    {title: "<?php echo lang("name") ?>"},
                    {title: '<i class="fa fa-bars"></i>', "class": "text-center option w100"}
                ],
                printColumns: [0, 1, 2, 3, 4, 5],
                xlsColumns: [0, 1, 2, 3, 4, 5]
            });
        });
    </script>



</div>


