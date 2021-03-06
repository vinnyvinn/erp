<div id="sidebar" class="box-content ani-width">
    <div id="sidebar-scroll">
        <ul class="" id="sidebar-menu">
            <?php
           
                  
            if ($this->login_user->user_type == "staff") {

                $sidebar_menu = array(
                    array("name" => "dashboard", "url" => "dashboard", "class" => "fa-desktop")
                );

                $permissions = $this->login_user->permissions;

                $access_expense = get_array_value($permissions, "expense");
                $access_invoice = get_array_value($permissions, "invoice");

                $access_technical = get_array_value($permissions, "technical");

                $access_ticket = get_array_value($permissions, "ticket");
                $access_client = get_array_value($permissions, "client");
                $access_timecard = get_array_value($permissions, "attendance");
                $access_leave = get_array_value($permissions, "leave");
                $access_estimate = get_array_value($permissions, "estimate");
                $access_finance = get_array_value($permissions, "finance");
                $access_administrator = get_array_value($permissions, "administration");
                $access_legal = get_array_value($permissions, "legal");

                if (get_setting("module_timeline") == "1") {
                    $sidebar_menu[] = array("name" => "timeline", "url" => "timeline", "class" => " fa-comments font-18");
                }

                if (get_setting("module_event") == "1") {
                    $sidebar_menu[] = array("name" => "Planner", "url" => "events", "class" => "fa-calendar");
                }

                if (get_setting("module_note") == "1") {
                    $sidebar_menu[] = array("name" => "notes", "url" => "notes", "class" => "fa-book font-16");
                }

                if (get_setting("module_message") == "1") {
                    $sidebar_menu[] = array("name" => "messages", "url" => "messages", "class" => "fa-envelope", "devider" => true, "badge" => count_unread_message(), "badge_class" => "badge-secondary");
                }


                if (get_setting("module_clients") == "1") {
                    if ($this->login_user->is_admin || $access_client) {
                        $sidebar_menu[] = array("name" => "Leads", "url" => "clients", "class" => "fa-briefcase");
                    }
                }

                /*$openProjects = [];
                $openProjects [] = ["name" => "All Projects", "url" => "projects/all_projects"];

                foreach ($projects as $project) {
                    $openProjects[] = ['name' => $project->title, 'url' => 'projects/view/' . $project->id];
                }
                $sidebar_menu[] = array("name" => "projects", "url" => "projects", "class" => "fa-th-large", "submenu" => $openProjects);*/

                $sidebar_menu[] = ["name" => "All Projects", "class" => "fa-th-large", "url" => "projects/all_projects"];
                $sidebar_menu[] = array("name" => "Your Tasks", "url" => "projects/all_tasks", "class" => "fa-check", "decider" => true);

                if (($this->login_user->user_type == "staff")) {
                    $checklistsSubs = [];
                    if ($this->login_user->is_admin || $this->Team_model->is_ict_member()) {
                        $checklistsSubs [] = ["name" => "Checklists", "url" => "checklists"];
                        $checklistsSubs [] = ["name" => "Support Reports", "url" => "ict_reports/support_entries"];
                    }
                    $checklistsSubs [] = ["name" => "Support Tickets", "url" => "ict_reports/support_tickets"];
                    if ($this->login_user->is_admin || $this->Team_model->is_ict_member()) {
                        $checklistsSubs [] = ["name" => "Checklists Reports", "url" => "ict_reports/checklists"];
                    }
                    $checklistsSubs [] = ["name" => "Assets", "url" => "ict_reports/inventory"];
                    $checklistsSubs [] = ["name" => "Assets Maintenance", "url" => "ict_reports/inventory_maintenance"];
                    if ($this->login_user->is_admin || $this->Team_model->is_ict_member()) {
                        $checklistsSubs [] = ["name" => "Assets Maintenance Reports", "url" => "ict_reports/maintainance_reports"];
                        $checklistsSubs [] = ["name" => "Assets Disposal", "url" => "ict_reports/asset_disposal"];
                    }
                    $sidebar_menu[] = array("name" => "ICT", "url" => "checklists", "class" => "fa-road", "submenu" => $checklistsSubs,"devider" => true);
                }
               if (get_setting("module_estimate") && get_setting("module_estimate_request") && ($this->login_user->is_admin || $access_estimate)) {

                    $sidebar_menu[] = array("name" => "estimates", "url" => "estimates", "class" => "fa-file",
                        "submenu" => array(
                            array("name" => "estimate_list", "url" => "estimates"),
                            array("name" => "estimate_requests", "url" => "estimate_requests"),
                            array("name" => "estimate_forms", "url" => "estimate_requests/estimate_forms")
                        )
                    );
                } else if (get_setting("module_estimate") && ($this->login_user->is_admin || $access_estimate)) {
                    $sidebar_menu[] = array("name" => "estimates", "url" => "estimates", "class" => "fa-file");
                }

                if (get_setting("module_invoice") == "1" && ($this->login_user->is_admin || $access_invoice)) {
                    $sidebar_menu[] = array("name" => "invoices", "url" => "invoices", "class" => "fa-file-text");
                }

             
                    
                     {
                 if (get_setting("module_finance") && (($this->login_user->is_admin || $access_finance))) {
                   

                    $attendanceSubs = [];
                    $attendanceSubs [] = ["name" => "invoice_payments", "url" => "invoice_payments"];
                    $attendanceSubs [] = ["name" => "expenses", "url" => "expenses"];
                    $attendanceSubs [] = ["name" => "income_vs_expenses", "url" => "expenses/income_vs_expenses_chart"];

                    $sidebar_menu[] = array("name" => "Finance", "url" => "expenses", "class" => "fa-money", "submenu" => $attendanceSubs);
                }
                
            }
               
                if ($this->login_user->user_type == "staff") {

                    $attendanceSubs = [];
                    $attendanceSubs [] = ["name" => "Inventory / Requisitions", "url" => "inventory_requisitions"];
                    $attendanceSubs [] = ["name" => "Mails & Parcels : Inwards", "url" => "parcels/inwards"];
                    $attendanceSubs [] = ["name" => "Mails & Parcels : Outwards", "url" => "parcels/outwards"];
                    $attendanceSubs [] = ["name" => "Cheques : Outwards", "url" => "cheques/outwards"];
                    $attendanceSubs [] = ["name" => "Mailing List", "url" => "parcels/parcels_mailing_list"];
                    $sidebar_menu[] = array("name" => "Administration", "url" => "inventory_requisitions", "class" => "fa-ils", "submenu" => $attendanceSubs);
                }

             
                if (get_setting("module_escalation_matrix") == "1" && ($this->login_user->is_admin)) {
                    $sidebar_menu[] = array("name" => "Escalation Matrix", "url" => "escalation_matrix", "class" => "fa-stack-overflow");
                }

                if (get_setting("module_ticket") == "1" && ($this->login_user->is_admin || $access_ticket)) {

                    $ticket_badge = 0;
                    if ($this->login_user->is_admin && $this->login_user->role_id == 2) {
                        $ticket_badge = count_new_tickets(NULL, NULL);
                    } elseif (!$this->login_user->is_admin && $this->login_user->role_id == 2) {
                        $ticket_badge = count_new_tickets(NULL, $this->login_user->id);
                    }
                    // die();

                    $sidebar_menu[] = array("name" => "tickets", "url" => "tickets", "class" => "fa-life-ring", "devider" => true, "badge" => $ticket_badge, "badge_class" => "badge-secondary");
                }

                $knowledgebase = [];
                $knowledgebase [] = ["name" => "Knowledgebase", "url" => "knowledge_base"];
                if ($this->login_user->is_admin) {
                    $knowledgebase [] = ["name" => "Add Knowledge", "url" => "knowledge_base/indexi"];
                }

                $sidebar_menu[] = array("name" => "knowledgebase", "url" => "knowledge_base", "class" => "fa-road font-16", "submenu" => $knowledgebase);


                if ($this->login_user->is_admin) {
                    $attendanceSubs = [];
                    $attendanceSubs [] = ["name" => "Team Members", "url" => "team_members"];
                    // $attendanceSubs [] = ["name" => "Task Summary", "url" => "attendance/task_summary"];

                    $sidebar_menu[] = array("name" => "Team", "url" => "team_members", "class" => "fa-user font-16", "submenu" => $attendanceSubs);
                } else if (get_setting("module_attendance") == "1") {
                    $sidebar_menu[] = array("name" => "team_members", "url" => "team_members", "class" => "fa-user font-16");
                }

                if (get_setting("module_attendance") == "1" && ($this->login_user->is_admin || $access_timecard)) {
                    $attendanceSubs = [];
                    $attendanceSubs [] = ["name" => "Attendance", "url" => "attendance"];
                    $attendanceSubs [] = ["name" => "Task Summary", "url" => "attendance/task_summary"];
                    $attendanceSubs [] = ["name" => "Day Summary", "url" => "attendance/days_summary"];

                    $sidebar_menu[] = array("name" => "attendance", "url" => "attendance", "class" => "fa-clock-o font-16", "submenu" => $attendanceSubs);
                } else if (get_setting("module_attendance") == "1") {
                    $sidebar_menu[] = array("name" => "attendance", "url" => "attendance/attendance_info", "class" => "fa-clock-o font-16");
                }

                if (get_setting("module_leave") == "1" && ($this->login_user->is_admin || $access_leave)) {
                    $sidebar_menu[] = array("name" => "leaves", "url" => "leaves", "class" => "fa-sign-out font-16", "devider" => true);
                } else if (get_setting("module_leave") == "1") {
                    $sidebar_menu[] = array("name" => "leaves", "url" => "leaves/leave_info", "class" => "fa-sign-out font-16", "devider" => true);
                }

                if (get_setting("module_announcement") == "1") {
                    $sidebar_menu[] = array("name" => "announcements", "url" => "announcements", "class" => "fa-bullhorn");
                }

                if (get_setting("module_sage") == "1") {
                    $sidebar_menu[] = array("name" => "Sage", "url" => "sage", "class" => "fa-cloud");
                }

                 
                  if (($this->login_user->is_admin || $access_technical)) {
                    

                    $attendanceSubs = [];
                    $attendanceSubs [] = ["name" => "Project Defferals", "url" => "project_defferal"];
                    $attendanceSubs [] = ["name" => "Accounts Transactions", "url" => "gl_process"];
                    $sidebar_menu[] = array("name" => "Defferals", "url" => "attendance", "class" => " fa-credit-card-alt font-16", "submenu" => $attendanceSubs);
               
                  }

                if (get_setting("module_technical") && (($this->login_user->is_admin || $access_technical))) {
                    

                    $attendanceSubs = [];
                    $attendanceSubs [] = ["name" => "Preventive", "url" => "preventive"];
                    $attendanceSubs [] = ["name" => "Reactive", "url" => "reactive"];
                    $attendanceSubs [] = ["name" => "Inspections", "url" => "followups"];
                    $attendanceSubs [] = ["name" => "Requisitions", "url" => "parts_requisition"];
                    $attendanceSubs [] = ["name" => "Warranty Parts", "url" => "warranty_parts"];
                    $attendanceSubs [] = ["name" => "Fueling", "url" => "fuel"];
                    $attendanceSubs [] = ["name" => "Hiring Assets", "url" => "hire_assets"];
                    $attendanceSubs [] = ["name" => "Trimmer Sheets", "url" => "trimmer_sheets"];
                    $attendanceSubs [] = ["name" => "Maintenance Reports", "url" => "maintenance_report"];
                    $attendanceSubs [] = ["name" => "Fuel Reports", "url" => "fuel_reports"];
                    $sidebar_menu[] = array("name" => "technical", "url" => "attendance", "class" => "fa-subway font-16", "submenu" => $attendanceSubs);
               
                  }
                  else{

                  }
            

                if (get_setting("module_legal") && (($this->login_user->is_admin || $access_legal))) {

                    $attendanceSubs = [];
                    $attendanceSubs [] = ["name" => "Documents", "url" => "legal/documents"];
                    $attendanceSubs [] = ["name" => "Cases & Lawsuits", "url" => "legal/lawsuits"];
                    $attendanceSubs [] = ["name" => "Customers & Suppliers", "url" => "cust_suppliers/index"];

                    $sidebar_menu[] = array("name" => "legal", "url" => "attendance", "class" => "fa-road font-16", "submenu" => $attendanceSubs);
                }


                if ($this->login_user->is_admin) {
                    $sidebar_menu[] = array("name" => "settings", "url" => "settings/general", "class" => "fa-wrench");
                }
            } else {
                //client menu

                $sidebar_menu = array(
                    array("name" => "dashboard", "url" => "dashboard", "class" => "fa-desktop"),
                );

                //check message access settings for clients
                if (get_setting("module_message") && get_setting("client_message_users")) {
                    $sidebar_menu[] = array("name" => "messages", "url" => "messages", "class" => "fa-envelope", "badge" => count_unread_message());
                }

                $openProjects = [];
                $openProjects [] = ["name" => "All Projects", "url" => "projects/all_projects"];

                foreach ($projects as $project) {
                    $openProjects[] = ['name' => $project->title, 'url' => 'projects/view/' . $project->id];
                }

                $sidebar_menu[] = array("name" => "projects", "url" => "projects", "class" => "fa-th-large", "submenu" => $openProjects);

                if (get_setting("module_estimate")) {
                    $sidebar_menu[] = array("name" => "estimates", "url" => "estimates", "class" => "fa-file");
                }

                if (get_setting("module_invoice") == "1") {
                    $sidebar_menu[] = array("name" => "invoices", "url" => "invoices", "class" => "fa-file-text");
                    $sidebar_menu[] = array("name" => "invoice_payments", "url" => "invoice_payments", "class" => "fa-money");
                }

                if (get_setting("module_ticket") == "1") {
                    $sidebar_menu[] = array("name" => "tickets", "url" => "tickets", "class" => "fa-life-ring");
                }

                if (get_setting("module_announcement") == "1") {
                    $sidebar_menu[] = array("name" => "announcements", "url" => "announcements", "class" => "fa-bullhorn");
                }

                $sidebar_menu[] = array("name" => "users", "url" => "clients/users", "class" => "fa-user");
                $sidebar_menu[] = array("name" => "my_profile", "url" => "clients/contact_profile/" . $this->login_user->id, "class" => "fa-cog");
            }

            foreach ($sidebar_menu as $main_menu) {
                $submenu = get_array_value($main_menu, "submenu");
                $expend_class = $submenu ? " expand " : "";
                $active_class = active_menu($main_menu['name'], $submenu);
                $submenu_open_class = "";
                if ($expend_class && $active_class) {
                    $submenu_open_class = " open ";
                }

                $devider_class = get_array_value($main_menu, "devider") ? "devider" : "";
                $badge = get_array_value($main_menu, "badge");
                $badge_class = get_array_value($main_menu, "badge_class");
                ?>
                <li class="<?php echo $active_class . " " . $expend_class . " " . $submenu_open_class . " $devider_class"; ?> main">
                    <a href="<?php echo_uri($main_menu['url']); ?>">
                        <i class="fa <?php echo($main_menu['class']); ?>"></i>
                        <?php if (lang($main_menu['name'])): ?>
                            <span><?php echo lang($main_menu['name']); ?></span>
                        <?php else : ?>
                            <span><?php echo $main_menu['name']; ?></span>
                            <?php
                        endif;

                        if ($badge) {
                            echo "<span class='badge $badge_class'>$badge</span>";
                        }
                        ?>
                    </a>
                    <?php
                    if ($submenu) {
                        echo "<ul>";
                        foreach ($submenu as $s_menu) {
                            ?>
                            <li>
                                <a href="<?php echo_uri($s_menu['url']); ?>">
                                    <i class="dot fa fa-circle"></i>
                                    <?php if (lang($s_menu['name'])): ?>
                                        <span><?php echo lang($s_menu['name']); ?></span>
                                    <?php else : ?>
                                        <span><?php echo $s_menu['name']; ?></span>
                                    <?php endif; ?>
                                </a>
                            </li>
                            <?php
                        }
                        echo "</ul>";
                    }
                    ?>
                </li>
                <?php } ?>
            </ul>
        </div>
    </div><!-- sidebar menu end -->
