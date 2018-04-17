<div class="row">
  <div class="col-sm-12">
    <div class="panel-default">
     <div class="panel-heading">
       <div class="panel-title">System Supports</div>
       <div class="row">
       <div class="col-md-6" style="width: 50%">
       <button class="btn btn-default pull-right" onclick="add_support()" style="margin-top: -24px"><i class="fa fa-plus-circle"></i> Assign Staff</button> 
     </div>
  <div class="col-md-6" style="width: 40%">
       <button class="btn btn-default pull-right" onclick="add_support()" style="margin-top: -24px;"><i class="fa fa-plus-circle"></i> Add support </button>
       </div>
       </div> 
    
     </div>
     <div class="panel-body">   
      <br />
      <br />

      <table id="support_table" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
          <tr>
            <th>ID</th>
            <th>Support No.</th>
            <th>Description</th>
            <th>Createn on</th>
             <th style="width:125px;">Action
            </th>
          </tr>
        </thead>
        <tbody>   
         <?php foreach($supports as $support){?>
         <tr>
           <td><?php echo $support['id'];?></td>
           <td><?php echo $support['support_no'];?></td>
           <td><?php echo $support['description'];?></td>
           <td><?php echo $support['created'];?></td>
             <td>
             <div class="col-xs-6" style="width: 20%;margin-right: -10px;">
              <button class="btn btn-warning edito" onclick="edit_support(<?php echo $support['id'];?>)" style="font-size: 10px;margin-left: -24px !important;"><i class="glyphicon glyphicon-pencil"></i></button>
            </div>
            <div class="col-xs-6">                   
             <button class="btn btn-danger" onclick="delete_support(<?php echo $support['id'];?>)" style="font-size: 10px"><i class="glyphicon glyphicon-remove"></i></button>
           </div>

         </td>
       </tr>
       <?php }?>



     </tbody>

     <tfoot>
      <tr>
        <th>ID</th>
        <th>Support No.</th>
            <th>Description</th>
            <th>Createn on</th>
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
    $('#support_table').DataTable();
  } );
    var save_method; //for save method string
    var table;


    function add_support()
    {
      save_method = 'add';
      $('#form')[0].reset(); // reset form on modals
      $('#modal_form').modal('show'); // show bootstrap modal
    //$('.modal-title').text('Add Person'); // Set Title to Bootstrap modal title
  }
 function assign_staff()
    {
      save_method = 'add';
      $('#form')[0].reset(); // reset form on modals
      $('#assign_modal_form').modal('show'); // show bootstrap modal
    //$('.modal-title').text('Add Person'); // Set Title to Bootstrap modal title
  }
  function edit_support(id)
  {
    save_method = 'update';
      $('#form')[0].reset(); // reset form on modals

      //Ajax Load data from ajax
      $.ajax({
        url : "<?php echo site_url('system_support/support_edit/')?>/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {

          $('[name="id"]').val(data.id);
          $('[name="description"]').val(data.description);
          $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit System Support'); // Set title to Bootstrap modal title

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
        url = "<?php echo site_url('system_support/add_support')?>";
      }
      else
      {
        url = "<?php echo site_url('system_support/support_update')?>";
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

      function save_user()
    {
      var url = "<?php echo site_url('system_support/add_support')?>";
     

       // ajax adding data to database
       $.ajax({
        url : url,
        type: "POST",
        data: $('#form').serialize(),
        dataType: "JSON",
        success: function(data)
        {
               //if success close modal and reload ajax table
              $('#assign_modal_form').modal('hide');
              location.reload();// for reload a page
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
              alert('Error adding / update data');
            }
          });
     }

     function delete_support(id)
     {
      if(confirm('Are you sure delete this data?'))
      {
        // ajax delete data from database
        $.ajax({
          url : "<?php echo site_url('system_support/delete')?>/"+id,
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
          <h3 class="modal-title">System Supports Form</h3>
        </div>
        <div class="modal-body form">
          <form action="#" id="form" class="form-horizontal">
            <input type="hidden" value="" name="id"/>
            <div class="form-body">

                    <div class="form-group">
              <label class="control-label col-md-3">Description</label>
              <div class="col-md-9">
                <textarea name="description" placeholder="Description" class="form-control" cols="3" rows="4"></textarea>
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

<!-- Bootstrap modal -->
  <div class="modal fade" id="assign_modal_form" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h3 class="modal-title">System Supports Form</h3>
        </div>
        <div class="modal-body form">
          <form action="#" id="form" class="form-horizontal">
            <input type="hidden" value="" name="id"/>
            <div class="form-body">

                    <div class="form-group">
              <label class="control-label col-md-3">Description</label>
              <div class="col-md-9">
                <textarea name="description" placeholder="Description" class="form-control" cols="3" rows="4"></textarea>
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
</script>