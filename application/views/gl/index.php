
<div id="page-content" class="p20 row">
  <div class="col-sm-3 col-lg-2">
    <?php
    $tab_view['active_tab'] = "GL Accounts";
    $this->load->view("settings/tabs", $tab_view);
    ?>
  </div>
  <div class="col-sm-9 col-lg-10">
    <div class="panel-default">
     <div class="panel-heading">
       <div class="panel-title">GL Accounts</div>
       <a href="<?php echo base_url();?>gl_accounts/import_gl" class="btn btn-info" style="float: right;margin-top: -26px;margin-left: 100px"><i class="glyphicon glyphicon-upload"></i> <span style="font-size: 12px">Import From Sage</span></a>	
       <button class="btn btn-success" onclick="add_gl()" style="float: right;margin-top: -26px;margin-right: 100px"><i class="glyphicon glyphicon-plus"></i> <span style="font-size: 12px">Add GL Account</span></button> 
     </div>
     <div class="panel-body">   
      <br />
      <br />

      <table id="gl_table" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
          <tr>
            <th>ID</th>
            <th>Master Sub Account</th>
            <th>Description</th>
            <th style="width:125px;">Action
            </th>
          </tr>
        </thead>
        <tbody>   
          <?php foreach($accounts as $account){?>
          <tr>
           <td><?php echo $account['id'];?></td>
           <td><?php echo $account['master_account'];?></td>
           <td><?php echo $account['description'];?></td>
                                
           <td>
             <div class="col-xs-6" style="width: 20%;margin-right: -10px;">
              <button class="btn btn-warning edito" onclick="edit_gl(<?php echo $account['id'];?>)" style="font-size: 10px;margin-left: -24px !important;"><i class="glyphicon glyphicon-pencil"></i></button>
            </div>
            <div class="col-xs-6">                   
             <button class="btn btn-danger" onclick="delete_gl(<?php echo $account['id'];?>)" style="font-size: 10px"><i class="glyphicon glyphicon-remove"></i></button>
           </div>

         </td>
       </tr>
       <?php }?>



     </tbody>

     <tfoot>
      <tr>
       <th>ID</th>
       <th>Master Sub Account</th>
       <th>Description</th>
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
    $('#gl_table').DataTable();
  } );
    var save_method; //for save method string
    var table;


    function add_gl()
    {
      save_method = 'add';
      $('#form')[0].reset(); // reset form on modals
      $('#modal_form').modal('show'); // show bootstrap modal
    //$('.modal-title').text('Add Person'); // Set Title to Bootstrap modal title
  }

  function edit_gl(id)
  {
    save_method = 'update';
      $('#form')[0].reset(); // reset form on modals

      //Ajax Load data from ajax
      $.ajax({
        url : "<?php echo site_url('gl_accounts/gl_edit/')?>/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {

          $('[name="id"]').val(data.id);
          $('[name="master_account"]').val(data.master_account);
          $('[name="description"]').val(data.description);
             $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Account'); // Set title to Bootstrap modal title

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
        url = "<?php echo site_url('gl_accounts/add_gl')?>";
      }
      else
      {
        url = "<?php echo site_url('gl_accounts/gl_update')?>";
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

     function delete_gl(id)
     {
      if(confirm('Are you sure delete this data?'))
      {
        // ajax delete data from database
        $.ajax({
          url : "<?php echo site_url('gl_accounts/gl_delete')?>/"+id,
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
          <h3 class="modal-title">GL Accounts Form</h3>
        </div>
        <div class="modal-body form">
          <form action="#" id="form" class="form-horizontal">
            <input type="hidden" value="" name="id"/>
            <div class="form-body">
              <div class="row">
                <div class="col-md-6" style="width: 45%;">
                  <div class="form-group">
                    <label class="control-label" style="margin-left: 10px;">Master Sub Account</label>
                    <input name="master_account" placeholder="Master Sub Account" class="form-control" type="text" style="width: 90%;margin-left: 8px;">

                  </div>

                </div>

                <div class="col-md-6" style="width: 45%;">
                  <div class="form-group">
                    <label class="control-label">Description</label>
                    <input name="description" placeholder="Description" class="form-control" type="text">

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




