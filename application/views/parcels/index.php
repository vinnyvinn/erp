<div id="page-content" class="p20 clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>Mails and Percels </h1>
            <div class="title-button-group">
                <?php
                if ($this->login_user->is_admin) {
                    echo modal_anchor(get_uri("parcels/modal_form_mailing_categories"), "<i class='fa fa-plus-circle'></i> " . "Mailing Categories", array("class" => "btn btn-default", "title" => "Add Mailing Categories"));
                }
                    echo modal_anchor(get_uri("parcels/modal_form"), "<i class='fa fa-plus-circle'></i> " . "Send Mail or Percel", array("class" => "btn btn-default", "title" => "Send Mail or Percel"));
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
            source: '<?php echo_uri("parcels/list_data") ?>',
            columns: [
                    {title: "ID", "class": "text-center w50"},
                    {title: "Title"},
                    {title: "Type"},
                    {title: "TO"},
                    {title: "Date"},
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