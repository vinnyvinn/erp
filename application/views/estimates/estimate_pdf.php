<div style="max-width: 1000px; margin: auto; color: #444;">
    <?php
    $estimate_color = get_setting("invoice_color");
    if (!$estimate_color) {
        $estimate_color = "#2AA384";
    }
    ?>
    <table style="">
        <tr>
            <td style="width: 50%; vertical-align: top;">

                <div style="width:10%;">
                    <img src="<?php echo get_file_uri(get_setting("system_file_path") . get_setting("invoice_logo")); ?>" />
                </div>
                <div><b><?php echo get_setting("company_name"); ?></b></div>
                <span style="font-size: 90%; color: #666;">
                    <div><?php
                        $company_address = nl2br(get_setting("company_address"));
                        $company_phone = get_setting("company_phone");
                        $company_website = get_setting("company_website");
                        if ($company_address) {
                            echo $company_address;
                        }
                        ?>
                        <?php if ($company_phone) { ?>
                            <div style="line-height: 5px;"> </div>
                            <br /><?php echo lang("phone") . ": " . $company_phone; ?>
                        <?php } ?>
                        <?php if ($company_website) { ?>
                            <div style="line-height: 5px;"> </div>
                            <br /><?php echo lang("website"); ?>: <a style="color:#666; text-decoration: none;" href="<?php echo $company_website; ?>"><?php echo $company_website; ?></a>
                        <?php } ?>
                    </div>
                </span>
            </td>
            <td style="width: 15%;">
            </td>
            <td style="width: 35%; vertical-align: top;">
                <div style="text-align: right; line-height: 23px;">
                    <span style="font-size:20px; font-weight: bold; background-color: <?php echo $estimate_color; ?>; color: #fff;">&nbsp;<span style="text-transform: uppercase;"><?php echo lang("estimate") . " #" . $estimate_info->id; ?></span>&nbsp; </span>
                    <div style="line-height: 10px;"></div>
                    <span><?php echo lang("estimate_date") . ": " . $estimate_info->estimate_date; ?></span><br />
                    <span><?php echo lang("valid_until") . ": " . $estimate_info->valid_until; ?></span>
                </div>
                <br /><br />
                <div>
                    <div style="border-bottom: 1px solid #f2f2f2;"><strong><?php echo lang("estimate_to"); ?></strong></div>

                    <div><strong><?php echo $client_info->company_name; ?> </strong></div>
                    <span style="font-size: 90%; color: #666;">
                        <?php if ($client_info->address) { ?>
                            <div><?php echo nl2br($client_info->address); ?>
                                <?php if ($client_info->city) { ?>
                                    <br /><?php echo $client_info->city; ?>
                                <?php } ?>
                                <?php if ($client_info->state) { ?>
                                    <br /><?php echo $client_info->state; ?>
                                <?php } ?>
                                <?php if ($client_info->zip) { ?>
                                    <br /><?php echo $client_info->zip; ?>
                                <?php } ?>
                                <?php if ($client_info->country) { ?>
                                    <br /><?php echo $client_info->country; ?>
                                <?php } ?>
                                <?php if ($client_info->vat_number) { ?>
                                    <br /><?php echo lang("vat_number") . ": " . $client_info->vat_number; ?>
                                <?php } ?>
                            </div>
                        <?php } ?>
                    </span>
                </div>  

            </td>
        </tr>
    </table>
</div>

<table style="width: 100%; color: #444;">            
    <tr style="font-weight: bold; background-color: <?php echo $estimate_color; ?>; color: #fff;  ">
        <th style="width: 45%; border-right: 1px solid #eee;"> <?php echo lang("item"); ?> </th>
        <th style="text-align: center;  width: 15%; border-right: 1px solid #eee;"> <?php echo lang("quantity"); ?></th>
        <th style="text-align: right;  width: 20%; border-right: 1px solid #eee;"> <?php echo lang("rate"); ?></th>
        <th style="text-align: right;  width: 20%; "> <?php echo lang("total"); ?></th>
    </tr>
    <?php
    foreach ($estimate_items as $item) {
        ?>
        <tr style="background-color: #f4f4f4; ">
            <td style="width: 45%; border: 1px solid #fff; padding: 10px;"><?php echo $item->title; ?>
                <br />
                <span style="color: #888; font-size: 90%;"><?php echo nl2br($item->description); ?></span>
            </td>
            <td style="text-align: center; width: 15%; border: 1px solid #fff;"> <?php echo $item->quantity . " " . $item->unit_type; ?></td>
            <td style="text-align: right; width: 20%; border: 1px solid #fff;"> <?php echo to_currency($item->rate, $item->currency_symbol); ?></td>
            <td style="text-align: right; width: 20%; border: 1px solid #fff;"> <?php echo to_currency($item->total, $item->currency_symbol); ?></td>
        </tr>
    <?php } ?>
    <tr>
        <td colspan="3" style="text-align: right;"><?php echo lang("total"); ?></td>
        <td style="text-align: right; width: 20%; border: 1px solid #fff; background-color: #f4f4f4;">
            <?php echo to_currency($estimate_total_summary->estimate_subtotal, $estimate_total_summary->currency_symbol); ?>
        </td>
    </tr>
    <?php if ($estimate_total_summary->tax) { ?>
        <tr>
            <td colspan="3" style="text-align: right;"><?php echo $estimate_total_summary->tax_name; ?></td>
            <td style="text-align: right; width: 20%; border: 1px solid #fff; background-color: #f4f4f4;">
                <?php echo to_currency($estimate_total_summary->tax, $estimate_total_summary->currency_symbol); ?>
            </td>
        </tr>
    <?php } ?>
    <?php if ($estimate_total_summary->tax2) { ?>
        <tr>
            <td colspan="3" style="text-align: right;"><?php echo $estimate_total_summary->tax_name2; ?></td>
            <td style="text-align: right; width: 20%; border: 1px solid #fff; background-color: #f4f4f4;">
                <?php echo to_currency($estimate_total_summary->tax2, $estimate_total_summary->currency_symbol); ?>
            </td>
        </tr>
    <?php } ?>
    <tr>
        <td colspan="3" style="text-align: right;"><?php echo lang("total"); ?></td>
        <td style="text-align: right; width: 20%; background-color: <?php echo $estimate_color; ?>; color: #fff;">
            <?php echo to_currency($estimate_total_summary->estimate_total, $estimate_total_summary->currency_symbol); ?>
        </td>
    </tr>
</table>

<br />
<br />
<div style="border-top: 2px solid #f2f2f2; color:#444;">
    <div><?php echo nl2br($estimate_info->note); ?></div>
</div>

<div style="margin-top: 15px;">
    <?php echo get_setting("estimate_footer"); ?>
</div>

