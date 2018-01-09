<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 12/12/2017
 * Time: 13:44
 */

if (!defined('BASEPATH'))
    exit('No direct script access allowed');
require_once("Pre_loader.php");

class Customers extends Pre_loader
{

    //customers
    function list_customers()
    {
        $SAGE_DB = $this->load->database('SAGE', TRUE);
        $sql = "SELECT * FROM dbo.Client";
        $results = $SAGE_DB->query($sql)->result();
        foreach ($results as $key => $result) {
            $key++;
            $result->idval = $key;
            $status = ["Submitted", "Partially Submitted", "Not Submitted"];
            //find if result is in local table
            $statuses = '';
            $custsupplier = $this->TblCustSuppChecksModel->getCustSupp($result->DCLink);

            if (!$custsupplier) {
                $statuses = 2;
            } else {
                //check if all checked are no
                $checks = $this->TblCustSuppSpecificChecksModel->getChecks($custsupplier->id);
                $allarenos = true;
                foreach ($checks as $check) {
                    if ((int)$check->status == 0) {
                        $allarenos = false;

                    }
                }

                if ($allarenos) {
                    $statuses = 2;
                }else{
                    //check if all required documents are submitted

                    $statuses = $custsupplier->status;
                }
            }

            $result->status_val = $statuses;
        }
        $data = [];
        $data["links"] = $this->make_links($results, 20);
        $data["data"] = $results;

        echo json_encode($data);
    }

    function getCustomer()
    {
        $postdata = json_decode(file_get_contents('php://input'));
        $SAGE_DB = $this->load->database('SAGE', TRUE);
        $sql = "SELECT * FROM dbo.Vendor WHERE DCLink=" . $postdata->id;
        $result = $SAGE_DB->query($sql)->row();
        echo json_encode($result);
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

    //get customers checklists
    function getCustomersChecks($custid)
    {
        //get customer with an id
        $customer = $this->TblCustSuppChecksModel->getCustSupp($custid);
        if ($customer) {
            $datas = $this->TblCustSuppSpecificChecksModel->getChecks($customer->id);
            foreach ($datas as $key => $data) {
                $key++;
                $checkitem = $this->TblCustSuppCheckItemsModel->get_item((int)$data->check_item);
                $statuses = ["Submitted", "Not Submitted"];
                $data->status_val = $statuses[(int)$data->status];
                $data->id_val = $key;
                $data->check_item_name = ($checkitem) ? $checkitem->name : '';
            }
            $data = [];
            $data["links"] = $this->make_links($datas, 20);
            $data["data"] = $datas;

            echo json_encode($data);
        }

    }

    function delete_check()
    {
        $postdata = json_decode(file_get_contents('php://input'));
        $this->TblCustSuppSpecificChecksModel->delete($postdata->id);
        echo json_encode(true);
    }

}