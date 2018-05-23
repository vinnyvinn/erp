<div id="page-content" class="p20 clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>Mails and Parcels </h1>
            <div class="title-button-group">
                <?php
                if ($this->login_user->is_admin) {
                    echo modal_anchor(get_uri("parcels/modal_form_inwards"), "<i class='fa fa-plus-circle'></i> " . "Inwards Mail or Parcel", array("class" => "btn btn-default", "title" => "Inwards Mail or Parcel"));
                }
                ?>
            </div>
        </div>
        <div class="table-responsive">
            <table id="parcels-table" class="display" cellspacing="0" width="100%">            
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        $("#parcels-table").appTable({
            source: '<?php echo_uri("parcels/inwards_list_data") ?>',
            columns: [
                    {title: "ID", "class": "text-center w50"},
                    {title: "Title"},
                    {title: "From"},
                    {title: "To"},
                    {title: "Date"},
                    {title: "Status"},
                    {title: '<i class="fa fa-bars"></i>', "class": "text-center option w100"}
                ],
            // order: [[1, "desc"]],
            printColumns: [0, 1, 2, 3, 4, 5],
            xlsColumns: [0, 1, 2, 3, 4, 5]
        });
    });
</script>