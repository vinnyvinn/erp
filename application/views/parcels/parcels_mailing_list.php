<div id="page-content" class="p20 clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>My Mailing List </h1>
            <div class="title-button-group">
                <?php
                    echo modal_anchor(get_uri("parcels/modal_form_mailing_list"), "<i class='fa fa-plus-circle'></i> " . "Mailing List", array("class" => "btn btn-default", "title" => "Add Mailing List"));
                ?>
            </div>
        </div>
        <div class="table-responsive">
            <table id="parcels_mailing_list-table" class="display" cellspacing="0" width="100%">            
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        $("#parcels_mailing_list-table").appTable({
            source: '<?php echo_uri("parcels/mailing_list_data") ?>',
            columns: [
                    {title: "ID", "class": "text-center w50"},
                    {title: "Title"},
                    {title: "Address"},
                    {title: "Date"},
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