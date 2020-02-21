<!-- Google Code for xcraft.com.ua Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 967874041;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "DyUJCPus4HMQ-avCzQM";
var google_remarketing_only = false;
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>

<script src="https://apis.google.com/js/platform.js?onload=renderOptIn" async defer></script>

<script>
  window.renderOptIn = function() {
   
    window.gapi.load('surveyoptin', function() {
      window.gapi.surveyoptin.render(
        {
          // REQUIRED FIELDS
          "merchant_id": 117800038,
          "order_id": "<?php echo $order_id?>",
          "email": "<?php echo $customer_email?>",
          "delivery_country": "ua",
          "estimated_delivery_date":"<?php echo $estimated_delivery_date?>"        
        });
    });
  }

</script>

<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/967874041/?label=DyUJCPus4HMQ-avCzQM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <?php echo $text_message; ?>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>