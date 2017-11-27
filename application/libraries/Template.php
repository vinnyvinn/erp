<?php

class Template {

    public function rander($view, $data = array()) {
        $ci = get_instance();
        $user = $ci->Users_model->get_access_info(intval($ci->Users_model->login_user_id()));
        $options = ["status" => 'open'];

        if (! $user->is_admin) {
            $options["user_id"] = $user->id;
        }
        $list_data = $ci->Projects_model->get_details($options)->result();

        $data['projects'] = $list_data;

        $data['content_view'] = $view;
        $ci->load->view('layout/index', $data);
    }

}
