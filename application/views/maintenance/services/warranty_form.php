   <div class="row">
    <div class="col-sm-12">

<div class="panel-default">
	<div class="panel-heading">
	<div class="panel-title">Warranty Parts
  
  <button class="btn btn-info pull-right" onclick="add_part()"><i class="fa fa-plus-circle"></i> <span style="font-size: 12px">Add Parts</span></button>

   </div>
	  
	</div>
<div class="panel-body">   
    <br />
    <br />
    <table id="jobs_table" class="table table-striped table-bordered" cellspacing="0" width="100%">
      <thead>
        <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Part No.</th>
                    <th>Description</th>
                    <th>Asset</th>
                    <th>Warranty Expiry</th>
                    <th style="width:125px;">Action
          </th>
        </tr>
      </thead>
      <tbody>   
                <?php foreach($parts as $part){?>
                     <tr>
                           <td><?php echo $part['id'];?></td>
                           <td><?php echo $part['name'];?></td>
                           <td><?php echo $part['part_no'];?></td>
                           <td><?php echo $part['description'];?></td>
                           <td><?php echo $part['code'];?></td>
                           <td><?php echo $part['warranty_period'];?></td>
                                                     
                            <td>
                              <div class="col-xs-6" style="width: 28%;">
                           <button class="btn btn-warning edito" onclick="edit_part(<?php echo $part['id'];?>)" style="font-size: 10px; 
                            "><i class="glyphicon glyphicon-pencil"></i></button>
                       </div>
                       <div class="col-xs-6">
                           <button class="btn btn-danger" onclick="delete_part(<?php echo $part['id'];?>)" style="font-size: 10px"><i class="glyphicon glyphicon-remove"></i></button>
                           </div>

                                </td>
                      </tr>
                     <?php }?>



      </tbody>

      <tfoot>
        <tr>
         <th>ID</th>
         <th>Name</th>
         <th>Part No</th>
         <th>Description</th>
         <th>Asset</th>
         <th>Warranty Expiry</th>
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
      $('#jobs_table').DataTable();
  } );
    var save_method; //for save method string
    var table;


    function add_part()
    {
      save_method = 'add';
      $('#form')[0].reset(); // reset form on modals
      $('#modal_form').modal('show'); // show bootstrap modal
    //$('.modal-title').text('Add Person'); // Set Title to Bootstrap modal title
    }

    function edit_part(id)
    {
      save_method = 'update';
      $('#form')[0].reset(); // reset form on modals

      //Ajax Load data from ajax
      $.ajax({
        url : "<?php echo site_url('warranty_parts/warranty_asset_edit/')?>/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {

            $('[name="id"]').val(data.id);
            $('[name="name"]').val(data.name);
            $('[name="description"]').val(data.description);
            $('[name="part_no"]').val(data.part_no);
             $('[name="asset"]').val(data.asset);
            $('[name="warranty_period"]').val(data.warranty_period);
            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Warranty Parts'); // Set title to Bootstrap modal title

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
          url = "<?php echo site_url('warranty_parts/add_warranty_asset')?>";
      }
      else
      {
        url = "<?php echo site_url('warranty_parts/warranty_asset_update')?>";
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

    function delete_part(id)
    {
      if(confirm('Are you sure delete this data?'))
      {
        // ajax delete data from database
          $.ajax({
            url : "<?php echo site_url('warranty_parts/delete')?>/"+id,
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
        <h3 class="modal-title">Warranty Parts Form</h3>
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
              <label class="control-label col-md-3">Part No</label>
              <div class="col-md-9">
                <input name="part_no" placeholder="Part No" class="form-control" type="text">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3">Description</label>
              <div class="col-md-9">
                <input name="description" placeholder="Description" class="form-control" type="text">
              </div>
            </div>

            <div class="form-group">
              <label class="control-label col-md-3">Asset</label>
              <div class="col-md-9">
            <select class="form-control" name="asset" id="asset" placeholder="Asset" id="asset" required>
            
                 <?php
              foreach ($assets_dropdown as $asset) {
                  echo "<option value=". $asset->id . ">" . ucfirst($asset->code) . "</option>";
              }
              ?>
            </select>
          </div>
        </div>
              
            <div class="form-group">
              <label class="control-label col-md-3">Warranty Expiry</label>
              <div class="col-md-9">
                <input name="warranty_period" placeholder="Warranty Expiry" class="form-control" type="date">
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

  <script type="text/javascript">
     $("#asset").select2();
  </script>

  <style type="text/css">
    .edito{
      margin-left: -24px;
    }
  </style>