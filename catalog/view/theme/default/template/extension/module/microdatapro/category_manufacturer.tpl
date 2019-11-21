<?php if($breadcrumbs){ ?>
<!--microdatapro <?php echo $version; ?> breadcrumb start [microdata & json-ld] -->
<?php if($syntax == "ld" or $syntax == "all"){ ?>
<script type="application/ld+json">
{
"@context": "http://schema.org",
"@type": "BreadcrumbList",
"itemListElement": [<?php foreach ($breadcrumbs as $key => $breadcrumb) { ?>{
"@type": "ListItem",
"position": <?php echo $key; ?>,
"item": {
"@id": "<?php echo $breadcrumb['href']; ?>",
"name": "<?php echo $breadcrumb['text']; ?>"
}
}<?php if($key != count($breadcrumbs)){ ?>,<?php } ?><?php } ?>]
}	  
</script>
<?php } ?>
<?php if($syntax == "md" or $syntax == "all"){ ?>
<span itemscope itemtype="http://schema.org/BreadcrumbList">
<?php foreach ($breadcrumbs as $key => $breadcrumb) { ?>
<span itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
<link itemprop="item" href="<?php echo $breadcrumb['href']; ?>">
<meta itemprop="name" content="<?php echo $breadcrumb['text']; ?>" />
<meta itemprop="position" content="<?php echo $key; ?>" />
</span>
<?php } ?>
</span>
<?php } ?>
<!--microdatapro <?php echo $version; ?> breadcrumb end [microdata & json-ld] -->
<?php } ?>