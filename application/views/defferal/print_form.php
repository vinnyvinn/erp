             <img src="./assets/images/esl.png" style="text-align: right;">
            <h2>EXPRESS SHIPPING & LOGISTICS E.A.LTD</h2>
            <center>
             PROJECT DEFFERALS FORM
            </center>
            
            </label>
            <br>
            
          </div>
          
          <table class="table table-striped table-bordered"  style="width: 100%">
           <thead>
             <tr>
               <th>Project Code</th>
               <th>Description</th>
               <th>Project Defferal Date</th>
               <th>Status</th>
                             
             </tr>
           </thead> 
           <tbody>

            
            <tr>
             <td><?php echo $reports['code']?></td>
             <td><?php echo $reports['description']?></td>
             <td><?php echo $reports['project_defferal_date']?></td>
             <td><?php echo $reports['status'] == 1 ? 'Active ' : ' Inactive';?></td>
           </tr>
           
           
         </tbody>
         
       </table>
       <br>
     <p style="line-height: 1.6">

          <p>Operations Comments: <?php echo $reports['comments']?></p>
         

         <p>Finance Remarks: <?php echo $reports['finance_remarks']?></p>
          
         

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
