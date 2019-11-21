<?php

require_once(DIR_SYSTEM . 'library/microdatapro.php');

class ControllerExtensionModuleMicrodataPro extends Controller {

	public function __construct($registry) {
		parent::__construct($registry);
		$this->microdatapro = new Microdatapro($this->registry);
	}

	public function install() {

		$response = $this->send();
		
		if($response['status'] && $response['content']){
			$this->editSetting('microdatapro', array("config_microdata_license_key"=>$response['content']));
		}		

	}

	public function index() {

		$a = 0;
		$response = $this->send();

		if($response['status'] && $response['content'] && $this->microdatapro->key($response['content'],1)){
			$a = 1;
			$this->db->query("UPDATE " . DB_PREFIX . "setting SET value = '" . $response['content'] . "' WHERE `key` = 'config_microdata_license_key'");
		}

		$data = $this->language->load('extension/module/microdatapro');

		$this->document->setTitle(strip_tags($this->language->get('heading_title')));
		$data['token'] = $this->session->data['token'];

		$this->load->model('setting/store');

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			$this->editSetting('microdatapro', $this->request->post);

			$this->response->redirect($this->url->link('extension/module/microdatapro', 'token=' . $this->session->data['token'], 'SSL'));			

		}
				
		$heading_title_array = explode(" [", $this->language->get('heading_title'));
		$data['heading_title'] = $heading_title_array[0] . ' ' . $this->microdatapro->module_info('version');

		$data['action'] = $this->url->link('extension/module/microdatapro', 'token=' . $this->session->data['token'], 'SSL');
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL');

		$data['modules_link'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL');

		$data['site_url'] = str_replace(array("https://", "http://", "/"), "", HTTP_CATALOG);
		
		$data['version2'] = false;
		if($this->microdatapro->opencart_version(0) == 2){
			$data['version2'] = true;
		}
		
		//array vars
		$vars = array(
			'config_microdata_license_key',
			'config_microdata_registration_email',
			'config_microdata_registration_nikname',
			'config_microdata_status',
			'config_company',
			'config_hcard',
			'config_company_syntax',
			'config_company_rating',
			'config_microdata_map',
			'config_latest_breadcrumb',
			'config_in_stock_status_id',
			'config_photo_original',
			'config_product_syntax',
			'config_category_syntax',
			'config_manufacturer_syntax',
			'config_information_syntax',
			'config_special_syntax',
			'config_clear_price',
			'config_microdata_phones',
			'config_microdata_groups',
			'config_microdata_locations',
			'config_product_page',
			'config_category_page',
			'config_manufacturer_page',
			'config_information_page',
			'config_information_author',
			'config_special_page',
			'config_special_manual_rating',
			'config_special_manual_count',
			'config_special_total_rating',				
			'config_product_breadcrumb',
			'config_category',
			'config_category_syntax',
			'config_manufacturer',
			'config_manufacturer_syntax',			
			'config_desc_full',
			'config_manufacturer_breadcrumb',
			'config_manufacturer_manual_rating',
			'config_manufacturer_manual_count',
			'config_manufacturer_total_rating',			
			'config_information_breadcrumb',
			'config_special_breadcrumb',
			'config_product_related',
			'config_product_reviews',
			'config_product_attribute', 
			'config_product_in_stock', 
			'config_microdata_mpn',  
			'config_microdata_sku',  
			'config_microdata_upc', 
			'config_microdata_ean', 
			'config_microdata_isbn', 
			'config_description_meta', 
			'config_microdata_special_description', 
			'config_microdata_special_name', 
			'config_microdata_product_description', 
			'config_microdata_category_description', 
			'config_microdata_manufacturer_description', 
			'config_microdata_twitter',
			'config_microdata_opengraph',
			'config_microdata_email',
			'config_microdata_hide_price',
			'config_microdata_twitter_account',
			'config_microdata_oh_1',
			'config_microdata_oh_2',
			'config_microdata_oh_3',
			'config_microdata_oh_4',
			'config_microdata_oh_5',
			'config_microdata_oh_6',
			'config_microdata_oh_7'
		);		
		
		//add multistore vars
		$store_results = $this->model_setting_store->getStores();
		foreach ($store_results as $result) {
			$vars[] = 'config_microdata_phones'.$result['store_id'];
			$vars[] = 'config_microdata_groups'.$result['store_id'];
			$vars[] = 'config_microdata_locations'.$result['store_id'];
			$vars[] = 'config_microdata_map'.$result['store_id'];
		}
		
 		foreach($vars as $var){
			if (isset($this->request->post[$var])) {
				$data[$var] = $this->request->post[$var];
			} else {
				$data[$var] = $this->config->get($var);
			}
		}

		//get all stores to tpl
		$data['email'] 		= $this->config->get('config_email');
		$data['store_name'] = $this->config->get('config_name');
		$data['stores'] = array();
		foreach ($store_results as $result) {
			$data['stores'][] = array(
				'store_id' => $result['store_id'],
				'name'     => $result['name'],
				'config_microdata_phones' => $data['config_microdata_phones'.$result['store_id']],
				'config_microdata_groups' => $data['config_microdata_groups'.$result['store_id']],
				'config_microdata_locations' => $data['config_microdata_locations'.$result['store_id']],
				'config_microdata_map' => $data['config_microdata_map'.$result['store_id']]
			); 
		}		
		
		//stock_statuses
		$this->load->model('localisation/stock_status');
		$data['stock_statuses'] =  $this->model_localisation_stock_status->getStockStatuses();
		$data['stock_status_id'] = $this->config->get('config_in_stock_status_id');

		//find old microdata
		$data['old_microdata'] = $this->find_old();

		if($response['status'] && $response['content'] && empty($data['config_microdata_license_key'])){
			$this->editSetting('microdatapro', array("config_microdata_license_key"=>$response['content']));
			$data['config_microdata_license_key'] = $response['content'];
		}		
		
		$data['config_microdata_license_key'] = $a?$data['config_microdata_license_key']:false;

		$data['template_for_2'] = true; 
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');																																																							
		$this->response->setOutput($this->load->view('extension/module/microdatapro.tpl', $data));
	}

	public function find_old($original = false) {
		$microdata = array();	
		$find_files	= $old_microdata = array();
		$find_files = $this->scan_Dir(DIR_CATALOG . "view/theme/" . $this->config->get('config_template') . "/template");

		$find_tags = array(
			'itemscope',
			'itemprop',
			'itemtype',
			'typeof="v:',
			'prefix:v',
			'property="v:',
			'rel="v:',
		);
		
		if($find_files){		
			foreach($find_files as $file){
				if(!strpos($file, "microdatapro") and !strpos($file, "mdp_backup") and !strpos($file, "agoo")){
					foreach($find_tags as $tag){
						if (strpos(file_get_contents($file), $tag)){
							$old_microdata[$file] = $file;
						}
					}			
				}
			}
		}

		if($old_microdata && !$original){
			foreach($old_microdata as $old_item){
				$data_arr = explode("catalog/view", $old_item);
				$microdata['catalog/view' . $data_arr[1]] = 'catalog/view' . $data_arr[1];
			}
		}
		
		if($original){
			$microdata = $old_microdata;
		}
		
		return $microdata;		
	}
	
	public function scan_Dir($dir) {
		$arrfiles = array();
		if (is_dir($dir)) {
			if ($handle = opendir($dir)) {
				chdir($dir);
				while (false !== ($file = readdir($handle))) { 
					if ($file != "." && $file != "..") { 
						if (is_dir($file)) { 
							$arr = $this->scan_Dir($file);
							foreach ($arr as $value) {
								$arrfiles[] = $dir."/".$value;
							}
						} else {
							$arrfiles[] = $dir."/".$file;
						}
					}
				}
				chdir("../");
			}
			closedir($handle);
		}
		
		return $arrfiles;
	}

	public function clear_old(){
		$find_files = array();	
			
		$find_files = $this->find_old(true); //true for get original path

		$find_tags = array(
			'itemscope',
			'itemprop',
			'itemtype',
			'typeof="v:',
			'prefix:v',			
			'property="v:',
			'rel="v:',
		);
		
		$find_tags_replace = array(
			'data-is=""',
			'data-ip',
			'data-it',
			'data-to="v:',
			'data-pr:v',
			'data-prt="v:',
			'data=rl="v:',
		);	

		foreach($find_files as $item){
			$file_data = str_replace($find_tags, $find_tags_replace, file_get_contents($item));	
			rename($item, $item."_mdp_backup");
			$fp = fopen($item, "w");
			fwrite($fp, $file_data);
			fclose($fp);
			$this->log->write("microdatapro очищенный файл: " . $item);
			$this->log->write("microdatapro оригинальный файл: " . $item . "_mdp_backup");
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($find_files));		
	}

	public function editSetting($group, $data, $store_id = 0) {	
		if($this->microdatapro->opencart_version(0) == 2){
			$group_code = "code";
		}else{
			$group_code = "group";			
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$store_id . "' AND `$group_code` = '" . $this->db->escape($group) . "'");

		foreach ($data as $key => $value) {
			if (!is_array($value)) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "setting SET store_id = '" . (int)$store_id . "', `$group_code` = '" . $this->db->escape($group) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape($value) . "'");
			} else {
				$this->db->query("INSERT INTO " . DB_PREFIX . "setting SET store_id = '" . (int)$store_id . "', `$group_code` = '" . $this->db->escape($group) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape(serialize($value)) . "', serialized = '1'");
			}
		}
	}
	
	public function send() {

		$prepare_data = array(
			'email'     => $this->config->get('config_email'),
			'module'    => $this->microdatapro->module_info('module') . " " . $this->microdatapro->module_info('version'),
			'site' 	    => $this->microdatapro->module_info('main_host', true),
			'sec_token' => "3274507573",
			'method'	=> 'POST',
			'lang'		=> $this->config->get('config_language'),
			'engine'	=> $this->microdatapro->module_info('engine'),
			'date'		=> date("Y-m-d H:i:s")
		);

		if($curl = curl_init()) { //POST CURL
			curl_setopt($curl, CURLOPT_URL, "https://microdata.pro/index.php?route=sale/sale");
			curl_setopt($curl, CURLOPT_HEADER, false);
			curl_setopt($curl, CURLOPT_RETURNTRANSFER,true);
			curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 30);
			curl_setopt($curl, CURLOPT_POST, true);
			curl_setopt($curl, CURLOPT_POSTFIELDS, $prepare_data);
			$register_number = curl_exec($curl);
			curl_close($curl);
			$response['content'] = $register_number;
			$response['status'] = true;			
		}else{ //file_get_contents
			$header = "User-Agent: " . (isset($_SERVER['HTTP_USER_AGENT']))?$_SERVER['HTTP_USER_AGENT']:'';
			$header .= " \r\n";
			$header .= "Content-type: application/x-www-form-urlencoded\r\n";
			$header .= "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8 \r\n";
			$header .= "Accept-language: en-us,en;q=0.5\r\n";
			$header .= "Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7\r\n";
			$header .= "Keep-Alive: 300\r\n";
			$header .= "Connection: keep-alive\r\n";
			$header .= "Referer: " . $prepare_data['site'];
			$header .= "\r\n";
			$option = array('http' => array('method' => 'POST', 'header' => $header, 'content' => http_build_query($prepare_data)));		
			$stream_context = stream_context_create($option);
			try {
				$response['content'] = file_get_contents("https://microdata.pro/index.php?route=sale/sale", FALSE , $stream_context);
				$response['status'] = true;
			}  catch (E_WARNING $e) {
				$response['content'] = '';
				$response['status'] = false;
			}
		}
		
		return $response;
	}
}