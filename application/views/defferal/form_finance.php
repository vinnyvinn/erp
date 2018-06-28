 <!-- <?php //echo form_open('"id" = "jobs-form", "class" = "general-form", "role" = "form"'); ?> -->
 <form method="POST" action="<?php echo base_url('project_defferal/add_finance') ?>" enctype="multipart/form-data">
 	<input type="hidden" name="project_id" value="<?php echo $project_id?>">
 	<div class="modal-body clearfix">
 		<div class="panel panel-default">
 			<div class="panel-heading">Finance Sign Off</div>
 			<div class="panel-body">
 				<div class="row">

 					<div class="col-md-12" style="width: 50%">
 						<div class="form-group">
 							<label for="finance_remarks"><b>Remarks</b></label>
 							<textarea name="finance_remarks" class="form-control" placeholder="Enter Remarks"></textarea>

 						</div>
 					</div>
 				</div>
 				<div class="row">
 					<div class="col-sm-12" style="width: 50%">
 						<div class="form-group">
 							<label for="defferal_date">Defferal Date</label>
 							<input type="text" name="defferal_date" class="form-control" id="defferal_date">
 						</div>
 					</div>
 				</div>
 				<div class="row">
 					<div class="col-md-12" style="width: 50%">
 						<div class="form-group">
 							<label for="finance_sign_off">Sign Off ?</label>
 							<select name="finance_sign_off" class="form-control">
 								<option value="1">Yes</option>
 								<option value="0">No</option>
 							</select>
 						</div>
 					</div>

 				</div>
 				<div class="form-group">
 					<button class="btn btn-primary" type="submit" style="margin-left: 40px">Save</button>
 				</div>
 			</div>
 		</div>
 	</div>

 </form>

 <script>
 	setDatePicker('#defferal_date');
 </script>



