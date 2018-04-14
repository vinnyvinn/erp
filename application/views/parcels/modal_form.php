<?php echo form_open(get_uri("parcels/save"), array("id" => "project-form", "class" => "general-form", "role" => "form")); ?>

<div class="modal-body clearfix">
    <div class="form-group">
        <label for="parcels type" class=" col-md-3">Mail / Parcel Type</label>
        <div class="col-md-9">
          <select class="select2 validate-hidden" name="activity_id" id="activity_id" required>
              <?php
              foreach ($parcels_types_dropdown as $value) {
                  echo "<option value=". $value->id . ">" . ucfirst($value->title) . "</option>";
              }
              ?>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label for="receiver" class=" col-md-3">Receiver (send to)</label>
        <div class="col-md-9">
          <select class="select2 validate-hidden" name="receiver_id" id="receiver_id" required>
              <?php
              foreach ($receivers_dropdown as $value) {
                  echo "<option value=". $value->id . ">" . ucfirst($value->title) . "</option>";
              }
              ?>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label for="title" class=" col-md-3">Title</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "type" => "text",
                "id" => "title",
                "name" => "title",
                "class" => "form-control",
                "placeholder" => "Title",
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>

    <div class="form-group">
        <label for="description" class=" col-md-3">Description</label>
        <div class=" col-md-9">
            <?php
            echo form_textarea(array(
                "type" => "text",
                "id" => "description",
                "name" => "description",
                "class" => "form-control",
                "placeholder" => "Description",
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>

</div>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fa fa-close"></span> <?php echo lang('close'); ?></button>
    <button type="submit" class="btn btn-primary"><span class="fa fa-check-circle"></span> <?php echo lang('save'); ?></button>
</div>
<?php echo form_close(); ?>

<script type="text/javascript">
    $(document).ready(function () {
        $("#project-form").appForm({
            onSuccess: function (result) {
                // $("#parcels-table").appTable({newData: result.data, dataId: result.id});
                setTimeout(function () {
                    window.location.reload();
                }, 100);
            }
        });

        $("#project-form .select2").select2();

    });
</script>