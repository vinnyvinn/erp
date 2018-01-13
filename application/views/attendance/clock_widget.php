<div class="panel <?php echo (isset($clock_status->id)) ? 'panel-info' : 'panel-coral'; ?>">
    <div class="panel-body ">
        <div class="widget-icon">
            <i class="fa fa-clock-o"></i>
        </div>
        <div class="widget-details">
            <div class='mb15' title='Time Sheets'>Welcome! Enter your time sheet.</div>
            <a href="<?= get_uri('/attendance') ?>" class="btn btn-default no-border" data-inline-loader="1" data-closest-target=".widget-container">
                <i class='fa fa-sign-in'></i> Time Sheets
            </a>
        </div>
    </div>
</div>