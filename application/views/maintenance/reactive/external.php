<?php echo form_open('"id" = "create-parts-form", "class" = "general-form", "role" = "form"'); ?>

<div class="modal-body clearfix">
     <div class="panel panel-default">
    <div class="panel-heading">New External Service</div>
    <div class="panel-body">
     <div class="row">
  <div class="col-sm-3">
    <div class="form-group">
    <label for="job_card" class="col-sm-10"><b><?php echo lang('job_card'); ?></b></label>
   <select class="form-control" name="job_card_id" id="job_card">
    <option></option>
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
     <select class="form-control" name="service_type" id="partselected">
     <option>-- Choose Service --</option>
    <option value="service">External Parts Service</option>
    <option value="fuel">Fuel</option>
    </select>
     </div>
    <div class="col-sm-6">
   <div class="form-group">
   <br>
    <label for="vehicle"><b>Vehicle #</b>

    <p id="vehicle_spare">  </p>  
    </label>
                             
      </div>
    </div>
    <div class="col-sm-6">
      <div class="form-group">
   <br>
    <label for="make"><b><?php echo lang('make_model'); ?></b>
    <p id="make"></p>   
    </label>
                            
</div>
</div>
</div>
<div id="service" class="col-sm-3 parts service">
    <div class="form-group">
    <label for="supplier" class="col-sm-10"><b><?php echo lang('supplier'); ?></b></label>
   <select class="form-control" name="supplier_id" id="supplier">
       <option></option>
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
    <input type="text" id="txtFromDate" class="form-control" required/>
            
    </div>
   </div>
   <div class="col-sm-6">
    <div class="form-group">
    <label for="hours"><b><?php echo lang('end_date')?></b></label>
    <input type="text" name="hours" id="txtToDate" class="form-control">
        
    </div>
   </div>
   <br>
   <div class="form-group">
  <br>
  <button type="submit" class="btn btn-info" id="saved_service" style="margin-left: 100%">Update</button>
</div> 
</div>
 <div class="col-sm-6">
<div class="form-group">
    <label for="description"><b><?php echo lang('description'); ?></b></label>
    <textarea name="description" cols="10" rows="4" class="form-control" id="details" value="" disabled></textarea>
          
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
            "class" => "form-control",
            "type" => "number",
            "required" => "required",
           
           
        ));
        ?>
    </div>
</div>

<div class="col-sm-4">
<div class="form-group">
  <br>
  <button type="submit" class="btn btn-success" id="saved_fuel">Add To Fuel</button>
</div>
</div>
</div>

</div>
</div>
</div>

<?php echo form_close(); ?>

<script src="<?php echo base_url('assets/js/jquery-1.9.1.js');?>"></script>
<script src="<?php echo base_url('assets/js/jquery-theme.js');?>"></script>
<link href="<?php echo base_url('assets/js/jquery-theme.css');?>" rel="Stylesheet" type="text/css"/>
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
              var ds_id=$(this).val();
              console.log('id='+ ds_id);
               var path="<?php echo site_url('reactive/description')?>/" + ds_id;
                $.ajax({
                type  : 'ajax',
                url   : path,
                async : false,
                dataType : 'json',
                success : function(data){
                  console.log('check' + data)
                    var html =data;
                   $('#details').html(html);
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
            var quantity       = $('#quantity').val();
            var amount = $('#amount').val();
            var description = $('#description').val();
            var partselected = $('#partselected').val();
          
              $.ajax({
                type : "POST",
                url  : "<?php echo site_url('reactive/save_fuel_service')?>",
                dataType : "JSON",
                data : {job_card_id:job_card,description:description,
                  amount:amount,quantity:quantity,service_type:partselected},
                success: function(data){
                    $('[name="job_card_id"]').val("");
                    $('[name="quantity"]').val("");
                    $('[name="amount"]').val("");
                    $('[name="description"]').val("");
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
            var start_date = $('#txtFromDate').val();
            var end_date = $('#txtToDate').val();
            var partselected = $('#partselected').val();
          
              $.ajax({
                type : "POST",
                url  : "<?php echo site_url('reactive/save_external_service')?>",
                dataType : "JSON",
                data : {job_card_id:job_card, description:description, supplier_id:supplier,
                  start_date:start_date,end_date:end_date,service_type:partselected},
                success: function(data){
                  console.log(data);
                    $('[name="job_card_id"]').val("");
                    $('[name="description"]').val("");
                    $('[name="supplier_id"]').val("");
                    $('[name="end_date"]').val("");
                    $('[name="start_date"]').val("");
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
  $(document).ready(function(){
    $("#txtFromDate").datepicker({
        minDate: 0,
        maxDate: "+60D",
        numberOfMonths: 2,
        onSelect: function(selected) {
          $("#txtToDate").datepicker("option","minDate", selected)
        }
    });
    $("#txtToDate").datepicker({ 
        minDate: 0,
        maxDate:"+60D",
        numberOfMonths: 2,
        onSelect: function(selected) {
           $("#txtFromDate").datepicker("option","maxDate", selected)
        }
    });  
});

</script>


