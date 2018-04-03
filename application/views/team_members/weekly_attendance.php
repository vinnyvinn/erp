<table id="weekly-attendance-table" class="display" cellspacing="0" width="100%">            
    <tfoot>
        <tr>
            <th colspan="6" class="text-right"><?php echo lang("total") ?>:</th>
            <th data-current-page="6"></th>
            <th> </th>
        </tr>
        <tr data-section="all_pages">
            <th colspan="6" class="text-right"><?php echo lang("total_of_all_pages") ?>:</th>
            <th data-all-page="6"></th>
            <th> </th>
        </tr>
    </tfoot>
</table>
<script type="text/javascript">
    $(document).ready(function() {
        loadMembersAttendanceTable("#weekly-attendance-table", "weekly");
    });
</script>