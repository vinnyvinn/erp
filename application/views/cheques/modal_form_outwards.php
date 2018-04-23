<?php echo form_open(get_uri("cheques/save"), array("id" => "project-form", "class" => "general-form", "role" => "form")); ?>

<div class="modal-body clearfix">

    <input type="hidden" name="activity_id" id="activity_id" value="4">

    <div class="form-group">
        <label for="receiver" class=" col-md-3">From (sender)</label>
        <div class="col-md-8">
          <select class="select2 validate-hidden" name="sender_id" id="sender_id" required>
              <?php
              foreach ($senders_dropdown as $value) {
                    echo "<option value=". $value->id . ">" . ucfirst($value->first_name . " " . $value->last_name) . "</option>";
              }
              ?>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label for="receiver" class=" col-md-3">Sent To (receiver)</label>
        <div class="col-md-8">
          <select class="select2 validate-hidden" name="receiver_id" id="receiver_id" required>
              <?php
              foreach ($receivers_dropdown as $value) {
                  echo "<option value=". $value->id . ">" . ucfirst($value->title) . "</option>";
              }
              ?>
            </select>
        </div>
        <div class="col-md-1">
            <?php echo modal_anchor(get_uri("parcels/modal_form_mailing_list"), "<i class='fa fa-plus-circle'></i>", array("data-is-popup" => '1', 'data-populate' => 'client_id', "class" => "btn btn-info btn-add", "title" => lang('add_client'))); ?>
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
        <label for="cheque amount" class=" col-md-3">Cheque Amount</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "type" => "number",
                "id" => "cheque_amount",
                "name" => "cheque_amount",
                "class" => "form-control",
                "placeholder" => "Cheque Amount",
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
            ));
            ?>
        </div>
    </div>
    <div class="form-group">
        <label for="expiry date" class=" col-md-3">Expiry Date</label>
        <div class=" col-md-9">
            <?php
            echo form_input(array(
                "id" => "expiry_date",
                "name" => "expiry_date",
                "data-date-start-date" => "1d",
                "class" => "form-control",
                "placeholder" => "Expiry Date"
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

        setDatePicker("#expiry_date");

        $("#project-form .select2").select2();

    });
</script>