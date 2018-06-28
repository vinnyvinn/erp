 <!-- <?php //echo form_open('"id" = "jobs-form", "class" = "general-form", "role" = "form"'); ?> -->
 <form method="POST" action="<?php echo base_url('gl_process/save_def') ?>">
 	<!-- <input type="hidden" name="project_id" value="<?php echo $project_id?>">
 	--> 	<div class="modal-body clearfix">
 		<div class="panel panel-default">
 			<div class="panel-heading">Project Defferal Form</div>
 			<div class="panel-body">

 				<div class="row">
 					<div class="col-sm-6">
 						<div class="form-group">
 							<label for="Project"><b>Revenue Transactions</b></label>
 							<select class="form-control" name="account_revenue" id="account_id" onchange="accountRevenue()">
 								<option value="">--Choose Contra A/C--</option>
 								<?php
 								foreach ($accounts_dropdown as $account) {
 									echo "<option value=". $account->account_link . ">" . ucfirst($account->master_account).'-'. ucfirst($account->description) . "</option>";
 								}
 								?>
 							</select>

 						</div>
 					</div>
 					<div class="col-sm-6">
 						<div class="form-group">
 							<label for="Project"><b>Project</b></label>
 							<select class="form-control" name="project_id" id="project_id" placeholder="Project">
 								<option value="">--Choose Project--</option>
 								<?php
 								foreach ($projects_dropdown as $project) {
 									echo "<option value=". $project->code . ">" . ucfirst($project->code) . "</option>";
 								}
 								?>
 							</select>

 						</div>
 					</div>

 					<div class="col-sm-6">
 						<div class="form-group">
 							<label for="Project"><b>Cost of Sale Transactions</b></label>
 							<select class="form-control" name="account_sale" id="account_id2" onchange="accountSale()">
 								<option value="">--Choose Contra A/C--</option>
 								<?php
 								foreach ($accounts_dropdown as $account) {
 									echo "<option value=". $account->account_link . ">" .  ucfirst($account->master_account).'-'. ucfirst($account->description) . "</option>";
 								}
 								?>
 							</select>

 						</div>
 					</div>

 					<div class="col-sm-6">
 						<div class="form-group">
 							<label for="Date">Date</label>
 							<input type="text" name="post_date" id="post_date" class="form-control" placeholder="Date">
 						</div>
 						<label class="radio-inline">
 							<input type="radio" name="defferal" value="def" onclick="valueDef()" id="def"><strong>DEF</strong>
 						</label>
 						<label class="radio-inline">
 							<input type="radio" name="defferal" value="rev" onclick="valueRev()" id="rev"><strong>REV.DEF</strong>
 						</label>
 					</div>
 					
 						
               
 					<div class="form-group">
 						<button type="submit" name="submit" class="btn btn-primary" style="margin-left: 30px">Process</button>	
 					</div>


 				</div>
 			</div>
 		</div>


 	</form>


 	<script type="text/javascript">
 		setDatePicker('#post_date');
 		$('#account_id,#account_id2,#project_id').select2();

 		function accountRevenue(){
 			var account = document.getElementById('account_id');
 			localStorage.setItem('rev_id',account.value);
 			var sale = localStorage.getItem('sale_id');
 			if(sale !==null){
 				if(sale == account.value){
 					alert('Sorry, Revenue account cannot be the same as Cost of Sale');
 					window.location.replace('gl_form');
 				}
 			}
 			console.log(account.value);

 		}
 		function accountSale(){
 			var sale = document.getElementById('account_id2');
 			var revn =  localStorage.getItem('rev_id');

 			localStorage.setItem('sale_id',sale.value);
 			if(revn == sale.value){
 				alert('Sorry, Cost of sale account cannot be the same as Revenue account');
 				window.location.replace('gl_form');
 			}
 			console.log(sale.value);

 		}

 		function valueDef(){
 			var def = document.getElementById('def');
 			console.log(def.value);
 		}

 		function valueRev(){
 			var rev = document.getElementById('rev');
 			console.log(rev.value);
 		}


   $('#saved_item').on('click',function(){
            var account1 = $('#account_id').val();
            var account2 = $('#account_id2').val();
            var project = $('#project_id').val();
            var def = $('#def').val()
            
   if(document.getElementById("def").checked){
    console.log('checked '+ $('#def').val());
    }
    else if(document.getElementById("rev").checked){
        console.log('checked ' + $('#rev').val());
    }

              $.ajax({
                type : "POST",
                url  : "<?php echo site_url('gl_process/save_def')?>",
                dataType : "JSON",
                data :{account_revenue:account1,account_sale:account2,project_id:project,
                  defferal:def},
                success: function(data){
                    console.log('abcdefg');
                                       
                    window.location = "<?php echo site_url('gl_process')?>";
                }
            });
            return false;
        });
</script>
