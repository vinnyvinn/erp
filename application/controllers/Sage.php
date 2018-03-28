<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require_once("Pre_loader.php");

class Sage extends Pre_loader {

   /**
    * Get All Data from this method.
    *
    * @return Response
   */

  public function __construct() {
      parent::__construct();
      $this->load->helper(array('form', 'url'));
  }

  public function SAGE_DB() {
    return $this->load->database('SAGE', TRUE);
  }

  public function index() {

   // $this->load->view('sage/index');
    $this->template->rander("sage/index");

  }

  function btblJrBatches() {
        
        $SADE_SQL = "SELECT * FROM _btblJrBatches";
        $stmt   = $this->SAGE_DB()->query($SADE_SQL);

        $arr = array();
        foreach ($stmt->result() as $row) {
        $arr[] = array(
               'idBatches' => $row->idBatches,
               'cBatchNo' => $row->cBatchNo
            );
        }
        //save data mysql data in json encode format     
        echo $data['data'] = json_encode($arr);
    }

    function Accounts() {
        
        $SADE_SQL = "SELECT AccountLink, (Master_Sub_Account + ' : ' + Description) AS Master_Sub_Account_Description FROM  Accounts ORDER BY AccountLink " . $_GET['Order'];
        $stmt   = $this->SAGE_DB()->query($SADE_SQL);

        $arr = array();
        foreach ($stmt->result() as $row) {
        $arr[] = array(
               'AccountLink' => $row->AccountLink,
               'Master_Sub_Account_Description' => $row->Master_Sub_Account_Description
            );
        }
        //save data mysql data in json encode format     
        echo $data['data'] = json_encode($arr);
    }

    function Projects() {
        
        $SADE_SQL = "SELECT ProjectLink, (ProjectCode + ' : ' + ProjectName) AS PROJECT FROM Project";
        $stmt   = $this->SAGE_DB()->query($SADE_SQL);

        $arr = array();
        foreach ($stmt->result() as $row) {
        $arr[] = array(
               'ProjectLink' => $row->ProjectLink,
               'PROJECT' => $row->PROJECT
            );
        }
        //save data mysql data in json encode format     
        echo $data['data'] = json_encode($arr);
    }

    /*function save_sync_settings() {

        $settings = array("HR_sync", "Payroll_sync");

        foreach ($settings as $setting) {
            $value = $this->input->post($setting);
            if (is_null($value)) {
                $value = "off";
            } else {
                $value = "on";
            }

            $this->Settings_model->save_setting($setting, $value);
        }
        echo json_encode(array("success" => true, 'message' => lang('settings_updated')));
    }*/

    function save_sage_sync() {
        
        $id_stmt = "SELECT id FROM Project WHERE ProjectLink = " . $_POST['projects'];
        $id_query = $this->SAGE_DB()->query($id_stmt);
        $row = $id_query->row();
        $ProjectID = $row->id;

        // SELECT tasks.description FROM tasks WHERE tasks.project_id = $ProjectID
        $query = $this->db->get_where('tasks', array('project_id' => $ProjectID));
        $cDescription = NULL;
        foreach ($query->result() as $row) {
            $cDescription .= $row->description . ", ";
        }

        $stmt_query = "SELECT CONCAT(users.first_name, ' ',users.last_name) AS Member, projects.title AS Project, (attendance.difference / 3600) AS Hours, team_member_job_info.hourly_rate AS Rate, (attendance.difference / 3600) * team_member_job_info.hourly_rate AS Total FROM attendance INNER JOIN team_member_job_info ON attendance.user_id = team_member_job_info.user_id INNER JOIN projects ON attendance.project_id = projects.id INNER JOIN users ON attendance.user_id = users.id WHERE attendance.project_id = " . $ProjectID;
        $_query = $this->db->query($stmt_query);
        $cMember = [];
        $cTotal = [];
        foreach ($_query->result() as $row) {
            $cTotal[] = $row->Total;
            $cMember[] = $row->Member;
        }
        $Total = array_sum($cTotal);

        $variable = array_unique($cMember);

        $cReference = NULL;
        foreach ($variable as $key => $value) {
            $cReference .= $value . ", ";
        }

        $SAGE_query = "INSERT INTO _btblJrBatchLines(iBatchesID, dTxDate, iAccountID, cDescription, cReference, fDebit, fCredit, iProjectID) VALUES (".$_POST['_btblJrBatches'].", '".date('Y-m-d')."', '".$_POST['debit']."', '$cDescription' ,'$cReference', '$Total', '', '".$_POST['projects']."')";
        $this->SAGE_DB()->query($SAGE_query);
        
        $SAGE_query = "INSERT INTO _btblJrBatchLines(iBatchesID, dTxDate, iAccountID, cDescription, cReference, fDebit, fCredit, iProjectID) VALUES (".$_POST['_btblJrBatches'].", '".date('Y-m-d')."', '".$_POST['credit']."', '$cDescription' ,'$cReference', '', '$Total', '".$_POST['projects']."')";
        $this->SAGE_DB()->query($SAGE_query);
        
        $this->index();

        // echo json_encode(array("success" => true, 'message' => lang('settings_updated')));
    }

}

?>