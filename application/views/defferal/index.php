 <form method="POST" action="<?php echo base_url('project_defferal/add_defferal') ?>" enctype="multipart/form-data">

  <div class="modal-body clearfix">
   <div class="panel panel-default">
    <div class="panel-heading" style="margin-top: -8px">Project Defferal</div>
  </div>



  <div class="panel-body">
   <div class="row">
    <div class="col-sm-12">
      <table class="table table-striped table-bordered" id="def_table" style="width: 100%">
       <thead>
        <tr>
         <th>No.</th>
         <th>Code</th>
         <th>Description</th>
           <?php if($this->login_user->is_admin || $this->login_user->role_id == 8) {?> 
           <th>Operation Sign Off</th>
         <?php }?> 
        
         <th>Project Defferal Date</th>
         <?php if ($this->login_user->is_admin || $this->login_user->role_id == 5) {?> 
           <th>Finance Sign Off</th>
         <?php }?> 
         <th>Status</th>
         <?php if ($this->login_user->is_admin || $this->login_user->role_id == 5) {?> 
           <th>Actions</th>
         <?php }?> 
       </tr>
     </thead> 
     <tbody>
       <?php foreach($project_details as $value){?>

         <tr>
           <td><?php echo $value->project_link;?></td>
           <td><a href="<?php echo base_url('project_defferal/view_project/'.$value->project_link);?>" class="badge badge-danger"><?php echo $value->code;?></a></td>
           <td><?php echo $value->description;?></td>
                     
           <?php if ($this->login_user->is_admin || $this->login_user->role_id == 8) {?> 

            <td>
              <?php if(($value->operations_sign_off==1) && ($value->finance_sign_off==1))  {?>
                <span class="label label-warning">Closed</span>
              <?php }

              else if($value->operations_sign_off==1){?>

                <span class="label label-success">Waiting</span>
              <?php }
              else if($value->status==1){?>
                <a href="<?php echo base_url('project_defferal/defferal_form/'.$value->project_link);?>" class="label label-info">Open</a>
              <?php }

              else if($value->status !=1 || $value->operations_sign_off !=1){?>
                <span class="label label-default">Inactive</a>
                <?php }?>
              </td>
            <?php }?> 
             <td><?php echo $value->project_defferal_date;?></td>
            <?php if ($this->login_user->is_admin || $this->login_user->role_id == 5) {?>
             <td>
              <?php if($value->operations_sign_off==1 && $value->finance_sign_off != 1)  {?>
               <a href="<?php echo base_url('project_defferal/finance_form/'.$value->project_link);?>" class="label label-success">Waiting</a>
             <?php }

             else if($value->operations_sign_off==1 && $value->finance_sign_off ==1)  {?>
              <span class="label label-warning">Closed</span>
            <?php }
            else if($value->status !=1 || ($value->operations_sign_off !=1 && $value->finance_sign_off !=1))  {?>
              <span class="label label-default">Inactive</span>
            <?php }?>
            
          </td>
        <?php }?>
        <td><?php echo $value->status == 1 ? 'Active' : 'Inactive';?></td>
        <?php if ($this->login_user->is_admin  || $this->login_user->role_id == 5) {?>
         <td>
          <?php if($value->finance_sign_off==1) {?>
            <a href="<?php echo base_url('project_defferal/edit_finance/'.$value->project_link);?>"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
          <?php } else {

          }?>
        </td>

      <?php }?>
    </tr>

  <?php }?>

</tbody>     
</table>

</div>
</div>
</div>

</div>
</div>
<link rel="stylesheet" href="<?php echo base_url();?>assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<?php echo base_url();?>assets/js/datatable/css/dataTables.bootstrap.min.css">

<script type="text/javascript">
  $(document).ready(function() {
    $('#def_table').DataTable();
  } );

  function OperationValue(){
    var operation=document.getElementById("operation");
    console.log(operation.value);
  }

  function FinanceValue(){
    var finance=document.getElementById("finance");
    console.log(finance.value);
  }
</script>



