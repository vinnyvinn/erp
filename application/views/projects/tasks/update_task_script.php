<script type="text/javascript">
    $(document).ready(function() {
        $('body').on('click', '[data-act=update-task-status]', function() {
            $(this).editable({
                type: "select2",
                pk: 1,
                name: 'status',
                ajaxOptions: {
                    type: 'post',
                    dataType: 'json'
                },
                value: $(this).attr('data-value'),
                url: '<?php echo_uri("projects/save_task_status") ?>/' + $(this).attr('data-id'),
                showbuttons: false,
                source: [
                    {text: 'ToDo', value: "to_do - 0%"},
                    {text: '25% Complete', value: "in_progress - 25%"},
                    {text: '50% Complete', value: "in_progress - 50%"},
                    {text: '75% Complete', value: "in_progress - 75%"},
                    {text: 'Done', value: "done - 100%"}
                ],
                success: function(response, newValue) {
                    if (response.success) {
                        $("#task-table").appTable({newData: response.data, dataId: response.id});
                    }
                }
            });
            $(this).editable("show");
        });

        $('body').on('click', '[data-act=update-task-status-checkbox]', function() {
            $(this).find("span").addClass("inline-loader");
            $.ajax({
                url: '<?php echo_uri("projects/save_task_status") ?>/' + $(this).attr('data-id'),
                type: 'POST',
                dataType: 'json',
                data: {value: $(this).attr('data-value')},
                success: function(response) {
                    if (response.success) {
                        $("#task-table").appTable({newData: response.data, dataId: response.id});
                    }
                }
            });
        });
    });
</script>