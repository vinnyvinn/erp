  <p style="text-align: center;">External Service</p>
  <br><br>
<table>  
<tr>  
    <th>Requisition #</th>
    <th><?php echo lang('job_card'); ?></th>
    <th><?php echo lang('vehicle');?></th>
    <th><?php echo lang('description'); ?></th>
    <th><?php echo lang('spare'); ?></th>
    <th>Price</th>
    <th><?php echo lang('quantity'); ?></th>
    <th><?php echo lang('total'); ?></th>

</tr>  
<tr>  
    <td><?php echo $services[0]['requisition_no']?></td>
    <td><?php echo $services[0]['card_no']?></td>
    <td><?php echo $services[0]['code']?> </td>
    <td><?php echo $services[0]['description']?></td>
    <td><?php echo $services[0]['stock_name']?></td>
    <td><?php echo $services[0]['avg_cost']?></td>
    <td><?php echo $services[0]['qnty_out']?></td>
    <td><?php echo number_format($services[0]['total']);?></td>
</tr>  
</table>  
 <script type="text/javascript">
     window.print();
</script>
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