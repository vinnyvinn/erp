function save_cron_settings() {

        $SAGE_DB = $this->load->database('SAGE', TRUE);
        $id_stmt = "SELECT id FROM DEMO.dbo.Project WHERE ProjectLink = " . $_POST['projects'];
        $id_query = $SAGE_DB->query($id_stmt);
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
        $cReference = $cMember[0] . " " . $cMember[1] . ", ";


        if (isset($_POST['Account_type']) && isset($_POST['_Accounts'])) {

            if ($_POST['Account_type'] == 'Debit') {
                $fDebit = $Total;
                $fCredit = NULL;
                $iAccountID = $_POST['_Accounts'];
            } elseif ($_POST['Account_type'] == 'Credit') {
                $fDebit = NULL;
                $fCredit = $Total;
                $iAccountID = $_POST['_Accounts'];
            }
        }
        
        $SAGE_query = "INSERT INTO DEMO.dbo._btblJrBatchLines(iBatchesID, dTxDate, iAccountID, cDescription, cReference, fDebit, fCredit, iProjectID) VALUES (".$_POST['_btblJrBatches'].", '".date('Y-m-d')."', '$iAccountID', '$cDescription' ,'$cReference', '$fDebit', '$fCredit', '".$_POST['projects']."')";
        $SAGE_DB->query($SAGE_query);

        // $this->sync();

        echo json_encode(array("success" => true, 'message' => lang('settings_updated')));
    }