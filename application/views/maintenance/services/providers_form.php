
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
  <div class="panel-title">Suppliers</div>

  <button class="btn btn-success" onclick="add_suppliers()" style="float: right;margin-top: -26px;margin-right: 100px"><i class="glyphicon glyphicon-plus"></i> <span style="font-size: 12px">Add Supplier</span></button> 
  </div>
<div class="panel-body">   
    <br />
    <br />

    <table id="jobs_table" class="table table-striped table-bordered" cellspacing="0" width="100%">
      <thead>
        <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Code</th>
                    <th>Telephone No.</th>
                    <th>Tax</th>
                    <th style="width:125px;">Action
          </th>
        </tr>
      </thead>
      <tbody>   
                <?php foreach($suppliers as $supplier){?>
                     <tr>
                           <td><?php echo $supplier['id'];?></td>
                           <td><?php echo $supplier['name'];?></td>
                           <td><?php echo $supplier['code'];?></td>
                           <td><?php echo $supplier['telephone_no'];?></td>
                          <td><?php echo $supplier['tax'];?></td>
                                                <td>
                           <div class="col-xs-6" style="width: 20%;margin-right: -10px;">
<button class="btn btn-warning edito" onclick="edit_suppliers(<?php echo $supplier['id'];?>)" style="font-size: 10px;margin-left: -24px !important;"><i class="glyphicon glyphicon-pencil"></i></button>
                             </div>
                              <div class="col-xs-6">                   
                           <button class="btn btn-danger" onclick="delete_suppliers(<?php echo $supplier['id'];?>)" style="font-size: 10px"><i class="glyphicon glyphicon-remove"></i></button>
                           </div>

                                </td>
                      </tr>
                     <?php }?>



      </tbody>

      <tfoot>
        <tr>
         <th>ID</th>
         <th>Name</th>
         <th>Code</th>
         <th>Telephone No.</th>
         <th>Tax</th>
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
      $('#jobs_table').DataTable();
  } );
    var save_method; //for save method string
    var table;


    function add_suppliers()
    {
      save_method = 'add';
      $('#form')[0].reset(); // reset form on modals
      $('#modal_form').modal('show'); // show bootstrap modal
    //$('.modal-title').text('Add Person'); // Set Title to Bootstrap modal title
    }

    function edit_suppliers(id)
    {
      save_method = 'update';
      $('#form')[0].reset(); // reset form on modals

      //Ajax Load data from ajax
      $.ajax({
        url : "<?php echo site_url('service_providers/provider_edit/')?>/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {

            $('[name="id"]').val(data.id);
            $('[name="name"]').val(data.name);
            $('[name="code"]').val(data.code);
             $('[name="telephone_no"]').val(data.telephone_no);
            $('[name="tax"]').val(data.tax);     
            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Suppliers'); // Set title to Bootstrap modal title

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
          url = "<?php echo site_url('service_providers/add_provider')?>";
      }
      else
      {
        url = "<?php echo site_url('service_providers/provider_update')?>";
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

    function delete_suppliers(id)
    {
      if(confirm('Are you sure delete this data?'))
      {
        // ajax delete data from database
          $.ajax({
            url : "<?php echo site_url('service_providers/provider_delete')?>/"+id,
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
        <h3 class="modal-title">Suppliers Form</h3>
      </div>
      <div class="modal-body form">
        <form action="#" id="form" class="form-horizontal">
          <input type="hidden" value="" name="id"/>
          <div class="form-body">
            
            <div class="form-group">
              <label class="control-label col-md-3">Name</label>
              <div class="col-md-9">
                <input name="name" placeholder="Name" class="form-control" type="text">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3">Code</label>
              <div class="col-md-9">
                <input type="text" name="code" placeholder="Code" class="form-control">  
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3">Telephone No.</label>
              <div class="col-md-9">
                <input type="text" name="telephone_no" placeholder="Telephone No." class="form-control">  
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3">Tax</label>
              <div class="col-md-9">
                <input type="text" name="tax" placeholder="Tax" class="form-control">  
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
