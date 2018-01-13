
<div id="page-content" class="p20 clearfix">
    <div class="row">
        <div class="col-sm-3 col-lg-2">
            <?php
            $tab_view['active_tab'] = "lawsuits";
            $this->load->view("legal/lawsuits/tabs", $tab_view);
            ?>
        </div>

        <div class="col-sm-9 col-lg-10">
            <div class="page-title mb15 clearfix">
                <h1>
                    Case : <?php echo $casedetails->name; ?> Details
                </h1>

                <div class="title-button-group" id="project-timer-box">
                  <span class="dropdown inline-block">
                            <button class="btn btn-default dropdown-toggle  mt0 mb0" type="button" data-toggle="dropdown" aria-expanded="true">
                                <i class='fa fa-cogs'></i> <?php echo lang('actions'); ?>
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu">
                                    <li role="presentation"><?php echo modal_anchor(get_uri("lawsuits/add_procedures/$casedetails->id"), "<i class='fa fa-check-circle'></i> Add Procedures", array("class" => "",
                                            "title" => 'Add Procedures')); ?> </li>
                                <li role="presentation"><?php echo modal_anchor(get_uri("lawsuits/close_case_modal/$casedetails->id"), "<i class='fa fa-check-circle'></i> Close Case", array("class" => "",
                                        "title" => 'Close Case')); ?> </li>
                                <li role="presentation">
                                    <a href="<?php echo site_url('lawsuits/back_to_cases') ?>">Back to Cases</a>

                                </li>
                            </ul>
                        </span>

                </div>
            </div>
            <ul id="project-tabs" data-toggle="ajax-tab" class="nav nav-tabs classic" role="tablist">
                <li><a role="presentation" href="<?php echo_uri("projects/tasks/" . $casedetails->id); ?>"
                       data-target="#project-tasks-section">Procedures</a></li>

            </ul>
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade" id="project-tasks-section">
                    <div class="panel panel-default">
                        <div class="table-responsive">
                            <table id="procedures" class="display" cellspacing="0" width="100%">
                            </table>
                        </div>
                    </div>


                </div>

            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    $(document).ready(function() {

        $("#procedures").appTable({
            source: '<?php echo_uri("lawsuits/procedure_list_data_for_case/".$casedetails->id) ?>',
            columns: [
                {title: "<?php echo lang("id") ?>", "class": "text-center w50"},
                {title: "Assigned"},
                {title: "Procedure"},
                {title: "Date"},
                {title: "Remove"},
            ],
            printColumns: [0, 1, 2, 3, 4, 5],
            xlsColumns: [0, 1, 2, 3, 4, 5]
        });
    });
</script>

