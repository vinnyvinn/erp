<div style="max-width: 1000px; margin: auto; color: #444;">
    <?php
    $invoice_color = get_setting("invoice_color");
    if (!$invoice_color) {
        $invoice_color = "#2AA384";
    }
    ?>
    <table style="">
        <tr>
            <td style="width: 50%; vertical-align: top;">

                <div style="width:10%;">
                     <img src="<?php echo base_url('assets/images/esl.png');?>"  />
                     <h4>Express Shipping & Logistics(EA) Limited</h4>
                     <p style="font-family: sans-serif;">
                          Cannon Towers<br> 
                         6th Floor, Moi Avenue Mombasa Kenya<br>
                         Email: agency@esl-eastafrica.com<br>
                         ops@esl-eastafrica.com<br>
                         Web: www.esl-eastafrica.com<br>

                      </p>
                </div>
                <div><b><?php echo $invoice_info->supplier;?></b></div>
                <span style="font-size: 90%; color: #666;">
                    <div><?php

                         $company_phone = $client_info->telephone;?>
                          <?php if ($company_phone) { ?>
                            <div style="line-height: 1.6px;"> </div>
                            <br /><?php echo lang("phone") . ": " . $company_phone; ?>
                        <?php } ?>
                        
                    </div>
                </span>
            </td>
            <td style="width: 15%;">
            </td>
            <td style="width: 35%; vertical-align: top;">
                <div style="text-align: right; line-height: 23px;">
                    <span style="font-size:20px; font-weight: bold; background-color: green; color: #fff;">&nbsp;<span style="text-transform: uppercase;"><?php echo lang("invoice") . " #" . $invoice_info->id; ?></span>&nbsp; </span>
                    <div style="line-height: 10px;"></div>
                    <span><?php echo lang("bill_date") . ": " . $invoice_info->created; ?></span><br />
                    
                </div>
              
                <div>
                    <div style="border-bottom: 1px solid #f2f2f2;"><strong><?php echo lang("bill_to"); ?></strong></div>

                    <div><strong><?php echo $client_info->name; ?> </strong></div>
                    
                </div>  

            </td>
        </tr>
    </table>
</div>

<table style="width: 100%; color: #444;">            
    <tr style="font-weight: bold; background-color: green; color: #fff;  ">
        <th style="width: 15%; border-right: 1px solid #eee;"> <?php echo lang("item"); ?> </th>
        <th style="width: 15%; border-right: 1px solid #eee;"> Hours </th>
        <th style="width: 15%; border-right: 1px solid #eee;"> Tonnes</th>
        <th style="text-align: right;  width: 25%; border-right: 1px solid #eee;"> <?php echo lang("rate"); ?></th>
        <th style="text-align: right;  width: 25%; "> <?php echo lang("total"); ?></th>
    </tr>

            <tr style="background-color: #f4f4f4; ">
            <td style="width: 15%; border: 1px solid #fff; padding: 10px;"><?php echo $invoice_info->equipment;?></td>
            <td style="width: 15%; border: 1px solid #fff; padding: 10px;"><?php echo $invoice_info->hours;?></td>
            <td style="width: 20%; border: 1px solid #fff; padding: 10px;"><?php echo $invoice_info->tonnes;?></td>
            <td style="width: 25%; border: 1px solid #fff;"> <?php echo to_currency($invoice_info->rate); ?></td>
            <td style="width: 25%; border: 1px solid #fff;"> <?php echo to_currency($invoice_info->total); ?></td>
        </tr>
   
    
    </table>
    <div class="panel panel-default">
        <div class="panel panel-heading">
                Terms and Conditions             
    </div>
</div>
<div style="margin-top: 15px;">
    <?php echo get_setting("invoice_footer"); ?>
</div>

