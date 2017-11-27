<!DOCTYPE html>
<html lang="en">
    <head>
        <?php $this->load->view('includes/head'); ?>
    </head>
    <body>
        <?php
        if (get_setting("show_background_image_in_signin_page") === "yes") {
            $background_url = get_file_uri('files/system/sigin-background-image.jpg');
            ?>
            <style type="text/css">
                body {background-image: url('<?php echo $background_url; ?>'); background-size:cover}
            </style>
        <?php } ?>

        <div class="signin-box">
            <?php
            if (isset($form_type) && $form_type == "request_reset_password") {
                $this->load->view("signin/reset_password_form");
            } else if (isset($form_type) && $form_type == "new_password") {
                $this->load->view('signin/new_password_form');
            } else {
                $this->load->view("signin/signin_form");
            }
            ?>
            <div class="pull-right">
                <a href="https://facebook.com/wizag" target="_blank"><i class="fa fa-facebook-square fa-2x"></i></a>
                <a href="https://twitter.com/_wizag" target="_blank"><i class="fa fa-twitter-square fa-2x"></i></a>
                <a href="https://www.linkedin.com/company/wizag" target="_blank"><i class="fa fa-linkedin-square fa-2x"></i></a>
                <a href="wizag.biz" target="_blank"><i class="fa fa-globe fa-2x"></i></a>
            </div>
        </div>
    </body>
</html>