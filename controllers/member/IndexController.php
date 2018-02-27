<?php

class IndexController extends Member {
    
    /*public function __construct() {
		parent::__construct();
	}*/
	
	private $nav;
    private $tree;
	private $form;
	private $group;
	private $cmodel;
	private $emodel;
    private $mverify;	///会员审核
	
    public function __construct() {
		parent::__construct();
		$this->isLogin(); //登录验证
		if (!$this->memberinfo['status']) $this->memberMsg(lang('m-con-0')); //判断审核
		$this->group	= $this->membergroup[$this->memberinfo['groupid']];
		/*$this->mverify	= $this->model('content_' . $this->siteid . '_verify');
		$this->nav		= $navigation = array();
		$this->tree		= $this->instance('tree');
		$this->form		= $this->getFormMember();
		$this->group	= $this->membergroup[$this->memberinfo['groupid']];
		$this->cmodel	= $this->get_model();
		$this->emodel	= $this->cache->get('model_member_extend');
		$this->tree->config(array('id' => 'catid', 'parent_id' => 'parentid', 'name' => 'catname'));
		if (SYS_LOG === true) Log::write("IndexController.php row-30".json_encode($this->cats,JSON_UNESCAPED_UNICODE));
		if ($this->cmodel) {	//数据模型菜单
		    foreach ($this->cmodel as $t) {
				//投稿权限验证
				if (!$this->group['setting'][$t['modelid']]['allowview']) continue;	
				$navigation[$t['modelid']] = array('name' => $t['modelname'], 'url' => url('member/content/', array('modelid' => $t['modelid'])));
				if (empty($this->nav)) $this->nav = url('member', array('modelid' => $t['modelid']));
			}
		}
		if ($this->form) {	//表单模型菜单
		    foreach ($this->form as $t) {
			    $navigation[$t['tablename']] = array('name' => $t['joinname'] . $t['modelname'], 'url' => url('member/content/form', array('modelid' => $t['modelid'])));
				if (empty($this->nav)) $this->nav = url('member/content/form', array('modelid' => $t['modelid']));
			}
		}*/
		/*if ($this->emodel) {	//会员扩展模型菜单
		    foreach ($this->emodel as $t) {
				//管理权限或者投稿权限验证
				if (!$this->group['setting'][$t['modelid']]['allowview']) continue;
				$navigation[$t['modelid']] = array('name' => $t['modelname'], 'url' => url('member/content/extend', array('modelid' => $t['modelid'])));
				if (empty($this->nav)) $this->nav = url('member/content/extend', array('modelid' => $t['modelid']));
			}
		}*/
		/*$navigation['verify']     = array('name' => lang('a-mod-137'), 'url' => url('member/content/verify'));
		$navigation['attachment'] = array('name' => lang('m-con-5'), 'url' => url('member/content/attachment'));
		if (empty($this->nav)) $this->nav = url('member/content/verify');*/
		
		$catid_display=$this->get("catid");
		$catid_display=($catid_display)?$catid_display:0;
		$mynav=$this->getCatTreeStr($catid_display);
		
		/*foreach ($this->cats as $t) {	
			//投稿权限验证
			if (!array_key_exists($t['catid'],$this->group['setting'])) continue;	
			if($t["arrchilds"]==$t["catid"]){
					$mynav.='<li><a href="'.url('member/content', array('catid' => $t["catid"])).'" tabid="cat-'.$t['catid'].'"><i class="'.$t["icon"].'"></i><span>'.$t['catname'].'</span></a></li>';
				}else{
					$mynav.='<li class="treeview"><a href="#" tabid="cat-'.$t['catid'].'"><i class="'.$t["icon"].'"></i><span>'.$t['catname'].'</span><i class="fa fa-angle-left pull-right"></i></a><ul class="treeview-menu" id="cat-'.$t['catid'].'-menu">';
					$mynav.=$this->getCatTreeStr($t['catid']);
					$mynav.='</ul></li>';
				}
		}*/
		/*
		if ($this->cats) {	//数据模型菜单
		    foreach ($this->cats as $t) {
				//投稿权限验证
				if (!$this->group['setting'][$t['modelid']]['allowview'] || $t["parentid"]!="0") continue;	
				if($t["arrchilds"]==$t["catid"]){
					$mynav.='<li><a href="'.url('member/content', array('catid' => $t["catid"])).'" tabid="cat-'.$t['catid'].'"><i class="'.$t["icon"].'"></i><span>'.$t['catname'].'</span></a></li>';
				}else{
					$mynav.='<li class="treeview"><a href="#" tabid="cat-'.$t['catid'].'"><i class="'.$t["icon"].'"></i><span>'.$t['catname'].'</span><i class="fa fa-angle-left pull-right"></i></a><ul class="treeview-menu" id="cat-'.$t['catid'].'-menu">';
					$mynav.=$this->getCatTreeStr($t['catid']);
					$mynav.='</ul></li>';
				}
				//$navigation[$t['catid']] = array('catname' => $t['catname'], 'children'=>$this->getNaviChild($t['catid']),'url' => url('member/content/', array('catid' => $t['catid'])));
				
				//if (empty($this->nav)) $this->nav = url('member', array('catid' => $t['catid']));
			}
		}*/
		/*if ($this->group['setting']["assets"]['allowview']){
			$navigation["assets"] = array('catname' => lang('a-ast-i'), 'url' => url('member/assets/'));
		}
		$this->view->assign('navigation', $navigation);*/
		$this->view->assign('mynav', $mynav);
		//Log::write("IndexController.php row-128 ".json_encode($mynav,JSON_UNESCAPED_UNICODE));
	}
	
	private function getNaviChild($catid){
		$return=array();
		$arrchilds = array();
		if($catid!=0){
			$arrchilds = explode(",", $this->cats[$catid]['arrchildid']);
		}else{
			foreach ($this->cats as $t) {
				if($t['parentid']!=0)array_push($arrchilds,$t['catid']); 
			}
		}
		foreach($arrchilds as $childid){
			if($childid!=$catid){
				$return[$childid]=array(
					'catname' => $this->cats[$childid]['catname'],
					'url' => url('member/content/', array('catid' => $childid)),
					'children' =>$this->getNaviChild($childid) 
					);
			}
		}
		return $return;
	}
	
	private function getCatTreeStr($catid){
		$str="";
		$arrchilds=array();
		$parentid=0;
		//Log::write("IndexController.php row-126 ".json_encode($catid,JSON_UNESCAPED_UNICODE));
		if($catid!=0){
			$arrchilds = explode(",", $this->cats[$catid]['arrchildid']);
			//$parentid=$this->cats[$catid]['parentid'];
		}else{
			foreach ($this->cats as $c) {
				if($c['parentid']==0)array_push($arrchilds,$c['catid']); 
			}
		}
		//Log::write("IndexController.php row-127 ".json_encode($arrchilds,JSON_UNESCAPED_UNICODE));
		foreach($arrchilds as $childid){
			if(!array_key_exists($childid,$this->group['setting']))continue;
			$t=$this->cats[$childid];
			if($t['parentid']==$catid){
				if($t["arrchildid"]==null){
					$str.='<li><a href="'.url('member/content', array('catid' => $t["catid"])).'" tabid="cat-'.$t['catid'].'"><i class="'.$t["icon"].'"></i><span>'.$t['catname'].'</span></a></li>';
				}else{
					$str.='<li class="treeview"><a href="#"><i class="'.$t["icon"].'"></i><span>'.$t['catname'].'</span><i class="fa fa-angle-left pull-right"></i></a><ul class="treeview-menu" id="cat-'.$t['catid'].'-menu">';
					$str.=$this->getCatTreeStr($t['catid']);
					$str.='</ul></li>';
				}
			}
		}
		return $str;
	}
	public function indexAction() {
		$this->isLogin(); //登录验证
	    $this->view->assign(array(
			'indexc'     => 1,
			'model'		 => $this->cmodel,//$this->get_model(),
			'form'       => $this->form,//$this->getFormMember(),
		    'meta_title' => lang('member') . '-' . $this->site['SITE_NAME'],
			'category'   => $this->cats,
			//'navigation' => $this->getNavigation(),
		));
	    //$this->view->display('member/index');
		$this->view->display('index');
	}
	
	public function mainAction() {
		$this->isLogin(); //登录验证
	    $this->view->assign(array(
			'indexc'     => 1,
			'model'		 => $this->cmodel,//$this->get_model(),
			'form'       => $this->form,//$this->getFormMember(),
		    'meta_title' => lang('member') . '-' . $this->site['SITE_NAME'],
			'category'   => $this->cats,
			//'navigation' => $this->getNavigation(),
		));
	    $this->view->display('member/index/index');
	}	
	
	public function infoAction() {
		$this->isLogin(); //登录验证
	    $this->view->assign(array(
			'indexc'     => 1,
			'model'		 => $this->cmodel,//$this->get_model(),
			'form'       => $this->form,//$this->getFormMember(),
		    'meta_title' => lang('member') . '-' . $this->site['SITE_NAME'],
			'category'   => $this->cats,
			//'navigation' => $this->getNavigation(),
		));
	    $this->view->display('member/main/index_info');
	}	
	
	public function geofileAction(){
		require_once EXTENSION_DIR . 'libkml' . DIRECTORY_SEPARATOR .'libkml.php';
		$id=$this->get("id");
		$kml_data = file_get_contents(CONFIG_DIR . 'powerplant-'.$id.'.kml');
		$kml = KML::createFromText($kml_data);
		$generated_json = $kml->toJSON();
		echo $generated_json;
	}
	
	/**
	 * 会员列表
	 */
	public function listAction() {
	    $page = (int)$this->get('page');
	    $page = $page ? $page : 1;
		$mid  = (int)$this->get('modelid');
		if ($mid && !isset($this->membermodel[$mid])) $this->msg(lang('m-ind-0', array('1'=>$mid)));
		$this->view->assign(array(
		    'page'    => $page,
			'modelid' => $mid,
		));
	    $this->view->display('list_member');
	}
	
}