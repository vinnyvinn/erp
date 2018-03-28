<div id="page-content" class="m20 clearfix">

    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>Task Summary</h1>
        </div>
        <div class="table-responsive">
            <table id="attendance-table" class="display" cellspacing="0" width="100%">            
            </table>
        </div>
    </div>

</div>


<script type="text/javascript">
    $(document).ready(function() {
        $("#attendance-table").appTable({
            source: '<?php echo_uri("attendance/task_summary_data"); ?>',
            order: [[1, "asc"]],
            dateRangeType: "custom",
            columns: [
                {title: "<?php echo lang("team_member"); ?>", "class": "w15p"},
                {visible: false, searchable: false},
                {title: "Task", "class": "w15p"},
                {title: "Duration", "class": "w10p text-right"},
            ],
            printColumns: [0, 1, 2, 3],
            xlsColumns: [0, 1, 2, 3],
            "drawCallback": function ( settings ) {
                var api = this.api();
                var rows = api.rows({page:'current'}).nodes();
                var last=null;
                var totale = new Array();
                totale['Totale']= new Array();
                var groupid = -1;
                var subtotale = new Array();

                api.column(1, {page:'current'}).data().each(function (group, i) {
                    if (last !== group) {
                        groupid++;
                        $(rows).eq(i).before('<tr class="group"><td><strong>'+group+'</strong></td></tr>');
                        last = group;
                    }

                    var val = api.row(api.row($(rows).eq( i )).index()).data();      //current order index

                    $.each(val,function(index2,val2){
                        if (index2 != 3) return true;
                        if (typeof subtotale[groupid] =='undefined'){
                            subtotale[groupid] = new Array();
                        }
                        if (typeof subtotale[groupid][index2] =='undefined'){
                            subtotale[groupid][index2] = 0;
                        }
                        if (typeof totale['Totale'][index2] =='undefined') {
                            totale['Totale'][index2] = 0;
                        }
                        valore = Number(val2);
                        subtotale[groupid][index2] += valore;
                        totale['Totale'][index2] += valore;
                    });
                });

                $('tbody').find('.group').each(function (i) {
                    var rowCount = $(this).nextUntil('.group').length;
                    var subtd = '';
                    var totalHours = 0;
                    totalHours = (Math.round(subtotale[i][3] * 100))/100;
                    rowCount = rowCount > 1 ? rowCount + ' Tasks' : rowCount + ' Task';
                    subtd += '<td><strong>'+rowCount+'</strong></td>';
                    subtd += '<td class="text-right"><strong>'+ totalHours +' Hours</strong></td>';
                    $(this).append(subtd);
                });
            }
        });
    });
</script>
