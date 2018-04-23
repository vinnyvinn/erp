<b>Driver:  <?php echo $jobs[0]['driver'];?></b>
<br>
 <b>Vehicle: <?php echo $jobs[0]['code'];?></b>
<table>  
<tr>  
    <th>Job Card #</th>
     <th><?php echo lang('job_type'); ?></th>
    <th><?php echo lang('service_type'); ?></th>
    <th><?php echo lang('description'); ?></th>
    <th>Service Provider</th>
    <th>Days</th>
    <th><?php echo lang('make_model'); ?></th>
    <th>Time(Hours)</th>
     <th><?php echo lang('km_reading'); ?></th>
    <th><?php echo lang('fuel_balance'); ?></th>
</tr>  
<tr>  
    <td><?php echo $jobs[0]['card_no']?></td>
    <td><?php echo $jobs[0]['job_type_id'];?></td>
    <td><?php echo $jobs[0]['service'];?></td>
    <td><?php echo $jobs[0]['explanation'];?></td>
    <td><?php echo $jobs[0]['provider']?></td>
    <td><?php $d1= strtotime($jobs[0]['actual_date']);
              $d2=strtotime($jobs[0]['completion_date']);
              $days=floor(($d2-$d1)/(60*60))/24;
              echo $days;?>
    </td>
   
    <td><?php echo $jobs[0]['code'];?></td>
    <td><?php $t1=strtotime($jobs[0]['time_in']);
              $t2=strtotime($jobs[0]['time_out']);
              $time=(($t2-$t1)/(60*60));
              echo $time;?>
             </td>
     <td><?php echo number_format($jobs[0]['km_reading'],2);?></td>
    <td><?php echo $jobs[0]['balance'];?></td>
</tr>  
</table>  
      <p style="line-height: 1.6">          
   <table>
        <thead>
          <tr>

            <th><?php echo lang('inspection'); ?></th>
            <th><?php echo lang('done_by'); ?></th>
            <th><?php echo lang('status'); ?></th>

          </tr>
        </thead>
        <tbody>

          <tr>
            <td> 
              <?php
              foreach ($inspections['inspect'] as $key => $value) { ?>
              <select  name="inspection_id" class="form-control" disabled="true">


                <option value="">
                  <?php  echo $value[0]->type; ?>
                </option>
              </select>
              <?php
            }
            ?>
          </td>

          <td>
            <?php
            foreach ($inspections['emp'] as $key => $value) { ?>
            <select  name="inspection_id" class="form-control" disabled="true">


              <option value="">
                <?php  echo $value[0]['name'];?>
              </option>
            </select>
            <?php
          }
          ?>
        </td>
        <td>
          <?php
          foreach ($inspections['status'] as $key => $value) { ?>
          <select  name="inspection_id" class="form-control" disabled="true">


            <option value="">
              <?php  echo $value[0]->name; ?>
            </option>
          </select>
          <?php
        }
        ?>
      </td>
    </tr>

  </tbody>
</table>
 
<style>
 table {  
    color: #333; /* Lighten up font color */
    font-family: Helvetica, Arial, sans-serif; /* Nicer font */
    width: 640px; 
    border-collapse: 
    collapse; border-spacing: 0; 
}

td, th { border: 1px solid #CCC; height: 30px; } /* Make cells a bit taller */

th {  
    background: #F3F3F3; /* Light grey background */
    font-weight: bold; /* Make sure they're bold */
}

td {  
    background: #FAFAFA; /* Lighter grey background */
    text-align: center; /* Center our text */
}
</style>
