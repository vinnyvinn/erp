<?php echo form_open(get_uri("clients/save_to_sage"), array("id" => "approval-form", "class" => "general-form", "role" => "form")); ?>

<input type="hidden" name="_id" id="_id" value="<?= $_id; ?>" required>

<div class="modal-body clearfix">
    <div class="form-group">
        <label for="description" class=" col-md-3"><?php echo lang("description"); ?></label>
        <div class="col-md-9">
            <?php
            echo form_textarea(array(
                "id" => "description",
                "name" => "description",
                "class" => "form-control",
                "placeholder" => lang("description"),
                "autofocus" => true,
                "data-rule-required" => true,
                "data-msg-required" => lang("field_required"),
                "style" => "height:150px;",
                "required" => true
            ));
            ?>
        </div>
        </div>
    </div>

<div class="form-group">
    <label for="assign agent" class=" col-md-3">Assign Agent</label>
    <div class="col-md-9">
      <select class="select2 validate-hidden" name="sage_agent" id="sage_agent" required>
          <?php
          foreach ($sage_agents_dropdown as $value) {
              echo "<option value=". $value->idAgents . ">" . ucfirst($value->cAgentName) . "</option>";
          }
          ?>
        </select>
    </div>
</div>

<div class="form-group">
    <label for="assign agent group" class=" col-md-3">Assign Agent Group</label>
    <div class="col-md-9">
      <select class="select2 validate-hidden" name="sage_agent_grp" id="sage_agent_grp" required>
          <?php
          foreach ($sage_agents_grp_dropdown as $value) {
              echo "<option value=". $value->idAgentGroups . ">" . ucfirst($value->cGroupName) . "</option>";
          }
          ?>
        </select>
    </div>
</div>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fa fa-close"></span> <?php echo lang('close'); ?></button>
    <button type="submit" class="btn btn-primary"><span class="fa fa-check-circle"></span> <?php echo lang('save'); ?></button>
</div>
<?php echo form_close(); ?>

<script type="text/javascript">
    $(document).ready(function () {
        $("#approval-form").appForm({
            onSuccess: function (result) {
                // $("#petty_cash-table").appTable({newData: result.data, dataId: result.id});
                setTimeout(function () {
                    window.location.reload();
                }, 100);
            }
        });
        $("#approval-form .select2").select2();
    });
</script>