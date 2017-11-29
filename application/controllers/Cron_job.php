<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');
class Cron_job extends CI_Controller {

    public function index() {
        echo "<pre>";
        // print_r(json_decode($this->Projects(array("id"))));
        $this->Differential();
    }

    public function Projects($array = NULL) {
    	// SELECT * FROM `pro_kazi`.`projects` LIMIT 0, 1000
    	$variable = $this->Projects_model->get_all_where(array("deleted" => 0))->result();
    	$return = $variable;
    	if ($array != NULL) {
    		$return = [];
	    	foreach ($variable as $value) {
	    		foreach ($array as $_value) {
	    			$return[] = $value->$_value;
	    		}	
	    	}
    	}

    	return json_encode($return);
    }

    public function Differential() {
    	$now = get_current_utc_time();
    	// SELECT TIMESTAMPDIFF(MINUTE, created_at, last_activity_at) AS Differential FROM tickets WHERE project_id = 8 AND deleted = 0
    	$fallback = [];

    	foreach (json_decode($this->Projects(array("id"))) as $id) {
        	// $query =$this->db->query("SELECT TIMESTAMPDIFF(MINUTE, created_at, last_activity_at) AS Differential FROM tickets WHERE project_id = ? AND deleted = ?", array($id, 0));
        	$query =$this->db->query("
			SELECT
			tickets.id,
			tickets.created_by,
			tickets.assigned_to,
			tickets.escalation_matrix AS escalation_id,
			tickets.status,
			TIMESTAMPDIFF(MINUTE, created_at, last_activity_at) AS differential,
			(SELECT settings.setting_value FROM settings WHERE settings.setting_name = 'escalation_duration' AND settings.deleted = 0) as escalation,
			escalation_matrix.agent_name AS agents
			FROM
			tickets
			INNER JOIN escalation_matrix ON tickets.escalation_matrix = escalation_matrix.id
			WHERE
			tickets.project_id = ?
			AND
			tickets.deleted = ?
			", array($id, 0));

	    	foreach ($query->result() as $row) {
			    // echo $row->Differential;
			    if ($row->differential > $row->escalation || $row->differential == 0) {
			    	// if difference is greater than set escalation duration
			    	$fallback = explode(',', $row->agents);
			    	// if assigned user is in the fall-back matrix unset them from array
			    	if (($key = array_search($row->assigned_to, $fallback)) !== false) {
					    unset($fallback[$key]);
					}
					$fallback = array_values($fallback); // re-base the array keys
					// $fallback = array_merge($fallback); // re-base the array keys
					// update each row with the new assigned team member from the matrix

					if ($this->db->simple_query("UPDATE `tickets` SET `created_by` = $row->created_by, `created_at` = '{$now}', `status` = 'new', `last_activity_at` = '{$now}', `assigned_to` = $fallback[0] WHERE `id` = $row->id AND `project_id` = $id AND `deleted` = 0")) {
					    // echo "Success!";
					} else {
						// echo "Query failed!";
					}
			    }
			}
        }
        print_r($fallback);
        unset($fallback[0]);

        if (count($fallback) == 0) {
        	$this->db->simple_query("DELETE FROM `escalation_matrix` WHERE `id` = $row->escalation_id");
        } else {
        	$new_fallback = implode(',', $fallback);
        	// echo "UPDATE `escalation_matrix` SET `agent_name`=$new_fallback WHERE `id` = $row->escalation_id";
        	$this->db->simple_query("UPDATE `escalation_matrix` SET `agent_name`=$new_fallback WHERE `id` = $row->escalation_id");
        }
    }

}

/* End of file Cron_job_tickets.php */
/* Location: ./application/controllers/Cron_job_tickets.php */