<div class="panel-default">
	<div class="panel-heading">
   <div class="panel-title">Prices</div>
   <button class="btn btn-success" onclick="add_price()" style="float: right;margin-top: -26px;margin-right: 200px"><i class="glyphicon glyphicon-plus"></i> <span style="font-size: 12px">Add Price</span></button>	
 </div>
 <div class="panel-body">   
  <br />
  <br />
  <table id="prices_table" class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
      <tr>
        <th>ID</th>
        <th>Price</th>
        <th style="width:125px;">Action
        </p></th>
      </tr>
    </thead>
    <tbody>   
      <?php foreach($prices as $price){?>
      <tr>
       <td><?php echo $price['id'];?></td>
       <td><?php echo $price['price'];?></td>
       
       <td>
         <button class="btn btn-warning" onclick="edit_price(<?php echo $price['id'];?>)" style="font-size: 10px"><i class="glyphicon glyphicon-pencil"></i></button>
         <button class="btn btn-danger" onclick="delete_price(<?php echo $price['id'];?>)" style="font-size: 10px"><i class="glyphicon glyphicon-remove"></i></button>


       </td>
     </tr>
     <?php }?>



   </tbody>

   <tfoot>
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Action</th>
    </tr>
  </tfoot>
</table>

</div>
</div>
<link rel="stylesheet" href="<?php echo base_url();?>assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<?php echo base_url();?>assets/js/datatable/css/dataTables.bootstrap.min.css">
<script type="text/javascript">
  $(document).ready( function () {
    $('#prices_table').DataTable();
  } );
    var save_method; //for save method string
    var table;


    function add_price()
    {
      save_method = 'add';
      $('#form')[0].reset(); // reset form on modals
      $('#modal_form').modal('show'); // show bootstrap modal
    //$('.modal-title').text('Add Person'); // Set Title to Bootstrap modal title
  }

  function edit_price(id)
  {
    save_method = 'update';
      $('#form')[0].reset(); // reset form on modals

      //Ajax Load data from ajax
      $.ajax({
        url : "<?php echo site_url('fuel_price/price_edit/')?>/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {

          $('[name="id"]').val(data.id);
          $('[name="price"]').val(data.price);
          

            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Fuel Price'); // Set title to Bootstrap modal title

          },
          error: function (jqXHR, textStatus, errorThrown)
          {
            alert('Error get data from ajax');
          }
        });
    }



    function save()
    {
      var url;
      if(save_method == 'add')
      {
        url = "<?php echo site_url('fuel_price/add_price')?>";
      }
      else
      {
        url = "<?php echo site_url('fuel_price/price_update')?>";
      }

       // ajax adding data to database
       $.ajax({
        url : url,
        type: "POST",
        data: $('#form').serialize(),
        dataType: "JSON",
        success: function(data)
        {
               //if success close modal and reload ajax table
               $('#modal_form').modal('hide');
              location.reload();// for reload a page
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
              alert('Error adding / update data');
            }
          });
     }

     function delete_price(id)
     {
      if(confirm('Are you sure delete this data?'))
      {
        // ajax delete data from database
        $.ajax({
          url : "<?php echo site_url('fuel_price/price_delete')?>/"+id,
          type: "POST",
          dataType: "JSON",
          success: function(data)
          {
           
           location.reload();
         },
         error: function (jqXHR, textStatus, errorThrown)
         {
          alert('Error deleting data');
        }
      });

      }
    }

  </script>

  <!-- Bootstrap modal -->
  <div class="modal fade" id="modal_form" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h3 class="modal-title">Fuel Prices Form</h3>
        </div>
        <div class="modal-body form">
          <form action="#" id="form" class="form-horizontal">
            <input type="hidden" value="" name="id"/>
            <div class="form-body">
              <div class="form-group">
                <label class="control-label col-md-3">Price</label>
                <div class="col-md-9">
                  <input name="price" placeholder="0.00" class="form-control" type="text">
                </div>
              </div>
              
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" id="btnSave" onclick="save()" class="btn btn-primary">Save</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
  <!-- End Bootstrap modal -->

</body>