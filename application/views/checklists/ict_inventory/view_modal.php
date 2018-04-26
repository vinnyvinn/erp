<?php
// echo "<pre>";
// print_r($list_data);
?>

<div class="table-responsive">
<div id="ict_reports_checklists_list_data-table_wrapper" class="dataTables_wrapper no-footer">
<div class="datatable-tools">
<div id="ict_reports_checklists_list_data-table_processing" class="dataTables_processing" style="display: none;">
<div class="table-loader">
<span class="loading">
</span>
</div>
</div>
</div>
<table class="display dataTable no-footer" cellspacing="0" width="100%" role="grid">      
<thead>
<tr role="row">
<th tabindex="0" rowspan="1" colspan="1">ID</th>
<th tabindex="0" rowspan="1" colspan="1">Ref No</th>
<th tabindex="0" rowspan="1" colspan="1">Item</th>
<th tabindex="0" rowspan="1" colspan="1">Type</th>
<th tabindex="0" rowspan="1" colspan="1">Status</th>
<th tabindex="0" rowspan="1" colspan="1">Comment</th>
</tr>
</thead>
<tbody>
	<?php
		$i = 0;
		foreach ($list_data as $key => $value) {
			echo "<tr role=\"row\" class=\"odd\">";
			echo "<td>{$value->id}</td>";
			echo "<td>{$value->ref_no}</td>";
			echo "<td>{$value->name}</td>";
			echo "<td>{$value->type}</td>";
			echo "<td>{$value->status}</td>";
			echo "<td>{$value->comment}</td>";
			echo "</tr>";
			$i++;
		}
	?>
</tbody>
</table>
<div class="datatable-tools clearfix">
</div>
</div>
        
</div>