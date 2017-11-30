<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');
class Cron_job extends CI_Controller {

    public function index() {
        // echo "<pre>";
        // print_r(json_decode($this->Projects(array("id"))));
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

					// update each ticket row with the new assigned team member from the matrix
					$this->update_ticket($row->id, $row->created_by, $fallback[0]);
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

    // update a ticket
    public function update_ticket($id, $created_by, $fallback) {

        $now = get_current_utc_time();
        $ticket_data = array(
            "created_at" => $now,
            "status" => "new",
            "last_activity_at" => $now,
            "assigned_to" => $fallback,
        );

        $ticket_id = $this->Tickets_model->save($ticket_data, $id);

        /*if ($ticket_id) {
        	log_notification("ticket_created", array("ticket_id" => $ticket_id, "ticket_comment_id" => $ticket_id));
        }*/

        // notify newly assiged agent (internal)
        $this->db->simple_query("INSERT INTO `notifications`(`user_id`, `description`, `created_at`, `notify_to`, `read_by`, `event`, `project_id`, `task_id`, `project_comment_id`, `ticket_id`, `ticket_comment_id`, `project_file_id`, `leave_id`, `post_id`, `to_user_id`, `activity_log_id`, `client_id`, `invoice_payment_id`, `estimate_id`, `estimate_request_id`, `deleted`) VALUES ($created_by, '', '{$now}', '$fallback', '', 'ticket_created', 0, 0, 0, 13, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)");

        // notify newly assiged agent (exterinternal via sms)
        if (get_setting('escalation_via_sms') == 1) {
        	$phone = $this->sms_to($fallback);
        	// hooks to sms API
        }
    }

    // SELECT `phone` FROM `users` WHERE `id` =? AND `deleted` = ?
    public function sms_to($value) {
    	$query =$this->db->query("SELECT `phone` FROM `users` WHERE `id` =? AND `deleted` = ?", array($value, 0))->result();
    	return $query[0]->phone;
    }

}

/* End of file Cron_job_tickets.php */
/* Location: ./application/controllers/Cron_job_tickets.php */