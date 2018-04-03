<?php

if (! defined('BASEPATH')) {
    exit('No direct script access allowed');
}
require_once("Pre_loader.php");

class Team_members extends Pre_loader
{

    public function __construct()
    {
        parent::__construct();
        $this->access_only_team_members();
    }

    private function can_view_team_members_contact_info()
    {
        if ($this->login_user->user_type == "staff") {
            if ($this->login_user->is_admin) {
                return true;
            } else {
                if (get_array_value($this->login_user->permissions, "can_view_team_members_contact_info") == "1") {
                    return true;
                }
            }
        }
    }

    private function can_view_team_members_social_links()
    {
        if ($this->login_user->user_type == "staff") {
            if ($this->login_user->is_admin) {
                return true;
            } else {
                if (get_array_value($this->login_user->permissions, "can_view_team_members_social_links") == "1") {
                    return true;
                }
            }
        }
    }

    //only admin can change other user's info
    //none admin users can only change his/her own info
    private function only_admin_or_own($user_id)
    {
        if ($user_id && ($this->login_user->is_admin || $this->login_user->id === $user_id)) {
            return true;
        } else {
            redirect("forbidden");
        }
    }

    public function index()
    {
        $view_data["show_contact_info"] = $this->can_view_team_members_contact_info();
        $this->template->rander("team_members/index", $view_data);
    }

    /* open new member modal */

    function modal_form()
    {
        $this->access_only_admin();

        validate_submitted_data(
            array(
                "id" => "numeric"
            ));

        $view_data['role_dropdown'] = $this->_get_roles_dropdown();

        $id = $this->input->post('id');
        $options = array(
            "id" => $id,
        );

        $view_data['model_info'] = $this->Users_model->get_details($options)->row();
        $this->load->view('team_members/modal_form', $view_data);
    }

    /* save new member */

    function add_team_member()
    {
        $this->access_only_admin();

        //check duplicate email address, if found then show an error message
        if ($this->Users_model->is_email_exists($this->input->post('email'))) {
            echo json_encode(array("success" => false, 'message' => lang('duplicate_email')));
            exit();
        }

        validate_submitted_data(
            array(
                "email"      => "required|valid_email",
                "first_name" => "required",
                "last_name"  => "required",
                "job_title"  => "required",
                "role"       => "required"
            ));

        $user_data = array(
            "email"      => $this->input->post('email'),
            "password"   => md5($this->input->post('password')),
            "first_name" => $this->input->post('first_name'),
            "last_name"  => $this->input->post('last_name'),
            "is_admin"   => $this->input->post('is_admin'),
            "address"    => $this->input->post('address'),
            "phone"      => $this->input->post('phone'),
            "gender"     => $this->input->post('gender'),
            "job_title"  => $this->input->post('job_title'),
            "phone"      => $this->input->post('phone'),
            "gender"     => $this->input->post('gender'),
            "user_type"  => "staff",
            "created_at" => get_current_utc_time()
        );

        //make role id or admin permission 
        $role = $this->input->post('role');
        $role_id = $role;

        if ($role === "admin") {
            $user_data["is_admin"] = 1;
            $user_data["role_id"] = 0;
        } else {
            $user_data["is_admin"] = 0;
            $user_data["role_id"] = $role_id;
        }


        //add a new team member
        $user_id = $this->Users_model->save($user_data);
        if ($user_id) {
            //user added, now add the job info for the user
            $job_data = array(
                "user_id"      => $user_id,
                "salary"       => $this->input->post('salary') ? $this->input->post('salary') : 0,
                "salary_term"  => $this->input->post('salary_term'),
                "working_hours"  => $this->input->post('working_hours'),
                "hourly_rate"  => $this->input->post('salary') / $this->input->post('working_hours'),
                "date_of_hire" => $this->input->post('date_of_hire')
            );
            $this->Users_model->save_job_info($job_data);

            //send login details to user
            if ($this->input->post('email_login_details')) {

                //get the login details template
                $email_template = $this->Email_templates_model->get_final_template("login_info");

                $parser_data["SIGNATURE"] = $email_template->signature;
                $parser_data["USER_FIRST_NAME"] = $user_data["first_name"];
                $parser_data["USER_LAST_NAME"] = $user_data["last_name"];
                $parser_data["USER_LOGIN_EMAIL"] = $user_data["email"];
                $parser_data["USER_LOGIN_PASSWORD"] = $this->input->post('password');
                $parser_data["DASHBOARD_URL"] = base_url();

                $message = $this->parser->parse_string($email_template->message, $parser_data, true);
                send_app_mail($this->input->post('email'), $email_template->subject, $message);
            }
        }

        if ($user_id) {
            if ($this->input->post('data-type') == 'plain') {
                echo json_encode([
                    "success" => true,
                    "data" => json_encode([
                        'id' => $user_id,
                        'title' => $user_data['first_name'] . ' ' . $user_data['last_name']
                    ]),
                    'id' => $user_id,
                    'message' => lang('record_saved')
                ]);
            } else {
                echo json_encode([
                    "success" => true,
                    "data" => $this->_row_data($user_id),
                    'id' => $user_id,
                    'message' => lang('record_saved')
                ]);
            }
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    public function HR_DB() {
        return $this->load->database('HR', TRUE);
    }

    function import_hr_members() {

       foreach ($this->HR_DB()->select("tblEmployee.Emp_Id, tblEmployee.Emp_First_Name, tblEmployee.Emp_Last_Name, tblEmployee.Emp_Gender, tblEmployee.Emp_Birth_Date, tblEmployee_Contact.Emp_WorkEmail, tblEmployee_Contact.Emp_WorkPhone, tblEmployee.Emp_Join_Date, tblEmployee.Is_Active, tblDepartment.Dept_Name + ' : ' + dbo.tblDesignation.Desig_Name AS Emp_Job_Title")->from('tblEmployee')->join('tblDesignation', 'tblEmployee.Emp_Desig_Id = tblDesignation.Desig_Id', 'inner')->join('tblEmployee_Contact', 'tblEmployee_Contact.Emp_Id = tblEmployee.Emp_Id', 'inner')->join('tblDepartment', 'tblEmployee.Cmp_Id = tblDepartment.Cmp_Id AND tblEmployee.Emp_Dept_Id = tblDepartment.Dept_Id', 'inner')->get()->result() as $value) {

            /*if ($value->Emp_WorkEmail != NULL) {
                $Emp_WorkEmail = $value->Emp_WorkEmail;
            } else {
                $Emp_WorkEmail = strtolower("{$value->Emp_First_Name}_{$value->Emp_Last_Name}". rand(99,9999) . "@teamkazi.com");
            }*/

            if ($value->Emp_Gender == 1) {
                $Emp_Gender = "male";
            } elseif ($value->Emp_Gender == 2) {
                $Emp_Gender = "female";
            }

            if ($value->Is_Active == 1) {
                $status = "active";
            } else {
                $status = "inactive";
            }    

            $user_data = array(
                'first_name' => $value->Emp_First_Name,
                'last_name'  => $value->Emp_Last_Name,
                'user_type'  => 'staff',
                'is_admin'   => 0,
                'role_id'    => 2,
                'email'      => $value->Emp_WorkEmail,
                'password'   => '25d55ad283aa400af464c76d713c07ad',
                'status'     => $status,
                'job_title'  => $value->Emp_Job_Title,
                'phone'      => $value->Emp_WorkPhone,
                'dob'        => $value->Emp_Birth_Date,
                'gender'     => $Emp_Gender,
                'created_at' => date('Y-m-d')
            );

            if (!$this->Users_model->is_email_exists($value->Emp_WorkEmail)) {

                // add a new team member
                $user_id = $this->Users_model->save($user_data);

                if ($user_id) {
                    //user added, now add the job info for the user
                    $job_data = array(
                        "user_id"      => $user_id,
                        "salary"       => 0,
                        "salary_term"  => "Contract",
                        "working_hours" => get_setting("working_hours"),
                        "hourly_rate"  => 0 / get_setting("working_hours"), // salary / hourly_rate
                        "date_of_hire" => (new DateTime($value->Emp_Join_Date))->format('Y-m-d')
                    );

                    $this->Team_member_model->save($job_data);
                    
                }
            }            
        }

    }

    /* open invitation modal */

    function invitation_modal()
    {
        $this->access_only_admin();
        $this->load->view('team_members/invitation_modal');
    }

    //send a team member invitation to an email address
    function send_invitation()
    {
        $this->access_only_admin();

        validate_submitted_data(
            array(
                "email" => "required|valid_email"
            ));

        $email = $this->input->post('email');

        //get the send invitation template 
        $email_template = $this->Email_templates_model->get_final_template("team_member_invitation");

        $parser_data["INVITATION_SENT_BY"] = $this->login_user->first_name . " " . $this->login_user->last_name;
        $parser_data["SIGNATURE"] = $email_template->signature;
        $parser_data["SITE_URL"] = get_uri();

        //make the invitation url with 24hrs validity
        $key = encode_id($this->encrypt->encode('staff|' . $email . '|' . (time() + (24 * 60 * 60))), "signup");
        $parser_data['INVITATION_URL'] = get_uri("signup/accept_invitation/" . $key);

        //send invitation email
        $message = $this->parser->parse_string($email_template->message, $parser_data, true);
        if (send_app_mail($email, $email_template->subject, $message)) {
            echo json_encode(array('success' => true, 'message' => lang("invitation_sent")));
        } else {
            echo json_encode(array('success' => false, 'message' => lang('error_occurred')));
        }
    }

    //prepere the data for members list
    function list_data()
    {
        $options = array(
            "status"    => $this->input->post("status"),
            "user_type" => "staff",
        );

        $list_data = $this->Users_model->get_details($options)->result();
        $result = array();
        foreach ($list_data as $data) {
            $result[] = $this->_make_row($data);
        }
        echo json_encode(array("data" => $result));
    }

    //get a row data for member list
    function _row_data($id)
    {
        $options = array("id" => $id);
        $data = $this->Users_model->get_details($options)->row();

        return $this->_make_row($data);
    }

    //prepare team member list row
    private function _make_row($data)
    {
        $image_url = get_avatar($data->image);
        $user_avatar = "<span class='avatar avatar-xs'><img src='$image_url' alt='...'></span>";
        $full_name = $data->first_name . " " . $data->last_name . " ";


        //check contact info view permissions
        $show_cotact_info = $this->can_view_team_members_contact_info();

        return array(
            $user_avatar,
            get_team_member_profile_link($data->id, $full_name),
            $data->job_title,
            $show_cotact_info ? $data->email : "",
            $show_cotact_info && $data->phone ? $data->phone : "-"
        );
    }

    //show team member's details view
    function view($id = 0, $tab = "")
    {
        if ($id * 1) {
            //we have an id. view the team_member's profie
            $options = array("id" => $id, "user_type" => "staff");
            $user_info = $this->Users_model->get_details($options)->row();
            if ($user_info) {

                //check which tabs are viewable for current logged in user
                $view_data['show_timeline'] = get_setting("module_timeline") ? true : false;
                $view_data['show_general_info'] = false;
                $view_data['show_job_info'] = false;
                $view_data['show_account_settings'] = false;

                $show_attendance = false;
                $show_leave = false;

                // $expense_access_info = $this->get_access_info("expense");
                // $view_data["show_expense_info"] = (get_setting("module_expense") == "1" && $expense_access_info->access_type == "all") ? true : false;

                if ($this->login_user->is_admin || $this->login_user->id == $id) {
                    $view_data["show_expense_info"] = true;
                } else {
                    $view_data["show_expense_info"] = false;
                }

                //admin can access all members attendance and leave
                //none admin users can only access to his/her own information 

                if ($this->login_user->is_admin || $user_info->id === $this->login_user->id) {
                    $show_attendance = true;
                    $show_leave = true;
                    $view_data['show_general_info'] = true;
                    $view_data['show_job_info'] = true;
                    $view_data['show_account_settings'] = true;
                } else {
                    //none admin users but who has access to this team member's attendance and leave can access this info
                    $access_timecard = $this->get_access_info("attendance");
                    if ($access_timecard->access_type === "all" || array_search(
                            $user_info->id,
                            $access_timecard->allowed_members)
                    ) {
                        $show_attendance = true;
                    }

                    $access_leave = $this->get_access_info("leave");
                    if ($access_leave->access_type === "all" || array_search(
                            $user_info->id,
                            $access_leave->allowed_members)
                    ) {
                        $show_leave = true;
                    }
                }


                //check module availability
                $view_data['show_attendance'] = $show_attendance && get_setting("module_attendance") ? true : false;
                $view_data['show_leave'] = $show_leave && get_setting("module_leave") ? true : false;


                //check contact info view permissions
                $show_cotact_info = $this->can_view_team_members_contact_info();
                $show_social_links = $this->can_view_team_members_social_links();

                //own info is always visible
                if ($id == $this->login_user->id) {
                    $show_cotact_info = true;
                    $show_social_links = true;
                }

                $view_data['show_cotact_info'] = $show_cotact_info;
                $view_data['show_social_links'] = $show_social_links;


                //show projects tab to admin
                $view_data['show_projects'] = false;
                if ($this->login_user->is_admin) {
                    $view_data['show_projects'] = true;
                }

                $view_data['tab'] = $tab; //selected tab
                $view_data['user_info'] = $user_info;
                $view_data['social_link'] = $this->Social_links_model->get_one($id);

                $this->template->rander("team_members/view", $view_data);
            } else {
                show_404();
            }
        } else {
            //we don't have any specific id to view. show the list of team_member
            $view_data['team_members'] = $this->Users_model->get_details(
                array("user_type" => "staff", "status" => "active"))->result();
            $this->template->rander("team_members/profile_card", $view_data);
        }
    }

    //show the job information of a team member
    function job_info($user_id)
    {
        $this->only_admin_or_own($user_id);

        $options = array("id" => $user_id);
        $user_info = $this->Users_model->get_details($options)->row();

        $totalUsers = $this->Team_model->count()->result()[0]->total;
        $rate = is_numeric(get_setting('admin_costs')) ? intval(get_setting('admin_costs')) : 1;
        $hours = is_numeric(get_setting('working_hours')) ? intval(get_setting('working_hours')) : 1;

        $view_data['rate'] = round($rate / ($totalUsers * $hours), 2);
        $view_data['user_id'] = $user_id;
        $view_data['job_info'] = $this->Users_model->get_job_info($user_id);
        $view_data['job_info']->job_title = $user_info->job_title;

        $this->load->view("team_members/job_info", $view_data);
    }

    //save job information of a team member
    function save_job_info()
    {
        $this->access_only_admin();

        validate_submitted_data(
            array(
                "user_id" => "required|numeric"
            ));

        $user_id = $this->input->post('user_id');

        $job_data = array(
            "user_id"      => $user_id,
            "salary"       => unformat_currency($this->input->post('salary')),
            "working_hours"       => unformat_currency($this->input->post('working_hours')),
            "hourly_rate"       => unformat_currency($this->input->post('salary')) / unformat_currency($this->input->post('working_hours')),
            "salary_term"  => $this->input->post('salary_term'),
            "date_of_hire" => $this->input->post('date_of_hire')
        );

        //we'll save the job title in users table
        $user_data = array(
            "job_title" => $this->input->post('job_title')
        );

        $this->Users_model->save($user_data, $user_id);
        if ($this->Users_model->save_job_info($job_data)) {
            echo json_encode(array("success" => true, 'message' => lang('record_updated')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    //show general information of a team member
    function general_info($user_id)
    {
        $this->only_admin_or_own($user_id);

        $view_data['user_info'] = $this->Users_model->get_one($user_id);
        $this->load->view("team_members/general_info", $view_data);
    }

    //save general information of a team member
    function save_general_info($user_id)
    {
        $this->only_admin_or_own($user_id);

        validate_submitted_data(
            array(
                "first_name" => "required",
                "last_name"  => "required"
            ));

        $user_data = array(
            "first_name"          => $this->input->post('first_name'),
            "last_name"           => $this->input->post('last_name'),
            "address"             => $this->input->post('address'),
            "phone"               => $this->input->post('phone'),
            "skype"               => $this->input->post('skype'),
            "gender"              => $this->input->post('gender'),
            "alternative_address" => $this->input->post('alternative_address'),
            "alternative_phone"   => $this->input->post('alternative_phone'),
            "dob"                 => $this->input->post('dob'),
            "ssn"                 => $this->input->post('ssn'),
            "landing_page"        => $this->input->post('landing_page')
        );

        $user_info_updated = $this->Users_model->save($user_data, $user_id);
        if ($user_info_updated) {
            echo json_encode(array("success" => true, 'message' => lang('record_updated')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    //show social links of a team member
    function social_links($user_id)
    {
        //important! here id=user_id
        $this->only_admin_or_own($user_id);

        $view_data['user_id'] = $user_id;
        $view_data['model_info'] = $this->Social_links_model->get_one($user_id);
        $this->load->view("users/social_links", $view_data);
    }

    //save social links of a team member
    function save_social_links($user_id)
    {
        $this->only_admin_or_own($user_id);

        $id = 0;
        $has_social_links = $this->Social_links_model->get_one($user_id);
        if (isset($has_social_links->id)) {
            $id = $has_social_links->id;
        }

        $social_link_data = array(
            "facebook"   => $this->input->post('facebook'),
            "twitter"    => $this->input->post('twitter'),
            "linkedin"   => $this->input->post('linkedin'),
            "googleplus" => $this->input->post('googleplus'),
            "digg"       => $this->input->post('digg'),
            "youtube"    => $this->input->post('youtube'),
            "pinterest"  => $this->input->post('pinterest'),
            "instagram"  => $this->input->post('instagram'),
            "github"     => $this->input->post('github'),
            "tumblr"     => $this->input->post('tumblr'),
            "vine"       => $this->input->post('vine'),
            "user_id"    => $user_id,
            "id"         => $id ? $id : $user_id
        );

        $this->Social_links_model->save($social_link_data, $id);
        echo json_encode(array("success" => true, 'message' => lang('record_updated')));
    }

    //show account settings of a team member
    function account_settings($user_id)
    {
        $this->only_admin_or_own($user_id);

        $view_data['user_info'] = $this->Users_model->get_one($user_id);
        if ($view_data['user_info']->is_admin) {
            $view_data['user_info']->role_id = "admin";
        }
        $view_data['role_dropdown'] = $this->_get_roles_dropdown();
        $this->load->view("users/account_settings", $view_data);
    }

    //prepare the dropdown list of roles
    private function _get_roles_dropdown()
    {
        $role_dropdown = array(
            "0"     => lang('team_member'),
            "admin" => lang('admin') //static role
        );
        $roles = $this->Roles_model->get_all(array("deleted" => 0))->result();
        foreach ($roles as $role) {
            $role_dropdown[$role->id] = $role->title;
        }

        return $role_dropdown;
    }

    //save account settings of a team member
    function save_account_settings($user_id)
    {
        $this->only_admin_or_own($user_id);

        if ($this->Users_model->is_email_exists($this->input->post('email'), $user_id)) {
            echo json_encode(array("success" => false, 'message' => lang('duplicate_email')));
            exit();
        }
        $account_data = array(
            "email" => $this->input->post('email')
        );

        if ($this->login_user->is_admin && $this->login_user->id != $user_id) {
            //only admin user has permission to update team member's role
            //but admin user can't update his/her own role 
            $role = $this->input->post('role');
            $role_id = $role;

            if ($role === "admin") {
                $account_data["is_admin"] = 1;
                $account_data["role_id"] = 0;
            } else {
                $account_data["is_admin"] = 0;
                $account_data["role_id"] = $role_id;
            }

            $account_data['disable_login'] = $this->input->post('disable_login');
            $account_data['status'] = $this->input->post('status') === "inactive" ? "inactive" : "active";
        }

        //don't reset password if user doesn't entered any password
        if ($this->input->post('password')) {
            $account_data['password'] = md5($this->input->post('password'));
        }

        if ($this->Users_model->save($account_data, $user_id)) {
            echo json_encode(array("success" => true, 'message' => lang('record_updated')));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('error_occurred')));
        }
    }

    //save profile image of a team member
    function save_profile_image($user_id = 0)
    {
        $this->only_admin_or_own($user_id);

        //process the the file which has uploaded by dropzone
        $profile_image = str_replace("~", ":", $this->input->post("profile_image"));

        if ($profile_image) {
            $profile_image = move_temp_file("avatar.png", get_setting("profile_image_path"), "", $profile_image);

            $image_data = array("image" => $profile_image);

            $this->Users_model->save($image_data, $user_id);
            echo json_encode(array("success" => true, 'message' => lang('profile_image_changed')));
        }

        //process the the file which has uploaded using manual file submit
        if ($_FILES) {
            $profile_image_file = get_array_value($_FILES, "profile_image_file");
            $image_file_name = get_array_value($profile_image_file, "tmp_name");
            if ($image_file_name) {
                $profile_image = move_temp_file("avatar.png", get_setting("profile_image_path"), "", $image_file_name);
                $image_data = array("image" => $profile_image);
                $this->Users_model->save($image_data, $user_id);
                echo json_encode(array("success" => true, 'message' => lang('profile_image_changed')));
            }
        }
    }

    //show projects list of a team member
    function projects_info($user_id)
    {
        if ($user_id) {
            $view_data['user_id'] = $user_id;
            $this->load->view("team_members/projects_info", $view_data);
        }
    }

    //show attendance list of a team member
    function attendance_info($user_id)
    {
        if ($user_id) {
            $view_data['user_id'] = $user_id;
            $this->load->view("team_members/attendance_info", $view_data);
        }
    }

    //show weekly attendance list of a team member
    function weekly_attendance()
    {
        $this->load->view("team_members/weekly_attendance");
    }

    //show daily attendance list of a team member
    function daily_attendance()
    {
        $this->load->view("team_members/daily_attendance");
    }

    //show leave list of a team member
    function leave_info($applicant_id)
    {
        if ($applicant_id) {
            $view_data['applicant_id'] = $applicant_id;
            $this->load->view("team_members/leave_info", $view_data);
        }
    }

    //show yearly leave list of a team member
    function yearly_leaves()
    {
        $this->load->view("team_members/yearly_leaves");
    }

    //show yearly leave list of a team member
    function expense_info($user_id)
    {
        $view_data["user_id"] = $user_id;
        $this->load->view("team_members/expenses", $view_data);
    }

}

/* End of file team_member.php */
/* Location: ./application/controllers/team_member.php */