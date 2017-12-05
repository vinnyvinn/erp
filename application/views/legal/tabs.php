
<h4><i class="fa fa-road"></i> <?php echo lang("legal") ?></h4>
<ul class="nav nav-tabs vertical" role="tablist">
    <li role="presentation" class="<?php echo ($active_tab == 'documents') ? 'active' : ''; ?>"><a href="<?php echo_uri("legal/documents"); ?>"><?php echo lang("documents"); ?></a></li>
    <li role="presentation" class="<?php echo ($active_tab == 'document_types') ? 'active' : ''; ?>"><a href="<?php echo_uri("document_types"); ?>"><?php echo lang("document_types"); ?></a></li>
    <li role="presentation" class="<?php echo ($active_tab == 'esc_n_reminders') ? 'active' : ''; ?>"><a href="<?php echo_uri("legal/reminders"); ?>">Reminders</a></li>
</ul>
