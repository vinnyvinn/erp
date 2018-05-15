<?php echo form_open('"id" = "create-parts-form", "class" = "general-form", "role" = "form"'); ?>

<div class="modal-body clearfix">
     <div class="panel panel-default">
    <div class="panel-heading">
 Reports
 </div>
  
    <div class="panel-body">
    <div class="row">
      <div class="col-sm-6">

  <div class="form-group">
    <label class="col-sm-6">SELECT MONTH</label>
    <select name="month" class="form-control">
      <option value="">--SELECT MONTH--</option>
      <option value="01">JAN</option>
      <option value="02">FEB</option>
      <option value="03">MARCH</option>
      <option value="04">APRIL</option>
      <option value="05">MAY</option>
      <option value="06">JUNE</option>
      <option value="07">JULY</option>
      <option value="08">AUGUST</option>
      <option value="09">SEP</option>
      <option value="10">OCT</option>
      <option value="11">NOV</option>
      <option value="12">DEC</option>
    </select>
  
</div>
   </div>
    </div>
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
 
        <?php foreach ($reactives as $key => $value) : ?>
         
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
 $(document).ready(function() {
 $('select[name="month"]').on('change', function() {
    var month_id = $(this).val();
    var path="<?php echo site_url('maintenance_report/view_r')?>/"+ month_id ;
   window.location.replace(path);
    
  });
 });
</script>

    