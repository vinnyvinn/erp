
 <div id="page-content" class="p20 row">
    <div class="col-sm-3 col-lg-2">
        <?php
        $tab_view['active_tab'] = "technical";
        $this->load->view("settings/tabs", $tab_view);
        ?>
    </div>
 <div class="col-sm-9 col-lg-10">
<div class="panel-default">
	<div class="panel-heading">
	<div class="panel-title">Fuel Suppliers</div>
	<button class="btn btn-success" onclick="add_supplier()" style="float: right;margin-top: -26px;margin-right: 100px"><i class="glyphicon glyphicon-plus"></i> <span style="font-size: 12px">Add Fuel Supplier</span></button> 
	</div>
<div class="panel-body">   
    <br />
    <br />

    <table id="suppliers_table" class="table table-striped table-bordered" cellspacing="0" width="100%">
      <thead>
        <tr>
                    <th>ID</th>
                    <th>Code</th>
                    <th>Name</th>
                    <th>Phone No.</th>
                    <th>Price</th>
                    <th style="width:125px;">Action
          </th>
        </tr>
      </thead>
      <tbody>   
                <?php foreach($suppliers as $supplier){?>
                     <tr>
                           <td><?php echo $supplier['id'];?></td>
                           <td><?php echo $supplier['code'];?></td>
                           <td><?php echo $supplier['name'];?></td>
                           <td><?php echo $supplier['phone_no'];?></td>
                           <td><?php echo $supplier['price'];?></td>
                                             
                            <td>
                           <div class="col-xs-6" style="width: 20%;margin-right: -10px;">
<button class="btn btn-warning edito" onclick="edit_supplier(<?php echo $supplier['id'];?>)" style="font-size: 10px;margin-left: -24px !important;"><i class="glyphicon glyphicon-pencil"></i></button>
                             </div>
                              <div class="col-xs-6">                   
                           <button class="btn btn-danger" onclick="delete_supplier(<?php echo $supplier['id'];?>)" style="font-size: 10px"><i class="glyphicon glyphicon-remove"></i></button>
                           </div>

                                </td>
                      </tr>
                     <?php }?>



      </tbody>

      <tfoot>
        <tr>
         <th>ID</th>
         <th>Code</th>
         <th>Name</th>
         <th>Phone No.</th>
         <th>Price</th>
         <th>Action</th>
        </tr>
      </tfoot>
    </table>

  </div>
 </div>
</div>
</div>
</div>
<link rel="stylesheet" href="<?php echo base_url();?>assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<?php echo base_url();?>assets/js/datatable/css/dataTables.bootstrap.min.css">

   <script type="text/javascript">
  $(document).ready( function () {
      $('#suppliers_table').DataTable();
  } );
    var save_method; //for save method string
    var table;


    function add_supplier()
    {
      save_method = 'add';
      $('#form')[0].reset(); // reset form on modals
      $('#modal_form').modal('show'); // show bootstrap modal
    //$('.modal-title').text('Add Person'); // Set Title to Bootstrap modal title
    }

    function edit_supplier(id)
    {
      save_method = 'update';
      $('#form')[0].reset(); // reset form on modals

      //Ajax Load data from ajax
      $.ajax({
        url : "<?php echo site_url('fuel_suppliers/supplier_edit/')?>/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {

            $('[name="id"]').val(data.id);
            $('[name="code"]').val(data.code);
            $('[name="name"]').val(data.name);
            $('[name="phone_no"]').val(data.phone_no);
            $('[name="price"]').val(data.price);
            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Supplier'); // Set title to Bootstrap modal title

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
          url = "<?php echo site_url('fuel_suppliers/add_supplier')?>";
      }
      else
      {
        url = "<?php echo site_url('fuel_suppliers/supplier_update')?>";
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

    function delete_supplier(id)
    {
      if(confirm('Are you sure delete this data?'))
      {
        // ajax delete data from database
          $.ajax({
            url : "<?php echo site_url('fuel_suppliers/supplier_delete')?>/"+id,
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
        <h3 class="modal-title">Fuel Suppliers Form</h3>
      </div>
      <div class="modal-body form">
        <form action="#" id="form" class="form-horizontal">
          <input type="hidden" value="" name="id"/>
          <div class="form-body">
            
            <div class="form-group">
              <label class="control-label col-md-3">Code</label>
              <div class="col-md-9">
                <input name="code" placeholder="Code" class="form-control" type="text">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3">Name</label>
              <div class="col-md-9">
                <input name="name" placeholder="Name" class="form-control" type="text">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3">Phone No.</label>
              <div class="col-md-9">
                <input name="phone_no" placeholder="Phone No." class="form-control" type="text">
              </div>
            </div>
    
              
            <div class="form-group">
              <label class="control-label col-md-3">Price</label>
              <div class="col-md-9">
                <input name="price" placeholder="Price" class="form-control" type="text">
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
