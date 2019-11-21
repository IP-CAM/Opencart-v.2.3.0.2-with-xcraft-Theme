<footer class="main-footer">


  <div class="footer-cnt">
    <div class="container">
      <div class="row">
        
        <div class="col-md-3 col-sm-6 logo-footer">
          <?php if ($logo) {?>
            <a href="<?php echo $home; ?>">
              <img src="<?php echo $logo; ?>" alt="<?php echo $name; ?>" class="img-responsive">
            </a>
          <?php }?>
        </div>

        <div class=" footer-mn">
          <nav class="footer-menu">
            <?php if ($informations) { ?>
              <div>
                <ul class="list-unstyled list-inline nav-inf">
                  <?php foreach ($informations as $information) { ?>
                  <li><a class="magic-hover" href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?> </a></li>
                  <?php } ?>
                  <li><a class="magic-hover" href="<?php echo $contact; ?>"><?php echo $text_svyaz_footer; ?></a></li>
                </ul>
              </div>
            <?php } ?>
          </nav>
        </div>
       </div>
<!--       <div class="col-md-2 col-sm-6">
        <nav class="nav-social">
          <ul>
            <li>
                <a href="http://facebook.com" rel="nofollow" target="_blank"><i class="fa fa-facebook-f"></i></a>  nofollow  для улучшения индексации и уменьшения веса страницы, открывает страницу в новой вкладке
            </li>

          </ul>
        </nav>

       
      </div> -->

    </div>
  </div>

  <div class="footer-phone">
    <div class="container">
      <div class="col-sm-12">
        <div class="site-phone_wrap">
          <div class="site-phone"><?php echo $telephone; ?></div>
          <a href="#callback" class="callback">Заказать звонок</a>
        </div>
      </div>
    </div>
  </div>

</footer>

      <div id="callback" class="callback-form product-popup">

            <h3>Заказать звонок</h3>
            <p>Введите номер телефона</p>

          <form class="ajax-form">
            <!-- Hidden Required Fields -->
            <input type="hidden" name="project_name" value="Xcraft">
            <input type="hidden" name="admin_email" value="<?php echo $email; ?>">
            <input type="hidden" name="form_subject" value="Заявка">
            <!-- END Hidden Required Fields -->

            <input class="form-control" type="text"  name="Phone"  placeholder="Ваш телеф" pattern="[0-9]{9,11}" required>
            <div class="btn btn-primary not-real hidden" style="margin-top: 20px;">Заказать</div>
            <button class="btn btn-primary">Заказать</button>
          </form>
          <div class="success">Спасибо за заявку!</div>
      </div>


<!-- Код тега ремаркетинга Google -->
<!--------------------------------------------------
С помощью тега ремаркетинга запрещается собирать информацию, по которой можно идентифицировать личность пользователя. Также запрещается размещать тег на страницах с контентом деликатного характера. Подробнее об этих требованиях и о настройке тега читайте на странице http://google.com/ads/remarketingsetup.
--------------------------------------------------->
<script type="text/javascript">
var google_tag_params = {
ecomm_prodid: 'REPLACE_WITH_VALUE',
ecomm_pagetype: 'REPLACE_WITH_VALUE',
ecomm_totalvalue: 'REPLACE_WITH_VALUE',
};
</script>
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 967874041;
var google_custom_params = window.google_tag_params;
var google_remarketing_only = true;
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/967874041/?guid=ON&amp;script=0"/>
</div>
</noscript>


<?php echo $microdatapro; ?>
</body>
</html>