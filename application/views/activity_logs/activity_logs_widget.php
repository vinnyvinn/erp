<?php foreach ($activity_logs as $log) { ?>
    <div class="media b-b mb15">
        <div class="media-left">
            <span class="avatar avatar-xs">
                <img src="<?php echo get_avatar($log->created_by_avatar); ?>" alt="..." />
            </span>
        </div>
        <div class="media-body">
            <div class="media-heading">
                <?php
                if ($log->user_type === "staff") {
                    echo get_team_member_profile_link($log->created_by, $log->created_by_user, array("class" => "dark strong"));
                } else {
                    echo get_client_contact_profile_link($log->created_by, $log->created_by_user, array("class" => "dark strong"));
                }
                ?>
                <small><span class="text-off"><?php echo format_to_relative_time($log->created_at); ?></span></small>
            </div>
            <p>
                <?php
                $label_class = 'default';
                if ($log->action === "created") {
                    $label_class = "success";
                    $log->action = "added";
                } else if ($log->action === "updated") {
                    $label_class = "warning";
                } else if ($log->action === "deleted") {
                    $label_class = "danger";
                }
                ?>
                <span class="label label-<?php echo $label_class; ?>"><?php echo lang($log->action); ?></span>
                <span><?php
                    $type_id = "";
                    if ($log->log_type === "task") {
                        $type_id = " #" . $log->log_type_id . " - ";
                    }

                    if ($log->log_type === "project_file") {
                        echo lang($log->log_type) . ": " . remove_file_prefix($log->log_type_title);
                    } else {
                        echo lang($log->log_type) . ": " . $type_id . nl2br($log->log_type_title);
                    }
                    ?></span>
                <?php
                if ($log->action === "updated" && $log->changes !== "") {
                    $changes = unserialize($log->changes);
                    echo "<ul>";
                    foreach ($changes as $field => $value) {
                        ?>
                    <li><?php echo get_change_logs($log->log_type, $field, $value); ?></li>
                    <?php
                } echo "</ul>";
            }
            ?>
            </p>
            <?php if ($log->log_for2 && $log->log_for2 != "customer_feedback") { ?>
                <p> <?php echo lang($log->log_for2) . ": #" . $log->log_for_id2; ?></p>
            <?php } ?>

            <?php if (isset($log->log_for_title)) { ?>
                <p> <?php echo lang($log->log_for) . ": " . anchor("projects/view/" . $log->log_for_id, $log->log_for_title, array("class" => "dark")); ?></p>
            <?php } ?>
        </div>
    </div>
    <?php
}
$next_container_id = "loadproject" . $next_page_offset;
?>    
<div id="<?php echo $next_container_id; ?>">
    <div class="text-center">
        <?php
        $project_id = isset($project_id) ? $project_id : 0;
        if ($result_remaining > 0) {
            echo ajax_anchor(get_uri("projects/history/" . $next_page_offset . "/" . $project_id), lang("load_more"), array("class" => "btn btn-default b-a load-more mt15", "title" => lang("load_more"), "data-inline-loader" => "1", "data-real-target" => "#" . $next_container_id));
        }
        ?>
    </div>
</div>
