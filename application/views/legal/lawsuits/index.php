<div id="page-content" class="p20 row">

    <div class="col-sm-3 col-lg-2">
        <?php
        $tab_view['active_tab'] = "lawsuits";
        $this->load->view("legal/lawsuits/tabs", $tab_view);
        ?>
    </div>

    <div class="col-sm-9 col-lg-10">
        <div class="panel panel-default">
            <div class="page-title clearfix">
                <h1>Cases and Lawsuits</h1>
                <div class="title-button-group">
                    <?php
                    echo modal_anchor(get_uri("lawsuits/form_modal2"), "<i class='fa fa-plus-circle'></i> " . lang('add_lawsuits'), array("class" => "btn btn-default", "title" => lang('add_lawsuits')));
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
                source: '<?php echo_uri("lawsuits/list_data") ?>',
                columns: [
                    {title: "<?php echo lang("id") ?>", "class": "text-center w50"},
                    {title: "name"},
                    {title: "Type"},
                    {title: "description"},
                    {title: "status"},
                 //   {title: "current procedure"},
                ],
                printColumns: [0, 1, 2, 3, 4, 5],
                xlsColumns: [0, 1, 2, 3, 4, 5]
            });
        });
    </script>




</div>


