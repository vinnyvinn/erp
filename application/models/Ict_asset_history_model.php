<?php

class Ict_asset_history_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'ict_asset_history';
        parent::__construct($this->table);
    }

    /*public function log_assetHistory($array) {

      $data = array(
        "sage_id" => $array['sage_id'] ? $array['sage_id'] : NULL,
        "action" => $array['action'] ? $array['action'] : NULL,
        "assigned_by" => $array['assigned_by'] ? $array['assigned_by'] : NULL,
        "status" => $array['status'] ? $array['status'] : NULL,
        "assigned_to" => $array['assigned_to'] ? $array['assigned_to'] : NULL
      );

      $this->Ict_asset_history_model->save($data);
    }*/

}
