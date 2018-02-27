<?php

class ProxyController extends Member {
    
    public function __construct() {
		parent::__construct();
	}
	
	//向实时库查询 报警
	public function alarmAction(){
	
		echo json_encode($_REQUEST);
	}
	
	//向实时库 订阅缺陷
	public function faultsubAction(){
		Log::write("ProxyController.php row-17".json_encode($_REQUEST,JSON_UNESCAPED_UNICODE));
		echo json_encode($_REQUEST);
	}
	
	//处理：实时库推过来的缺陷 
	public function faultAction(){
		Log::write("ProxyController.php row-23".json_encode($_REQUEST,JSON_UNESCAPED_UNICODE));
		echo json_encode($_REQUEST);
	}
	
	
	/**
	 * 通过cpid取值，get时： cpids=AN01NB010005,AN01NB010003;
	 * js示例：
	 * var cpids="AN01NB010005,AN01NB010003";
	 * $.post("{url('member/proxy/jaction')}&cpids="+cpids,function(data){console.log(data)});
	 */
	public function nowval_bycpidAction(){
		return $this->jactionAction();
	}
	public function jactionAction(){
		$cpids=$_GET['cpids'];
		unset($_GET['cpids']);
		$url="http://114.55.25.50/cgi-bin/nowval.rsp?method=jaction&any={%22any%22:{%22cpid%22:[%22";
		$url.=join("%22,%22",explode(",",$cpids))."%22]}}";
		$r=json_decode($this->proxy($url),true)['contents'];
		//echo json_encode($r);
		$d=null;
		if($r['iret']>=0){
			foreach($r['any'] as $data){
				$d[$data['ipid']]=$data;
			}
		}
		echo json_encode($d);
	}
	
	/**
	 * 通过ipid获取当前值 
	 * js示例：
	 * var id='16777221,16777222';
	 * $.post("{url('member/proxy/nowval')}&id="+id,function(data){console.log(data)});
	 */
	public function nowvalAction() {
		$id=$_GET['id'];
		unset($_GET['id']);
		$url='http://114.55.25.50/cgi-bin/nowval.rsp?method=mGet&id={%22id%22:['.$id.']}';
		//echo $url;
		//echo $this->proxy($url);
		$r=json_decode($this->proxy($url),true)['contents'];
		$d=null;
		if($r['iret']>=0){
			foreach($r['any'] as $data){
				$d[$data['ipid']]=$data;
			}
		}
		echo json_encode($d);
		//'http://114.55.25.50/cgi-bin/nowval.rsp?method=mGet&id={%22id%22:[16777221,16777222]}';
	}
	
	private function proxy($url){
		$enable_jsonp    = false;
		$enable_native   = false;
		$valid_url_regex = '/.*/';
		// ############################################################################
		//$url = $_GET['url'];
		if ( !$url ) {
		  
		  // Passed url not specified.
		  $contents = 'ERROR: url not specified';
		  $status = array( 'http_code' => 'ERROR' );
		  
		} else if ( !preg_match( $valid_url_regex, $url ) ) {
		  
		  // Passed url doesn't match $valid_url_regex.
		  $contents = 'ERROR: invalid url';
		  $status = array( 'http_code' => 'ERROR' );
		  
		} else {
		  $ch = curl_init( $url );
		  
		  if ( strtolower($_SERVER['REQUEST_METHOD']) == 'post' ) {
			curl_setopt( $ch, CURLOPT_POST, true );
			curl_setopt( $ch, CURLOPT_POSTFIELDS, $_POST );
		  }
		  
		  if ( $_GET['send_cookies'] ) {
			$cookie = array();
			foreach ( $_COOKIE as $key => $value ) {
			  $cookie[] = $key . '=' . $value;
			}
			if ( $_GET['send_session'] ) {
			  $cookie[] = SID;
			}
			$cookie = implode( '; ', $cookie );
			
			curl_setopt( $ch, CURLOPT_COOKIE, $cookie );
		  }
		  
		  curl_setopt( $ch, CURLOPT_FOLLOWLOCATION, true );
		  curl_setopt( $ch, CURLOPT_HEADER, true );
		  curl_setopt( $ch, CURLOPT_RETURNTRANSFER, true );
		  
		  curl_setopt( $ch, CURLOPT_USERAGENT, $_GET['user_agent'] ? $_GET['user_agent'] : $_SERVER['HTTP_USER_AGENT'] );
		  
		  list( $header, $contents ) = preg_split( '/([\r\n][\r\n])\\1/', curl_exec( $ch ), 2 );
		  
		  $status = curl_getinfo( $ch );
		  
		  curl_close( $ch );
		}
		// Split header text into an array.
		$header_text = preg_split( '/[\r\n]+/', $header );
		if ( $_GET['mode'] == 'native' ) {
		  if ( !$enable_native ) {
			$contents = 'ERROR: invalid mode';
			$status = array( 'http_code' => 'ERROR' );
		  }
		  
		  // Propagate headers to response.
		  foreach ( $header_text as $header ) {
			if ( preg_match( '/^(?:Content-Type|Content-Language|Set-Cookie):/i', $header ) ) {
			  header( $header );
			}
		  }
		  
		  return $contents;
		  
		} else {
		  
		  // $data will be serialized into JSON data.
		  $data = array();
		  
		  // Propagate all HTTP headers into the JSON data object.
		  if ( $_GET['full_headers'] ) {
			$data['headers'] = array();
			
			foreach ( $header_text as $header ) {
			  preg_match( '/^(.+?):\s+(.*)$/', $header, $matches );
			  if ( $matches ) {
				$data['headers'][ $matches[1] ] = $matches[2];
			  }
			}
		  }
		  
		  // Propagate all cURL request / response info to the JSON data object.
		  if ( $_GET['full_status'] ) {
			$data['status'] = $status;
		  } else {
			$data['status'] = array();
			$data['status']['http_code'] = $status['http_code'];
		  }
		  
		  // Set the JSON data object contents, decoding it from JSON if possible.
		  $decoded_json = json_decode( $contents );
		  $data['contents'] = $decoded_json ? $decoded_json : $contents;
		  
		  // Generate appropriate content-type header.
		  $is_xhr = strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest';
		  header( 'Content-type: application/' . ( $is_xhr ? 'json' : 'x-javascript' ) );
		  
		  // Get JSONP callback.
		  $jsonp_callback = $enable_jsonp && isset($_GET['callback']) ? $_GET['callback'] : null;
		  
		  // Generate JSON/JSONP string
		  $json = json_encode( $data );
		  
		  return $jsonp_callback ? "$jsonp_callback($json)" : $json;
		}
			
	}

	
	
}