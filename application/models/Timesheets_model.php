<?php

class Timesheets_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'project_time';
        parent::__construct($this->table);
    }

    function get_details($options = array()) {
        $timesheet_table = $this->db->dbprefix('attendance');
        $users_table = $this->db->dbprefix('users');
        $tasksTable = $this->db->dbprefix('tasks');

        $where = "";
        $id = get_array_value($options, "id");
        if ($id) {
            $where .= " AND $timesheet_table.id=$id";
        }

        $project_id = get_array_value($options, "project_id");
        if ($project_id) {
            $where .= " AND $timesheet_table.project_id=$project_id";
        }

        $user_id = get_array_value($options, "user_id");
        if ($user_id) {
            $where .= " AND $timesheet_table.user_id=$user_id";
        }

        $status = get_array_value($options, "status");
        if ($status === "none_open") {
            $where .= " AND $timesheet_table.status !='open'";
        } else if ($status) {
            $where .= " AND $timesheet_table.status='$status'";
        }

        $sql = "SELECT $timesheet_table.*, $tasksTable.title as taskName,  CONCAT($users_table.first_name, ' ',$users_table.last_name) AS logged_by_user, $users_table.image as logged_by_avatar
        FROM $timesheet_table
        LEFT JOIN $users_table ON $users_table.id= $timesheet_table.user_id
        LEFT JOIN $tasksTable ON $tasksTable.id = $timesheet_table.task_id
        WHERE $timesheet_table.deleted=0 $where";

        return $this->db->query($sql);
    }

    function get_timer_info($project_id, $user_id) {
        return parent::get_all_where(array("project_id" => $project_id, "user_id" => $user_id, "status" => "open", "deleted" => 0));
    }

    function process_timer($data) {
        $status = get_array_value($data, "status"); //user wants to set this status
        $project_id = get_array_value($data, "project_id");
        $user_id = get_array_value($data, "user_id");

        //check if timer record already exists
        $where = array("project_id" => $project_id, "user_id" => $user_id, "status" => "open", "deleted" => 0);
        $timer_info = parent::get_one_where($where);

        $now = get_current_utc_time();
        if ($status === "start" && !$timer_info->id) {
            //no record found, create a new record 
            $timer_data = array(
                "project_id" => $project_id,
                "user_id" => $user_id,
                "status" => "open",
                "start_time" => $now
            );
            return parent::save($timer_data);
        } else if ($status === "stop" && $timer_info->id) {
            //timer is running
            //calculate the total time and stop the timer
            $timer_data = array(
                "end_time" => $now,
                "status" => "logged"
            );
            return parent::save($timer_data, $timer_info->id);
        }
    }

    function get_open_timers($user_id = 0) {
        $timesheet_table = $this->db->dbprefix('project_time');
        $projects_table = $this->db->dbprefix('projects');

        $sql = "SELECT $timesheet_table.*, $projects_table.title AS project_title
        FROM $timesheet_table
        LEFT JOIN $projects_table ON $projects_table.id= $timesheet_table.project_id
        WHERE $timesheet_table.deleted=0 AND $timesheet_table.user_id=$user_id AND $timesheet_table.status='open'";
        return $this->db->query($sql);
    }

    function get_timesheet_statistics($options = array()) {
        $timesheet_table = $this->db->dbprefix('project_time');

        $where = "";
        $offset = convert_seconds_to_time_format(get_timezone_offset());

        $start_date = get_array_value($options, "start_date");
        if ($start_date) {
            $where .= " AND DATE(ADDTIME($timesheet_table.start_time,'$offset'))>='$start_date'";
        }
        $end_date = get_array_value($options, "end_date");
        if ($end_date) {
            $where .= " AND DATE(ADDTIME($timesheet_table.start_time,'$offset'))<='$end_date'";
        }

        $user_id = get_array_value($options, "user_id");
        if ($user_id) {
            $where .= " AND $timesheet_table.user_id=$user_id";
        }

        $sql = "SELECT DATE_FORMAT($timesheet_table.start_time,'%d') AS day, SUM(TIME_TO_SEC(TIMEDIFF($timesheet_table.end_time,$timesheet_table.start_time))) total_sec
                FROM $timesheet_table 
                WHERE $timesheet_table.deleted=0 AND $timesheet_table.status='logged' $where
                GROUP BY DATE($timesheet_table.start_time)";
        return $this->db->query($sql);
    }

}
