<div id="page-content" class="p20 clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>Mails and Parcels </h1>
            <div class="title-button-group">
                <?php
                if ($this->login_user->is_admin || $this->login_user->role_id == 7) {
                    echo modal_anchor(get_uri("parcels/modal_form_outwards"), "<i class='fa fa-plus-circle'></i> " . "Outwards Mail or Parcel", array("class" => "btn btn-default", "title" => "Outwards Mail or Parcel"));
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
            source: '<?php echo_uri("parcels/outwards_list_data") ?>',
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