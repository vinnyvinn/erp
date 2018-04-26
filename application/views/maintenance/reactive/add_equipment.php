
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
  <div class="panel-title">Equipments</div>
  <a href="<?php echo base_url();?>equipments/import_sage" class="btn btn-info" style="float: right;margin-top: -26px;margin-left: 100px"><i class="glyphicon glyphicon-upload"></i> <span style="font-size: 12px">Import From Sage</span></a>
  <button class="btn btn-success" onclick="add_equipment()" style="float: right;margin-top: -26px;margin-right: 50px"><i class="glyphicon glyphicon-plus"></i> <span style="font-size: 12px">Add Equipment</span></button>  
  </div>
<div class="panel-body">   
    <br/>
    <br/>
    <table id="equipments" class="table table-striped table-bordered" cellspacing="0" width="100%">
      <thead>
        <tr>
                    <th>ID</th>
                    <th>Code</th>
                    <th>Asset No.</th>
                    <th>Description</th>
                    <th>Rate</th>
                     <th style="width:125px;">Action
                     </th>
        </tr>
      </thead>
      <tbody>   
                <?php foreach($equipments as $equipment){?>
                     <tr>
                           <td><?php echo $equipment['id'];?></td>
                           <td><?php echo $equipment['code'];?></td>
                           <td><?php echo $equipment['asset_no'];?></td>
                           <td><?php echo $equipment['description'];?></td>
                           <td><?php echo $equipment['purchase_price'];?></td>
                           <td>
                           <button class="btn btn-warning" onclick="edit_equipment(<?php echo $equipment['id'];?>)" style="font-size: 10px"><i class="glyphicon glyphicon-pencil"></i></button>
                                    <button class="btn btn-danger" onclick="delete_equipment(<?php echo $equipment['id'];?>)" style="font-size: 10px"><i class="glyphicon glyphicon-remove"></i></button>


                                </td>
                      </tr>
                     <?php }?>



      </tbody>

      <tfoot>
        <tr>
         <th>ID</th>
          <th>Code</th>
          <th>Asset No.</th>
          <th>Description</th>
          <th>Price</th>
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
      $('#equipments').DataTable();
  } );
    var save_method; //for save method string
    var table;


    function add_equipment()
    {
      save_method = 'add';
      $('#form')[0].reset(); // reset form on modals
      $('#modal_form').modal('show'); // show bootstrap modal
    //$('.modal-title').text('Add Person'); // Set Title to Bootstrap modal title
    }

    function edit_equipment(id)
    {
      save_method = 'update';
      $('#form')[0].reset(); // reset form on modals

      //Ajax Load data from ajax
      $.ajax({
        url : "<?php echo site_url('equipments/equipment_edit/')?>/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {

            $('[name="id"]').val(data.id);
            $('[name="code"]').val(data.code);
            $('[name="asset_no"]').val(data.asset_no);
            $('[name="description"]').val(data.description);
            $('[name="purchase_price"]').val(data.purchase_price);

            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Equipment'); // Set title to Bootstrap modal title

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
          url = "<?php echo site_url('equipments/add_equipment')?>";
      }
      else
      {
        url = "<?php echo site_url('equipments/equipment_update')?>";
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

    function delete_equipment(id)
    {
      if(confirm('Are you sure delete this data?'))
      {
        // ajax delete data from database
          $.ajax({
            url : "<?php echo site_url('equipments/delete')?>/"+id,
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
        <h3 class="modal-title">Equipments Form</h3>
      </div>
      <div class="modal-body form">
        <form action="#" id="form" class="form-horizontal">
          <input type="hidden" value="" name="id"/>
          <div class="form-body">
            <div class="form-group">
              <label class="control-label col-md-3">Code</label>
              <div class="col-md-9">
                <input name="code" placeholder="Equipment Code" class="form-control" type="text">
              </div>
            </div>
                     
            <div class="form-group">
              <label class="control-label col-md-3">Equipment No</label>
              <div class="col-md-9">
                <input name="asset_no" placeholder="Equipment No" class="form-control" type="text">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3">Description</label>
              <div class="col-md-9">
                <textarea name="description" placeholder="Description" class="form-control"></textarea>  
            </div>
          </div>
            <div class="form-group">
              <label class="control-label col-md-3">Rate</label>
              <div class="col-md-9">
                <input name="purchase_price" placeholder="Rate" class="form-control" type="text">
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
 