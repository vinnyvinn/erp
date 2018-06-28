 <!-- <?php //echo form_open('"id" = "jobs-form", "class" = "general-form", "role" = "form"'); ?> -->
 <form method="POST" action="<?php echo base_url('project_defferal/add_operations') ?>" enctype="multipart/form-data">
 	<input type="hidden" name="project_id" value="<?php echo $project_id?>">
 	<div class="modal-body clearfix">
 		<div class="panel panel-default">
 			<div class="panel-heading">Operations Sign Off</div>
 			<div class="panel-body">
 				<div class="row">

 					<div class="col-md-12" style="width: 50%">
 						<div class="form-group">
 							<label for="Comments"><b>Comments</b></label>
 							<textarea name="comments" class="form-control" placeholder="Enter Comments"></textarea>

 						</div>
 					</div>
 				</div>
 				<div class="row">
 					<div class="col-md-12" style="width: 50%">
 						<div class="form-group">
 							<label for="operations_sign_off">Sign Off ?</label>
 							<select name="operations_sign_off" class="form-control">
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



