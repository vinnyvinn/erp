<?php

class Pre_loader extends CI_Controller {

    public $login_user;
    protected $access_type = "";
    protected $allowed_members = array();

    function __construct() {
        parent::__construct();
        //$this->load->library('csvimport');
        $this->load->library('Excel');

        //check user's login status, if not logged in redirect to signin page
        $login_user_id = $this->Users_model->login_user_id();
        if (!$login_user_id) {
            $uri_string = uri_string();
//        var_dump($uri_string);
//        die();
            if (!$uri_string || $uri_string === "signin") {
                redirect('signin');
            } else {
                redirect('signin?redirect=' . get_uri($uri_string));
            }
        }

        //initialize login users required information
        $this->login_user = $this->Users_model->get_access_info($login_user_id);

        //initialize login users access permissions
        if ($this->login_user->permissions) {
            $permissions = unserialize($this->login_user->permissions);
            $this->login_user->permissions = is_array($permissions) ? $permissions : array();
        } else {
            $this->login_user->permissions = array();
        }
    }

    //initialize the login user's permissions with readable format
    protected function init_permission_checker($module) {
        $info = $this->get_access_info($module);
        $this->access_type = $info->access_type;
        $this->allowed_members = $info->allowed_members;
    }

    //prepear the login user's permissions
    protected function get_access_info($module) {
        $info = new stdClass();
        $info->access_type = "";
        $info->allowed_members = array();

        //admin users has access to everything
        if ($this->login_user->is_admin) {
            $info->access_type = "all";
        } else {

            //not an admin user? check module wise access permissions
            $module_permission = get_array_value($this->login_user->permissions, $module);

            if ($module_permission === "all") {
                //this user's has permission to access/manage everything of this module (same as admin)
                $info->access_type = "all";
            } else if ($module_permission === "specific") {
                //this user's has permission to access/manage sepcific items of this module

                $info->access_type = "specific";
                $module_permission = get_array_value($this->login_user->permissions, $module . "_specific");
                $permissions = explode(",", $module_permission);

                //check the accessable users list
                if ($module === "leave" || $module === "attendance") {
                    $info->allowed_members = array($this->login_user->id);
                    $allowed_teams = array();
                    foreach ($permissions as $vlaue) {
                        $permission_on = explode(":", $vlaue);
                        $type = get_array_value($permission_on, "0");
                        $type_value = get_array_value($permission_on, "1");
                        if ($type === "member") {
                            array_push($info->allowed_members, $type_value);
                        } else if ($type === "team") {
                            array_push($allowed_teams, $type_value);
                        }
                    }

                    if (count($allowed_teams)) {
                        $team = $this->Team_model->get_members($allowed_teams)->result();
                        foreach ($team as $value) {
                            $info->allowed_members+=explode(",", $value->members);
                        }
                    }
                }
            }
        }
        return $info;
    }

    //only allowed to access for team members 
    protected function access_only_team_members() {
        if ($this->login_user->user_type !== "staff") {
            redirect("forbidden");
        }
    }

    //only allowed to access for admin users
    protected function access_only_admin() {
        if (!$this->login_user->is_admin) {
            redirect("forbidden");
        }
    }

    //access only allowed team members
    protected function access_only_allowed_members() {
        if ($this->access_type !== "all") {
            redirect("forbidden");
        }
    }

    //access only allowed team members
    protected function access_only_allowed_members_or_client_contact($client_id) {
        if (!($this->access_type === "all" || $this->login_user->client_id === $client_id)) {
            redirect("forbidden");
        }
    }

    //allowed team members and clint himself can access  
    protected function access_only_allowed_members_or_contact_personally($user_id) {
        if (!($this->access_type === "all" || $user_id === $this->login_user->id)) {
            redirect("forbidden");
        }
    }

    //access all team members and client contact
    protected function access_only_team_members_or_client_contact($client_id) {
        if (!($this->login_user->user_type === "staff" || $this->login_user->client_id === $client_id)) {
            redirect("forbidden");
        }
    }

    //only allowed to access for admin users
    protected function access_only_clients() {
        if ($this->login_user->user_type != "client") {
            redirect("forbidden");
        }
    }

    //check module is enabled or not
    protected function check_module_availability($module_name) {
        if (get_setting($module_name) != "1") {
            redirect("forbidden");
        }
    }

    protected function can_create_projects() {
        if ($this->login_user->user_type == "staff") {
            if ($this->login_user->is_admin) {
                return true;
            } else if (get_array_value($this->login_user->permissions, "can_create_projects") == "1") {
                return true;
            }
        }
    }

}
