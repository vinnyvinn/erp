<?php

if ($files && count($files)) {

    $timeline_file_path = get_setting("timeline_file_path");
    $total_files = count($files);
    echo "<div class='timeline-images mb15'>";
    $file_name = $files[0]['file_name'];
    $more_image = "";
    if ($total_files > 1) {
        $more_count = $total_files - 1;
        $more_image = "<span class='more'>+" . $more_count . " More</span>";
    }

    $shown_preview_image = false;

    foreach ($files as $file) {
        $file_name = $file['file_name'];
        $url = get_file_uri($timeline_file_path . $file_name);
        $image = "";
        if (is_viewable_video_file($file_name)) {

            if (!$shown_preview_image) {
                $image = "<img src='" . get_file_uri("assets/images/video_preview.jpg") . "' alt='video'/>$more_image";
                $shown_preview_image = true;
            }
            echo "<a href='$url' data-title='" . remove_file_prefix($file_name) . "' class='mfp-iframe'>$image</a>";
        } else if (is_viewable_image_file($file_name)) {

            if (!$shown_preview_image) {
                $image = "<img src='$url' alt='$file_name'/>$more_image";
                $shown_preview_image = true;
            }
            echo "<a href='$url' data-title='" . remove_file_prefix($file_name) . "'>$image</a>";
        }
    }
    echo "</div>";
}