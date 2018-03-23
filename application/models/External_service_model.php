<?php

class External_service_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'external_services';
        parent::__construct($this->table);
    }
  
   function get_details(){
   	$query="SELECT external_services.*,jobs.card_no,assets.code FROM external_services 
   	LEFT JOIN jobs ON jobs.id=external_services.job_card_id
   	LEFT JOIN assets ON assets.id=jobs.vehicle_no";
  	return $this->db->query($query)->result_array();
   } 

   public function get_services($id){
    $query="SELECT external_services.*,spares.requisition_no,jobs.card_no,
    parts_suppliers.name as supplier,assets.code as vehicle,assets.description as make FROM external_services
    LEFT JOIN jobs ON jobs.id=external_services.job_card_id 
    LEFT JOIN spares ON spares.job_card_id=external_services.job_card_id
    LEFT JOIN assets ON assets.id=jobs.vehicle_no
    LEFT JOIN parts_suppliers ON parts_suppliers.id=external_services.supplier_id WHERE spares.id=$id";
    return $this->db->query($query)->result_array();
   }
}