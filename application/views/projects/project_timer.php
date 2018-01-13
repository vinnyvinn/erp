<?php

if ($timer_status === "open") {
    echo ajax_anchor(get_uri("projects/timer/" . $project_info->id . "/stop"), "<i class='fa fa fa-clock-o'></i> " . lang('stop_timer'), array("class" => "btn btn-sm btn-danger", "title" => lang('stop_timer'), "data-reload-on-success" => "1"));
} else {
    echo ajax_anchor(get_uri("projects/timer/" . $project_info->id . "/start"), "<i class='fa fa fa-clock-o'></i> " . lang('start_timer'), array("class" => "btn btn-sm btn-info", "title" => lang('start_timer'), "data-reload-on-success" => "1"));
}
?>