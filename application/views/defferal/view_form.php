 <!-- <?php //echo form_open('"id" = "jobs-form", "class" = "general-form", "role" = "form"'); ?> -->
 <form method="POST" action="" enctype="multipart/form-data">
 	
 	<div class="modal-body clearfix">
 		<div class="panel panel-default">
 			<div class="panel-heading">Project Details
               <a href="<?php echo base_url('project_defferal/print_project/'.$details['project_link']);?>" class="btn btn-success pull-right">Download Page <i class="fa fa-download" aria-hidden="true"></i></a>
 			</div>
 			<div class="panel-body">
 				<div class="row">

 					<div class="col-md-4">
 						<div class="form-group">
 							<label for="Code"><b>Project Code</b></label>
 							<input type="text" name="code" value="<?php echo $details['code'];?>" class="form-control" disabled>

 						</div>


 						<div class="form-group">
 							<label for="Description"><b>Description</b></label>
 							<input type="text" name="description" value="<?php echo $details['description'];?>" class="form-control" disabled>

 						</div>

 						<div class="form-group">
 							<label for="Comments"><b>Operations Comments</b></label>
 							<?php
 							echo form_textarea(array(
 							"id" => "description",
 							"name" => "description",
 							"value" => $details['comments'],
 							"class" => "form-control",
 							'rows' => '5',
 							'cols' => '5',
 							"disabled" => "disabled",
 							));
 							?>
 						</div>
 					</div>

 					<div class="col-md-4">
 						<div class="form-group">
 							<label for="Date"><b>Start Date</b></label>
 							<input type="text" name="date_created" class="form-control" value="<?php echo $details['date_created']?>" disabled>

 						</div>

 						<div class="form-group">
 							<label for="Status"><b>Status</b></label>
 							<input type="text" name="status" class="form-control" value="<?php echo $details['status'] == 1 ? 'Active ' : ' Inactive';?>" disabled>

 						</div>

 						<div class="form-group">
 							<label for="remarks"><b>Finance Remarks</b></label>
 							<?php
 							echo form_textarea(array(
 							"id" => "description",
 							"name" => "description",
 							"value" => $details['finance_remarks'],
 							"class" => "form-control",
 							'rows' => '5',
 							'cols' => '5',
 							"disabled" => "disabled",
 							));
 							?>
 						</div>


 					</div>
 					<div class="col-md-4">
 						<div class="form-group">
 							<label for="Status"><b>Project Defferal Date</b></label>
 							<input type="text" name="project_defferal_date" class="form-control" value="<?php echo $details['project_defferal_date']?>" disabled>

 						</div>

 						<div class="form-group">
 							<label for="Status"><b>Operations Sign Off</b></label>
 							<input type="text" name="operations_sign_off" class="form-control" value="<?php echo $details['operations_sign_off'] == 1 ? ' Done' : ' Not yet'?>" disabled>

 						</div>

 						<div class="form-group">
 							<label for="Status"><b>Finance Sign Off</b></label>
 							<input type="text" name="finance_sign_off" class="form-control" value="<?php echo $details['finance_sign_off'] == 1 ? ' Done' : ' Not yet'?>" disabled>

 						</div>		
 					</div>
 				</div>
 			</div>
 		</div>
 	</div>
 </form>



