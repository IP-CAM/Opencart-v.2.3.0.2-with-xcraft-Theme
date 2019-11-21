$(function (){

//Купить в один клик
$('.product-layout > .product-thumb').each(function (e){
	e +=1;

	var img_url = $(this).find('.img-responsive').attr('src'), 
		item_name = $(this).find('h4 a').text(), 
		item_price = $(this).find('.price').html(); 
		admin = $('#callback [name=admin_email]').attr('value'); 
		
        buy_one_click = document.firstElementChild.lang == 'ua'? 'Замовити в один клік': 'Купить в один клик'; //переменная для текста на кнопке заказа в один клик
        text_button_order = document.firstElementChild.lang == 'ua'? 'Замовити': 'Заказать';//переменная для текста на кнопке заказа
        success_order = document.firstElementChild.lang == 'ua'? 'Дякуємо за заявку!': 'Спасибо за заявку!';


$(this).after('\
	<div id="pp-item-' + e +'" class="product-popup">\
		<h2>'+ buy_one_click +'</h2>\
		<div class="pp-mg-wrap"><img src="'+ img_url +'" alt="Xcraft"></div>\
		<div class="pp-content">\
			<h3>'+ item_name + '</h3>\
			<p> '+ item_price +' </>\
			<form  class="ajax-form">\
				<input type="hidden" name="project_name" value="Xcraft">\
				<input type="hidden" name="admin_email" value="'+ admin +'">\
				<input type="hidden" name="form_subject" value="Заявка">\
				<input type="hidden" name="Продукт" value="'+ item_name +'">\
				<div style="color: #ea5a5a;"></div>\
				 <input id="mob_phone"  class="form-control" type="text" name="Phone" placeholder="Ваш телефон" required>\
				 <div class="btn btn-primary not-real hidden">'+ text_button_order +'</div>\
				 <button class="btn btn-primary btn-order">'+ text_button_order +'</button>\
			</form>\
			<div class="success">'+ success_order +'</div>\
		</div>\
	</div');

	$(this).find('.button-group').append('<a class="button toclick" href="#pp-item-'+ e + '">'+ buy_one_click +'</a>');

	$(this).parent().attr({
		'class' : 'product-layout col-lg-4 col-md-4 col-sm-6 col-xs-12'
	});


});

$('#mob_phone').blur(function(){
	$('.btn-order').removeClass('hidden');
	var phoneV = $('#mob_phone').val();
	var phoneLnght = phoneV.length;

	if(/[^0-9]/.test(phoneV) ){
		// $('#mob_phone').addClass('notValid');
		$('.btn-order').addClass('hidden');
		$('.not-real').removeClass('hidden');
		$(this).prev().text('Введите только цифры');
	}else if(phoneLnght <= 5){
		// $('#mob_phone').addClass('notValid');
		$('.btn-order').addClass('hidden');
		$('.not-real').removeClass('hidden');
		$(this).prev().text('Направильно введен номер телефона');
	}else{
		// $('mob_phone').addClass('valid');
		$('.btn-order').removeClass('hidden');
		$('.not-real').addClass('hidden');
		$(this).prev().text('');
	}
});



$('.product-thumb h4').css('.height', '').equalHeights();

$('.toclick, .callback').magnificPopup({
		mainClass: 'mfp-zoom-in', 
		removalDelay: 500
	});

	$(".ajax-form").submit(function() { //Change
		var th = $(this);
		$.ajax({
			type: "POST",
			url: "/catalog/view/theme/xcraft/mail.php", //Change
			data: th.serialize()
		}).done(function() {
			var pp_succ = th.closest('.product-popup').find('.success')
			pp_succ.fadeIn();
			setTimeout(function() {
				// Done Functions
				th.trigger("reset");
				pp_succ.fadeOut();
				$.magnificPopup.close();
			}, 2000);
		});
		return false;
	});

});

