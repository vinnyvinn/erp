<?php

//extend from this model to execute basic db operations
class Crud_model extends CI_Model {

    private $table;
    private $log_activity = false;
    private $log_type = "";
    private $log_for = "";
    private $log_for_key = "";
    private $log_for2 = "";
    private $log_for_key2 = "";

    function __construct($table = null) {
        $this->use_table($table);
    }

    protected function use_table($table) {
        $this->table = $table;
    }

    protected function init_activity_log($log_type = "", $log_type_title_key = "", $log_for = "", $log_for_key = 0, $log_for2 = "", $log_for_key2 = 0) {
        if ($log_type) {
            $this->log_activity = true;
            $this->log_type = $log_type;
            $this->log_type_title_key = $log_type_title_key;
            $this->log_for = $log_for;
            $this->log_for_key = $log_for_key;
            $this->log_for2 = $log_for2;
            $this->log_for_key2 = $log_for_key2;
        }
    }

    function get_one($id = 0) {
        return $this->get_one_where(array('id' => $id));
    }

    function get_one_where($where = array()) {
        $result = $this->db->get_where($this->table, $where, 1);
        if ($result->num_rows()) {
            return $result->row();
        } else {
            $db_fields = $this->db->list_fields($this->table);
            $fields = new stdClass();
            foreach ($db_fields as $field) {
                $fields->$field = "";
            }
            return $fields;
        }
    }

    function get_all($include_deleted = false) {
        $where = array("deleted" => 0);
        if (!$include_deleted) {
            $where = array();
        }
        return $this->get_all_where($where);
    }

    function get_all_where($where = array(), $limit = 1000000, $offset = 0) {
        $where_in = get_array_value($where, "where_in");
        if ($where_in) {
            foreach ($where_in as $key => $value) {
                $this->db->where_in($key, $value);
            }
            unset($where["where_in"]);
        }
        return $this->db->get_where($this->table, $where, $limit, $offset);
    }

    function save(&$data = array(), $id = 0) {
        if ($id) {
            //update
            $where = array("id" => $id);

            //to log an activity we have to know the changes. now collect the data before update anything
            if ($this->log_activity) {
                $data_before_update = $this->get_one($id);
            }

            $success = $this->update_where($data, $where);
            if ($success) {
                if ($this->log_activity) {
                    //to log this activity, check the changes
                    $fields_changed = array();
                    foreach ($data as $field => $value) {
                        if ($data_before_update->$field != $value) {
                            $fields_changed[$field] = array("from" => $data_before_update->$field, "to" => $value);
                        }
                    }
                    //has changes? log the changes.
                    if (count($fields_changed)) {
                        $log_for_id = 0;
                        if ($this->log_for_key) {
                            $log_for_key = $this->log_for_key;
                            $log_for_id = $data_before_update->$log_for_key;
                        }

                        $log_for_id2 = 0;
                        if ($this->log_for_key2) {
                            $log_for_key2 = $this->log_for_key2;
                            $log_for_id2 = $data_before_update->$log_for_key2;
                        }

                        $log_type_title_key = $this->log_type_title_key;
                        $log_type_title = isset($data_before_update->$log_type_title_key) ? $data_before_update->$log_type_title_key : "";

                        $log_data = array(
                            "action" => "updated",
                            "log_type" => $this->log_type,
                            "log_type_title" => $log_type_title,
                            "log_type_id" => $id,
                            "changes" => serialize($fields_changed),
                            "log_for" => $this->log_for,
                            "log_for_id" => $log_for_id,
                            "log_for2" => $this->log_for2,
                            "log_for_id2" => $log_for_id2,
                        );
                        $this->Activity_logs_model->save($log_data);
                        $activity_log_id = $this->db->insert_id();
                        $data["activity_log_id"] = $activity_log_id;
                    }
                }
            }
            return $success;
        } else {
            //insert
            if ($this->db->insert($this->table, $data)) {
                $insert_id = $this->db->insert_id();
                if ($this->log_activity) {
                    //log this activity
                    $log_for_id = 0;
                    if ($this->log_for_key) {
                        $log_for_id = get_array_value($data, $this->log_for_key);
                    }

                    $log_for_id2 = 0;
                    if ($this->log_for_key2) {
                        $log_for_id2 = get_array_value($data, $this->log_for_key2);
                    }

                    $log_type_title = get_array_value($data, $this->log_type_title_key);
                    $log_data = array(
                        "action" => "created",
                        "log_type" => $this->log_type,
                        "log_type_title" => $log_type_title ? $log_type_title : "",
                        "log_type_id" => $insert_id,
                        "log_for" => $this->log_for,
                        "log_for_id" => $log_for_id,
                        "log_for2" => $this->log_for2,
                        "log_for_id2" => $log_for_id2,
                    );
                    $this->Activity_logs_model->save($log_data);
                    $activity_log_id = $this->db->insert_id();
                    $data["activity_log_id"] = $activity_log_id;
                }
                return $insert_id;
            }
        }
    }

    function update_where($data = array(), $where = array()) {
        if (count($where)) {
            if ($this->db->update($this->table, $data, $where)) {
                $id = get_array_value($where, "id");
                if ($id) {
                    return $id;
                } else {
                    return true;
                }
            }
        }
    }

    function delete($id = 0, $undo = false) {
        $data = array('deleted' => 1);
        if ($undo === true) {
            $data = array('deleted' => 0);
        }
        $this->db->where("id", $id);
        $success = $this->db->update($this->table, $data);
        if ($success) {
            if ($this->log_activity) {
                if ($undo) {
                    // remove previous deleted log.
                    $this->Activity_logs_model->delete_where(array("action" => "deleted", "log_type" => $this->log_type, "log_type_id" => $id));
                } else {
                    //to log this activity check the title
                    $model_info = $this->get_one($id);
                    $log_for_id = 0;
                    if ($this->log_for_key) {
                        $log_for_key = $this->log_for_key;
                        $log_for_id = $model_info->$log_for_key;
                    }
                    $log_type_title_key = $this->log_type_title_key;
                    $log_type_title = $model_info->$log_type_title_key;
                    $log_data = array(
                        "action" => "deleted",
                        "log_type" => $this->log_type,
                        "log_type_title" => $log_type_title ? $log_type_title : "",
                        "log_type_id" => $id,
                        "log_for" => $this->log_for,
                        "log_for_id" => $log_for_id,
                    );
                    $this->Activity_logs_model->save($log_data);
                }
            }
        }
        return $success;
    }

    function get_dropdown_list($option_fields = array(), $key = "id", $where = array()) {
        $where["deleted"] = 0;
        $list_data = $this->get_all_where($where)->result();
        $result = array();
        foreach ($list_data as $data) {
            $text = "";
            foreach ($option_fields as $option) {
                $text.=$data->$option . " ";
            }
            $result[$data->$key] = $text;
        }
        return $result;
    }

}
