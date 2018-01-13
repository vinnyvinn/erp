<?php

class Attendance_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'attendance';
        parent::__construct($this->table);
    }

    function current_clock_in_record($user_id) {
        $attendnace_table = $this->db->dbprefix('attendance');
        $sql = "SELECT $attendnace_table.*
        FROM $attendnace_table
        WHERE $attendnace_table.deleted=0 AND $attendnace_table.user_id=$user_id AND $attendnace_table.status='incomplete'";
        $result = $this->db->query($sql);
        if ($result->num_rows()) {
            return $result->row();
        } else {
            return false;
        }
    }

    function log_time($user_id) {

        $current_clock_record = $this->current_clock_in_record($user_id);

        $now = get_current_utc_time();

        if ($current_clock_record && $current_clock_record->id) {
            $data = array(
                "out_time" => $now,
                "status" => "pending"
            );
            return $this->save($data, $current_clock_record->id);
        } else {
            $data = array(
                "in_time" => $now,
                "status" => "incomplete",
                "user_id" => $user_id
            );
            return $this->save($data);
        }
    }

    function get_details($options = array()) {
        $attendnace_table = $this->db->dbprefix('attendance');
        $users_table = $this->db->dbprefix('users');
        $tasksTable = $this->db->dbprefix('tasks');
        $projectsTable = $this->db->dbprefix('projects');

        $where = "";
        $id = get_array_value($options, "id");
        if ($id) {
            $where .= " AND $attendnace_table.id=$id";
        }
        $offset = convert_seconds_to_time_format(get_timezone_offset());

        $start_date = get_array_value($options, "start_date");
        if ($start_date) {
            $where .= " AND DATE(ADDTIME($attendnace_table.in_time,'$offset'))>='$start_date'";
        }
        $end_date = get_array_value($options, "end_date");
        if ($end_date) {
            $where .= " AND DATE(ADDTIME($attendnace_table.in_time,'$offset'))<='$end_date'";
        }

        $user_id = get_array_value($options, "user_id");
        if ($user_id) {
            $where .= " AND $attendnace_table.user_id=$user_id";
        }

        $access_type = get_array_value($options, "access_type");

        if (!$id && $access_type !== "all") {

            $allowed_members = get_array_value($options, "allowed_members");
            if (is_array($allowed_members) && count($allowed_members)) {
                $allowed_members = join(",", $allowed_members);
            } else {
                $allowed_members = '0';
            }
            $login_user_id = get_array_value($options, "login_user_id");
            if ($login_user_id) {
                $allowed_members .= "," . $login_user_id;
            }
            $where .= " AND $attendnace_table.user_id IN($allowed_members)";
        }


        $sql = "SELECT $attendnace_table.*, $projectsTable.title as projectName, $tasksTable.title as taskName, CONCAT($users_table.first_name, ' ',$users_table.last_name) AS created_by_user, $users_table.image as created_by_avatar
        FROM $attendnace_table
        LEFT JOIN $users_table ON $users_table.id = $attendnace_table.user_id
        LEFT JOIN $tasksTable ON $tasksTable.id = $attendnace_table.task_id
        LEFT JOIN $projectsTable ON $projectsTable.id = $attendnace_table.project_id
        WHERE $attendnace_table.deleted=0 $where";

        return $this->db->query($sql);
    }

    function count_clock_status() {
        $attendnace_table = $this->db->dbprefix('attendance');
        $users_table = $this->db->dbprefix('users');

        $clocked_in = "SELECT $attendnace_table.user_id
        FROM $attendnace_table
        WHERE $attendnace_table.deleted=0 AND $attendnace_table.status='incomplete'
        GROUP BY $attendnace_table.user_id";
        $clocked_in_result = $this->db->query($clocked_in);

        $total_members = "SELECT COUNT(id) AS total_members
        FROM $users_table
        WHERE $users_table.deleted=0 AND $users_table.user_type='staff'";
        $total_members_result = $this->db->query($total_members)->row()->total_members;


        $info = new stdClass();
        $info->members_clocked_in = $clocked_in_result->num_rows();
        $info->total_members = $total_members_result ? $total_members_result : 0;
        $info->members_clocked_out = $total_members_result - $info->members_clocked_in;

        return $info;
    }

    function get_timecard_statistics($options = array()) {
        $attendnace_table = $this->db->dbprefix('attendance');

        $where = "";
        $offset = convert_seconds_to_time_format(get_timezone_offset());

        $start_date = get_array_value($options, "start_date");
        if ($start_date) {
            $where .= " AND DATE(ADDTIME($attendnace_table.in_time,'$offset'))>='$start_date'";
        }
        $end_date = get_array_value($options, "end_date");
        if ($end_date) {
            $where .= " AND DATE(ADDTIME($attendnace_table.in_time,'$offset'))<='$end_date'";
        }

        $user_id = get_array_value($options, "user_id");
        if ($user_id) {
            $where .= " AND $attendnace_table.user_id=$user_id";
        }

        $sql = "SELECT DATE_FORMAT($attendnace_table.in_time,'%d') AS day, SUM(TIME_TO_SEC(TIMEDIFF($attendnace_table.out_time,$attendnace_table.in_time))) total_sec
                FROM $attendnace_table 
                WHERE $attendnace_table.deleted=0 AND $attendnace_table.status!='incomplete' $where
                GROUP BY DATE($attendnace_table.in_time)";
        return $this->db->query($sql);
    }

    function count_total_time($options = array()) {
        $attendnace_table = $this->db->dbprefix('attendance');
        $timesheet_table = $this->db->dbprefix('project_time');


        $attendance_where = "";
        $timesheet_where = "";
        $offset = convert_seconds_to_time_format(get_timezone_offset());

        $start_date = get_array_value($options, "start_date");
        if ($start_date) {
            $attendance_where .= " AND DATE(ADDTIME($attendnace_table.in_time,'$offset'))>='$start_date'";
            $timesheet_where .= " AND DATE(ADDTIME($timesheet_table.start_time,'$offset'))>='$start_date'";
        }
        $end_date = get_array_value($options, "end_date");
        if ($end_date) {
            $attendance_where .= " AND DATE(ADDTIME($attendnace_table.in_time,'$offset'))<='$end_date'";
            $timesheet_where .= " AND DATE(ADDTIME($timesheet_table.start_time,'$offset'))<='$end_date'";
        }

        $user_id = get_array_value($options, "user_id");
        if ($user_id) {
            $attendance_where .= " AND $attendnace_table.user_id=$user_id";
            $timesheet_where .= " AND $timesheet_table.user_id=$user_id";
        }

        $info = new stdClass();
        $attendance_sql = "SELECT  SUM(TIME_TO_SEC(TIMEDIFF($attendnace_table.out_time,$attendnace_table.in_time))) total_sec
                FROM $attendnace_table 
                WHERE $attendnace_table.deleted=0 AND $attendnace_table.status!='incomplete' $attendance_where";
        $info->timecard_total = $this->db->query($attendance_sql)->row()->total_sec;

        $timesheet_sql = "SELECT SUM(TIME_TO_SEC(TIMEDIFF($timesheet_table.end_time,$timesheet_table.start_time))) total_sec
                FROM $timesheet_table 
                WHERE $timesheet_table.deleted=0 AND $timesheet_table.status='logged' $timesheet_where";

        $info->timesheet_total = $this->db->query($timesheet_sql)->row()->total_sec;

        return $info;
    }

    public function getTaskAttendance($startDate, $endDate)
    {
        $attendnace_table = $this->db->dbprefix('attendance');
        $users_table = $this->db->dbprefix('users');
        $tasksTable = $this->db->dbprefix('tasks');
        $projectsTable = $this->db->dbprefix('projects');

        $where = "";
        $offset = convert_seconds_to_time_format(get_timezone_offset());
        $where .= " AND DATE(ADDTIME($attendnace_table.in_time,'$offset'))>='$startDate'";
        $where .= " AND DATE(ADDTIME($attendnace_table.in_time,'$offset'))<='$endDate'";

        $sql = "SELECT SUM(difference) as clockedHours, $projectsTable.title as projectName, $tasksTable.title as taskName, CONCAT($users_table.first_name, ' ',$users_table.last_name) AS created_by_user, $users_table.image as created_by_avatar
        FROM $attendnace_table
        LEFT JOIN $users_table ON $users_table.id = $attendnace_table.user_id
        LEFT JOIN $tasksTable ON $tasksTable.id = $attendnace_table.task_id
        LEFT JOIN $projectsTable ON $projectsTable.id = $attendnace_table.project_id
        WHERE $attendnace_table.deleted=0 $where
         GROUP BY $attendnace_table.user_id, tasks.id";

        return $this->db->query($sql);
    }

    public function getAttendanceHours($startDate, $endDate)
    {
        $attendanceTable = $this->db->dbprefix('attendance');
        $usersTable = $this->db->dbprefix('users');

        $where = "";
        $offset = convert_seconds_to_time_format(get_timezone_offset());
        $where .= " AND DATE(ADDTIME($attendanceTable.in_time,'$offset'))>='$startDate'";
        $where .= " AND DATE(ADDTIME($attendanceTable.in_time,'$offset'))<='$endDate'";

        $sql = "SELECT user_id, DATE_FORMAT(in_time, '%a %D %b %Y') as dayDescription, "
            . "DATE(in_time) as inTime, DATE(out_time) as outTime, SUM(difference) as clockedHours, "
            ."CONCAT($usersTable.first_name, ' ',$usersTable.last_name) AS created_by_user, "
            . "$usersTable.image as created_by_avatar "
            . "FROM $attendanceTable LEFT JOIN $usersTable ON $usersTable.id = $attendanceTable.user_id "
            . "WHERE $attendanceTable.deleted = 0 $where GROUP BY user_id, inTime ORDER BY user_id";

        return $this->db->query($sql);
    }

}
