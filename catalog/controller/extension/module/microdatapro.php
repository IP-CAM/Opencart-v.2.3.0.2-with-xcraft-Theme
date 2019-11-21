<?php
require_once(DIR_SYSTEM . 'library/microdatapro.php');

class ControllerExtensionModuleMicrodataPro extends Controller {

	public function __construct($registry) {
		parent::__construct($registry);
		$this->microdatapro = new Microdatapro($this->registry);

		if ((isset($_SERVER['HTTPS']) && ($_SERVER['HTTPS'] == 'on' || $_SERVER['HTTPS'] == '1' || $_SERVER['HTTPS'])) || (!empty($_SERVER['HTTP_X_FORWARDED_PROTO']) && (strtolower($_SERVER['HTTP_X_FORWARDED_PROTO']) == 'https') || (!empty($_SERVER['HTTP_X_FORWARDED_SSL']) && $_SERVER['HTTP_X_FORWARDED_SSL'] == 'on'))) {
			$this->host = $this->config->get('config_ssl');
		} else {
			$this->host = $this->config->get('config_url');
		}
	}

	public function index() {
		/************copyright**************/
		/*                                 */
		/*   site:  https://microdata.pro  */
		/*   email: info@microdata.pro     */
		/*                                 */
		/************copyright**************/
	}
	
	public function company() { //LocalBissness - on all pages
		if($this->config->get('config_microdata_status') && $this->config->get('config_company') && $this->microdatapro->key($this->config->get('config_microdata_license_key'))){
			$data['company_syntax']     = $this->config->get('config_company_syntax');
			$data['config_hcard']	    = $this->config->get('config_hcard');
			$data['version'] 	        = $this->microdatapro->module_info('version');
			$data['code']			    = $this->session->data['currency'];
			$data['organization_name']  = $this->microdatapro->clear($this->config->get('config_name'));
			$data['organization_url']   = $this->host;
			$data['organization_logo']  = $this->host . "image/" . $this->config->get('config_logo');
			$data['organization_email'] = $this->config->get('config_microdata_email')?$this->config->get('config_microdata_email'):$this->config->get('config_email');
			$data['organization_phones']= $this->config->get('config_microdata_phones')?array_diff(array_map('trim', explode(",", $this->config->get('config_microdata_phones'))), array('')):false;
			$data['organization_groups']= $this->config->get('config_microdata_groups')?array_diff(array_map('trim', explode(",", $this->config->get('config_microdata_groups'))), array('')):false;
			$data['organization_map']	= trim($this->config->get('config_microdata_map'));
			
			$data['organization_oh'] = array();
			$days = array("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday");
			
			foreach($days as $i => $day){
				$i++;
				if($this->config->get('config_microdata_oh_'.$i)){
					$pre_data = explode("-", $this->config->get('config_microdata_oh_'.$i));
					if(isset($pre_data[0]) && isset($pre_data[1])){
						$data['organization_oh'][$day] = array(
							'open' => trim($pre_data[0]),
							'close' => trim($pre_data[1])
						);
					}
				}
			}
			
			$data['organization_locations'] = array();
			if($this->config->get('config_microdata_locations')){
				$config_microdata_locations = explode(PHP_EOL, $this->config->get('config_microdata_locations'));
				foreach($config_microdata_locations as $location){
					$geo = explode("//", trim($location));
					if($geo[0]){
						$coordinates = explode(";", $geo[0]);
						if(isset($coordinates[0]) && isset($coordinates[1]) && isset($geo[1]) && isset($geo[2]) && isset($geo[3])){
							$data['organization_locations'][] = array(
								'latitude'  	  => trim($coordinates[0]),
								'longitude' 	  => trim($coordinates[1]),
								'addressLocality' => trim($geo[1]),
								'streetAddress'   => trim($geo[2]),
								'postalCode' 	  => trim($geo[3])
							);
						}
					}
				}
			}
			
			//multistore
			$store_id = false;
		
			$query_stores = $this->db->query("SELECT * FROM " . DB_PREFIX . "store ORDER BY url");
			
			foreach ($query_stores->rows as $result){
				if($result['url'] == $this->host){
					$store_id = $result['store_id'];
				}
			}
			
			if($store_id){
				$data['organization_phones']= $this->config->get('config_microdata_phones'.$store_id)?array_diff(array_map('trim', explode(",", $this->config->get('config_microdata_phones'.$store_id))), array('')):$data['organization_phones'];
				$data['organization_groups']= $this->config->get('config_microdata_groups'.$store_id)?array_diff(array_map('trim', explode(",", $this->config->get('config_microdata_groups'.$store_id))), array('')):$data['organization_groups'];
				$data['organization_map']	= $this->config->get('config_microdata_map'.$store_id)?$this->config->get('config_microdata_map'.$store_id):$data['organization_map'];

				if($this->config->get('config_microdata_locations'.$store_id)){
					$data['organization_locations'] = array();
					$config_microdata_locations = explode(PHP_EOL, $this->config->get('config_microdata_locations'.$store_id));
					foreach($config_microdata_locations as $location){
						$geo = explode("//", trim($location));
						if($geo[0]){
							$coordinates = explode(";", $geo[0]);
							if(isset($coordinates[0]) && isset($coordinates[1]) && isset($geo[1]) && isset($geo[2]) && isset($geo[3])){
								$data['organization_locations'][] = array(
									'latitude'  	  => trim($coordinates[0]),
									'longitude' 	  => trim($coordinates[1]),
									'addressLocality' => trim($geo[1]),
									'streetAddress'   => trim($geo[2]),
									'postalCode' 	  => trim($geo[3])
								);
							}
						}
					}
				}
			}

			return $this->view("company", $data);
		}
	}
	
	public function category($microdatapro_data) { //Breadcrumbs - on category pages
		if($this->config->get('config_microdata_status') && $this->config->get('config_category') && $this->microdatapro->key($this->config->get('config_microdata_license_key'))){

			$data['version'] = $this->microdatapro->module_info('version');
			$data['syntax']  = $this->config->get('config_category_syntax');
		
			$data['breadcrumbs'] = array();

			foreach($microdatapro_data['breadcrumbs'] as $breadcrumb){
				$data['breadcrumbs'][count($data['breadcrumbs'])+1] = array(
					'text' => $this->microdatapro->clear($breadcrumb['text']),
					'href' => $breadcrumb['href'],
				);					
			}	

			return $this->view("category_manufacturer", $data);
		}
	}
	
	public function manufacturer($microdatapro_data) { //Breadcrumbs - on manufacturer pages
		if($this->config->get('config_microdata_status') && $this->config->get('config_manufacturer') && $this->microdatapro->key($this->config->get('config_microdata_license_key'))){

			$data['version'] = $this->microdatapro->module_info('version');
			$data['syntax']  = $this->config->get('config_manufacturer_syntax');
		
			$data['breadcrumbs'] = array();

			foreach($microdatapro_data['breadcrumbs'] as $breadcrumb){
				$data['breadcrumbs'][count($data['breadcrumbs'])+1] = array(
					'text' => $this->microdatapro->clear($breadcrumb['text']),
					'href' => $breadcrumb['href'],
				);					
			}	

			return $this->view("category_manufacturer", $data);
		}
	}	
	
	public function product($microdatapro_data) { //Product - on product page
		if($this->config->get('config_microdata_status') && $this->config->get('config_product_page') && $this->microdatapro->key($this->config->get('config_microdata_license_key'))){

			$url = end($microdatapro_data['breadcrumbs']);
			
			$data['version']  	 = $this->microdatapro->module_info('version');
			$data['code']	  	 = $this->session->data['currency'];
			$data['syntax']   	 = $this->config->get('config_product_syntax');
			$data['related']  	 = $this->config->get('config_product_related');
			$data['reviews']  	 = $this->config->get('config_product_reviews');
			$data['attribute']	 = $this->config->get('config_product_attribute');	
			$data['name'] 		 = $this->microdatapro->clear($microdatapro_data['heading_title']);
			$data['url']  		 = isset($url['href'])?$url['href']:'';
			$data['popup']		 = $microdatapro_data['popup'];
			$data['manufacturer']= $this->microdatapro->clear($microdatapro_data['manufacturer']);
			$data['model']		 = $this->microdatapro->clear($microdatapro_data['model']);
			$data['description'] = trim($this->microdatapro->clear($microdatapro_data['description']));
			
			$data['price'] = '';
			
			if(!$this->config->get('config_microdata_hide_price')){
				$data['price'] = (float)rtrim(preg_replace('/[^\d.]/', '', $microdatapro_data['special']?$microdatapro_data['special']:$microdatapro_data['price']), ".");
			
				//option price
				$option_prices = array();
				if(!(int)$data['price'] && $microdatapro_data['options'] && !$this->config->get('config_microdata_hide_price')){
					foreach($microdatapro_data['options'] as $option){
						foreach($option['product_option_value'] as $value){
							$option_price = (float)rtrim(preg_replace('/[^\d.]/', '', $value['price']), ".");
							$option_prices[$option_price] = $option_price;
						}
					}
				}

				if($option_prices){
					$data['price'] = min($option_prices);	
				}
			}
			
			if($this->config->get('config_product_in_stock')){ //always in stock
				$microdatapro_data['microdatapro_data']['quantity'] = '3274';
			}
			if($this->config->get('config_in_stock_status_id') && !$this->config->get('config_product_in_stock')){		
				$stock_status_id_query = $this->db->query("SELECT stock_status_id FROM `" . DB_PREFIX . "product` WHERE product_id = '" . $microdatapro_data['product_id'] . "'");
				if($stock_status_id_query->row['stock_status_id']){
					if($stock_status_id_query->row['stock_status_id'] == $this->config->get('config_in_stock_status_id')){
						$microdatapro_data['microdatapro_data']['quantity'] = '3274';
					}
				}
			}
			
			$data['stock'] = ($microdatapro_data['microdatapro_data']['quantity'] > 0)?"InStock":"OutOfStock";
			
			$data['reviews'] 	 = array();
			$data['reviewCount'] = false;
			$data['rating']		 = false;
			if($this->config->get('config_product_reviews')){
				$data['reviewCount'] = (int)$microdatapro_data['microdatapro_data']['reviews'];
				$data['rating']		 = (float)$microdatapro_data['microdatapro_data']['rating'];				

				$reviews_query = $this->db->query("SELECT author, date_added, rating, text FROM " . DB_PREFIX . "review WHERE product_id = '" . (int)$microdatapro_data['product_id'] . "' AND status = '1' ORDER BY date_added DESC");
				if($reviews_query->rows){
					foreach($reviews_query->rows as $key => $review){
						$data['reviews'][count($data['reviews'])+1] = array(
							'author'     => $this->microdatapro->clear($review['author']),
							'date_added' => date("Y-m-d", strtotime($review['date_added'])),
							'rating'     => (int)$review['rating'],
							'text'       => $this->microdatapro->clear($review['text'])
						);
					}
				}
			}

			foreach(array('sku','upc','ean','isbn','mpn') as $item){
				$data[$item] = (isset($microdatapro_data['microdatapro_data'][$item]) && $microdatapro_data['microdatapro_data'][$item] && $this->config->get('config_microdata_'.$item))?$this->microdatapro->clear($microdatapro_data['microdatapro_data'][$item]):false;
			}

			$data['attributes'] = array();
			if($this->config->get('config_product_attribute')){
				foreach($microdatapro_data['attribute_groups'] as $attribute_group){
					foreach($attribute_group['attribute'] as $attribute){
						$data['attributes'][count($data['attributes'])+1] = array(
							'text' => $this->microdatapro->clear($attribute['text']),
							'name' => $this->microdatapro->clear($attribute['name'])
						);
					}
				}
			}
			
			$data['products'] = array();
			if($this->config->get('config_product_related')){
				foreach($microdatapro_data['products'] as $related){
					$data['products'][count($data['products'])+1] = array(
						'name' => $this->microdatapro->clear($related['name']),
						'href' => $related['href'],
						'thumb'=> $related['thumb'],
						'price'=> $this->config->get('config_microdata_hide_price')?'':(float)rtrim(preg_replace('/[^\d.]/', '', $related['special']?$related['special']:$related['price']), "."),
					);
				}
			}
			

			$data['category'] = false;
			$count = count($microdatapro_data['breadcrumbs'])-2;
			if($count && isset($microdatapro_data['breadcrumbs'][$count]['text'])){
				$data['category'] = $this->microdatapro->clear($microdatapro_data['breadcrumbs'][$count]['text']);
			}

			$data['breadcrumbs'] = array();
			if($this->config->get('config_product_breadcrumb') && $microdatapro_data['breadcrumbs']){
				foreach($microdatapro_data['breadcrumbs'] as $breadcrumb){
					$data['breadcrumbs'][count($data['breadcrumbs'])+1] = array(
						'text' => $this->microdatapro->clear($breadcrumb['text']),
						'href' => $breadcrumb['href'],
					);
				}
			}

			return $this->view("product", $data);
		}
	}
	
	public function information($information) { //NewsArticle - on information page
		if($this->config->get('config_microdata_status') && $this->config->get('config_information_page') && $this->microdatapro->key($this->config->get('config_microdata_license_key'))){
	
			$url = end($information['breadcrumbs']);
			list($width, $height) = getimagesize(DIR_IMAGE . $this->config->get('config_logo'));
	
			$data['version'] 	  = $this->microdatapro->module_info('version');
			$data['syntax']  	  = $this->config->get('config_product_syntax');
			$data['name'] 	 	  = $this->microdatapro->clear($information['heading_title']);
			$data['url']  	 	  = isset($url['href'])?$url['href']:'';			
			$data['logo']    	  = $this->host . "image/" . $this->config->get('config_logo');
			$data['author']  	  = $this->microdatapro->clear($this->config->get('config_name'));
			$data['image_width']  = $width;
			$data['image_height'] = $height;
			$data['date'] 		  = date('Y-m-d', filectime(DIR_SYSTEM . 'library/microdatapro.php'));
			$data['description']  = trim($this->microdatapro->clear($information['description']));
			
			$data['breadcrumbs'] = array();
			if($this->config->get('config_information_breadcrumb') && $information['breadcrumbs']){
				foreach($information['breadcrumbs'] as $breadcrumb){
					$data['breadcrumbs'][count($data['breadcrumbs'])+1] = array(
						'text' => $this->microdatapro->clear($breadcrumb['text']),
						'href' => $breadcrumb['href'],
					);					
				}
			}			
			
			$data['organization'] = array();
			
			if($this->config->get('config_microdata_locations')){
				$config_microdata_locations = explode(PHP_EOL, $this->config->get('config_microdata_locations'));
				foreach($config_microdata_locations as $location){
					$geo = explode("//", trim($location));
					if($geo[0]){
						$coordinates = explode(";", $geo[0]);
						if(isset($coordinates[0]) && isset($coordinates[1]) && isset($geo[1]) && isset($geo[2]) && isset($geo[3])){
							$data['organization'][] = array(
								'latitude'  	  => trim($coordinates[0]),
								'longitude' 	  => trim($coordinates[1]),
								'addressLocality' => trim($geo[1]),
								'streetAddress'   => trim($geo[2]),
								'postalCode' 	  => trim($geo[3])
							);
						}
					}
				}
			}			
			
			$data['phones'] = $this->config->get('config_microdata_phones')?array_diff(array_map('trim', explode(",", $this->config->get('config_microdata_phones'))), array('')):false;

			return $this->view("information", $data);
		}
	}
	
	public function tc_og($tc_og) { //twitter card & open graph - in header of the page
		if(($this->config->get('config_microdata_opengraph') || $this->config->get('config_microdata_twitter_account')) && $this->config->get('config_microdata_status') && $this->microdatapro->key($this->config->get('config_microdata_license_key'))){

			if($this->config->get('config_description_meta') && isset($tc_og['microdatapro_data']['meta_description']) && $tc_og['microdatapro_data']['meta_description']){
				$description = $this->microdatapro->clear($tc_og['microdatapro_data']['meta_description']);
			}elseif(isset($tc_og['description']) && $tc_og['description']){
				$description = $this->microdatapro->mbCutString($this->microdatapro->clear($tc_og['description']), 290);
			}else{
				$description = $tc_og['heading_title'];
			}
			
			$url = end($tc_og['breadcrumbs']);
		
			if(isset($tc_og['microdatapro_data']['image'])){
				$image = $this->host . 'image/' . $tc_og['microdatapro_data']['image'];
			}else{
				$image = $this->host . "image/" . $this->config->get('config_logo');
			}
			
			$data['twitter']   		 = $this->config->get('config_microdata_twitter_account');
			$data['opengraph'] 		 = $this->config->get('config_microdata_opengraph');
			$data['twitter_account'] = $this->config->get('config_microdata_twitter_account');
			$data['version'] 	     = $this->microdatapro->module_info('version');
			$data['title'] 		 	 = $this->microdatapro->clear($tc_og['heading_title']);
			$data['description'] 	 = $description;
			$data['image']			 = $image;
			$data['url']  		 	 = isset($url['href'])?$url['href']:'';

			return $this->view("tc_og", $data);
		}
	}	
	
	public function view($template, $data) {
		return $this->load->view('extension/module/microdatapro/' . $template, $data);	
	}
	
}