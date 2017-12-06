<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 05/12/2017
 * Time: 16:02
 */

class Legal_cron_jobs extends CI_Controller {

    //run notifier
    public function notify(){
        $reminders = $this->LegalReminders->getReminders();
        echo "<pre>";
        foreach ($reminders as $reminder){
            //send reminder only when db update is successifull
            if($this->update_database($reminder)){
                $this->sendEmailReminder($reminder);
            }

        }
    }

    protected function update_database($reminder){ //after sending the notification simply update the updated_on row of the database
        //find all active documents which can expire
        $active_documents_types = $this->LegalDocumentTypesModel->getCanexpireTypes();

        $user_group = $reminder->reminder_to;  //users group to send the notification

        $duration_before_send = $this->getDurationSeconds($reminder->duration_before);  //duration before sending the notification in seconds
        $reminder_every = $this->getDurationSeconds($reminder->reminder_every);  //reminder ever number of seconds before snding the next notification
        $reminder_for = $this->getDurationSeconds($reminder->reminder_for); //inetrval to send the reminders


        foreach ($active_documents_types as $doc){
            //find all documents that have not expired yet
            $documents = $this->LegalDocumentsModel->getTypeDocuments($doc->id);
            foreach ($documents as $document){
                //check if its already expired
                if(strtotime(date('Y-m-d')) > strtotime($document->covered_to)){
                    if($reminder_for != 0  &&  $reminder_every != 0){ //there is an interval to send a reminder that its not set to n/a
                       // $total_to_be_sent =


                    }else{ //send notification
                        if($document->reminder_sent >= 1){ //only one reminder to be sent
                            break;
                        }else{

                            //send reminder


                        }

                    }

                }

                die();
            }

        }





        var_dump("reminder is",$reminder);
        die();

        $dbupdated = false;



        return $dbupdated;


    }




    function sendEmailReminder($reminder){
        var_dump($reminder);
        die();
    }

    //returns the total number of seconds from a given id
    function getDurationSeconds($id){

    }

    function formatSeconds($secs) {
        $secs = (int)$secs;
        if ( $secs === 0 ) {
            return '0 secs';
        }
        // variables for holding values
        $mins  = 0;
        $hours = 0;
        $days  = 0;
        $weeks = 0;
        // calculations
        if ( $secs >= 60 ) {
            $mins = (int)($secs / 60);
            $secs = $secs % 60;
        }
        if ( $mins >= 60 ) {
            $hours = (int)($mins / 60);
            $mins = $mins % 60;
        }
        if ( $hours >= 24 ) {
            $days = (int)($hours / 24);
            $hours = $hours % 60;
        }
        if ( $days >= 7 ) {
            $weeks = (int)($days / 7);
            $days = $days % 7;
        }
        // format result
        $result = '';
        if ( $weeks ) {
            $result = "{$weeks} week(s) ";
        }
        if ( $days ) {
            $result = "{$days} day(s) ";
        }
        if ( $hours ) {
            $result = "{$hours} hour(s) ";
        }
        if ( $mins ) {
            $result = "{$mins} min(s) ";
        }
        if ( $secs ) {
            $result = "{$secs} sec(s) ";
        }
        $result = rtrim($result);
        echo $result;
    }
}