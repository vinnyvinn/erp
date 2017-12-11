<?php

class Administration_model extends Crud_model {

    private $table = null;

    /*function __construct() {
        $this->table = 'tickets';
        parent::__construct($this->table);
    }*/

    public function count_ict_administration($super_admin = "", $general_staff = "") {
    	if ($super_admin) {
    		return ($this->db->query('SELECT COUNT(*) AS Inventory_count FROM inventory_requisitions')->result()[0]->Inventory_count + $this->db->query('SELECT COUNT(*) AS Petty_cash_count FROM petty_cash')->result()[0]->Petty_cash_count);
    	} elseif ($general_staff) {
    		return ($this->db->query('SELECT COUNT(*) AS Inventory_count FROM inventory_requisitions WHERE user_id = ' . $general_staff)->result()[0]->Inventory_count + $this->db->query('SELECT COUNT(*) AS Petty_cash_count FROM petty_cash WHERE user_id = ' . $general_staff)->result()[0]->Petty_cash_count);
    	}
    }

}
