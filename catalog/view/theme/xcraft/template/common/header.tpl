<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<!-- <meta name="keywords" content= "<?php echo $keywords; ?>" /> -->
<link rel="canonical" href="<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<link href="catalog/view/javascript/jquery/magnific/magnific-popup.css" rel="stylesheet">
<link href="catalog/view/theme/xcraft/stylesheet/stylesheet.css" rel="stylesheet">
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<script src="catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js"></script>
<script src="catalog/view/theme/xcraft/js/main.js" type="text/javascript"></script>
<script src="bower_components/equalheights/equalheights.js" type="text/javascript"></script>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
  ga('create', 'UA-104126611-1', 'auto');
  ga('send', 'pageview');
</script>
</head>
<body class="<?php echo $class; ?>">
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
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/967874041/?label=DyUJCPus4HMQ-avCzQM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
<header>
<nav id="top">
  <div class="container">
    <?php echo $currency; ?>
    <!--<?php echo $language; ?>-->
  <div class="col-sm-5 top-search">
    <?php echo $search; ?>
   </div>
    <div id="top-links" class="nav pull-right">
      <ul class="list-inline">
        <!--<li><a class="magic-hover" href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_wishlist; ?></span></a></li>-->
        <li><a class="magic-hover" href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><span class=""> <?php echo $cart; ?></span></a></li>
        <!--<li><a class="magic-hover" href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>-->
      </ul>
    </div>
  </div>
</nav>
  <div class="container">
      <div class="row">
        <div class="col-sm-3">
          <div id="logo">
            <?php if ($logo) { ?>
            <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?> - отладочные платы" alt="<?php /*echo $name; */?> development board kit " class="img-responsive" /></a>
            <?php } else { ?>
            <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
            <?php } ?>
            <p><?php echo $text_magazin; ?></p>
          </div>
        </div>
        <div class="col-sm-6">
       <!-- <h4 class="slogan">Делайте мир интересней вместе с инструментами нашего интернет-магазина!</h4> -->
       <h4 class="slogan"><?php echo $text_slogan; ?></br><?php echo $text_slogan2; ?></h4>
     </div>
            <div class="col-sm-3 inform">
          <div class="inform-item">
              <ul class="head-telephone">
                <li><i class="glyphicon glyphicon-phone-alt"></i><span class=""><?php echo $telephone; ?></span></li>
                <li><i class="glyphicon glyphicon-envelope"></i><span class=""> order@xcraft.com.ua</span></li>
              </ul>
          </div>
          <div class="inform-item">
                <strong><?php echo $store; ?></strong><br />
                <address><?php echo $address; ?></address>
          </div>  
           <div class="inform-item our-work">  
                <?php if ($open) { ?>
                <!--<strong><?php echo $text_open; ?></strong><br />-->
                <?php echo $open; ?><br />
                <br />
                <?php } ?>
          </div>
        </div>
    </div>
  </div>
    <div class="container info hidden-sm hidden-xs">
      <?php if ($informations) { ?>
      <div>
        <ul class="list-unstyled list-inline nav-inf">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?> </a></li>
          <?php } ?>
          <li><a href="<?php echo $contact; ?>"><?php echo $text_svyaz; ?></i></a></li>
        </ul>
      </div>
      <?php } ?>
    </div>
</header>
