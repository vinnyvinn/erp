             <?php

             function secondsToTime($seconds) {
              $dtF = new \DateTime('@0');
              $dtT = new \DateTime("@$seconds");
              return $dtF->diff($dtT)->format('%a days, %h hours, %i minutes');
            }

            ?>
            <img src="./assets/images/esl.png" style="text-align: right;">
            <h2>EXPRESS SHIPPING & LOGISTICS E.A.LTD</h2>
            <center>
              MAINTENANCE  JOB CARD
            </center>
            <label>Driver : <?php echo $reports_data[0]['employee']; ?>
            </label>
            <br>
            
          </div>
          
          <table class="table table-striped table-bordered"  style="width: 100%">
           <thead>
             <tr>
               <th>Maintenance Required</th>
               <th>Description</th>
               <th>Job Card No: <?php echo $reports_data[0]['card_no']?></th>
               
             </tr>
           </thead> 
           <tbody>

            
            <tr>
             <td><?php echo $reports_data[0]['job_type_id']?></td>
             <td><?php echo $reports_data[0]['description']?></td>
             <td>
               <b>Job Card Opened- Date:</b> <?php 
               $date=strtotime($reports_data[0]['created']);?>
               <?php echo date('Y/m/d',$date)?> <br>
               <b>Time:</b> <?php echo date('H:i:s',$date)?><br>
               <b style="text-align: left;">Reg: </b> <?php echo $reports_data[0]['reg']?>;<br>
               <b>Make: </b> <?php echo $reports_data[0]['make']?><br>
               <b>Mileage Reading: </b>  <?php echo $reports_data[0]['km_reading'] ? $reports_data[0]['km_reading'] .' km' : $reports_data[0]['miles_reading'] .' mi'?> <br>
               <b>Next Service Mileage: </b> <?php echo $reports_data[0]['next_time_km'] ? $reports_data[0]['next_time_km'].' km' : ($reports_data[0]['next_time_miles'] ? $reports_data[0]['next_time_miles'] .' mi' : $reports_data[0]['next_time_hours'] .' hrs')?> <br>

             </td>
           </tr>
           
           
         </tbody>
         
       </table>
       <b>Repair / Service Required</b>: <?php echo $reports_data[0]['job_type_id']?>

       <table class="table table-striped table-bordered"  style="width: 100%">
         <thead>
           <tr>
             
             <th>Parts</th>
             <th>Qty</th>
             <th>Unit Cost</th>
             <th>Total Cost(Ksh)</th>
            
             
           </tr>
         </thead> 
         <tbody>
          <?php

          $parts=json_decode($reports_data[0]['part_name']);
          $quantity=json_decode($reports_data[0]['quantity']);
          $cost=json_decode($reports_data[0]['cost']);
          $total=0;
          ?>

          <?php  
         
          foreach ($parts as $key => $value): ?>
          
          <tr>
            <td><?= $value ?></td>
            <td><?= isset($quantity[$key]) && $quantity[$key]>0 ? number_format((int) $quantity[$key], 0) : '' ?></td>
            <td><?= isset($cost[$key]) && $cost[$key]>0 ? number_format((int) $cost[$key], 2) : '' ?></td>
             <td><?= isset($quantity[$key]) && ($quantity[$key]) > 0 ? number_format($quantity[$key] * $cost[$key],2) : '';
               $total+=($quantity[$key] * $cost[$key]);
             ?></td>
          </tr>
          <?php  endforeach; ?>
          
          
        </tbody>
        <tfoot>
          <tr>
            <td><</td>
            <td></td>
            <td style="color: red; font-size: 18px; text-align: right;"><b>Sub Totals</b></td>
             <td>
              <?php
              echo number_format($total,2);
              ?></td>
            </tr>
            <tr>
            <td><</td>
            <td></td>
            <td style="color: red; font-size: 18px; text-align: right;"><b>Labour Cost</b></td>
             <td>
              <?php
              echo number_format($reports_data[0]['labour_cost'],2);
              ?></td>
            </tr>
            <tr>
            <td><</td>
            <td></td>
            <td style="color: red; font-size: 18px; text-align: right;"><b>Totals Cost</b></td>
             <td>
              <?php
              
              echo number_format($total + $reports_data[0]['labour_cost'],2);
              ?></td>
            </tr>
          </tfoot>
        </table>
        
        <br><br>
        <p style="line-height: 1.6">
          <p>Comments: <?php $items= json_decode($reports_data[0]['part_name']);
           echo implode(',',$items);
           ;?>
           supplied by
           <?php echo  $reports_data[0]['supplier'] ? $reports_data[0]['supplier'] : $reports_data[0]['internal_provider']?>. Fixed on 
           <?php $date=strtotime($reports_data[0]['completion_date']);
           echo date('Y/m/d',$date)?> from <?php echo $reports_data[0]['time_in']?> -  <?php echo $reports_data[0]['time_out']?>
           Total downtime <?php 
           $time_in=strtotime($reports_data[0]['time_in']);
           $time_out=strtotime( $reports_data[0]['time_out']);
           $start_date=strtotime($reports_data[0]['actual_date']);
           $end_date=strtotime( $reports_data[0]['completion_date']);
           
           echo secondsToTime((($time_out+$end_date)-($time_in+$start_date)));
           ?>
         </p>

         <link rel="stylesheet" href="<?php echo base_url();?>assets/bootstrap/css/bootstrap.min.css">
         <link rel="stylesheet" href="<?php echo base_url();?>assets/js/datatable/css/dataTables.bootstrap.min.css">
         <style type="text/css">
          .pdfcolor{
            color: red;
          }
        </style>

        
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
