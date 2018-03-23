<?php

class Jobs_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'jobs';
        parent::__construct($this->table);
    }

     function get_details() {
      $query="SELECT jobs.*,job_services.*,jobs.id as id ,assets.code,employees.name as driver,
      job_types.job_type_name job_type FROM jobs 
      LEFT JOIN job_services ON job_services.id=jobs.job_service_id
      LEFT JOIN assets ON assets.id=jobs.vehicle_no
      LEFT JOIN employees ON employees.id=assets.driver_id
      LEFT JOIN job_types ON job_types.id=jobs.job_type_id";
      return $this->db->query($query)->result_array();
    }

    function fetchId($id){
      $query="SELECT jobs.*,job_types.*,job_types.id as j_ID,job_inspections.*,jobs.description as explanation,jobs_status.name as status,job_services.*,jobs.id as id ,
      job_services.id as serviceID,assets.code,assets.asset_no,employees.name as driver,
      job_types.job_type_name job_type FROM jobs 
      LEFT JOIN job_services ON job_services.id=jobs.job_service_id
      LEFT JOIN assets ON assets.id=jobs.vehicle_no
      LEFT JOIN employees ON employees.id=assets.driver_id
      LEFT JOIN job_inspections ON job_inspections.id=jobs.inspection_id
      LEFT JOIN jobs_status ON jobs_status.id=jobs.status_id
      LEFT JOIN job_types ON job_types.id=jobs.job_type_id WHERE jobs.id=$id";
      return $this->db->query($query)->row_array();
    }
    public function driver($id){
        $query="SELECT * FROM jobs 
         LEFT JOIN employees ON find_in_set(employees.id,jobs.done_by) WHERE jobs.id=$id";
               return $this->db->query($query)->result_array();
    }
     public function inspection($id){
        $query="SELECT * FROM jobs
        LEFT JOIN job_inspections ON find_in_set(job_inspections.id,jobs.inspection_id) WHERE jobs.id=$id";
        return $this->db->query($query)->result_array();
     }
     public function status($id){
        $query="SELECT * FROM jobs 
        LEFT JOIN jobs_status ON find_in_set(jobs_status.id,jobs.status_id) WHERE jobs.id=$id";
          return $this->db->query($query)->result_array();
     }
}