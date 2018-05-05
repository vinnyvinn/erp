<?php echo form_open('"id" = "create-parts-form", "class" = "general-form", "role" = "form"'); ?>
<div class="modal-body clearfix">
 <div class="panel panel-default">
  <div class="panel-heading" > Reports
  <?php if ($this->session->preventive) {?>

    <a href="<?php echo base_url('maintenance_report/print_page_p/'.$this->session->month);?>" class="btn btn-success pull-right" style="margin-top: -5px">Download Page <i class="fa fa-download" aria-hidden="true"></i></a>
  <?php }
 elseif($this->session->reactive) {?>
<a href="<?php echo base_url('maintenance_report/print_page_r/'.$this->session->month);?>" class="btn btn-success pull-right" style="margin-top: -5px">Download Page <i class="fa fa-download" aria-hidden="true"></i></a>
<?php }?>
  </div>

  <div class="panel-body">
   <div class="row">
     <div class="col-sm-12">
      <table class="table table-striped table-bordered"  style="width: 100%">
       <thead>
         <tr>
           <th>No.</th>
           <th>Car / Machine</th>
           <th>Total(Ksh)</th>
         </tr>
       </thead> 
       <tbody>


         <?php
         $total=0;
         foreach ($reports_data as $key => $data_value) : ?>
         <tr>
          <td><?php echo $data_value['reports']['id'];?></td>
          <td><?php echo $data_value['reports']['card_no'];?></td>
          <td>
            <?php $costs=json_decode($data_value['reports']['cost']);
            $sum=0;
            foreach ($costs as $key => $cost) :
             $sum+=$cost;
           endforeach;
           echo  number_format($sum + $data_value['reports']['labour_cost'],2);
           $totalCost=$sum + $data_value['reports']['labour_cost'];
           $total+=$totalCost;
           ?>
           
         </td>

       </tr>
     <?php endforeach;?>
   </tbody>
   <tfoot>
    <tr>
      <td style="text-align: right;"><b>Total Cost</b></td>
      <td></td>

      <td>
      <?php echo number_format($total,2);?>
     </td>
   </tr>
 </tfoot>

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

</script>


