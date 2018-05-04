
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
  <div class="panel-title">Clients</div>
  <a href="<?php echo base_url();?>employees_types/import_staffs" class="btn btn-info" style="float: right;margin-top: -26px;margin-left: 100px"><i class="glyphicon glyphicon-upload"></i> <span style="font-size: 12px">Import From HR</span></a>
  <button class="btn btn-success" onclick="add_staff()" style="float: right;margin-top: -26px;margin-right: 50px"><i class="glyphicon glyphicon-plus"></i> <span style="font-size: 12px">Add Client</span></button>  
  </div>
<div class="panel-body">   
    <br />
    <br />
    <table id="job_service" class="table table-striped table-bordered" cellspacing="0" width="100%">
      <thead>
        <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Title</th>
                    <th>Code</th>
                    <th>Join Date</th>
                    <th style="width:125px;">Action
          </p></th>
        </tr>
      </thead>
      <tbody>   
                <?php foreach($employees as $employee){?>
                     <tr>
                           <td><?php echo $employee['id'];?></td>
                           <td><?php echo $employee['name'];?></td>
                           <td><?php echo $employee['email'];?></td>
                           <td><?php echo $employee['title'];?></td>
                           <td><?php echo $employee['code_no'];?></td>
                           <td><?php echo $employee['join_date'];?></td>    
                                <td>
                           <button class="btn btn-warning" onclick="edit_staff(<?php echo $employee['id'];?>)" style="font-size: 10px"><i class="glyphicon glyphicon-pencil"></i></button>
                                    <button class="btn btn-danger" onclick="delete_staff(<?php echo $employee['id'];?>)" style="font-size: 10px"><i class="glyphicon glyphicon-remove"></i></button>


                                </td>
                      </tr>
                     <?php }?>



      </tbody>

      <tfoot>
        <tr>
         <th>ID</th>
         <th>Name</th>
         <th>Email</th>
         <th>Title</th>
         <th>Code</th>
         <th>Join Date</th>
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
      $('#job_service').DataTable();
  } );
    var save_method; //for save method string
    var table;


    function add_staff()
    {
      save_method = 'add';
      $('#form')[0].reset(); // reset form on modals
      $('#modal_form').modal('show'); // show bootstrap modal
    //$('.modal-title').text('Add Person'); // Set Title to Bootstrap modal title
    }

    function edit_staff(id)
    {
      save_method = 'update';
      $('#form')[0].reset(); // reset form on modals

      //Ajax Load data from ajax
      $.ajax({
        url : "<?php echo site_url('employees_types/employee_edit/')?>/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {

            $('[name="id"]').val(data.id);
            $('[name="name"]').val(data.name);
            $('[name="email"]').val(data.email);
            $('[name="title"]').val(data.title);
            $('[name="code_no"]').val(data.code_no);
            $('[name="join_date"]').val(data.join_date);
                     

            $('#modal_form').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Client'); // Set title to Bootstrap modal title

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
          url = "<?php echo site_url('employees_types/add_employee')?>";
      }
      else
      {
        url = "<?php echo site_url('employees_types/employee_update')?>";
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

    function delete_staff(id)
    {
      if(confirm('Are you sure delete this data?'))
      {
        // ajax delete data from database
          $.ajax({
            url : "<?php echo site_url('employees_types/delete')?>/"+id,
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
        <h3 class="modal-title">Clients Form</h3>
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
              <label class="control-label col-md-3">Email</label>
              <div class="col-md-9">
                <input name="email" placeholder="Email" class="form-control" type="text">
              </div>
            </div>  
            <div class="form-group">
              <label class="control-label col-md-3">Title</label>
              <div class="col-md-9">
                <input name="title" placeholder="Title" class="form-control" type="text">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3">Code</label>
              <div class="col-md-9">
                <input name="code_no" placeholder="Code" class="form-control" type="text">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-md-3">Join Date</label>
              <div class="col-md-9">
                <input name="join_date" placeholder="Join Date"  id="join_date" class="form-control join_date" type="date">
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
 