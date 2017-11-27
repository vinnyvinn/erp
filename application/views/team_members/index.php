<!-- <link rel="stylesheet" type="text/css" href="<?php echo get_uri("team_members/sync_members"); ?>"> -->

<div id="page-content" class="p20 clearfix">
    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1><?php echo lang('team_members'); ?></h1>
            <div class="title-button-group">
                <div class="btn-group" role="group">
                    <button type="button" class="btn btn-default btn-sm active mr-1"  title="<?php echo lang('list_view'); ?>"><i class="fa fa-bars"></i></button>
                    <?php echo anchor(get_uri("team_members/view"), "<i class='fa fa-th-large'></i>", array("class" => "btn btn-default btn-sm")); ?>
                </div>
                <button class="btn btn-default" id="Sync"><i class="fa fa-refresh"></i> Sync Members</button>
                <?php
                if ($this->login_user->is_admin) {
                    echo modal_anchor(get_uri("team_members/invitation_modal"), "<i class='fa fa-envelope-o'></i> " . lang('send_invitation'), array("class" => "btn btn-default", "title" => lang('send_invitation')));
                    echo modal_anchor(get_uri("team_members/modal_form"), "<i class='fa fa-plus-circle'></i> " . lang('add_team_member'), array("class" => "btn btn-default", "title" => lang('add_team_member')));
                }
                ?>
            </div>
        </div>
        <div class="table-responsive">
            <table id="team_member-table" class="display" cellspacing="0" width="100%">            
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        var visible = false;
        if ("<?php echo $show_contact_info; ?>") {
            visible = true;
        }

        $("#team_member-table").appTable({
            source: '<?php echo_uri("team_members/list_data/") ?>',
            order: [[1, "asc"]],
            radioButtons: [{text: '<?php echo lang("active_members") ?>', name: "status", value: "active", isChecked: true}, {text: '<?php echo lang("inactive_members") ?>', name: "status", value: "inactive", isChecked: false}],
            columns: [
                {title: '', "class": "w50 text-center"},
                {title: "<?php echo lang("name") ?>"},
                {title: "<?php echo lang("job_title") ?>", "class": "w15p"},
                {visible: visible, title: "<?php echo lang("email") ?>", "class": "w20p"},
                {visible: visible, title: "<?php echo lang("phone") ?>", "class": "w15p"}
            ],
            printColumns: [0, 1, 2, 3, 4],
            xlsColumns: [1, 2, 3, 4]

        });

        $('#Sync').click(function() {
            swal.queue([{
                type: 'success',
                background: '#f9f9f9 url(<?php echo get_uri("team_members/sync_members"); ?>)',
                showConfirmButton: false,
                timer: 1500
            }])
        });
    });
</script>