<?php
/**
 * Created by PhpStorm.
 * User: geowan
 * Date: 1/30/18
 * Time: 9:47 AM
 */
class TblLegalDocsItems extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'tbl_legal_docs_items';
        parent::__construct($this->table);
    }



    function get_doc_items($options = array()) {
        $table = $this->db->dbprefix($this->table);
        $where = "";
        $id = get_array_value($options, "legal_doc_id");

        if ($id && $id != null) {
            $where = " AND $table.id=$id";
        }

        $sql = "SELECT $table.*
        FROM $table
        WHERE $where";
        return $this->db->query($sql)->result();
    }

    function getSageItems(){
        $SAGE_DB = $this->load->database('SAGE', TRUE);
        $SADE_SQL = "SELECT * FROM _btblFAAsset";
        $sql   = $SAGE_DB->query($SADE_SQL)->result();
        return $sql;
    }

    function getSageItem($id){
        $SAGE_DB = $this->load->database('SAGE', TRUE);
        $SADE_SQL = "SELECT * FROM _btblFAAsset WHERE idAssetNo=".$id;
        $sql   = $SAGE_DB->query($SADE_SQL)->row();
        return $sql;
    }
}