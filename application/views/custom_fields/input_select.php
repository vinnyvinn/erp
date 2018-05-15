<select class="select2 validate-hidden" id="custom_field_<?php echo $field_info->id; ?>" name="custom_field_<?php echo $field_info->id; ?>" placeholder="<?php echo $field_info->placeholder; ?>"  data-rule-required ='<?php echo $field_info->required ? true : false; ?>'
        data-msg-required="<?php echo lang('field_required'); ?>" >
    <option value=""></option>
    <?php
    $options = $field_info->options;
    $options_array = explode(",", $options);
    if ($options && count($options_array)) {
        foreach ($options_array as $value) {
            echo '<option value="' . trim($value) . '" >' . trim($value) . '</option>';
        }
    }
    ?>
</select>
<script type="text/javascript">
    $(document).ready(function () {
        $("select#custom_field_<?php echo $field_info->id; ?>").select2();
    });
</script>