<?php echo form_open('"id" = "create-parts-form", "class" = "general-form", "role" = "form"'); ?>

<div class="modal-body clearfix">
     <div class="panel panel-default">
    <div class="panel-heading" style="margin-top: -8px">Maintenance Reports
     <?php echo anchor(get_uri("maintenance_report/preventive"), "<i class='fa fa-plus-circle'></i> " . lang('preventive'), array("class" => "btn btn-default pull-right rq", "title" => lang('preventive'))); ?>
  <?php echo anchor(get_uri("maintenance_report/reactive"), "<i class='fa fa-plus-circle'></i> " . lang('reactive'), array("class" => "btn btn-default pull-right rq", "title" => lang('reactive'))); ?>
  </div>
   <h2><?php if($this->session->flashdata('item')) {?></h2> 
    <div class="alert alert-info">
            <a href="#" class="close" data-dismiss="alert">&times;</a>
            <strong>Info!</strong> <?php echo $this->session->flashdata('item'); }?>
        </div>
    <div class="panel-body">
     <div class="row">
     <div class="col-sm-12">
    <table class="table table-striped table-bordered"  id="reports_table" style="width: 100%">
     <thead>
       <tr>
         <th>No.</th>
        <th>Car / Machine</th>
        <th>Total(Ksh)</th>
                
         </tr>
     </thead> 
     <tbody>
 
        <?php foreach ($preventives as $key => $value) : ?>
         
         <tr>
         
          <td><?php echo $value['id'];?></td>
          <td><?php echo $value['card_no'];?></td>
          <td>
            <?php $costs=json_decode($value['cost']);
            $sum=0;
            foreach ($costs as $key => $cost) :
             $sum+=$cost;
            endforeach;
           echo  number_format($sum + $value['labour_cost'],2);
            ?>
            </td>
           
       </tr>
     <?php endforeach?>
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
$('#reports_table').dataTable();
</script>


    