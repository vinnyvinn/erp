<?php

class Support_comments_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'support_comments';
        parent::__construct($this->table);
    }

    public function getComments($ticket_id){
    	  $sql = "SELECT support_comments.*, CONCAT(users.first_name, users.last_name) AS created_by_user, users.image as created_by_avatar, users.user_type
        FROM support_comments
        LEFT JOIN users ON users.id= support_comments.created_by
        WHERE support_comments.ticket_id=$ticket_id ORDER BY support_comments.created_at ASC";
        return $this->db->query($sql)->result();
    }

}