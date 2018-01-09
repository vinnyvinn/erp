<?php


if (!defined('BASEPATH'))
    exit('No direct script access allowed');
require_once("Pre_loader.php");

class CheckItems extends Pre_loader
{

    function index()
    {
        $results = $this->TblCustSuppCheckItemsModel->getAll();
        foreach ($results as $key => $result) {
            $key++;
            $result->idval = $key;
            $checked_on = '';
            if (!empty($result->performed_on)) {
                foreach (explode(",", $result->performed_on) as $newval) {
                    if ((int)$newval == 1) { //customer
                        $checked_on .= "Customers <br>";
                    }
                    if ((int)$newval == 2) {//suppliers
                        $checked_on .= "Suppliers <br>";
                    }
                }
            }
            $result->checked_on = $checked_on;
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


    function save()
    {
        $datasaved = false;
        $postdata = json_decode(file_get_contents('php://input'));
        $performed_on = '';
        $performed_on .= ($postdata->performed_customer) ? "1," : "";
        $performed_on .= ($postdata->performed_supplier) ? "2" : "";

        $data = array(
            "name" => $postdata->name,
            "performed_on" => $performed_on

        );
        if ($this->TblCustSuppCheckItemsModel->save($data, $postdata->id)) {
            $datasaved = true;
        }
        echo json_encode(array("success" => $datasaved, 'message' => lang('record_saved')));
    }

    function delete()
    {
        $deleted = false;
        $postdata = json_decode(file_get_contents('php://input'));
        if ($this->TblCustSuppCheckItemsModel->delete($postdata->id)) {
            $deleted = true;
        }
        echo json_encode(array("success" => $deleted, 'message' => lang('record_saved')));
    }

    function getCust_suppChecks($nature)
    {
        //pass nature which identifies if its a customer or supplier
        $checks = $this->TblCustSuppCheckItemsModel->getChecks($nature);

        echo json_encode($checks);
    }

    function savecustsuppchecks($nature)
    {
        $saved = false;
        $fullysubmitted = true;
        $postdata = json_decode(file_get_contents('php://input'));
        $customer_supp_id = $this->get_customer($postdata->cust_supp_id, (int)$this->allyes($postdata->check), $nature); //customer or supplier id
        $datas = $this->TblCustSuppSpecificChecksModel->getChecks($customer_supp_id);
        foreach ($datas as $key=>$data){
            $this->TblCustSuppSpecificChecksModel->forcedelete($data->id,$nature);
        }
        //save customer data
        $datasaved = true;
        foreach ($postdata->check as $key=>$check){
            //get check id

            $data = array(
                "status" => (int)$this->check_passed($check),
                "check_item" => ($postdata->checkitems)?$postdata->checkitems[$key]->id:'',
                "comment" => ($postdata->comment)?$postdata->comment[$key]:'',
                "expiry_date" => (!empty($postdata->date_expiry[$key]))?date('Y-m-d',strtotime($postdata->date_expiry[$key])):'',
                "customer_id" => $customer_supp_id,
            );

            if(!$this->TblCustSuppSpecificChecksModel->save($data)){
                $datasaved=false;
            };

        }

        var_dump($datasaved);
        die();

    }

    function get_customer($id, $status, $nature){
        $data = array(
            "cust_supp_id" => $id,
            "checked_by" => $this->login_user->id,
            "checked_on" => date('Y-m-d'),
            "status"=>$status,
            "type"=>$nature

        );
        $customer = $this->TblCustSuppChecksModel->getCustSupp($id, $nature);//
        return $this->TblCustSuppChecksModel->save($data, ($customer)?$customer->id:null);
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

        return !$allyes;
    }
    function check_passed($check){
        $checkpassed = true;
        if (explode('_', $check)[0] == 'no') {
            $checkpassed = false;
        }

        //check if all are nos

        return !$checkpassed;
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


    //get the preiously done checks
    function get_performed_checks($type){ //type identifies if its a customer or supplier, 1 for customer, 2 for supplier
        $postdata = json_decode(file_get_contents('php://input'));

        $custsupp = $this->TblCustSuppChecksModel->getCustSupp((int)$postdata->custid, $type);
        if($custsupp){
            //get all performed
            $performed = $this->TblCustSuppSpecificChecksModel->getChecks($custsupp->id);
            echo json_encode($performed);

        }

    }


}