<?php echo form_open('"id" = "create-parts-form", "class" = "general-form", "role" = "form"'); ?>
<div class="modal-body clearfix">
 <div class="panel panel-default">
  <div class="panel-heading" style="margin-top: -8px">Defferal Transactions
    <?php echo anchor(get_uri("gl_process/gl_form"), "<i class='fa fa-plus-circle'></i> " . 'Add Transaction', array("class" => "btn btn-default pull-right rq", "title" => 'Add Transaction')); ?>
    
  </div>
</div>
<div class="panel-body">
 <div class="row">
  <div class="col-sm-12">
    <?php if ($this->session->flashdata('msg')) { ?>
    <div class="alert alert-danger">
            <a href="#" class="close" data-dismiss="alert">&times;</a>
            <strong>Error! </strong> <?php echo $this->session->flashdata('msg'); ?>
        </div>
      <?php } ?>
    <table class="table table-striped table-bordered" id="jt" style="width: 100%">
     <thead>
       <tr>
        <?php $counter = 1;?>
        <th>No.</th>
        <th>Status</th>
        <th>Date</th>


      </tr>
    </thead> 
    <tbody>
      <?php foreach ($defferals as  $def) {?>

        <tr>
          <td>
            <?php echo $counter++;?> 
          </td>
          <td><?php echo $def->POST_STATUS;?></span></a></td>
          <td><?php echo $def->POSTING_DATE?></td>
          

        </tr>
      <?php }?>
    </tbody>     
  </table>

</div>
</div>
</div>
</div>
</div>
<link rel="stylesheet" href="<?php echo base_url();?>assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<?php echo base_url();?>assets/js/datatable/css/dataTables.bootstrap.min.css">

<script type="text/javascript">
  $(document).ready(function() {
    $('#jt').DataTable();
  } );
</script>

<script>

  $(document).ready(function() {
    $('.confirm-div').hide();
    <?php if($this->session->flashdata('msg')){ ?>
      $('.confirm-div').html('<?php echo $this->session->flashdata('msg'); ?>').show();
    });
<?php } ?>
</script>