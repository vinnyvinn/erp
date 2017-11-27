<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.min.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.min.js"></script>
<link rel="stylesheet" type="text/css" href="<?php echo get_uri("team_members/sync_members"); ?>">

<div class="page-title clearfix">
    <h1><?php echo lang('team_members'); ?></h1>
    <div class="title-button-group">
        <?php
        echo anchor(get_uri("team_members"), "<i class='fa fa-bars'></i>", array("class" => "btn btn-default btn-sm mr-1", "title" => lang('list_view')));
        echo js_anchor("<i class='fa fa-th-large'></i>", array("class" => "btn btn-default btn-sm active ml-1"));

        echo "<button class=\"btn btn-default\" id=\"Sync\"><i class=\"fa fa-refresh\"></i> Sync Members</button>";

        if ($this->login_user->is_admin) {
            echo modal_anchor(get_uri("team_members/invitation_modal"), "<i class='fa fa-envelope-o'></i> " . lang('send_invitation'), array("class" => "btn btn-default", "title" => lang('send_invitation')));
            echo modal_anchor(get_uri("team_members/modal_form"), "<i class='fa fa-plus-circle'></i> " . lang('add_team_member'), array("class" => "btn btn-default", "title" => lang('add_team_member')));
        }
        ?>
    </div>
</div>
<div id="page-content" class="p20 clearfix">
    <div class="row">
        <?php foreach ($team_members as $team_member) { ?>
            <div class="col-md-3 col-sm-6">
                <div class="panel panel-default  text-center ">
                    <div class="panel-body">
                        <span class="avatar avatar-md mt15"><img src="<?php echo get_avatar($team_member->image); ?>" alt="..."></span> 
                        <h4><?php echo $team_member->first_name . " " . $team_member->last_name; ?></h4>
                        <p class="text-off"><?php echo $team_member->job_title ? $team_member->job_title : "Untitled"; ?></p>
                    </div>
                    <div class="panel-footer bg-info p15 no-border">
                        <?php echo get_team_member_profile_link($team_member->id, lang("view_details"), array("class" => "btn btn-xs btn-info")); ?>
                    </div>
                </div>
            </div>
        <?php } ?>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
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