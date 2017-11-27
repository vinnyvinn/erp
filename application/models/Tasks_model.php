<?php

class Tasks_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'tasks';
        parent::__construct($this->table);
        parent::init_activity_log("task", "title", "project", "project_id");
    }

    function schema() {
        return array(
            "id" => array(
                "label" => lang("id"),
                "type" => "int"
            ),
            "title" => array(
                "label" => lang("title"),
                "type" => "text"
            ),
            "description" => array(
                "label" => lang("description"),
                "type" => "text"
            ),
            "assigned_to" => array(
                "label" => lang("assigned_to"),
                "type" => "foreign_key",
                "linked_model" => $this->Users_model,
                "label_fields" => array("first_name", "last_name"),
            ),
            "collaborators" => array(
                "label" => lang("collaborators"),
                "type" => "foreign_key",
                "link_type" => "user_group_list",
                "linked_model" => $this->Users_model,
                "label_fields" => array("user_group_name"),
            ),
            "milestone_id" => array(
                "label" => lang("milestone"),
                "type" => "foreign_key",
                "linked_model" => $this->Milestones_model,
                "label_fields" => array("title"),
            ),
            "labels" => array(
                "label" => lang("labels"),
                "type" => "tag"
            ),
            "status" => array(
                "label" => lang("status"),
                "type" => "language_key"
            ),
            "start_date" => array(
                "label" => lang("start_date"),
                "type" => "date"
            ),
            "deadline" => array(
                "label" => lang("deadline"),
                "type" => "date"
            ),
            "project_id" => array(
                "label" => lang("project"),
                "type" => "foreign_key"
            ),
            "points" => array(
                "label" => lang("points"),
                "type" => "int"
            ),
            "deleted" => array(
                "label" => lang("deleted"),
                "type" => "int"
            )
        );
    }

    function get_details($options = array()) {
        $tasks_table = $this->db->dbprefix('tasks');
        $users_table = $this->db->dbprefix('users');
        $projects = $this->db->dbprefix('projects');
        $milestones_table = $this->db->dbprefix('milestones');
        $project_members_table = $this->db->dbprefix('project_members');
        $attendance_table = $this->db->dbprefix('attendance');
        $mainTasksTable = $this->db->dbprefix('main_tasks');

        $where = "";

        $id = get_array_value($options, "id");
        if ($id) {
            $where .= " AND $tasks_table.id=$id";
        }

        $project_id = get_array_value($options, "project_id");
        if ($project_id) {
            $where .= " AND $tasks_table.project_id=$project_id";
        }

        $client_id = get_array_value($options, "client_id");
        if ($client_id) {
            $where .= " AND $projects.client_id=$client_id";
        }


        $status = get_array_value($options, "status");
        if ($status) {
            $where .= " AND FIND_IN_SET($tasks_table.status,'$status')";
        }

        $assigned_to = get_array_value($options, "assigned_to");
        if ($assigned_to) {
            $where .= " AND $tasks_table.assigned_to=$assigned_to";
        }

        $specific_user_id = get_array_value($options, "specific_user_id");
        if ($specific_user_id) {
            $where .= " AND ($tasks_table.assigned_to=$specific_user_id OR FIND_IN_SET('$specific_user_id', $tasks_table.collaborators))";
        }


        $milestone_id = get_array_value($options, "milestone_id");
        if ($milestone_id) {
            $where .= " AND $tasks_table.milestone_id=$milestone_id";
        }


        $extra_left_join = "";
        $project_member_id = get_array_value($options, "project_member_id");
        if ($project_member_id) {
            $where .= " AND $project_members_table.user_id=$project_member_id";
            $extra_left_join = " LEFT JOIN $project_members_table ON $tasks_table.project_id= $project_members_table.project_id AND $project_members_table.deleted=0 AND $project_members_table.user_id=$project_member_id";
        }
        $ParentOrder = $this->order_project_tasks();
        $sql = "SELECT parent.title as parentTask, $tasks_table.*, CONCAT($users_table.first_name, ' ',$users_table.last_name) AS assigned_to_user,
                $users_table.image as assigned_to_avatar, $projects.title AS project_title,
                 $milestones_table.title AS milestone_title, IF($tasks_table.deadline='0000-00-00',
                 $milestones_table.due_date,$tasks_table.deadline) AS deadline,
                    (SELECT SUM($attendance_table.difference) from $attendance_table where task_id = tasks.id and deleted = 0) as logged,
                    (SELECT GROUP_CONCAT($users_table.id, '--::--', $users_table.first_name, ' ', $users_table.last_name, '--::--' , IFNULL($users_table.image,'')) FROM $users_table WHERE FIND_IN_SET($users_table.id, $tasks_table.collaborators)) AS collaborator_list  
        FROM $tasks_table
        LEFT JOIN $users_table ON $users_table.id= $tasks_table.assigned_to
        LEFT JOIN $projects ON $tasks_table.project_id=$projects.id 
        LEFT JOIN $milestones_table ON $tasks_table.milestone_id=$milestones_table.id 
        LEFT JOIN $mainTasksTable as parent ON $tasks_table.parent_id=parent.id 
        $extra_left_join
        WHERE $tasks_table.deleted=0 $where ORDER BY $ParentOrder DESC";

        return $this->db->query($sql);
    }

    public function getTasks($user)
    {
        $userId = $user->id;
        $tasksTable = $this->db->dbprefix('tasks');
        $projectsTable = $this->db->dbprefix('projects');

        $query = 'SELECT ' . $tasksTable . '.*, ' . $projectsTable . '.title as projectName FROM ' . $tasksTable .
            ' INNER JOIN ' . $projectsTable . ' ON ' . $projectsTable . '.id = ' . $tasksTable . '.project_id ' .
            ' WHERE '. $tasksTable . '.assigned_to = ' . $userId .
            ' OR '. $tasksTable . '.collaborators LIKE "%,' . $userId . ',%"' .
            ' OR '. $tasksTable . '.collaborators LIKE "' . $userId . ',%"' .
            ' OR '. $tasksTable . '.collaborators LIKE "%,' . $userId . '"' .
            ' OR '. $tasksTable . '.collaborators = ' . $userId;

        if ($user->is_admin) {
            $query = 'SELECT ' .$tasksTable . '.*, ' . $projectsTable . '.title as projectName FROM ' . $tasksTable .
                ' INNER JOIN ' . $projectsTable . ' ON ' . $projectsTable . '.id = ' . $tasksTable . '.project_id';
        }

        return $this->db->query($query);
    }

    public function getCurrentCost($projectId)
    {
        $attendanceTable = $this->db->dbprefix('attendance');
        $jobInfoTable = $this->db->dbprefix('team_member_job_info');

        $query = 'SELECT (SUM(difference) / 3600) as time_rate, ' .
            'SUM((difference * hourly_rate)/3600) as total_cost FROM ' . $attendanceTable .
            ' INNER JOIN ' . $jobInfoTable . ' on ' . $jobInfoTable . '.user_id = ' . $attendanceTable . '.user_id ' .
            'WHERE project_id = ' . $projectId . ' and ' . $attendanceTable . '.deleted = 0';

        return $this->db->query($query);
    }

    public function getEstimatedCost($projectId, $individualRunningCost)
    {
        $tasksTable = $this->db->dbprefix('tasks');
        $jobInfoTable = $this->db->dbprefix('team_member_job_info');

        $query = "SELECT SUM(max_hours * (hourly_rate + $individualRunningCost)) as estimate FROM $tasksTable" .
            " INNER JOIN $jobInfoTable ON $jobInfoTable.user_id = $tasksTable.assigned_to " .
            "WHERE project_id = $projectId";

        return $this->db->query($query);
    }

    function count_my_open_tasks($user_id) {
        $tasks_table = $this->db->dbprefix('tasks');
        $sql = "SELECT COUNT($tasks_table.id) AS total
        FROM $tasks_table
        WHERE $tasks_table.deleted=0  AND ($tasks_table.assigned_to=$user_id OR FIND_IN_SET('$user_id', $tasks_table.collaborators)) AND FIND_IN_SET($tasks_table.status,'to_do - 0%,in_progress - 25%,in_progress - 50%,in_progress - 75%')";
        ;
        return $this->db->query($sql)->row()->total;
    }

    function get_label_suggestions($project_id) {
        $tasks_table = $this->db->dbprefix('tasks');
        $sql = "SELECT GROUP_CONCAT(labels) as label_groups
        FROM $tasks_table
        WHERE $tasks_table.deleted=0 AND $tasks_table.project_id=$project_id";
        return $this->db->query($sql)->row()->label_groups;
    }

    function get_my_projects_dropdown_list($user_id = 0) {
        $project_members_table = $this->db->dbprefix('project_members');
        $projects_table = $this->db->dbprefix('projects');

        $where = " AND $project_members_table.user_id=$user_id";

        $sql = "SELECT $project_members_table.project_id, $projects_table.title AS project_title
        FROM $project_members_table
        LEFT JOIN $projects_table ON $projects_table.id= $project_members_table.project_id
        WHERE $project_members_table.deleted=0 $where 
        GROUP BY $project_members_table.project_id";
        return $this->db->query($sql);
    }

    function order_project_tasks() {
        $settings_table = $this->db->dbprefix('settings');
        $query = "SELECT `setting_value` FROM $settings_table WHERE `setting_name` = 'order_project_tasks'";
        $variable = $this->db->query($query)->result();
        $data     = [];
            foreach($variable as $value) {
                $data[] = array('setting_value' => $value->setting_value);
            }

        return $data[0]['setting_value'];
    }

    function get_task_statistics($options = array()) {
        $tasks_table = $this->db->dbprefix('tasks');

        $where = "";

        $project_id = get_array_value($options, "project_id");
        if ($project_id) {
            $where .= " AND $tasks_table.project_id=$project_id";
        }

        $user_id = get_array_value($options, "user_id");
        if ($user_id) {
            $where .= " AND $tasks_table.assigned_to=$user_id";
        }

        $sql = "SELECT COUNT($tasks_table.id) AS total, $tasks_table.status
        FROM $tasks_table
        WHERE $tasks_table.deleted=0 $where
        GROUP BY $tasks_table.status";
        // return $sql;
        return $this->db->query($sql)->result();
    }

    public function getProjectTasks($projectId)
    {
        $tasksTable = $this->db->dbprefix('tasks');

        $query = 'SELECT * FROM ' . $tasksTable .' WHERE project_id = ' . $projectId . ' AND parent_id = 0';

        return $this->db->query($query)->result();
    }
}
