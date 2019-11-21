<?php echo $header; ?>
<style>
.mdp_box_size *{box-sizing: border-box;}
.md_box{max-width:800px;margin:20px auto;position:relative;}
.md_box a{cursor:pointer;}
.md_box a:not(.mdp_heading a){color:#008c23;font-size:15px;text-decoration:underline;}
.md_box a:hover{text-decoration:none;}
.mdp_heading{height:70px;position:relative;border:2px solid #00b32d;padding:10px 20px;}
.mdp_heading .heading_title{text-align:center;font:28px/50px Arial;}
.mdp_heading .heading_title a{font:28px/50px Arial;}
.mdp_heading .heading_title strong span{display:none;}
.button_status{position:absolute;top:21px;right:240px;}
.button_status input[type="checkbox"]+label{text-align:center;line-height:26px;color:#999;font-size:12px;}
.button_status input[type="checkbox"]:checked+label{color:#fff;}
.gotomodule{padding:0px 25px;font-size:14px;height:66px;line-height:66px;display:inline-block;background:#ffa64c;color:#fff!important;position:absolute;top:0px;left:0px;text-decoration:none;}
.green{padding:0px 25px;font-size:14px;height:66px;line-height:66px;display:inline-block;background:#00b32d;color:#fff!important;position:absolute;top:0px;right:0px;text-decoration:none;}
.green:hover{background:#238c00;}
.gotomodule:hover{background:#ff8000;}
#form{border:2px solid #00b32d;padding:10px 20px;border-top:0px;}
#form table{border-collapse:collapse;width:100%;}
#form table tr td{font-size:15px;border-bottom:1px solid #ccc;padding:10px 0;}
input[type="checkbox"]{display:none;}
input[type="checkbox"]+label{cursor:pointer;display:inline-block;width:30px;height:30px;border-radius:15px;background:#e8e8e8;border:2px solid #cccccc;}
input[type="checkbox"]:checked+label{background:#00b32d;border:2px solid #336600;}
.md_box input, .md_box textarea, .md_box select{border:1px solid #cccccc;width:100%;padding:0 10px;line-height:30px;height:30px;}
.md_box textarea{height:76px;padding:10px;line-height:20px;}
.md_box input:focus, .md_box textarea:focus, .md_box select:focus{border-color:#00b32d;outline:0px;}
.ib{display:inline-block;}
.placeholder_name{padding:5px 10px;background:#ccc;cursor:pointer;display:inline-block;max-width:122px;max-height:48px;overflow:hidden;}
.ib .placeholder_name+textarea{width:378px;display:none;position:absolute;}
.placeholder_name.opened{background:#00b32d;color:#fff;}
.placeholder_name.opened+textarea{border:1px solid #00b32d;}
#form table tr td.heading_table{text-align:center;color:#00b32d;font-size:20px;border-bottom:2px solid #00b32d;line-height:32px;}
#form table tr td.heading_table input[type="checkbox"]+label{text-align:center;line-height:26px;color:#999;font-size:12px;}
#form table tr td.heading_table input[type="checkbox"]:checked+label{color:#fff;}
td+td{width:50%;}
.table_head{cursor:pointer;position:relative;}
.table_head td{cursor:pointer;}
#form table.table_head.opened tr td.heading_table{color:#ffa64c;}
#form table.table_head:hover tr td.heading_table{color:#ffa64c;}
#form table.table_head:before{content:'+';font-size:24px;position:absolute;right:10px;top:10px;color:#00b32d;}
#form table.table_head.opened:before{content:'-';color:#ffa64c;font-size:30px;top:4px;}
span.help{margin:10px 0 0;}
span.placeholder_name{font-size:12px;}
.other_data input[type="checkbox"]+label{text-align:center;line-height:26px;color:#999;font-size:12px;}
.other_data input[type="checkbox"]:checked+label{color:#fff;}
.i{font-style:italic;font-size:12px!important;}
.red{color:#ff0000;}
.inline-div>div>div{display:inline-block;}
.inline-div>div>div:first-child{width:100px;padding-right:10px;text-align:right;}
<?php if($version2){ ?>
span.help{display:block;color:#777;font-size:12px;}
.other_data label{font-weight:400!important;}
<?php } ?>
</style>
<?php if($version2){ ?><?php echo $column_left; ?><?php } ?>
<div id="content" class="mdp_box_size">
	<div class="md_box">
		<div class="mdp_heading">
		  <a class="gotomodule" href="<?php echo $modules_link; ?>"><?php echo $button_cancel; ?></a>
		  <a onclick="$('#form').submit();" class="green mdp_button"><?php echo $button_save; ?></a>
		  <div class="heading_title"><?php echo $heading_title; ?></div>	  
		</div>	
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
			<?php if(!$config_microdata_license_key){ ?>
				<div style="font-size:22px;text-align:center;"><?php echo $text_no_active; ?></div>
			<?php }else{ ?>
			<?php if($old_microdata){ ?> 
				<table id="old_microdata_block">
				  <tr>
					<td class="red"><?php echo $text_old_microdata; ?><br><a id="clear_old"><?php echo $text_clear; ?></a></td>
					<td class="i">
						<?php foreach($old_microdata as $file){ ?>
							<?php echo $file; ?><br>
						<?php } ?>
					</td>
				  </tr>	
				</table>
			<?php } ?>			
			<div class="button_status">
				<input type="checkbox" name="config_microdata_status" value="1" <?php if ($config_microdata_status) { $stat_text = 'ON'; ?>checked="checked"<?php }else{$stat_text = 'OFF';} ?> id="status"><label for="status" ><?php echo $stat_text; ?></label>
			</div>
			<table>
				<tr>
				  <td><a href="https://microdata.pro/blog/open-graph" target="_blank"><?php echo $text_opengraph; ?></a><?php echo $text_opengraph_h; ?></td>
				  <td><input type="checkbox" name="config_microdata_opengraph" value="1" <?php if ($config_microdata_opengraph) { ?>checked="checked"<?php } ?> id="opengraph"><label for="opengraph"></label></td>
				</tr>
				<tr>
				  <td><a href="https://microdata.pro/about/how-to-customize#howto13" target="_blank" title="<?php echo $text_info_title; ?>"><?php echo $text_meta_desc; ?></a><?php echo $text_meta_desc_h; ?></td>
				  <td><input type="checkbox" name="config_description_meta" value="1" <?php if ($config_description_meta) { ?>checked="checked"<?php } ?> id="opengraph_meta"><label for="opengraph_meta"></label></td>
				</tr>				
				<tr>
					<td><a target="_blank" href="https://microdata.pro/blog/twitter-cards"><?php echo $text_twitter_account; ?></a><?php echo $text_twitter_account_h; ?></td>
					<td><input type="text" name="config_microdata_twitter_account" placeholder="@account" value="<?php echo $config_microdata_twitter_account; ?>"></td>
				</tr>			
			</table>
			<table class="table_head opened" id="_company">	
				<tr>
					<td colspan="2" class="heading_table"><span data-id="_company"><?php echo $text_company; ?></span> <input type="checkbox" name="config_company" value="1" <?php if ($config_company) { $company_text = 'ON'; ?>checked="checked"<?php }else{$company_text = 'OFF';} ?> id="company"><label for="company"><?php echo $company_text; ?></label></td>
				</tr>				
			</table>	
			<table>			
				<tr>
				  <td><a href="https://microdata.pro/blog/hcard" target="_blank" title="<?php echo $text_info_title; ?>"><?php echo $text_config_hcard; ?></a><?php echo $text_config_hcard_h; ?></td>
				  <td><input type="checkbox" name="config_hcard" value="1" <?php if ($config_hcard) { ?>checked="checked"<?php } ?> id="hcard"><label for="hcard"></label></td>
				</tr>
				<tr>
				  <td><a href="https://microdata.pro/blog/microdata-vs-json-ld" target="_blank" title="<?php echo $text_info_title; ?>"><?php echo $text_company_syntax; ?></a><?php echo $text_company_syntax_h; ?></td>
				  <td>
					<select name="config_company_syntax">
						<option value="all" <?php if($config_company_syntax == 'all'){ ?>selected="selected"<?php } ?>><?php echo $text_company_syntax_all; ?></option>
						<option value="ld" <?php if($config_company_syntax == 'ld'){ ?>selected="selected"<?php } ?>><?php echo $text_company_syntax_ld; ?></option>
						<option value="md" <?php if($config_company_syntax == 'md'){ ?>selected="selected"<?php } ?>><?php echo $text_company_syntax_md; ?></option>
					</select>
				  </td>
				</tr>
				<tr>
				  <td><?php echo $text_email; ?></td>
				  <td>
					<input name="config_microdata_email" placeholder="<?php echo $email; ?>" value="<?php echo $config_microdata_email; ?>">
				  </td>
				</tr>
				<tr>
				  <td><?php echo $text_oh; ?></td> 
				  <td class="inline-div">
					<div><div><?php echo $text_monday; ?></div><div><input type="text" name="config_microdata_oh_1" value="<?php echo $config_microdata_oh_1; ?>" placeholder="10:00-20:00"></div></div>
					<div><div><?php echo $text_tuesday; ?></div><div><input type="text" name="config_microdata_oh_2" value="<?php echo $config_microdata_oh_2; ?>" placeholder="10:00-20:00"></div></div>
					<div><div><?php echo $text_wednesday; ?></div><div><input type="text" name="config_microdata_oh_3" value="<?php echo $config_microdata_oh_3; ?>" placeholder="10:00-20:00"></div></div>
					<div><div><?php echo $text_thursday; ?></div><div><input type="text" name="config_microdata_oh_4" value="<?php echo $config_microdata_oh_4; ?>" placeholder="10:00-20:00"></div></div>
					<div><div><?php echo $text_friday; ?></div><div><input type="text" name="config_microdata_oh_5" value="<?php echo $config_microdata_oh_5; ?>" placeholder="10:00-20:00"></div></div>
					<div><div><?php echo $text_saturday; ?></div><div><input type="text" name="config_microdata_oh_6" value="<?php echo $config_microdata_oh_6; ?>" placeholder="10:00-18:00"></div></div>
					<div><div><?php echo $text_sunday; ?></div><div><input type="text" name="config_microdata_oh_7" value="<?php echo $config_microdata_oh_7; ?>" placeholder="10:00-18:00"></div></div>
				  </td>
				</tr>				
				<tr>
				  <td><a href="https://microdata.pro/about/how-to-customize#howto1" target="_blank" title="<?php echo $text_info_title; ?>"><?php echo $text_entry_telephone; ?></a><?php echo $text_entry_telephone_h; ?></td>
				  <td>
					<div class="first">
					<span class="placeholder_name"><?php echo $store_name; ?></span>
					<textarea name="config_microdata_phones" cols="40" rows="5" placeholder="+12-345-678-90-00,+34-555-678-11-11"><?php echo $config_microdata_phones; ?></textarea></div>
					<?php if($stores){ ?>
						<?php foreach($stores as $store){ ?>
							<div class="ib">
							<span class="placeholder_name"><?php echo $store['name']; ?></span>
							<textarea name="config_microdata_phones<?php echo $store['store_id']; ?>" cols="40" rows="5" placeholder="+12-345-678-90-00,+34-555-678-11-11"><?php echo $store['config_microdata_phones']; ?></textarea></div>
						<?php } ?>					
					<?php } ?>
				  </td>
				</tr>				
				<tr>
				  <td><a href="https://microdata.pro/about/how-to-customize#howto2" target="_blank" title="<?php echo $text_info_title; ?>"><?php echo $text_entry_group; ?></a><?php echo $text_entry_group_h; ?></td>
				  <td>
					<div class="first">
					<span class="placeholder_name"><?php echo $store_name; ?></span>
					<textarea name="config_microdata_groups" cols="40" rows="5" placeholder="https://vk.com/group, https://twitter.com/group"><?php echo $config_microdata_groups; ?></textarea></div>
					<?php if($stores){ ?>
						<?php foreach($stores as $store){ ?>
							<div class="ib">
							<span class="placeholder_name"><?php echo $store['name']; ?></span>
							<textarea name="config_microdata_groups<?php echo $store['store_id']; ?>" cols="40" rows="5" placeholder="https://vk.com/group, https://twitter.com/group"><?php echo $store['config_microdata_groups']; ?></textarea></div>
						<?php } ?>
					<?php } ?>
				  </td>
				</tr>
				<tr>
				  <td><a href="https://microdata.pro/blog/yandex-maps-get-latitude-longitude" target="_blank" title="<?php echo $text_info_title; ?>"><?php echo $text_entry_address; ?></a><?php echo $text_entry_address_h; ?></td>
				  <td>
					<div class="first">
					<span class="placeholder_name"><?php echo $store_name; ?></span>
					<textarea name="config_microdata_locations" cols="40" rows="5" placeholder="50.501090;30.496714//Москва, Россия//ул. Гагарина 54//012345"><?php echo $config_microdata_locations; ?></textarea></div>
					<?php if($stores){ ?>
						<?php foreach($stores as $store){ ?>
							<div class="ib">
							<span class="placeholder_name"><?php echo $store['name']; ?></span>
							<textarea name="config_microdata_locations<?php echo $store['store_id']; ?>" cols="40" rows="5" placeholder="50.501090;30.496714/Москва, Россия/ул. Гагарина 54/012345"><?php echo $store['config_microdata_locations']; ?></textarea></div>
						<?php } ?>
					<?php } ?>
				  </td>
				</tr>				
				<tr>
				  <td><?php echo $text_entry_map; ?><?php echo $text_entry_map_h; ?></td>
				  <td>
					<div class="first">
					<span class="placeholder_name"><?php echo $store_name; ?></span>
					<textarea name="config_microdata_map" cols="40" rows="5" placeholder="https://www.google.ru/maps/place/Москва/@55.7647764,37.6009499,17.37z/data=!4m5!3m4!1s0x46b54afc73d4b0c9:0x3d44d6cc5757cf4c!8m2!3d55.755826!4d37.6173"><?php echo $config_microdata_map; ?></textarea></div>
					<?php if($stores){ ?>
						<?php foreach($stores as $store){ ?>
							<div class="ib">
							<span class="placeholder_name"><?php echo $store['name']; ?></span>
							<textarea name="config_microdata_map<?php echo $store['store_id']; ?>" cols="40" rows="5" placeholder="https://www.google.ru/maps/place/Москва/@55.7647764,37.6009499,17.37z/data=!4m5!3m4!1s0x46b54afc73d4b0c9:0x3d44d6cc5757cf4c!8m2!3d55.755826!4d37.6173"><?php echo $store['config_microdata_map']; ?></textarea></div>
						<?php } ?>
					<?php } ?>
				  </td>
				</tr>
			</table>
			<table class="table_head opened" id="_product">
				<tr>
					<td colspan="2" class="heading_table"><span data-id="_product"><?php echo $text_product_page; ?></span> <input type="checkbox" name="config_product_page" value="1" <?php if ($config_product_page) { $product_text = 'ON'; ?>checked="checked"<?php }else{$product_text = 'OFF';} ?> id="product_page"><label for="product_page"><?php echo $product_text; ?></label></td>
				</tr>
			</table>
			<table>
				<tr>
				  <td><a href="https://microdata.pro/blog/microdata-vs-json-ld" target="_blank" title="<?php echo $text_info_title; ?>"><?php echo $text_syntax; ?></a><?php echo $text_company_syntax_h; ?></td>
				  <td>
					<select name="config_product_syntax">
						<option value="all" <?php if($config_product_syntax == 'all'){ ?>selected="selected"<?php } ?>><?php echo $text_company_syntax_all; ?></option>
						<option value="ld" <?php if($config_product_syntax == 'ld'){ ?>selected="selected"<?php } ?>><?php echo $text_company_syntax_ld; ?></option>
						<option value="md" <?php if($config_product_syntax == 'md'){ ?>selected="selected"<?php } ?>><?php echo $text_company_syntax_md; ?></option>
					</select>
				  </td>
				</tr>
				<tr>
				  <td><a href="https://microdata.pro/blog/breadcrumbs" target="_blank" title="<?php echo $text_info_title; ?>"><?php echo $text_breadcrumb; ?></a></td> 
				  <td><input type="checkbox" name="config_product_breadcrumb" value="1" <?php if ($config_product_breadcrumb) { ?>checked="checked"<?php } ?> id="product_breadcrumb"><label for="product_breadcrumb"></label></td>
				</tr>
				<tr>
				  <td><a href="https://microdata.pro/about/how-to-customize#howto15" target="_blank" title="<?php echo $text_info_title; ?>"><?php echo $text_hide_price; ?></a></td> 
				  <td><input type="checkbox" name="config_microdata_hide_price" value="1" <?php if ($config_microdata_hide_price) { ?>checked="checked"<?php } ?> id="product_hide_price"><label for="product_hide_price"></label></td>
				</tr>				
				<tr>
				  <td><a href="https://microdata.pro/about/how-to-customize#howto12" target="_blank" title="<?php echo $text_info_title; ?>"><?php echo $text_other_data; ?></a><?php echo $text_other_data_h; ?></td>
				  <td class="other_data">
					<input type="checkbox" name="config_microdata_sku" value="1" <?php if ($config_microdata_sku) { ?>checked="checked"<?php } ?> id="sku"><label for="sku">sku</label>
					<input type="checkbox" name="config_microdata_upc" value="1" <?php if ($config_microdata_upc) { ?>checked="checked"<?php } ?> id="upc"><label for="upc">upc</label>
					<input type="checkbox" name="config_microdata_ean" value="1" <?php if ($config_microdata_ean) { ?>checked="checked"<?php } ?> id="ean"><label for="ean">ean</label>
					<input type="checkbox" name="config_microdata_mpn" value="1" <?php if ($config_microdata_mpn) { ?>checked="checked"<?php } ?> id="mpn"><label for="mpn">mpn</label>
					<input type="checkbox" name="config_microdata_isbn" value="1" <?php if ($config_microdata_isbn) { ?>checked="checked"<?php } ?> id="isbn"><label for="isbn">isbn</label>	
				  </td>
				</tr>
				<tr>
				  <td><a href="https://microdata.pro/about/how-to-customize#howto7" target="_blank" title="<?php echo $text_info_title; ?>"><?php echo $text_reviews; ?></a></td>
				  <td><input type="checkbox" name="config_product_reviews" value="1" <?php if ($config_product_reviews) { ?>checked="checked"<?php } ?> id="product_reviews"><label for="product_reviews"></label></td>
				</tr>
				<tr>
				  <td><a href="https://microdata.pro/about/how-to-customize#howto8" target="_blank" title="<?php echo $text_info_title; ?>"><?php echo $text_related; ?></a></td>
				  <td><input type="checkbox" name="config_product_related" value="1" <?php if ($config_product_related) { ?>checked="checked"<?php } ?> id="product_related"><label for="product_related"></label></td>
				</tr>
				<tr>
				  <td><a href="https://microdata.pro/about/how-to-customize#howto9" target="_blank" title="<?php echo $text_info_title; ?>"><?php echo $text_attribute; ?></a></td>
				  <td><input type="checkbox" name="config_product_attribute" value="1" <?php if ($config_product_attribute) { ?>checked="checked"<?php } ?> id="product_attribute"><label for="product_attribute"></label></td>
				</tr>				
				<tr>
				  <td><a href="https://microdata.pro/about/how-to-customize#howto10" target="_blank" title="<?php echo $text_info_title; ?>"><?php echo $text_in_stock; ?></a><?php echo $text_in_stock_h; ?></td>
				  <td><input type="checkbox" name="config_product_in_stock" value="1" <?php if ($config_product_in_stock) { ?>checked="checked"<?php } ?> id="product_in_stock"><label for="product_in_stock"></label></td>
				</tr>
				<tr>
				  <td><a href="https://microdata.pro/about/how-to-customize#howto11" target="_blank" title="<?php echo $text_info_title; ?>"><?php echo $text_in_stock_status; ?></a><?php echo $text_in_stock_status_h; ?></td>
					  <td>
						  <select name="config_in_stock_status_id">
							<option value="0" <?php if(!$stock_status_id){ ?>selected="selected"<?php } ?>>---</option>
							<?php foreach ($stock_statuses as $stock_status) { ?>
							<?php if ($stock_status['stock_status_id'] == $stock_status_id) { ?>
							<option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
							<?php } else { ?>
							<option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
							<?php } ?>
							<?php } ?>
						  </select>							  
					  </td>
				</tr>
			</table>
			
			<table class="table_head opened" id="_category">				
				<tr>
					<td colspan="2" class="heading_table"><span data-id="_category"><?php echo $text_category_page; ?></span> <input type="checkbox" name="config_category" value="1" <?php if ($config_category) { $info_text = 'ON'; ?>checked="checked"<?php }else{$info_text = 'OFF';} ?> id="category_page"><label for="category_page"><?php echo $info_text; ?></label></td>
				</tr>
			</table>
			<table>				
				<tr>
				  <td><a href="https://microdata.pro/blog/microdata-vs-json-ld" target="_blank" title="<?php echo $text_info_title; ?>"><?php echo $text_syntax; ?></a><?php echo $text_company_syntax_h; ?></td>
				  <td>
					<select name="config_category_syntax">
						<option value="all" <?php if($config_category_syntax == 'all'){ ?>selected="selected"<?php } ?>><?php echo $text_company_syntax_all; ?></option>
						<option value="ld" <?php if($config_category_syntax == 'ld'){ ?>selected="selected"<?php } ?>><?php echo $text_company_syntax_ld; ?></option>
						<option value="md" <?php if($config_category_syntax == 'md'){ ?>selected="selected"<?php } ?>><?php echo $text_company_syntax_md; ?></option>
					</select>
				  </td>
				</tr>
			</table>
			
			<table class="table_head opened" id="_manufacturer">				
				<tr>
					<td colspan="2" class="heading_table"><span data-id="_manufacturer"><?php echo $text_manufacturer_page; ?></span> <input type="checkbox" name="config_manufacturer" value="1" <?php if ($config_manufacturer) { $info_text = 'ON'; ?>checked="checked"<?php }else{$info_text = 'OFF';} ?> id="manufacturer_page"><label for="manufacturer_page"><?php echo $info_text; ?></label></td>
				</tr>
			</table>
			<table>				
				<tr>
				  <td><a href="https://microdata.pro/blog/microdata-vs-json-ld" target="_blank" title="<?php echo $text_info_title; ?>"><?php echo $text_syntax; ?></a><?php echo $text_company_syntax_h; ?></td>
				  <td>
					<select name="config_manufacturer_syntax">
						<option value="all" <?php if($config_manufacturer_syntax == 'all'){ ?>selected="selected"<?php } ?>><?php echo $text_company_syntax_all; ?></option>
						<option value="ld" <?php if($config_manufacturer_syntax == 'ld'){ ?>selected="selected"<?php } ?>><?php echo $text_company_syntax_ld; ?></option>
						<option value="md" <?php if($config_manufacturer_syntax == 'md'){ ?>selected="selected"<?php } ?>><?php echo $text_company_syntax_md; ?></option>
					</select>
				  </td>
				</tr>
			</table>			
			
			<table class="table_head opened" id="_info">				
				<tr>
					<td colspan="2" class="heading_table"><span data-id="_info"><?php echo $text_info_page; ?></span> <input type="checkbox" name="config_information_page" value="1" <?php if ($config_information_page) { $info_text = 'ON'; ?>checked="checked"<?php }else{$info_text = 'OFF';} ?> id="information_page"><label for="information_page"><?php echo $info_text; ?></label></td>
				</tr>
			</table>
			<table>				
				<tr>
				  <td><a href="https://microdata.pro/blog/microdata-vs-json-ld" target="_blank" title="<?php echo $text_info_title; ?>"><?php echo $text_syntax; ?></a><?php echo $text_company_syntax_h; ?></td>
				  <td>
					<select name="config_information_syntax">
						<option value="all" <?php if($config_information_syntax == 'all'){ ?>selected="selected"<?php } ?>><?php echo $text_company_syntax_all; ?></option>
						<option value="ld" <?php if($config_information_syntax == 'ld'){ ?>selected="selected"<?php } ?>><?php echo $text_company_syntax_ld; ?></option>
						<option value="md" <?php if($config_information_syntax == 'md'){ ?>selected="selected"<?php } ?>><?php echo $text_company_syntax_md; ?></option>
					</select>
				  </td>
				</tr>				
				<tr>
				  <td><a href="https://microdata.pro/blog/breadcrumbs" target="_blank" title="<?php echo $text_info_title; ?>"><?php echo $text_breadcrumb; ?></a></td>
				  <td><input type="checkbox" name="config_information_breadcrumb" value="1" <?php if ($config_information_breadcrumb) { ?>checked="checked"<?php } ?> id="information_breadcrumb"><label for="information_breadcrumb"></label></td>
				</tr>					
			</table>
			
			<table class="table_head opened" id="_information">				
				<tr>
					<td colspan="2" class="heading_table"><span data-id="_information"><?php echo $text_information; ?></span></td>
				</tr>
			</table>
			<table>
				<tr>
				  <td><?php echo $text_faq; ?><?php echo $text_faq_h; ?></td>
				  <td><a href="https://microdata.pro/faq/" target="_blank">https://microdata.pro/faq/</a></td>
				</tr>
				<tr>
				  <td><?php echo $text_check; ?><?php echo $text_check_h; ?></td>
				  <td>
					<a target="_blank" href="https://search.google.com/structured-data/testing-tool/#url=<?php echo $site_url; ?>">Google structured data testing tool</a><br>
					<a target="_blank" href="https://webmaster.yandex.ru/tools/microtest/">Валидатор микроразметки Яндекс.Вебмастер</a>
				  </td>
				</tr>
				<tr>
				  <td><?php echo $text_contacts; ?><?php echo $text_contacts_h; ?></td>
				  <td>
					<?php echo $text_email; ?> <a href="mailto:info@microdata.pro">info@microdata.pro</a><br>
					<?php echo $text_site; ?> <a href="https://microdata.pro" target="_blank">https://microdata.pro</a><br>
				  </td>
				</tr>					
			</table>
			<?php } ?>
			<input type="hidden" name="config_microdata_license_key" value="<?php echo $config_microdata_license_key; ?>" >
		</form>
		<script>
			$('[for="status"], [for="company"], [for="product_page"], [for="category_page"], [for="information_page"]').on("click", function(){
				if($(this).parent().find('[type="checkbox"]:checked').length > 0){
					$(this).text("OFF");
				}else{
					$(this).text("ON");
				}
			});
			$(".ib .placeholder_name").on("click", function(){
				if($(this).hasClass("opened")){
					$(this).removeClass("opened");
					$(this).parent().find('textarea').slideUp('100');				
				}else{
					$(this).addClass("opened");
					$(this).parent().find('textarea').slideDown('200');			
				}
			});
			$(".table_head span").on("click", function(){
				id = $(this).data("id");
				if($("#"+id).hasClass("opened")){
					$("#"+id).removeClass("opened");
					$("#"+id).next('table').slideUp(200);				
				}else{
					$("#"+id).addClass("opened");
					$("#"+id).next('table').slideDown(200);			
				}
			});
			
			function sub() {      
				$('#old_microdata_block').slideUp('600');   
			}		
			
			$('#clear_old').click(function(){
				$.ajax({
					url: 'index.php?route=module/microdatapro/clear_old&token=<?php echo $token; ?>',
					type: 'post',
					dataType: 'json',
					success: function(succ){
						$('.red').text("<?php echo $text_success_removed; ?>");
						setTimeout(sub, 4000);
					}
				});			
			});			
		</script>
	</div>
</div>
<?php echo $footer; ?>