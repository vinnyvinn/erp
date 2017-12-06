<?php
/**
 * Created by PhpStorm.
 * User: HP
 * Date: 01/12/2017
 * Time: 11:48
 */
defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_tbl_time_types extends CI_Migration
{

    public function up()
    {
        $this->dbforge->add_field(array(
            'id' => array(
                'type' => 'INT',
                'unsigned' => TRUE,
                'auto_increment' => TRUE
            ),
            'label' => array(
                'type' => 'VARCHAR',
                'constraint' => '200',
            ),
            'name' => array(
                'type' => 'VARCHAR',
                'constraint' => '200',
            ),

        ));
        $this->dbforge->add_key('id', TRUE);
        $this->dbforge->create_table('tbl_time_types');

        //insert time types
        $sql = "INSERT INTO table (label, name)
                VALUES
                    ('sec', 'Seconds'),
                    ('min', 'Minutes'),
                    ('hours', 'Hours'),
                    ('days', 'Days'),
                    ('months', 'Months')";

        $this->db->query($sql);


    }

    public function down()
    {


    }
}

?>