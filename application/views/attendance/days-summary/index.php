<div id="page-content" class="m20 clearfix">

    <div class="panel panel-default">
        <div class="page-title clearfix">
            <h1>Day Summary</h1>
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
            source: '<?php echo_uri("attendance/days_summary_data"); ?>',
//            order: [[1, "asc"]],
            dateRangeType: "custom",
            columns: [
                {visible: false, searchable: false},
                {title: "<?php echo lang("team_member"); ?>", "class": "w15p"},
                {title: "Duration", "class": "w10p text-right"},
            ],
            printColumns: [0, 1, 2],
            xlsColumns: [0, 1, 2],
            "drawCallback": function ( settings ) {
                var api = this.api();
                var rows = api.rows({page:'current'}).nodes();
                var last=null;
                var totale = new Array();
                totale['Totale']= new Array();
                var groupid = -1;
                var subtotale = new Array();

                api.column(0, {page:'current'}).data().each(function (group, i) {
                    if (last !== group) {
                        groupid++;
                        $(rows).eq(i).before('<tr class="group"><td><strong>'+group+'</strong></td></tr>');
                        last = group;
                    }

                    var val = api.row(api.row($(rows).eq( i )).index()).data();      //current order index

                    $.each(val,function(index2,val2){
                        if (index2 != 2) return true;
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
                    var subtd = '';
                    var totalHours = (Math.round(subtotale[i][2] * 100))/100;
                    subtd += '<td class="text-right"><strong>'+ totalHours +' Hours</strong></td>';
                    $(this).append(subtd);
                });
            }
        });
    });
</script>
