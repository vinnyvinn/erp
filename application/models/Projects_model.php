<?php

class Projects_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'projects';
        parent::__construct($this->table);
    }

    function hesabu($query) {
        // returns a count of affect rows
        $sql   = $this->db->query($query);
        return $sql->num_rows();
    }

    function serialPrefix() {
        $settings_table = $this->db->dbprefix('settings');
        $query = "SELECT `setting_value` FROM $settings_table WHERE `setting_name` = 'serial_prefix'";
        $variable = $this->db->query($query)->result();
        $data     = [];
            foreach($variable as $value) {
                $data[] = array('setting_value' => $value->setting_value);
            }

        return $data[0]['setting_value'];
    }

    function productSerial() {
        $settings_table = $this->db->dbprefix('settings');
        $query = "SELECT `setting_value` FROM $settings_table WHERE `setting_name` = 'product_serial'";
        $variable = $this->db->query($query)->result();
        $data     = [];
            foreach($variable as $value) {
                $data[] = array('setting_value' => $value->setting_value);
            }

        return $data[0]['setting_value'];
    }

    function get_details($options = array()) {
        $projects_table = $this->db->dbprefix('projects');
        $project_members_table = $this->db->dbprefix('project_members');
        $clients_table = $this->db->dbprefix('clients');
        $tasks_table = $this->db->dbprefix('tasks');
        $where = "";

        $id = get_array_value($options, "id");
        if ($id) {
            $where .= " AND $projects_table.id=$id";
        }

        $client_id = get_array_value($options, "client_id");
        if ($client_id) {
            $where .= " AND $projects_table.client_id=$client_id";
        }

        $status = get_array_value($options, "status");
        if ($status) {
            $where .= " AND $projects_table.status='$status'";
        }

        $project_label = get_array_value($options, "project_label");
        if ($project_label) {
            $where .= " AND (FIND_IN_SET('$project_label', $projects_table.labels)) ";
        }


        $extra_join = "";
        $extra_where = "";
        $user_id = get_array_value($options, "user_id");

        if (!$client_id && $user_id) {
            $extra_join = " LEFT JOIN (SELECT $project_members_table.user_id, $project_members_table.project_id FROM $project_members_table WHERE $project_members_table.user_id=$user_id AND $project_members_table.deleted=0 GROUP BY $project_members_table.project_id) AS project_members_table ON project_members_table.project_id= $projects_table.id ";
            $extra_where = " AND project_members_table.user_id=$user_id";
        }


        $sql = "SELECT $projects_table.*, $clients_table.company_name, $clients_table.currency_symbol,  total_points_table.total_points, completed_points_table.completed_points
        FROM $projects_table
        LEFT JOIN $clients_table ON $clients_table.id= $projects_table.client_id
        LEFT JOIN (SELECT project_id, (SUM(points) * 100) AS total_points FROM $tasks_table WHERE deleted=0 GROUP BY project_id) AS  total_points_table ON total_points_table.project_id= $projects_table.id
        LEFT JOIN (SELECT project_id, SUM(hesabu) AS completed_points FROM $tasks_table WHERE deleted=0 GROUP BY project_id) AS  completed_points_table ON completed_points_table.project_id= $projects_table.id
        $extra_join    
        WHERE $projects_table.deleted=0 $where $extra_where
        ORDER BY $projects_table.title";
        return $this->db->query($sql);
    }

    function get_label_suggestions() {
        $projects_table = $this->db->dbprefix('projects');
        $sql = "SELECT GROUP_CONCAT(labels) as label_groups
        FROM $projects_table
        WHERE $projects_table.deleted=0";
        return $this->db->query($sql)->row()->label_groups;
    }

    function count_project_status($options = array()) {
        $projects_table = $this->db->dbprefix('projects');
        $project_members_table = $this->db->dbprefix('project_members');

        $extra_join = "";
        $extra_where = "";
        $user_id = get_array_value($options, "user_id");
        if ($user_id) {
            $extra_join = " LEFT JOIN (SELECT $project_members_table.user_id, $project_members_table.project_id FROM $project_members_table WHERE $project_members_table.user_id=$user_id AND $project_members_table.deleted=0 GROUP BY $project_members_table.project_id) AS project_members_table ON project_members_table.project_id= $projects_table.id ";
            $extra_where = " AND project_members_table.user_id=$user_id";
        }

        $sql = "SELECT $projects_table.status, COUNT($projects_table.id) as total
        FROM $projects_table
              $extra_join    
        WHERE $projects_table.deleted=0 AND ($projects_table.status='open' OR  $projects_table.status='completed') $extra_where
        GROUP BY $projects_table.status";
        $result = $this->db->query($sql)->result();

        $info = new stdClass();
        $info->open = 0;
        $info->completed = 0;
        foreach ($result as $value) {
            $status = $value->status;
            $info->$status = $value->total;
        }
        return $info;
    }

    function get_gantt_data($project_id = 0, $options = array()) {
        $tasks_table = $this->db->dbprefix('tasks');
        $milestones_table = $this->db->dbprefix('milestones');
        $users_table = $this->db->dbprefix('users');


        $where = "";

        $milestone_id = get_array_value($options, "milestone_id");
        if ($milestone_id) {
            $where .= " AND $tasks_table.milestone_id=$milestone_id";
        }

        $assigned_to = get_array_value($options, "assigned_to");
        if ($assigned_to) {
            $where .= " AND $tasks_table.assigned_to=$assigned_to";
        }

        $sql = "SELECT $tasks_table.id AS task_id, $tasks_table.title AS task_title, $tasks_table.status, $tasks_table.start_date, $tasks_table.deadline AS end_date, 
             $milestones_table.id AS milestone_id, $milestones_table.title AS milestone_title, $milestones_table.due_date AS milestone_due_date, $tasks_table.assigned_to, CONCAT($users_table.first_name, ' ', $users_table.last_name ) AS assigned_to_name
                FROM $tasks_table
                LEFT JOIN $milestones_table ON $milestones_table.id= $tasks_table.milestone_id
                    LEFT JOIN $users_table ON $users_table.id= $tasks_table.assigned_to
        WHERE $tasks_table.deleted=0 AND $tasks_table.project_id=$project_id $where
        ORDER BY $tasks_table.start_date, $milestones_table.due_date DESC";
        return $this->db->query($sql)->result();
    }

    public function getProjectAttendance($projectId)
    {
        $tasksTable = $this->db->dbprefix('tasks');
        $usersTable = $this->db->dbprefix('users');
        $projectsTable = $this->db->dbprefix('projects');
        $attendanceTable = $this->db->dbprefix('attendance');

        $query = 'select ' . $attendanceTable .'.*, ' . $usersTable .'.* from ' . $attendanceTable .
            ' inner join ' . $tasksTable .' on ' . $attendanceTable . '.task_id = ' . $tasksTable .
            '.id inner join ' . $projectsTable . ' on ' . $tasksTable . '.project_id = ' . $projectsTable .
            '.id inner join ' . $usersTable . ' on ' . $attendanceTable . '.user_id = ' . $usersTable .
            '.id where ' . $projectsTable . '.id = ' . $projectId;

        return $this->db->query($query)->result();
    }

    public function getTaskAttendance($projectId)
    {
        $tasksTable = $this->db->dbprefix('tasks');
        $usersTable = $this->db->dbprefix('users');
        $projectsTable = $this->db->dbprefix('projects');
        $attendanceTable = $this->db->dbprefix('attendance');

        $query = 'select ' . $attendanceTable .'.*, ' . $usersTable .'.* from ' . $attendanceTable .
            ' inner join ' . $tasksTable .' on ' . $attendanceTable . '.task_id = ' . $tasksTable .
            '.id inner join ' . $projectsTable . ' on ' . $tasksTable . '.project_id = ' . $projectsTable .
            '.id inner join ' . $usersTable . ' on ' . $attendanceTable . '.user_id = ' . $usersTable .
            '.id where ' . $projectsTable . '.id = ' . $projectId;

        return $this->db->query($query)->result();
    }

    public function getAll($clientId = null)
    {
        $projectsTable = $this->db->dbprefix('projects');

        $where  = '';
        if ($clientId) {
            $where = ' AND client_id = ' . $clientId;
        }

        $query = 'select * from ' . $projectsTable .' where deleted = 0' . $where . ' order by title';

        return $this->db->query($query)->result();
    }

    public function A($query)
    {
        return $this->db->query($query)->result();
    }

}
