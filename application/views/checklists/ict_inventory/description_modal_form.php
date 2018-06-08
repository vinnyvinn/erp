<div class="modal-body clearfix">
<h3><?php echo $title; ?></h3>
<p><?php echo $model_info->description; ?></p>
</div>

<div class="panel panel-default">
<div class="table-responsive">
    <table id="ict_inventory-table" class="display" cellspacing="0" width="100%">
    	<thead>
    	<tr role="row">
			<th>#</th>
			<th>Action</th>
			<th>BY</th>
			<th>TO</th>
			<th>Status</th>
			<th>Date</th>
		</tr>
	</thead>
	<tbody>
		<?php for ($i=0; $i < count($model_info_history); $i++) { ?>
			<tr role="row">
				<td><?php echo $model_info_history[$i]->asset_id; ?></td>
				<td><?php echo $model_info_history[$i]->action; ?></td>
				<td><?php echo $this->Users_model->get_one($model_info_history[$i]->assigned_by)->first_name; ?></td>
				<td><?php echo $this->Users_model->get_one($model_info_history[$i]->assigned_to)->first_name; ?></td>
				<td><?php echo $model_info_history[$i]->status; ?></td>
				<td><?php echo date("dS M Y",strtotime($model_info_history[$i]->created_at)); ?></td>
			</tr>			
		<?php } ?>
	</tbody>
    </table>
</div>
</div>

<div class="modal-footer">
    <?php
    if ($this->login_user->is_admin) {
        echo modal_anchor(get_uri("ict_reports/edit_description_modal_form"), "<i class='fa fa-pencil'></i> " . "Edit Asset Description", array("class" => "btn btn-default", "data-post-id" => $model_info->sage_id, "title" => "Edit Asset Description"));
    }
    ?>
    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fa fa-close"></span> <?php echo lang('close'); ?></button><div class="table-responsive">
            <table id="ict_inventory-table" class="display" cellspacing="0" width="100%">            
            </table>
        </div>
</div>


