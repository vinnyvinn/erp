<div class="bg-white p15 pt0 b-b">
    <?php
    $ticket_labels = "";
    if ($ticket_info['labels'] && $this->login_user->user_type == "staff") {
        $labels = explode(",", $ticket_info['labels']);
        foreach ($labels as $label) {
            $ticket_labels.="<span class='label label-info'  title='$label'>" . $label . "</span> ";
        }
    }
    echo "<span class='mr15'>" . $ticket_labels . " </span>";
    ?>



  
    <span class="text-off ml15"><?php echo lang("created") . ": "; ?></span>
    <?php echo format_to_relative_time($ticket_info['created_at']); ?> 

    <span class="text-off ml15"><?php echo lang("ticket_type") . ": "; ?></span>
    <?php echo $ticket_info['ticket']; ?>


    

</div>