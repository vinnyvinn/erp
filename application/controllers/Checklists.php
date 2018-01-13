<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 14/12/2017
 * Time: 08:59
 */

if (!defined('BASEPATH'))
    exit('No direct script access allowed');
require_once("Pre_loader.php");

class Checklists extends Pre_loader
{

    function index(){
        $this->template->rander("checklists/index");
    }

    function list_checklists($performed_on = null)
    {
        $results = $this->TblChecklists->getAll((int)$performed_on);
        foreach ($results as $key => $result) {
            $type = $this->TblChecklistPerformedOn->get_item($result->performed_on);
            $key++;
            $result->typeval =($type)?$type->name:'';
            $checked_on = '';
            $result->checked_on = $checked_on;
            $result->keyval = $key;
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

    function checklist_types(){
        $data = $this->TblChecklistPerformedOn->getAll();
        echo json_encode($data);
    }


    function save()
    {
        $datasaved = false;
        $postdata = json_decode(file_get_contents('php://input'));
        if((int)$postdata->type->value){
            $data = array(
                "name" => $postdata->name,
                "performed_on" => (int)$postdata->type->value,
                "comment"=>$postdata->comment

            );
            if ($this->TblChecklists->save($data, $postdata->id)) {
                $datasaved = true;
            }
        }

        echo json_encode(array("success" => $datasaved, 'message' => lang('record_saved')));
    }

    function delete()
    {
        $deleted = false;
        $postdata = json_decode(file_get_contents('php://input'));
        if ($this->TblChecklists->delete($postdata->id)) {
            $deleted = true;
        }
        echo json_encode(array("success" => $deleted, 'message' => lang('record_saved')));
    }

    function ict_users(){
        $users = $this->Users_model->get_details(['user_type'=>'staff'])->result();
        echo json_encode($users);
    }

}