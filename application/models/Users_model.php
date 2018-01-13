<?php

class Users_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'users';
        parent::__construct($this->table);
    }

    function authenticate($email, $password) {
        $this->db->select("id,user_type,client_id");
        $result = $this->db->get_where($this->table, array('email' => $email, 'password' => md5($password), 'status' => 'active', 'deleted' => 0, 'disable_login' => 0));
        if ($result->num_rows() == 1) {
            $user_info = $result->row();

            //check client login settings
            if ($user_info->user_type === "client" && get_setting("disable_client_login")) {
                return false;
            } else if ($user_info->user_type === "client") {
                //user can't be loged in if client has deleted
                $clients_table = $this->db->dbprefix('clients');

                $sql = "SELECT $clients_table.id
                        FROM $clients_table
                        WHERE $clients_table.id= $user_info->client_id AND $clients_table.deleted=0
                        ";
                $client_result = $this->db->query($sql);
                if (!$client_result->num_rows()) {
                    return false;
                }
            }

            $this->session->set_userdata('user_id', $user_info->id);
            return true;
        }
    }

    function login_user_id() {
        $login_user_id = $this->session->user_id;
        return $login_user_id ? $login_user_id : false;
    }

    function sign_out() {
        $this->session->sess_destroy();
        redirect('signin');
    }

    function get_details($options = array()) {
        $users_table = $this->db->dbprefix('users');
        $team_member_job_info_table = $this->db->dbprefix('team_member_job_info');

        $where = "";
        $id = get_array_value($options, "id");
        $status = get_array_value($options, "status");
        $user_type = get_array_value($options, "user_type");
        $client_id = get_array_value($options, "client_id");
        $exclude_user_id = get_array_value($options, "exclude_user_id");

        if ($id) {
            $where .= " AND $users_table.id=$id";
        }
        if ($status === "active") {
            $where .= " AND $users_table.status='active'";
        } else if ($status === "inactive") {
            $where .= " AND $users_table.status='inactive'";
        }

        if ($user_type) {
            $where .= " AND $users_table.user_type='$user_type'";
        }

        if ($client_id) {
            $where .= " AND $users_table.client_id=$client_id";
        }

        if ($exclude_user_id) {
            $where .= " AND $users_table.id!=$exclude_user_id";
        }


        $sql = "SELECT $users_table.*,
            $team_member_job_info_table.date_of_hire, $team_member_job_info_table.salary, $team_member_job_info_table.salary_term
        FROM $users_table
        LEFT JOIN $team_member_job_info_table ON $team_member_job_info_table.user_id=$users_table.id
        WHERE $users_table.deleted=0 $where
        ORDER BY $users_table.first_name";
        return $this->db->query($sql);
    }

    function is_email_exists($email, $id = 0) {
        $result = $this->get_all_where(array("email" => $email, "deleted" => 0));
        if ($result->num_rows() && $result->row()->id != $id) {
            return $result->row();
        } else {
            return false;
        }
    }

    function get_job_info($user_id) {
        parent::use_table("team_member_job_info");
        return parent::get_one_where(array("user_id" => $user_id));
    }

    function save_job_info($data) {
        parent::use_table("team_member_job_info");

        //check if job info already exists
        $where = array("user_id" => get_array_value($data, "user_id"));
        $exists = parent::get_one_where($where);
        if ($exists->user_id) {
            //job info found. update the record
            return parent::update_where($data, $where);
        } else {
            //insert new one
            return parent::save($data);
        }
    }

    function get_team_members($member_ids = "") {
        $users_table = $this->db->dbprefix('users');
        $sql = "SELECT $users_table.*
        FROM $users_table
        WHERE $users_table.deleted=0 AND $users_table.user_type='staff' AND FIND_IN_SET($users_table.id, '$member_ids')
        ORDER BY $users_table.first_name";
        return $this->db->query($sql);
    }

    function get_access_info($user_id = 0) {
        $users_table = $this->db->dbprefix('users');
        $roles_table = $this->db->dbprefix('roles');
        $team_table = $this->db->dbprefix('team');

        $sql = "SELECT $users_table.id, $users_table.landing_page, $users_table.user_type, $users_table.is_admin, $users_table.role_id, $users_table.email,
            $users_table.first_name, $users_table.last_name, $users_table.image, $users_table.message_checked_at, $users_table.notification_checked_at, $users_table.client_id, 
            $users_table.is_primary_contact, $users_table.sticky_note,
            $roles_table.title as role_title, $roles_table.permissions,
            (SELECT GROUP_CONCAT(id) team_ids FROM $team_table WHERE FIND_IN_SET('$user_id', `members`)) as team_ids
        FROM $users_table
        LEFT JOIN $roles_table ON $roles_table.id = $users_table.role_id AND $roles_table.deleted = 0
        WHERE $users_table.deleted=0 AND $users_table.id=$user_id";
        return $this->db->query($sql)->row();
    }

    function get_team_members_and_clients($user_type = "", $user_ids = "", $exlclude_user = 0) {

        $users_table = $this->db->dbprefix('users');
        $clients_table = $this->db->dbprefix('clients');


        $where = "";
        if ($user_type) {
            $where.= " AND $users_table.user_type='$user_type'";
        }

        if ($user_ids) {
            $where.= "  AND FIND_IN_SET($users_table.id, '$user_ids')";
        }

        if ($exlclude_user) {
            $where.= " AND $users_table.id !=$exlclude_user";
        }

        $sql = "SELECT $users_table.id,$users_table.client_id, $users_table.user_type, $users_table.first_name, $users_table.last_name, $clients_table.company_name
        FROM $users_table
        LEFT JOIN $clients_table ON $clients_table.id = $users_table.client_id
        WHERE $users_table.deleted=0 AND $users_table.disable_login = 0 AND $users_table.status = 'active' $where
        ORDER BY $users_table.user_type, $users_table.first_name ASC";

        return $this->db->query($sql);
    }

    /* return comma separated list of user names */

    function user_group_names($user_ids = "") {
        $users_table = $this->db->dbprefix('users');

        $sql = "SELECT GROUP_CONCAT(' ', $users_table.first_name, ' ', $users_table.last_name) AS user_group_name
        FROM $users_table
        WHERE FIND_IN_SET($users_table.id, '$user_ids')";
        return $this->db->query($sql)->row();
    }

    public function all_dropdown()
    {
        $users = $this->db->dbprefix('users');
        $jobInfo = $this->db->dbprefix('team_member_job_info');

        // $sql = "SELECT {$users}.id as user_id, CONCAT(first_name,  ' ',last_name) AS member_name FROM {$users} "
        //     . "INNER JOIN {$jobInfo} on {$users}.id = {$jobInfo}.user_id WHERE status = 'active' "
        //     . "and disable_login = 0 and {$users}.deleted = 0 ORDER BY first_name";

        $sql = "SELECT {$users}.id as user_id, CONCAT(first_name,  ' ',last_name) AS member_name FROM {$users} "
            . "INNER JOIN {$jobInfo} on {$users}.id = {$jobInfo}.user_id WHERE status = 'active' "
            . "and disable_login = 0 and {$users}.deleted = 0 ORDER BY first_name";

        return $this->db->query($sql);
    }

}
