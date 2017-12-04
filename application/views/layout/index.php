<!DOCTYPE html>
<html lang="en">
    <?php $this->load->view('includes/head'); ?>
    <script src="https://unpkg.com/vue"></script>
    <body >
        <?php $this->load->view('includes/topbar'); ?>
        <div id="content" class="box">
            <?php $this->load->view('includes/left_menu'); ?>
            <div id="page-container" class="box-content">
                <div id="pre-loader">
                    <div id="pre-loade" class="app-loader"><div class="loading"></div></div>
                </div>
                <div class="scrollable-page">
                    <?php
                    if (isset($content_view) && $content_view != "") {
                        $this->load->view($content_view);
                    }
                    ?>
                </div>
            </div>
        </div>
        <?php $this->load->view('modal/index'); ?>
        <div style='display: none;'>
            <script type='text/javascript'>
                <?php
                $error_message = $this->session->flashdata("error_message");
                $success_message = $this->session->flashdata("success_message");
                if (isset($error)) {
                    echo 'appAlert.error("' . $error . '");';
                }
                if (isset($error_message)) {
                    echo 'appAlert.error("' . $error_message . '");';
                }
                if (isset($success_message)) {
                    echo 'appAlert.success("' . $success_message . '");';
                }
                ?>
            </script>
        </div>
        <script src="https://unpkg.com/vue"></script>
        <script src="https://cdn.jsdelivr.net/npm/vue-resource@1.3.4"></script>
    </body>
</html>