 <p style="text-align: center;">External Service</p>
 <b>External Service #<?php echo $services[0]['service_no'];?></b>
 <p style="line-height: 1.6"></p>
 <table>  
<tr>  
    <th><?php echo lang('job_card'); ?></th>
    <th><?php echo lang('external_service_type'); ?></th>
    <th>Vehicle #</th>
    <th><?php echo lang('make_model'); ?></th>
    <th><?php echo lang('supplier'); ?></th>
    <th><?php echo lang('start_date');?></th>
    <th><?php echo lang('end_date');?></th>
    <th>Item</th>
    <th><?php echo lang('quantity'); ?></th>
    <th>Price</th>
    <th>Total(labour)</th>
    <th>Total(Parts)</th>
    </tr> 
     
     <tr>  
    <td><?php echo $services[0]['card_no'];?></td>
    <td><?php echo $services[0]['service_type'];?></td>
    <td><?php echo $services[0]['vehicle'];?></td>
    <td><?php echo $services[0]['make'];?></td>
    <td><?php echo $services[0]['supplier'];?></td>
    <td><?php echo $services[0]['start_date'];?></td>
    <td><?php echo $services[0]['end_date']?></td>
    <td><?php echo $services[0]['spare']?></td>
    <td><?php echo $services[0]['quantity']?></td>
    <td><?php echo number_format($services[0]['amount'],2);?></td>
    <td><?php echo number_format($services[0]['total_service'],2);?></td>
    <td><?php echo number_format($services[0]['total_fuel'],2);?></td>
    
</tr>  
</table>  

<style type="text/css">
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