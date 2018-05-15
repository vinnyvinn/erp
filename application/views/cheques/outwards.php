<div id="page-content" class="p20 clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>Cheques</h1>
            <div class="title-button-group">
                <?php
                if ($this->login_user->is_admin) {
                    echo modal_anchor(get_uri("cheques/modal_form_outwards"), "<i class='fa fa-plus-circle'></i> " . "Outwards Cheques", array("class" => "btn btn-default", "title" => "Outwards Cheques"));
                }
                ?>
            </div>
        </div>
        <div class="table-responsive">
            <table id="cheques-table" class="display" cellspacing="0" width="100%">            
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        $("#cheques-table").appTable({
            source: '<?php echo_uri("cheques/outwards_list_data") ?>',
            columns: [
                    {title: "ID", "class": "text-center w50"},
                    {title: "Title"},
                    {title: "Amount"},
                    {title: "From"},
                    {title: "To"},
                    {title: "Date"},
                    {title: "Collected"},
                    {title: "Status"},
                    {title: '<i class="fa fa-bars"></i>', "class": "text-center option w100"}
                ],
            // order: [[1, "desc"]],
            printColumns: [0, 1, 2, 3, 4, 5],
            xlsColumns: [0, 1, 2, 3, 4, 5]
        });
    });
</script>