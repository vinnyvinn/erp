<?php

/**
 * use this to print link location
 *
 * @param string $uri
 * @return print url
 */
if (!function_exists('echo_uri')) {

    function echo_uri($uri = "") {
        echo get_uri($uri);
    }

}

/**
 * prepare uri
 * 
 * @param string $uri
 * @return full url 
 */
if (!function_exists('get_uri')) {

    function get_uri($uri = "") {
        $ci = get_instance();
        $index_page = $ci->config->item('index_page');
        return base_url($index_page . '/' . $uri);
    }

}

/**
 * use this to print file path
 * 
 * @param string $uri
 * @return full url of the given file path
 */
if (!function_exists('get_file_uri')) {

    function get_file_uri($uri = "") {
        return base_url($uri);
    }

}

/**
 * get the url of user avatar
 * 
 * @param string $image_name
 * @return url of the avatar of given image reference
 */
if (!function_exists('get_avatar')) {

    function get_avatar($image_name = "") {
        if ($image_name) {
            return base_url(get_setting("profile_image_path")) . "/" . $image_name;
        } else {
            return base_url("assets/images/avatar.jpg");
        }
    }

}

/**
 * link the css files 
 * 
 * @param array $array
 * @return print css links
 */
if (!function_exists('load_css')) {

    function load_css(array $array) {
        foreach ($array as $uri) {
            echo "<link rel='stylesheet' type='text/css' href='" . base_url($uri) . "' />";
        }
    }

}


/**
 * link the javascript files 
 * 
 * @param array $array
 * @return print js links
 */
if (!function_exists('load_js')) {

    function load_js(array $array) {
        foreach ($array as $uri) {
            echo "<script type='text/javascript'  src='" . base_url($uri) . "'></script>";
        }
    }

}

/**
 * check the array key and return the value 
 * 
 * @param array $array
 * @return extract array value safely
 */
if (!function_exists('get_array_value')) {

    function get_array_value(array $array, $key) {
        if (array_key_exists($key, $array)) {
            return $array[$key];
        }
    }

}

/**
 * prepare a anchor tag for any js request
 * 
 * @param string $title
 * @param array $attributes
 * @return html link of anchor tag
 */
if (!function_exists('js_anchor')) {

    function js_anchor($title = '', $attributes = '') {
        $title = (string) $title;
        $html_attributes = "";

        if (is_array($attributes)) {
            foreach ($attributes as $key => $value) {
                $html_attributes .= ' ' . $key . '="' . $value . '"';
            }
        }

        return '<a href="#"' . $html_attributes . '>' . $title . '</a>';
    }

}


/**
 * prepare a anchor tag for modal 
 * 
 * @param string $url
 * @param string $title
 * @param array $attributes
 * @return html link of anchor tag
 */
if (!function_exists('modal_anchor')) {

    function modal_anchor($url, $title = '', $attributes = '') {
        $attributes["data-act"] = "ajax-modal";
        if (get_array_value($attributes, "data-modal-title")) {
            $attributes["data-title"] = get_array_value($attributes, "data-modal-title");
        } else {
            $attributes["data-title"] = get_array_value($attributes, "title");
        }
        $attributes["data-action-url"] = $url;

        return js_anchor($title, $attributes);
    }

}

/**
 * prepare a anchor tag for ajax request
 * 
 * @param string $url
 * @param string $title
 * @param array $attributes
 * @return html link of anchor tag
 */
if (!function_exists('ajax_anchor')) {

    function ajax_anchor($url, $title = '', $attributes = '') {
        $attributes["data-act"] = "ajax-request";
        $attributes["data-action-url"] = $url;
        return js_anchor($title, $attributes);
    }

}

/**
 * get the selected menu 
 * 
 * @param string $url
 * @param array $submenu
 * @return string "active" indecating the active page
 */
if (!function_exists('active_menu')) {

    function active_menu($menu = "", $submenu = array()) {
        $ci = & get_instance();
        $controller_name = strtolower(get_class($ci));

        //compare with controller name. if not found, check in submenu values
        if ($menu === $controller_name) {
            return "active";
        } else if (count($submenu)) {
            foreach ($submenu as $sub_menu) {
                if ($sub_menu['name'] === $controller_name) {
                    return "active";
                }
            }
        }
    }

}

/**
 * get the selected submenu
 * 
 * @param string $submenu
 * @param boolean $is_controller
 * @return string "active" indecating the active sub page
 */
if (!function_exists('active_submenu')) {

    function active_submenu($submenu = "", $is_controller = false) {
        $ci = & get_instance();
        //if submenu is a controller then compare with controller name, otherwise compare with method name
        if ($is_controller && $submenu === strtolower(get_class($ci))) {
            return "active";
        } else if ($submenu === strtolower($ci->router->method)) {
            return "active";
        }
    }

}

/**
 * get user's time zone offset 
 * 
 * @return active users timezone
 */
if (!function_exists('get_timezone_offset')) {

    function get_timezone_offset() {
        $timeZone = new DateTimeZone(get_setting("timezone"));
        $dateTime = new DateTime("now", $timeZone);
        return $timeZone->getOffset($dateTime);
    }

}

/**
 * convert a local time to UTC 
 * 
 * @param string $date
 * @param string $format
 * @return utc date
 */
if (!function_exists('convert_date_local_to_utc')) {

    function convert_date_local_to_utc($date = "", $format = "Y-m-d H:i:s") {
        if (!$date) {
            return false;
        }
        //local timezone
        $time_offset = get_timezone_offset() * -1;

        //add time offset
        return date($format, strtotime($date) + $time_offset);
    }

}

/**
 * get current utc time
 * 
 * @param string $format
 * @return utc date
 */
if (!function_exists('get_current_utc_time')) {

    function get_current_utc_time($format = "Y-m-d H:i:s") {
        $d = DateTime::createFromFormat("Y-m-d H:i:s", date("Y-m-d H:i:s"));
        $d->setTimeZone(new DateTimeZone("UTC"));
        return $d->format($format);
    }

}

/**
 * convert a UTC time to local timezon as defined on users setting
 * 
 * @param string $date_time
 * @param string $format
 * @return local date
 */
if (!function_exists('convert_date_utc_to_local')) {

    function convert_date_utc_to_local($date_time, $format = "Y-m-d H:i:s") {
        $date = new DateTime($date_time . ' +00:00');
        $date->setTimezone(new DateTimeZone(get_setting('timezone')));
        return $date->format($format);
    }

}

/**
 * get current users local time
 * 
 * @param string $format
 * @return local date
 */
if (!function_exists('get_my_local_time')) {

    function get_my_local_time($format = "Y-m-d H:i:s") {
        return date($format, strtotime(get_current_utc_time()) + get_timezone_offset());
    }

}

/**
 * convert time string to 24 hours format 
 * 01:00 AM will be converted as 13:00:00 
 * 
 * @param string $time  required time format = 01:00 AM/PM
 * @return 24hrs time
 */
if (!function_exists('convert_time_to_24hours_format')) {

    function convert_time_to_24hours_format($time = "00:00 AM") {
        if (!$time)
            $time = "00:00 AM";

        if (strpos($time, "AM")) {
            $time = trim(str_replace("AM", "", $time));
            $check_time = explode(":", $time);
            if ($check_time[0] == 12) {
                $time = "00:" . get_array_value($check_time, 1);
            }
        } else if (strpos($time, "PM")) {
            $time = trim(str_replace("PM", "", $time));
            $check_time = explode(":", $time);
            if ($check_time[0] > 0 && $check_time[0] < 12) {
                $time = $check_time[0] + 12 . ":" . get_array_value($check_time, 1);
            }
        }
        $time.=":00";
        return $time;
    }

}

/**
 * convert time string to 12 hours format 
 * 13:00:00 will be converted as 01:00 AM
 * 
 * @param string $time  required time format =  00:00:00
 * @return 12hrs time
 */
if (!function_exists('convert_time_to_12hours_format')) {

    function convert_time_to_12hours_format($time = "") {
        if ($time) {
            $am = " AM";
            $pm = " PM";
            if (get_setting("time_format") === "small") {
                $am = " am";
                $pm = " pm";
            }
            $check_time = explode(":", $time);
            $hour = $check_time[0] * 1;
            $minute = get_array_value($check_time, 1) * 1;
            $minute = ($minute < 10) ? "0" . $minute : $minute;

            if ($hour == 0) {
                $time = "12:" . $minute . $am;
            } else if ($hour == 12) {
                $time = $hour . ":" . $minute . $pm;
            } else if ($hour > 12) {
                $hour = $hour - 12;
                $hour = ($hour < 10) ? "0" . $hour : $hour;
                $time = $hour . ":" . $minute . $pm;
            } else {
                $hour = ($hour < 10) ? "0" . $hour : $hour;
                $time = $hour . ":" . $minute . $am;
            }
            return $time;
        }
    }

}

/**
 * prepare a decimal value from a time string
 * 
 * @param string $time  required time format =  00:00:00
 * @return number
 */
if (!function_exists('convert_time_string_to_decimal')) {

    function convert_time_string_to_decimal($time = "00:00:00") {
        $hms = explode(":", $time);
        return $hms[0] + ($hms[1] / 60) + ($hms[2] / 3600);
    }

}

/**
 * prepare a human readable time format from a decimal value of seconds
 * 
 * @param string $seconds
 * @return time
 */
if (!function_exists('convert_seconds_to_time_format')) {

    function convert_seconds_to_time_format($seconds = 0) {
        $is_negative = false;
        if ($seconds < 0) {
            $seconds = $seconds * -1;
            $is_negative = true;
        }
        $seconds = $seconds * 1;
        $hours = floor($seconds / 3600);
        $mins = floor(($seconds - ($hours * 3600)) / 60);
        $secs = floor($seconds % 60);

        $hours = ($hours < 10) ? "0" . $hours : $hours;
        $mins = ($mins < 10) ? "0" . $mins : $mins;
        $secs = ($secs < 10) ? "0" . $secs : $secs;

        $string = $hours . ":" . $mins . ":" . $secs;
        if ($is_negative) {
            $string = "-" . $string;
        }
        return $string;
    }

}

/**
 * get seconds form a given time string
 * 
 * @param string $time
 * @return seconds
 */
if (!function_exists('convert_time_string_to_second')) {

    function convert_time_string_to_second($time = "00:00:00") {
        $hms = explode(":", $time);
        return $hms[0] * 3600 + ($hms[1] * 60) + ($hms[2]);
    }

}

/**
 * get the defined config value by a key
 * @param string $key
 * @return config value
 */
if (!function_exists('get_setting')) {

    function get_setting($key = "") {
        $ci = get_instance();
        return $ci->config->item($key);
    }

}

/**
 * convert a datetime string to relative time 
 * ex: $date_time = "2015-01-01 23:10:00" will return like this: Today at 23:10 PM
 * 
 * @param string $date_time .. it will be considered as UTC time.
 * @param string $convert_to_local .. to prevent conversion, pass $convert_to_local=false 
 * @return date time
 */
if (!function_exists('format_to_relative_time')) {

    function format_to_relative_time($date_time, $convert_to_local = true, $is_short_date = false) {
        if ($convert_to_local) {
            $date_time = convert_date_utc_to_local($date_time);
        }

        $target_date = new DateTime($date_time);
        $now = new DateTime();
        $now->setTimezone(new DateTimeZone(get_setting('timezone')));
        $today = $now->format("Y-m-d");
        $date = "";
        $short_date = "";
        if ($now->format("Y-m-d") == $target_date->format("Y-m-d")) {
            $date = lang("today_at");   //today
            $short_date = lang("today");
        } else if (date('Y-m-d', strtotime(' -1 day', strtotime($today))) === $target_date->format("Y-m-d")) {
            $date = lang("yesterday_at"); //yesterday
            $short_date = lang("yesterday");
        } else {
            $date = format_to_date($date_time);
            $short_date = format_to_date($date_time);
        }
        if ($is_short_date) {
            return $short_date;
        } else {
            if (get_setting("time_format") == "24_hours") {
                return $date . " " . $target_date->format("H:i");
            } else {
                return $date . " " . convert_time_to_12hours_format($target_date->format("H:i:s"));
            }
        }
    }

}

/**
 * convert a datetime string to date format as defined on settings
 * ex: $date_time = "2015-01-01 23:10:00" will return like this: Today at 23:10 PM
 * 
 * @param string $date_time .. it will be considered as UTC time.
 * @param string $convert_to_local .. to prevent conversion, pass $convert_to_local=false 
 * @return date
 */
if (!function_exists('format_to_date')) {

    function format_to_date($date_time, $convert_to_local = true) {
        if (!$date_time) {
            return "";
        }

        if ($convert_to_local) {
            $date_time = convert_date_utc_to_local($date_time);
        }
        $target_date = new DateTime($date_time);
        return $target_date->format(get_setting('date_format'));
    }

}

/**
 * convert a datetime string to 12 hours time format
 * 
 * @param string $date_time .. it will be considered as UTC time.
 * @param string $convert_to_local .. to prevent conversion, pass $convert_to_local=false 
 * @return time
 */
if (!function_exists('format_to_time')) {

    function format_to_time($date_time, $convert_to_local = true) {
        if ($convert_to_local) {
            $date_time = convert_date_utc_to_local($date_time);
        }
        $target_date = new DateTime($date_time);

        if (get_setting("time_format") == "24_hours") {
            return $target_date->format("H:i");
        } else {
            return convert_time_to_12hours_format($target_date->format("H:i:s"));
        }
    }

}

/**
 * convert a datetime string to datetime format as defined on settings
 * 
 * @param string $date_time .. it will be considered as UTC time.
 * @param string $convert_to_local .. to prevent conversion, pass $convert_to_local=false 
 * @return date time
 */
if (!function_exists('format_to_datetime')) {

    function format_to_datetime($date_time, $convert_to_local = true) {
        if ($convert_to_local) {
            $date_time = convert_date_utc_to_local($date_time);
        }
        $target_date = new DateTime($date_time);
        $date = $target_date->format(get_setting('date_format'));

        if (get_setting("time_format") == "24_hours") {
            return $date . " " . $target_date->format("H:i");
        } else {
            return $date . " " . convert_time_to_12hours_format($target_date->format("H:i:s"));
        }
    }

}

/**
 * get a human readable file size format from bytes 
 * 
 * @param string $bytes
 * @return fise size
 */
if (!function_exists('convert_file_size')) {

    function convert_file_size($bytes) {
        $bytes = floatval($bytes);
        $bytes_array = array(
            0 => array("unit" => "TB", "value" => pow(1024, 4)),
            1 => array("unit" => "GB", "value" => pow(1024, 3)),
            2 => array("unit" => "MB", "value" => pow(1024, 2)),
            3 => array("unit" => "KB", "value" => 1024),
            4 => array("unit" => "B", "value" => 1),
        );

        foreach ($bytes_array as $byte) {
            if ($bytes >= $byte["value"]) {
                $result = $bytes / $byte["value"];
                $result = strval(round($result, 2)) . " " . $byte["unit"];
                break;
            }
        }
        return $result;
    }

}


/**
 * get some predefined icons for some known file types 
 * 
 * @param string $file_ext
 * @return fontawesome icon class
 */
if (!function_exists('get_file_icon')) {

    function get_file_icon($file_ext = "") {
        switch ($file_ext) {
            case "jpeg":
            case "jpg":
            case "png":
            case "gif":
            case "bmp":
            case "svg":
                return "file-image-o";
                break;
            case "doc":
            case "dotx":
                return "file-word-o";
                break;
            case "xls":
            case "xlsx":
            case "csv":
                return "file-excel-o";
                break;
            case "ppt":
            case "pptx":
            case "pps":
            case "pot":
                return "file-powerpoint-o";
                break;
            case "zip":
            case "rar":
            case "7z":
            case "s7z":
            case "iso":
                return "file-zip-o";
                break;
            case "pdf":
                return "file-pdf-o";
                break;
            case "html":
            case "css":
                return "file-code-o";
                break;
            case "txt":
                return "file-text-o";
                break;
            case "mp3":
            case "wav":
            case "wma":
                return "file-sound-o";
                break;
            case "mpg":
            case "mpeg":
            case "flv":
            case "mkv":
            case "webm":
            case "avi":
            case "mp4":
            case "3gp":
                return "file-movie-o";
                break;
            default:
                return "file-o";
        };
    }

}

/**
 * check the file is a image
 * 
 * @param string $file_name
 * @return true/false
 */
if (!function_exists('is_image_file')) {

    function is_image_file($file_name = "") {
        $extension = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));
        $image_files = array("jpg", "jpeg", "png", "gif", "bmp");
        return (in_array($extension, $image_files)) ? true : false;
    }

}


/**
 * check the file preview supported by google
 * 
 * @param string $file_name
 * @return true/false
 */
if (!function_exists('is_google_preview_available')) {

    function is_google_preview_available($file_name = "") {
        $extension = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));
        $image_files = array("pdf", "doc", "docx", "ppt", "pptx", "txt");
        return (in_array($extension, $image_files)) ? true : false;
    }

}



/**
 * check if a string starts with a specified sting
 * 
 * @param string $string
 * @param string $needle
 * @return true/false
 */
if (!function_exists('starts_with')) {

    function starts_with($string, $needle) {
        $string = $string;
        return $needle === "" || strrpos($string, $needle, -strlen($string)) !== false;
    }

}

/**
 * check if a string ends with a specified sting
 * 
 * @param string $string
 * @param string $needle
 * @return true/false
 */
if (!function_exists('ends_with')) {

    function ends_with($string, $needle) {
        return $needle === "" || (($temp = strlen($string) - strlen($string)) >= 0 && strpos($string, $needle, $temp) !== false);
    }

}

/**
 * create a encoded id for sequrity pupose 
 * 
 * @param string $id
 * @param string $salt
 * @return endoded value
 */
if (!function_exists('encode_id')) {

    function encode_id($id, $salt) {
        $ci = get_instance();
        $id = $ci->encrypt->encode($id . $salt);
        $id = str_replace("=", "~", $id);
        $id = str_replace("+", "_", $id);
        $id = str_replace("/", "-", $id);
        return $id;
    }

}


/**
 * decode the id which made by encode_id()
 * 
 * @param string $id
 * @param string $salt
 * @return decoded value
 */
if (!function_exists('decode_id')) {

    function decode_id($id, $salt) {
        $ci = get_instance();
        $id = str_replace("_", "+", $id);
        $id = str_replace("~", "=", $id);
        $id = str_replace("-", "/", $id);
        $id = $ci->encrypt->decode($id);
        if ($id && strpos($id, $salt) !== false) {
            return str_replace($salt, "", $id);
        }
    }

}

/**
 * decode html data which submited using a encode method of encodeAjaxPostData() function
 * 
 * @param string $html
 * @return htmle
 */
if (!function_exists('decode_ajax_post_data')) {

    function decode_ajax_post_data($html) {
        $html = str_replace("~", "=", $html);
        $html = str_replace("^", "&", $html);
        return $html;
    }

}

/**
 * check if fields has any value or not. and generate a error message for null value
 * 
 * @param array $fields
 * @return throw error for bad value
 */
if (!function_exists('check_required_hidden_fields')) {

    function check_required_hidden_fields($fields = array()) {
        $has_error = false;
        foreach ($fields as $field) {
            if (!$field) {
                $has_error = true;
            }
        }
        if ($has_error) {
            echo json_encode(array("success" => false, 'message' => lang('something_went_wrong')));
            exit();
        }
    }

}

/**
 * convert a number to currency forma
 * 
 * @param number $number
 * @param string $currency
 * @return number with currency symbol
 */
if (!function_exists('to_currency')) {

    function to_currency($number = 0, $currency = "") {
        $decimal_separator = get_setting("decimal_separator");
        $negative_sign = "";
        if ($number < 0) {
            $number = $number * -1;
            $negative_sign = "-";
        }
        if (!$currency) {
            $currency = get_setting("currency_symbol");
        }

        if ($decimal_separator === ",") {
            return $negative_sign . $currency . number_format($number, 2, ",", ".");
        } else {
            return $negative_sign . $currency . number_format($number, 2, ".", ",");
        }
    }

}

/**
 * convert a number to quantity format
 * 
 * @param number $number
 * @return number
 */
if (!function_exists('to_decimal_format')) {

    function to_decimal_format($number = 0) {
        $decimal_separator = get_setting("decimal_separator");
        $decimal = 0;
        if (is_numeric($number) && floor($number) != $number) {
            $decimal = 2;
        }
        if ($decimal_separator === ",") {
            return number_format($number, $decimal, ",", ".");
        } else {
            return number_format($number, $decimal, ".", ",");
        }
    }

}

/**
 * convert a currency value to data format
 *  
 * @param number $currency
 * @return number
 */
if (!function_exists('unformat_currency')) {

    function unformat_currency($currency = "") {
// remove everything except a digit "0-9", a comma ",", and a dot "."
        $new_money = preg_replace('/[^\d,-\.]/', '', $currency);
        $decimal_separator = get_setting("decimal_separator");
        if ($decimal_separator === ",") {
            $new_money = str_replace(".", "", $new_money);
            $new_money = str_replace(",", ".", $new_money);
        } else {
            $new_money = str_replace(",", "", $new_money);
        }
        return $new_money;
    }

}

/**
 * convert simple link text to clickable link
 * @param string $text
 * @return html link
 */
if (!function_exists('link_it')) {

    function link_it($text) {
        return preg_replace('@(https?://([-\w\.]+[-\w])+(:\d+)?(/([\w/_\.#-]*(\?\S+)?[^\.\s])?)?)@', '<a href="$1" target="_blank">$1</a>', $text);
    }

}


/**
 * check the file format priview is available or not
 * 
 * @param string $file_name
 * @return true/false
 */
if (!function_exists('is_viewable_image_file')) {

    function is_viewable_image_file($file_name = "") {
        $viewable_extansions = array(
            "jpeg",
            "jpg",
            "png",
            "gif",
            "bmp",
            "mp4");
        $file_extension = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));
        if (in_array($file_extension, $viewable_extansions)) {
            return true;
        }
    }

}

/**
 * check the file format for video priview is available or not
 * 
 * @param string $file_name
 * @return true/false
 */
if (!function_exists('is_viewable_video_file')) {

    function is_viewable_video_file($file_name = "") {
        $viewable_extansions = array(
            "mp4",
            "webm",
            "ogv"
        );
        $file_extension = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));
        if (in_array($file_extension, $viewable_extansions)) {
            return true;
        }
    }

}


/**
 * upload a file to temp folder when using dropzone autoque=true
 * 
 * @param file $_FILES
 * @return void
 */
if (!function_exists('upload_file_to_temp')) {

    function upload_file_to_temp() {
        if (!empty($_FILES)) {
            $temp_file = $_FILES['file']['tmp_name'];
            $file_name = $_FILES['file']['name'];

            if (!is_valid_file_to_upload($file_name))
                return false;


            $temp_file_path = get_setting("temp_file_path");
            $target_path = getcwd() . '/' . $temp_file_path;
            if (!is_dir($target_path)) {
                if (!mkdir($target_path, 0777, true)) {
                    die('Failed to create file folders.');
                }
            }
            $target_file = $target_path . $file_name;
            copy($temp_file, $target_file);
        }
    }

}

/**
 * this method process 3 types of files
 * 1. direct upload
 * 2. move a uploaded file which has been uploaded in temp folder
 * 3. copy a text based image
 * 
 * @param string $file_name
 * @param string $target_path
 * @param string $source_path 
 * @param string $static_file_name 
 * @return filename
 */
if (!function_exists('move_temp_file')) {

    function move_temp_file($file_name, $target_path, $related_to = "", $source_path = NULL, $static_file_name = "") {

        //to make the file name unique we'll add a prefix
        $filename_prefix = $related_to . "_" . uniqid("file") . "-";


        //if not provide any source path we'll find the default path
        if (!$source_path) {
            $source_path = getcwd() . "/" . get_setting("temp_file_path") . $file_name;
        }

        //check destination directory. if not found try to create a new one
        if (!is_dir($target_path)) {
            if (!mkdir($target_path, 0777, true)) {
                die('Failed to create file folders.');
            }
        }

        //remove unsupported values from the file name
        $new_filename = $filename_prefix . preg_replace('/\s+/', '-', $file_name);

        $new_filename = str_replace("’", "-", $new_filename);
        $new_filename = str_replace("'", "-", $new_filename);

        //overwrite extisting logic and use static file name
        if ($static_file_name) {
            $new_filename = $static_file_name;
        }

        //check the file type is data or file. then copy to destination and remove temp file
        if (starts_with($source_path, "data")) {
            copy_text_based_image($source_path, $target_path . $new_filename);
            return $new_filename;
        } else {
            if (file_exists($source_path)) {
                copy($source_path, $target_path . $new_filename);
                unlink($source_path);
                return $new_filename;
            }
        }
        return false;
    }

}


/**
 * Convert to a file from text based image
 * 
 * @param string $source_path 
 * @param string $target_path
 * @return file size
 */
if (!function_exists('copy_text_based_image')) {

    function copy_text_based_image($source_path, $target_path) {
        $buffer_size = 3145728;
        $byte_number = 0;
        $file_open = fopen($source_path, "rb");
        $file_wirte = fopen($target_path, "w");
        while (!feof($file_open)) {
            $byte_number += fwrite($file_wirte, fread($file_open, $buffer_size));
        }
        fclose($file_open);
        fclose($file_wirte);
        return $byte_number;
    }

}

/**
 * remove file name prefix which was added by move_temp_file() method
 * 
 * @param string $file_name
 * @return filename
 */
if (!function_exists('remove_file_prefix')) {

    function remove_file_prefix($file_name = "") {
        return substr($file_name, strpos($file_name, "-") + 1);
    }

}

/**
 * send mail
 * 
 * @param string $to
 * @param string $subject
 * @param string $message
 * @param array $optoins
 * @return true/false
 */
if (!function_exists('send_app_mail')) {

    function send_app_mail($to, $subject, $message, $optoins = array()) {
        $email_config = Array(
            'charset' => 'utf-8',
            'mailtype' => 'html'
        );

        //check mail sending method from settings
        if (get_setting("email_protocol") === "smtp") {
            $email_config["protocol"] = "smtp";
            $email_config["smtp_host"] = get_setting("email_smtp_host");
            $email_config["smtp_port"] = get_setting("email_smtp_port");
            $email_config["smtp_user"] = get_setting("email_smtp_user");
            $email_config["smtp_pass"] = get_setting("email_smtp_pass");
            $email_config["smtp_crypto"] = get_setting("email_smtp_security_type");
            if (!$email_config["smtp_crypto"]) {
                $email_config["smtp_crypto"] = "tls";
            }
        }

        $ci = get_instance();
        $ci->load->library('email', $email_config);
        $ci->email->clear();
        $ci->email->set_newline("\r\n");
        $ci->email->from(get_setting("email_sent_from_address"), get_setting("email_sent_from_name"));
        $ci->email->to($to);
        $ci->email->subject($subject);
        $ci->email->message($message);

        //add attachment
        $attachments = get_array_value($optoins, "attachments");
        if (is_array($attachments)) {
            foreach ($attachments as $value) {
                $ci->email->attach(trim($value));
            }
        }

        //check cc
        $cc = get_array_value($optoins, "cc");
        if ($cc) {
            $ci->email->cc($cc);
        }

        //check bcc
        $bcc = get_array_value($optoins, "bcc");
        if ($bcc) {
            $ci->email->bcc($bcc);
        }

        //send email
        if ($ci->email->send()) {
            return true;
        } else {
            //show error message in none production version
            if (ENVIRONMENT !== 'production') {
                show_error($ci->email->print_debugger());
            }
            return false;
        }
    }

}


/**
 * return users local time (today)
 * 
 * @return date
 */
if (!function_exists('get_today_date')) {

    function get_today_date() {
        return date("Y-m-d", strtotime(convert_date_local_to_utc(date("Y-m-d H:i:s"))) + get_timezone_offset());
    }

}


/**
 * return users local time (tomorrow)
 * 
 * @return date
 */
if (!function_exists('get_tomorrow_date')) {

    function get_tomorrow_date() {
        $today = date("Y-m-d H:i:s");
        $tomorrow = date('Y-m-d H:i:s', strtotime($today . ' + 1 days'));
        return date("Y-m-d", strtotime(convert_date_local_to_utc($tomorrow)) + get_timezone_offset());
    }

}

/**
 * copy a directory to another directory
 * 
 * @param string $src
 * @param string $dst
 * @return void
 */
if (!function_exists('copy_recursively')) {

    function copy_recursively($src, $dst) {
        $dir = opendir($src);
        @mkdir($dst);
        while (false !== ( $file = readdir($dir))) {
            if (( $file != '.' ) && ( $file != '..' )) {
                if (is_dir($src . '/' . $file)) {
                    copy_recursively($src . '/' . $file, $dst . '/' . $file);
                } else {
                    copy($src . '/' . $file, $dst . '/' . $file);
                }
            }
        }
        closedir($dir);
    }

}

/**
 * get users ip address
 * 
 * @return ip
 */
if (!function_exists('get_real_ip')) {

    function get_real_ip() {
        if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
            $ip = $_SERVER['HTTP_CLIENT_IP'];
        } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
        } else {
            $ip = $_SERVER['REMOTE_ADDR'];
        }
        return $ip;
    }

}


/**
 * convert string to url
 * 
 * @param string $address
 * @return url
 */
if (!function_exists('to_url')) {

    function to_url($address = "") {
        if (strpos($address, 'http://') === false && strpos($address, 'https://') === false) {
            $address = "http://" . $address;
        }
        return $address;
    }

}

/**
 * validate post data using the codeigniter's form validation method
 * 
 * @param string $address
 * @return throw error if foind any inconsistancy
 */
if (!function_exists('validate_submitted_data')) {

    function validate_submitted_data($fields = array()) {
        $ci = get_instance();
        foreach ($fields as $field_name => $requirement) {
            $ci->form_validation->set_rules($field_name, $field_name, $requirement);
        }

        if ($ci->form_validation->run() == FALSE) {
            if (ENVIRONMENT === 'production') {
                $message = lang('something_went_wrong');
            } else {
                $message = validation_errors();
            }
            echo json_encode(array("success" => false, 'message' => $message));
            exit();
        }
    }

}

/**
 * team members profile anchor. only clickable to team members
 * client's will see a none clickable link
 * 
 * @param string $id
 * @param string $name
 * @param array $attributes
 * @return html link
 */
if (!function_exists('get_team_member_profile_link')) {

    function get_team_member_profile_link($id = 0, $name = "", $attributes = array()) {
        $ci = get_instance();
        if ($ci->login_user->user_type === "staff") {
            return anchor("team_members/view/" . $id, $name, $attributes);
        } else {
            return js_anchor($name, $attributes);
        }
    }

}


/**
 * team members profile anchor. only clickable to team members
 * client's will see a none clickable link
 * 
 * @param string $id
 * @param string $name
 * @param array $attributes
 * @return html link
 */
if (!function_exists('get_client_contact_profile_link')) {

    function get_client_contact_profile_link($id = 0, $name = "", $attributes = array()) {
        return anchor("clients/contact_profile/" . $id, $name, $attributes);
    }

}




/**
 * move file to a parmanent direnctory from the temp dirctory
 * 
 * dropzone file post data example
 * the input should be named as file_names and file_sizes
 * 
 * for old borwsers which doesn't supports dropzone the files will be handaled using manual process
 * the post data should be named as manualFiles
 * 
 * @param string $target_path
 * @param string $name
 * 
 * @return array of file ids
 */
if (!function_exists('move_files_from_temp_dir_to_permanent_dir')) {

    function move_files_from_temp_dir_to_permanent_dir($target_path = "", $related_to = "") {

        $ci = get_instance();

        //process the fiiles which has been uploaded by dropzone
        $files_data = array();
        $file_names = $ci->input->post("file_names");
        $file_sizes = $ci->input->post("file_sizes");

        if ($file_names && get_array_value($file_names, 0)) {
            foreach ($file_names as $key => $file_name) {
                $new_file_name = move_temp_file($file_name, $target_path, $related_to);
                $files_data[] = array(
                    "file_name" => $new_file_name,
                    "file_size" => get_array_value($file_sizes, $key)
                );
            }
        }

        //process the files which has been submitted manually
        if ($_FILES) {
            $files = $_FILES['manualFiles'];
            if ($files && count($files) > 0) {
                foreach ($files["tmp_name"] as $key => $file) {
                    $temp_file = $file;
                    $file_name = $files["name"][$key];
                    $file_size = $files["size"][$key];

                    $new_file_name = move_temp_file($file_name, $target_path, $related_to, $temp_file);
                    $files_data[] = array(
                        "file_name" => $new_file_name,
                        "file_size" => $file_size,
                    );
                }
            }
        }
        return serialize($files_data);
    }

};


/**
 * check post file is valid or not
 * 
 * @param string $file_name
 * @return json data of success or error message
 */
if (!function_exists('validate_post_file')) {

    function validate_post_file($file_name = "") {
        if (is_valid_file_to_upload($file_name)) {
            echo json_encode(array("success" => true));
        } else {
            echo json_encode(array("success" => false, 'message' => lang('invalid_file_type') . " ($file_name)"));
        }
    }

}


/**
 * check the file type is valid for upload
 * 
 * @param string $file_name
 * @return true/false
 */
if (!function_exists('is_valid_file_to_upload')) {

    function is_valid_file_to_upload($file_name = "") {

        if (!$file_name)
            return false;

        $file_ext = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));

        $file_formates = explode(",", get_setting("accepted_file_formats"));
        if (in_array($file_ext, $file_formates)) {
            return true;
        }
    }

}


/**
 * return a colorful label accroding to invoice status
 * 
 * @param Object $invoice_info
 * @return html
 */
if (!function_exists('get_invoice_status_label')) {

    function get_invoice_status_label($invoice_info, $return_html = true) {
        $invoice_status_class = "label-default";
        $status = "not_paid";
        $now = get_my_local_time("Y-m-d");
        if ($invoice_info->status != "draft" && $invoice_info->due_date < $now && $invoice_info->payment_received < $invoice_info->invoice_value) {
            $invoice_status_class = "label-danger";
            $status = "overdue";
        } else if ($invoice_info->status !== "draft" && $invoice_info->payment_received <= 0) {
            $invoice_status_class = "label-warning";
            $status = "not_paid";
        } else if ($invoice_info->payment_received && $invoice_info->payment_received >= $invoice_info->invoice_value) {
            $invoice_status_class = "label-success";
            $status = "fully_paid";
        } else if ($invoice_info->payment_received > 0 && $invoice_info->payment_received < $invoice_info->invoice_value) {
            $invoice_status_class = "label-primary";
            $status = "partially_paid";
        } else if ($invoice_info->status === "draft") {
            $invoice_status_class = "label-default";
            $status = "draft";
        }
        $invoice_status = "<span class='label $invoice_status_class large'>" . lang($status) . "</span>";
        if ($return_html) {
            return $invoice_status;
        } else {
            return $status;
        }
    }

}



/**
 * ger all data to make an invoice
 * 
 * @param Int $invoice_id
 * @return array
 */
if (!function_exists('get_invoice_making_data')) {

    function get_invoice_making_data($invoice_id) {
        $ci = get_instance();
        $invoice_info = $ci->Invoices_model->get_details(array("id" => $invoice_id))->row();
        if ($invoice_info) {
            $data['invoice_info'] = $invoice_info;
            $data['client_info'] = $ci->Clients_model->get_one($data['invoice_info']->client_id);
            $data['invoice_items'] = $ci->Invoice_items_model->get_details(array("invoice_id" => $invoice_id))->result();
            $data['invoice_status_label'] = get_invoice_status_label($invoice_info);
            $data["invoice_total_summary"] = $ci->Invoices_model->get_invoice_total_summary($invoice_id);
            return $data;
        }
    }

}

/**
 * ger all data to make an estimate
 * 
 * @param Int $estimate_id
 * @return array
 */
if (!function_exists('get_estimate_making_data')) {

    function get_estimate_making_data($estimate_id) {
        $ci = get_instance();
        $estimate_info = $ci->Estimates_model->get_details(array("id" => $estimate_id))->row();
        if ($estimate_info) {
            $data['estimate_info'] = $estimate_info;
            $data['client_info'] = $ci->Clients_model->get_one($data['estimate_info']->client_id);
            $data['estimate_items'] = $ci->Estimate_items_model->get_details(array("estimate_id" => $estimate_id))->result();
            $data["estimate_total_summary"] = $ci->Estimates_model->get_estimate_total_summary($estimate_id);
            return $data;
        }
    }

}


/**
 * get team members and teams select2 dropdown data list
 * 
 * @return array
 */
if (!function_exists('get_team_members_and_teams_select2_data_list')) {

    function get_team_members_and_teams_select2_data_list() {
        $ci = get_instance();

        $team_members = $ci->Users_model->get_all_where(array("deleted" => 0, "user_type" => "staff"))->result();
        $members_and_teams_dropdown = array();

        foreach ($team_members as $team_member) {
            $members_and_teams_dropdown[] = array("type" => "member", "id" => "member:" . $team_member->id, "text" => $team_member->first_name . " " . $team_member->last_name);
        }

        $team = $ci->Team_model->get_all_where(array("deleted" => 0))->result();
        foreach ($team as $team) {
            $members_and_teams_dropdown[] = array("type" => "team", "id" => "team:" . $team->id, "text" => $team->title);
        }

        return $members_and_teams_dropdown;
    }

}



/**
 * submit data for notification
 * 
 * @return array
 */
if (!function_exists('log_notification')) {

    function log_notification($event, $options = array(), $user_id = 0) {

        $ci = get_instance();

        $url = get_uri("notification_processor/create_notification");

        $req = "event=" . encode_id($event, "notification");

        if ($user_id) {
            $req .= "&user_id=" . $user_id;
        } else {
            $req .= "&user_id=" . $ci->login_user->id;
        }


        foreach ($options as $key => $value) {
            $value = urlencode($value);
            $req .= "&$key=$value";
        }


        $ch = curl_init();
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $req);
        curl_setopt($ch, CURLOPT_TIMEOUT, 1);
        curl_exec($ch);
        curl_close($ch);
    }

}



/**
 * delete file 
 * @param String file_path
 * @return void
 */
if (!function_exists('delete_file_from_directory')) {

    function delete_file_from_directory($file_path = "") {
        $source_path = getcwd() . "/" . $file_path;
        if (file_exists($source_path)) {
            unlink($source_path);
        }
    }

}


/**
 * download files. If there is one file then don't archive the file otherwise archive the files.
 * 
 * @param string $file_path
 * @param string $serialized_file_data 
 * @return download files
 */
if (!function_exists('download_app_files')) {

    function download_app_files($directory_path, $serialized_file_data) {
        $ci = get_instance();

        $file_exists = false;
        if ($serialized_file_data) {

            $files = unserialize($serialized_file_data);
            $total_files = count($files);

            //for only one file we'll download the file without archiving
            if ($total_files === 1) {
                $ci->load->helper('download');
            } else {
                $ci->load->library('zip');
            }


            $file_path = getcwd() . '/' . $directory_path;

            foreach ($files as $file) {
                $path = $file_path . get_array_value($file, 'file_name');
                $output_filename = remove_file_prefix($path);
                if (file_exists($path)) {

                    //if there exists only one file then don't archive the file otherwise archive the file
                    if ($total_files === 1) {

                        $data = file_get_contents($path);
                        force_download($output_filename, $data);
                        exit();
                    } else {

                        $ci->zip->read_file($path, $output_filename);
                        $file_exists = true;
                    }
                }
            }
        }

        if ($file_exists) {
            $ci->zip->download('documents.zip');
        } else {
            die(lang("no_such_file_or_directory_found"));
        }
    }

}