<form method="POST" action="<?php echo base_url('parts_requisition/save_part') ?>">

<div class="modal-body clearfix">
     <div class="panel panel-default">
    <div class="panel-heading">New Parts Request</div>
    <div class="panel-body">
     <div class="row">
  <div class="col-sm-6">
    <div class="form-group vehicle_sel">
      
    <label for="job_card" class="col-sm-10"><b><?php echo lang('job_card'); ?></b></label>
      <select class="form-control" name="job_card_id" id="job_card">
         <option value=""></option>
               <?php
              foreach ($jobs_card_dropdown as $card) {
                  echo "<option value=". $card->id . ">" . ucfirst($card->card_no) . "</option>";
              }
              ?>
           </select>
      
    </div>
   <div class="form-group">
   <br>
    <label for="vehicle" class="col-sm-3"><b><?php echo lang('vehicle'); ?></b></label>
       <p id="vehicle_spare"></p>                        
</div>
</div>

<div class="col-sm-3">
<div class="form-group">
    <label for="name"><b><?php echo lang('spare'); ?></b></label>
    <select class="form-control" name="stock_id" id="part">
      <?php
              foreach ($stocks_dropdown as $spare) {
                  echo "<option value=". $spare->Stk_ID . ">" . ucfirst($spare->Stk_Name) . "</option>";
              }
              ?>
    </select>
       
    </div>
</div>

<div class="col-sm-3">
<div class="form-group">
    <label for="quantity"><b><?php echo lang('quantity'); ?></b></label>
    
        <?php
        echo form_input(array(
            "id" => "quantity",
            "name" => "qnty_out",
            "class" => "form-control",
            "type" => "number",
            "required" => "required",
           
           
        ));
        ?>
    </div>
</div>

<div class="col-sm-3">
<div class="form-group">
  <br>
  <button type="submit" class="btn btn-success">Update</button>
</div>
</div>
</div>
</div>
</div>
</div>

</form>

<script type="text/javascript">
  $("#job_card").select2();
   $("#part").select2();
</script>
 <script type="text/javascript">   
             $(document).ready(function() {

             $('select[name="job_card_id"]').on('change', function() {
            var spare_id = $(this).val();
            console.log(spare_id)
            var path="<?php echo site_url('parts_requisition/spare')?>/" + spare_id;
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
  $('#saved_data').on('click',function(){
            var job_card = $('#job_card').val();
            var description = $('#details').val();
            var part = $('#part').val();
            console.log('sp no:' + part);
             var quantity       = $('#quantity').val();
              $.ajax({
                type : "POST",
                url  : "<?php echo site_url('parts_requisition/save_part')?>",
                dataType : "JSON",
                data : {job_card_id:job_card, description:description, spare_id:part,quantity:quantity},
                success: function(data){
                    $('[name="job_card_id"]').val("");
                    $('[name="description"]').val("");
                    $('[name="spare_id"]').val("");
                    $('[name="quantity"]').val("");
                    window.location = "<?php echo site_url('parts_requisition')?>";
                }
            });
            return false;
        });
</script>
<script type="text/javascript">   
             $(document).ready(function() {
             $('select[name="job_card_id"]').on('change', function() {
              var ds_id=$(this).val();
              console.log('id='+ ds_id);
               var path="<?php echo site_url('parts_requisition/description')?>/" + ds_id;
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