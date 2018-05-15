<div id="page-content" class="p20 clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>Petty Cash</h1>
            <div class="title-button-group">
                <?php
                if ($this->login_user->is_admin) {
                    echo modal_anchor(get_uri("petty_cash/modal_form_types"), "<i class='fa fa-plus-circle'></i> " . "Petty Cash Types", array("class" => "btn btn-default", "title" => "Add Petty Cash Types"));
                }
                    echo modal_anchor(get_uri("petty_cash/modal_form"), "<i class='fa fa-plus-circle'></i> " . "Request Petty Cash", array("class" => "btn btn-default", "title" => "Add Petty Cash"));
                ?>
            </div>
        </div>
        <div class="table-responsive">
            <table id="petty_cash-table" class="display" cellspacing="0" width="100%">            
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        $("#petty_cash-table").appTable({
            source: '<?php echo_uri("petty_cash/list_data") ?>',
            columns: [
                    {title: "ID", "class": "text-center w50"},
                    {title: "Petty Cash Type"},
                    {title: "Cost Amount"},
                    {title: "Project"},
                    {title: "Requested On"},
                    {title: "Status"},
                    <?php
                    if ($this->login_user->is_admin) {
                        echo '{title: \'<i class="fa fa-bars"></i>\', "class": "text-center option w100"}';
                    }
                    ?>

                ],
            // order: [[1, "desc"]],
            printColumns: [0, 1, 2, 3, 4, 5],
            xlsColumns: [0, 1, 2, 3, 4, 5]
        });
    });
</script>