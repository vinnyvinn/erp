    <style>
    table {
        width:100%;
    }
    table, th, td {
        border: 1px solid black;
        border-collapse: collapse;
    }
    th, td {
        padding: 15px;
        text-align: left;
    }
</style>
<div class="panel panel-default">
    <img src="./assets/images/esl.png" align="right" width="20%">
    <div class="panel-heading">
       <h2 style="text-align: center;">EXPRESS SHIPPING & LOGISTICS E.A.LTD</h2>
       <br>
   </div>
    
   <div class="panel-body">
     <div class="row">
        <?php foreach ($all_data as $data) {?>
        <div class="col-sm-12">
            <div class="panel-heading">
                <label><b>Driver : <?php echo $data['user']['name']; ?>
                </label>
                <br>
                <b>Vehicle :
                    <?php foreach ($data['vehicle'] as $key => $value) {?>
                    <label><?php echo $value['code'];?> </label> 

                    <?php }?>
                </b>
            </div>
           
            <table>
                <thead>
                 <tr>
                     <th>No.</th>
                     <th>Date</th>
                     <th>Invoice No.</th>
                     <th>Litres</th>
                     <th>Pump Price</th>
                     <th>Cost</th>
                     <th>Km Reading</th>
                     <th>Others</th>
                     <th>Cost</th>
                 </tr>
             </thead>
             <tbody>
               <?php foreach ($data['details'] as $report) {?>
               <tr>
                 <td><?php echo $report['id']?></td>
                 <td width="60%"><?php $pubdate= $report['created'];
                 $da = strtotime($pubdate);
                 echo date('Y-m-d', $da);?>
             </td>
             <td><?php echo $report['invoice_no']?></td>
             <td><?php echo $report['litres']?></td>
             <td><?php echo $report['price']?></td>
             <td><?php echo $report['total']?></td>
             <td><?php echo $report['km_reading']?></td>
             <td><?php echo $report['expenses']?></td>
             <td><?php echo $report['expense_cost']?></td>


         </tr>
         <?php }?>
     </tbody>
     <tfoot>
       <tr>
           <td>Total</td>
           <td></td>
           <td></td>
           <td></td>
           <td></td>
           <td><</td>
           <td></td>
           <td></td>
           <td></td>
       </tr>
   </tfoot>
</table>
</div>
</div>
<?php }?>
</div>
</div>