<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Prokazi - mail</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
<div>

<div style="font-size: 26px;font-weight: 700;letter-spacing: -0.02em;line-height: 32px;color: #41637e;font-family: sans-serif;text-align: center" align="center" id="emb-email-header"><img style="border: 0;-ms-interpolation-mode: bicubic;display: block;Margin-left: auto;Margin-right: auto;max-width: 158px" src="http://pro.teamkazi.com/files/system/default-stie-logo.png" alt="ProKazi"></div>

<p style="Margin-top: 0;color: #565656;font-family: Georgia,serif;font-size: 16px;line-height: 25px;Margin-bottom: 25px">Hey <?= $username;?>,</p> 

<p style="Margin-top: 0;color: #565656;font-family: Georgia,serif;font-size: 16px;line-height: 25px;Margin-bottom: 25px"> Your Petty Cash Request amounting to <?= $amount;?> for <?= $petty_cash_type;?>, requested on <?= $request_date;?> has been <?= $status; ?></p>

</div>
</body>
</html>