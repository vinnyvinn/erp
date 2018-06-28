<div class="media b-b p10 m0 bg-white">
    <div class="media-left pl10">
        <span class="avatar avatar-sm">
            <img src="<?php echo get_avatar($comment->created_by_avatar); ?>" alt="..." />
        </span>
    </div>
    <div class="media-body">
       
        <p><?php echo nl2br(link_it($comment->description)); ?></p>
        <div class="comment-image-box clearfix">

            <?php
            $files = unserialize($comment->files);
            $total_files = count($files);
            $this->load->view("includes/timeline_preview", array("files" => $files));


            if ($total_files) {
                $download_caption = lang('download');
                if ($total_files > 1) {
                    $download_caption = sprintf(lang('download_files'), $total_files);
                }
                echo "<i class='fa fa-paperclip pull-left font-16'></i>";
                echo anchor(get_uri("tickets/download_comment_files/" . $comment->id), $download_caption, array("class" => "pull-right", "title" => $download_caption));
            }
            ?>
        </div>
    </div>
</div>