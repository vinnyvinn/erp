<?php


class MainTask extends Crud_model
{
    protected $table = null;

    public function __construct()
    {
        $this->table = 'main_tasks';
        parent::__construct($this->table);
    }

    public function all()
    {
        $table = $this->db->dbprefix('main_tasks');

        $query = "SELECT * FROM $table WHERE deleted = 0";

        return $this->db->query($query)->result();
    }

    public function forProject($projectId)
    {
        $table = $this->db->dbprefix('main_tasks');

        $query = "SELECT * FROM $table WHERE deleted = 0 AND project_id = $projectId";

        return $this->db->query($query)->result();
    }

    // public function insert_main_task($serial, $title, $description, $project_id)
    // {
    //     $table = $this->db->dbprefix('main_tasks');

    //     $query = "INSERT INTO `$table`(`serial`,`title`, `description`, `project_id`) VALUES ('$serial', '$title', '$description', '$project_id')";

    //     $sql = $this->db->query($query)->result();
    //     return $sql->num_rows();
    // }
}
