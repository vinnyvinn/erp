<?php echo form_open('"id" = "create-parts-form", "class" = "general-form", "role" = "form"'); ?>

<div class="modal-body clearfix">
     <div class="panel panel-default">
      <?php echo "<pre>";
      print_r($services)?>
    <div class="panel-heading">External Service #<?php echo $services[0]['requisition_no'];?>
    <span style="margin-left: 300px">Requested On: <?php $date= $services[0]['created']; $d = new DateTime($date); echo $d->format('Y-m-d');?></span>
   <a href="<?php echo base_url('reactive/printService/'.$services[0]['id']);?>" class="btn btn-success pull-right" style="margin-top: -6px"><i class="fa fa-print"> Print Page</i></a>
    </div>

    <div class="panel-body">
     <div class="row">
  <div class="col-sm-3">
    <div class="form-group">
     <label for="job_card" class="col-sm-10"><b><?php echo lang('job_card'); ?></b></label>
   <select class="form-control" name="job_card_id" id="job_card" disabled>
    <option value="<?php echo $services[0]['jID'];?>"><?php echo $services[0]['card_no'];?></option>
             <?php
              foreach ($jobs_card_dropdown as $card) {
                  echo "<option value=". $card->id . ">" . ucfirst($card->card_no) . "</option>";
              }
              ?>
           </select>
      
    </div>
    <br>
    <div class="form-group">
    <label for="name"><b><?php echo lang('external_service_type'); ?></b></label>
     <select class="form-control" name="service_type" id="partselected" disabled>
     <option value="<?php echo $services[0]['id'];?>"><?php echo $services[0]['service_type'];?></option>
    <option value="service">External Parts Service</option>
    <option value="fuel">Fuel</option>
    </select>
     </div>
    <div class="col-sm-6">
   <div class="form-group">
   <br>
    <label for="vehicle"><b>Vehicle #</b>
     
    <p id="vehicle_spare"><?php echo $services[0]['vehicle'];?>  </p>  
    </label>
                             
      </div>
    </div>
    <div class="col-sm-6">
      <div class="form-group">
   <br>
    <label for="make"><b><?php echo lang('make_model'); ?></b>
    <p id="make"> <?php echo $services[0]['make'];?></p>   
    </label>
                            
</div>
</div>
</div>
<div id="service" class="col-sm-3 parts service">
    <div class="form-group">

    <label for="supplier" class="col-sm-10"><b><?php echo lang('supplier'); ?></b></label>
   <select class="form-control" name="supplier_id" id="supplier" disabled>
        <option value="<?php echo $services[0]['sID'];?>"><?php echo $services[0]['supplier'];?></option>
              <?php
              foreach ($suppliers_dropdown as $supplier) {
                  echo "<option value=". $supplier->id . ">" . ucfirst($supplier->name) . "</option>";
              }
              ?>
           </select>
           
      
    </div>
     <br>
    <div class="col-sm-6">
    <div class="form-group">
    <label for="rate"><b><?php echo lang('start_date');?></b></label>
     <?php
        echo form_input(array(
            "id" => "rate",
            "name" => "rate",
            "class" => "form-control",
            "value" => $services[0]['start_date'],
            "disabled" => "disabled",
            "type" => "text",
            "required" => "required",
             ));
        ?>
       
    </div>
   </div>
   <div class="col-sm-6">
    <div class="form-group">
    <label for="hours"><b><?php echo lang('end_date');?></b></label>
    <input type="text" name="hours" id="hours" class="form-control" value="<?php echo $services[0]['end_date']?>"
    disabled>
            
    </div>
    <div class="form-group">
    <label for="rate"><b>Total Charges</b></label>
    Ksh.<?php echo number_format($services[0]['total_service'],2)?>
    </div>
   </div>
  </div>
<div class="col-sm-6">
<div class="form-group">
    <label for="description"><b><?php echo lang('description'); ?></b></label>
    
        <?php
        echo form_textarea(array(
            "id" => "description",
            "name" => "description",
            "value" => $services[0]['description'],
            "class" => "form-control",
            "cols" => "10",
            "rows" => "5",
            "disabled" => "disabled",
           
        ));
        ?>
    </div>
  </div>
</div>
<br><br><br><br>
<div id="fuel" class="row parts fuel">
<div class="col-sm-4">
<div class="form-group">
    <label for="amount"><b>Price</b></label>
    
        <?php
        echo form_input(array(
            "id" => "amount",
            "name" => "amount",
            "class" => "form-control",
            "type" => "number",
            "value" => number_format($services[0]['amount'],2),
            "disabled" => "disabled",
            "required" => "required",
             ));
        ?>
    </div>
</div>
<div class="col-sm-4">
<div class="form-group">
    <label for="quantity"><b><?php echo lang('quantity'); ?>(in Ltrs)</b></label>
    
        <?php
        echo form_input(array(
            "id" => "quantity",
            "name" => "quantity",
            "value" => $services[0]['quantity'],
            "disabled" => "disabled",
            "class" => "form-control",
            "type" => "number",
            "required" => "required",
           
           
        ));
        ?>
    </div>
</div>

<div class="col-sm-4">
  <label for="total"><b><?php echo lang('total'); ?> </b></label>
  <p>Ksh.<?php echo number_format($services[0]['amount'],2);?></p>
</div>
</div>

</div>
</div>
</div>

<?php echo form_close(); ?>

<script type="text/javascript">
  $("#job_card").select2();
   $("#part").select2();
   $("#supplier").select2();
</script>
 <script type="text/javascript">   
             $(document).ready(function() {

             $('select[name="job_card_id"]').on('change', function() {
            var spare_id = $(this).val();
            console.log(spare_id)
            var path="<?php echo site_url('reactive/spare')?>/" + spare_id;
                 $.ajax({
                type  : 'ajax',
                url   : path,
                async : false,
                dataType : 'json',
                success : function(data){
                    var html ='<p>'+data+'</p>';
                   $('#vehicle_spare').html(html);
                }
 
            });
        });
        });
</script>

<script type="text/javascript">   
             $(document).ready(function() {

             $('select[name="job_card_id"]').on('change', function() {
            var make_id = $(this).val();
            console.log(make_id)
            var path="<?php echo site_url('reactive/model')?>/" + make_id;
                 $.ajax({
                type  : 'ajax',
                url   : path,
                async : false,
                dataType : 'json',
                success : function(data){
                    var html ='<p>'+data+'</p>';
                   $('#make').html(html);
                }
 
            });
        });
        });
</script>
<script type="text/javascript">
  $('#saved_fuel').on('click',function(){
            var job_card = $('#job_card').val();
            var supplier = $('#supplier').val();
            var rate = $('#rate').val();
            var quantity       = $('#quantity').val();
            var hours = $('#hours').val();
            var amount = $('#amount').val();
            var partselected = $('#partselected').val();
          
              $.ajax({
                type : "POST",
                url  : "<?php echo site_url('reactive/save_fuel_service')?>",
                dataType : "JSON",
                data : {job_card_id:job_card,supplier_id:supplier,
                  amount:amount,quantity:quantity,rate:rate,hours:hours,service_type:partselected},
                success: function(data){
                    $('[name="job_card_id"]').val("");
                    $('[name="supplier"]').val("");
                    $('[name="rate"]').val("");
                    $('[name="quantity"]').val("");
                    $('[name="amount"]').val("");
                    $('[name="hours"]').val("");
                    $('[name="service_type"]').val("");
                    window.location = "<?php echo site_url('reactive/external_service')?>";
                }
            });
            return false;
        });
</script>
<script type="text/javascript">
  $('#saved_service').on('click',function(){
            var job_card = $('#job_card').val();
            var description = $('#description').val();
            var supplier = $('#supplier').val();
            var rate = $('#rate').val();
            var hours = $('#hours').val();
            var partselected = $('#partselected').val();
          
              $.ajax({
                type : "POST",
                url  : "<?php echo site_url('reactive/save_external_service')?>",
                dataType : "JSON",
                data : {job_card_id:job_card, description:description, supplier_id:supplier,
                  rate:rate,hours:hours,service_type:partselected},
                success: function(data){
                    $('[name="job_card_id"]').val("");
                    $('[name="description"]').val("");
                    $('[name="supplier_id"]').val("");
                    $('[name="rate"]').val("");
                    $('[name="hours"]').val("");
                    $('[name="service_type"]').val("");
                    window.location = "<?php echo site_url('reactive/external_service')?>";
                }
            });
            return false;
        });
</script>
<script type="text/javascript">
  $(function() {
  $('#partselected').change(function(){
    $('.parts').hide();
    $('#' + $(this).val()).show();
  });
});
</script>
<script type="text/javascript">
window.print();
</script>