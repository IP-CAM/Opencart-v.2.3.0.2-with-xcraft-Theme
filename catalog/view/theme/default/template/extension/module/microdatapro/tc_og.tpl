<?php if($twitter){ ?>
<!--microdatapro <?php echo $version; ?> twitter cards start -->
<meta name="twitter:card" content="summary" />
<meta name="twitter:creator" content="<?php echo $twitter_account; ?>" />
<meta name="twitter:title" content="<?php echo $title; ?>" />
<meta name="twitter:description" content="<?php echo $description; ?>" />
<meta name="twitter:image" content="<?php echo $image; ?>" />
<!--microdatapro <?php echo $version; ?> twitter cards end -->
<?php } ?>
<?php if($opengraph){ ?>
<!--microdatapro <?php echo $version; ?> open graph start -->
<meta property="og:type" content="website" />
<meta property="og:title" content="<?php echo $title; ?>" />
<meta property="og:description" content="<?php echo $description; ?>" />
<meta property="og:image" content="<?php echo $image; ?>" />
<meta property="og:url" content="<?php echo $url; ?>" />
<!--microdatapro <?php echo $version; ?> open graph end -->
<?php } ?>