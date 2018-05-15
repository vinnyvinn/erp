<div class="bg-white p15 pt0 b-b">
    <?php
    $ticket_labels = "";
    if ($ticket_info->labels && $this->login_user->user_type == "staff") {
        $labels = explode(",", $ticket_info->labels);
        foreach ($labels as $label) {
            $ticket_labels.="<span class='label label-info'  title='$label'>" . $label . "</span> ";
        }
    }
    echo "<span class='mr15'>" . $ticket_labels . " </span>";
    ?>


    <?php if ($this->login_user->user_type === "staff") { ?>
        <span class="text-off"><?php echo lang("client") . ": "; ?></span>
        <?php echo $ticket_info->company_name ? anchor(get_uri("clients/view/" . $ticket_info->client_id), $ticket_info->company_name) : "-"; ?>
        <span class="text-off ml15"><?php echo lang("project") . ": "; ?></span>
        <?php echo $ticket_info->projectTitle ? anchor(get_uri("projects/view/" . $ticket_info->project_id), $ticket_info->projectTitle) : "-"; ?>
    <?php } ?>

    <?php
    if ($ticket_info->assigned_to && $this->login_user->user_type == "staff") {
        //show assign to field to team members only
        $image_url = get_avatar($ticket_info->assigned_to_avatar);
        $assigned_to_user = "<span class='avatar avatar-xs mr10'><img src='$image_url' alt='...'></span> $ticket_info->assigned_to_user";
        ?>
        <span class="text-off ml15 mr10"><?php echo lang("assigned_to") . ": "; ?></span>
        <?php
        echo get_team_member_profile_link($ticket_info->assigned_to, $assigned_to_user);
    }
    ?>
    <br>
    <span class="text-off ml15"><?php echo lang("created") . ": "; ?></span>
    <?php echo format_to_relative_time($ticket_info->created_at); ?> 

    <span class="text-off ml15"><?php echo lang("ticket_type") . ": "; ?></span>
    <?php echo $ticket_info->ticket_type; ?>


    <span class="text-off ml15"><?php echo lang("status") . ": "; ?></span>
    <?php
    $ticket_status_class = "label-danger";
    if ($ticket_info->status === "new") {
        $ticket_status_class = "label-warning";
    } else if ($ticket_info->status === "closed") {
        $ticket_status_class = "label-success";
    }
    $ticket_status = "<span class='label $ticket_status_class large'>" . lang($ticket_info->status) . "</span> ";
    echo $ticket_status;
    ?>

</div>