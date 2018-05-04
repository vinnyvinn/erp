        <img src="./assets/images/esl.png" align="right" width="20%">
    <div class="panel-heading">
    <h2 style="text-align: center;"><?php 
    if(isset($reports_data[0]['reports']['reactive'] )){
      echo 'Preventive Maintance Reports For The Month Of '.date("F Y", strtotime($reports_data[0]['reports']['created_at'])) ;
    }
    else{
       echo 'Reactive Maintance Reports For The Month Of '.date("F Y", strtotime($reports_data[0]['reports']['created_at'])) ;
    }
    ?>
      </h2>
       <br>
   </div>
      <table class="table table-striped table-bordered"  style="width: 100%">
       <thead>
         <tr>
           <th>No.</th>
           <th>Car / Machine</th>
           <th>Total(Ksh)</th>

         </tr>
       </thead> 
       <tbody>

        <?php foreach ($reports_data as $key => $data_value) : ?>

        <tr>
          <td><?php echo $data_value['reports']['id'];?></td>
          <td><?php echo $data_value['reports']['card_no'];?></td>
          <td>
            <?php $costs=json_decode($data_value['reports']['cost']);
            $sum=0;
            foreach ($costs as $key => $cost) :
             $sum+=$cost;
           endforeach;
            echo  number_format($sum + $data_value['reports']['labour_cost'],2);
           ?>
         </td>

       </tr>
    
   <?php endforeach?>
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



