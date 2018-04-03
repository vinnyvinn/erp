<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 15/12/2017
 * Time: 02:55
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');
require_once("Pre_loader.php");

class Checklist_daily_tasks extends Pre_loader{

    function list_daily_checks()
    {
        $results = $this->TblChecklistsTasks->getAll();
        foreach ($results as $key => $result) {
            $status = $this->TblChecklistStatus->get_item($result->status);
            $user = $this->Users_model->get_details(["id"=>$result->performed_by])->row();

            $key++;
            //$result->typeval =($type)?$type->name:'';
            $checked_on = '';
            $result->performed_on =date('Y-m-d', strtotime($result->performed_on));
            $result->performed_by = ($user)?$user->first_name." ".$user->last_name:'';
            $result->checked_on = $checked_on;
            $result->statusval = ($status)?$status->name:'';
        }

        $data = [];
        $data["links"] = $this->make_links($results, 20);
        $data["data"] = $results;

        echo json_encode($data);
    }

    function make_links($results, $current_page, $per_page = 10)
    {
        return array("pagination" => [
            "total" => count($results),
            "per_page" => $per_page,
            "current_page" => $current_page,
            "last_page" => 4,
            "next_page_url" => "...",
            "prev_page_url" => "...",
            "from" => 1,
            "to" => 15,
        ]);

    }


    function savetasks()
    {
        $datasaved = false;
        $postdata = json_decode(file_get_contents('php://input'));

        $status = $this->allyes($postdata->check);

        $taskid = $this->savetask((!empty($postdata->escalate_to))?$postdata->escalate_to->value:'', ($status)?1:2); //customer or supplier id

        foreach ($postdata->check as $key=>$check){
            //get check id
            $data = array(
                "status" => (int)$this->check_passed($check),
                "check_item" => ($postdata->checkitems)?$postdata->checkitems[$key]->id:'',
                "comment" => ($postdata->comment)?$postdata->comment[$key]:'',
                "checklist_task" => $taskid,
            );

            if($this->TblChecklistsTasksChecks->save($data)){
                $datasaved=true;
            };

        }

        var_dump($datasaved);
        die();

    }

    function savetask($escalate_to, $status){
        $data = array(
            "ref_no" => time(),
            "status" => $status,
            "performed_by" => $this->login_user->id,
            "performed_on" => date('Y-m-d'),
            "escalate_to" => $escalate_to,
        );
        return $this->TblChecklistsTasks->save($data);
    }

    //use int so reverse the value
    function allyes($checks)
    {
        $allyes = true;
        if(!empty($checks)){
            foreach ($checks as $check) {
                //check if there is a no
                if (explode('_', $check)[0] == 'no') {
                    $allyes = false;
                }
            }
        }

        return $allyes;
    }
    function check_passed($check){
        $checkpassed = true;
        if (explode('_', $check)[0] == 'no') {
            $checkpassed = false;
        }

        return $checkpassed;
    }

    function getItem_id($checklists, $getval)
    {
        $id = null;
        foreach ($checklists as $checklist) {
            if ($checklist->id == $getval) {
                $id = $checklist->id;
            }
        }

        return $id;

    }

}