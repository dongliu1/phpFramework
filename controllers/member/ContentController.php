<?php

class ContentController extends Member {
    
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
		$this->mverify	= $this->model('content_' . $this->siteid . '_verify');
		$this->nav		= $navigation = array();
		$this->tree		= $this->instance('tree');
		$this->form		= $this->getFormMember();
		//Log::write("ContentController.php rwo-21 ::::: ".json_encode($this->memberinfo,JSON_UNESCAPED_UNICODE));
		$this->group	= $this->membergroup[$this->memberinfo['groupid']];
		//Log::write("ContentController.php rwo-23 ::::: ".json_encode($this->group['setting'],JSON_UNESCAPED_UNICODE));
		$this->cmodel	= $this->get_model();
		$this->emodel	= $this->cache->get('model_member_extend');
		/*$this->tree->config(array('id' => 'catid', 'parent_id' => 'parentid', 'name' => 'catname'));
		if ($this->cmodel) {	//内容模型菜单
		    foreach ($this->cmodel as $t) {
				//投稿权限验证
				//if (!$this->memberPost($t['setting']['auth'])) continue;
				if (!$this->group['setting'][$t['modelid']]['allowview']) continue;
				$navigation[$t['modelid']] = array('name' => $t['modelname'], 'url' => url('member/content/', array('modelid' => $t['modelid'])));
				if (empty($this->nav)) $this->nav = url('member/content/', array('modelid' => $t['modelid']));
			}
		}
		if ($this->form) {	//表单模型菜单
		    foreach ($this->form as $t) {
			    $navigation[$t['tablename']] = array('name' => $t['joinname'] . $t['modelname'], 'url' => url('member/content/form', array('modelid' => $t['modelid'])));
				if (empty($this->nav)) $this->nav = url('member/content/form', array('modelid' => $t['modelid']));
			}
		}
		if ($this->emodel) {	//会员扩展模型菜单
		    foreach ($this->emodel as $t) {
				//管理权限或者投稿权限验证
				//if (!$t['setting']['member']['admin'] && !$this->memberPost($t['setting']['auth'])) continue;
				if (!$this->group['setting'][$t['modelid']]['allowview']) continue;
				$navigation[$t['modelid']] = array('name' => $t['modelname'], 'url' => url('member/content/extend', array('modelid' => $t['modelid'])));
				if (empty($this->nav)) $this->nav = url('member/content/extend', array('modelid' => $t['modelid']));
			}
		}
		$navigation['verify']     = array('name' => lang('a-mod-137'), 'url' => url('member/content/verify'));
		$navigation['attachment'] = array('name' => lang('m-con-5'), 'url' => url('member/content/attachment'));
		if (empty($this->nav)) $this->nav = url('member/content/verify');
		$this->view->assign('navigation', $navigation);
		*/
	}
	
	/*
	 * 内容管理
	 */
	public function listAction() {
		$page     = (int)$this->get('page') ? (int)$this->get('page') : 1;
	    $pagelist = $this->instance('pagelist');
		$pagelist->loadconfig();
	    $where    = 'userid=' . $this->memberinfo['id'] . ' and sysadd=0 and `status`=1';
	    $total    = $this->content->_count(null, $where);
	    $pagesize = isset($this->memberconfig['pagesize']) && $this->memberconfig['pagesize'] ? $this->memberconfig['pagesize'] : 8;
	    $data     = $this->content->page_limit($page, $pagesize)->order('updatetime DESC')->where($where)->select();
	    $pagelist = $pagelist->total($total)->url(url('member/content/list', array('page' => '{page}')))->num($pagesize)->page($page)->output();
		//if (SYS_LOG === true) Log::write('ContentController.php row67:' );
	    $this->view->assign(array(
	        'list'       => $data,
	        'page'       => $page,
	        'pagelist'   => $pagelist,
	        'category'   => $this->cats,
			'countinfo'  => $this->getPosts(),
			'meta_title' => lang('member') . '-' . $this->site['SITE_NAME']
	    ));
	    //$this->view->display('member/list');
		$this->view->display('member/' . (is_file(VIEW_DIR . SYS_THEME_DIR . 'member' . DIRECTORY_SEPARATOR . $this->cmodel[$modelid]['listtpl']) ? substr($this->cmodel[$modelid]['listtpl'], 0, -5) : 'content_list'));
	}
	
	/*
	 * 栏目选择
	 */
	public function categoryAction() {
	    echo "<div style='text-align:center;padding-top:10px;'>";
	    echo "<select id='catid_post' name='catid_post'>";
	    echo "<option value='0'>" . lang('m-con-7') . "</option>";
	    echo $this->tree->get_tree($this->cats, 0, null, '&nbsp;|-', true, $this->memberinfo['modelid'], $this->memberinfo['groupid']);
	    echo "</select>";
	    echo "</div>";
	}
	
	/*
	 * 内容管理
	 */
	public function indexAction() {
		if ($this->post('ids')) { //刷新
	        $ids  = implode(',', $this->post('ids'));
			if (empty($ids)) $this->memberMsg(lang('m-con-6'));
			$this->content->update(array('updatetime'=>time()), "userid=" . $this->memberinfo['id'] . " and username='" . $this->memberinfo['username'] . "' and sysadd=0 and id in(" . $ids . ")");
	    }
		$ewhere="";
		if ($this->post('submit')) {
	        $data  = $this->post('data');
			foreach($data as $colname=>$coldata){
				if($coldata!=""){
					list($col,$op)=explode("|",$colname);
					$ewhere=" AND ".$col.$op."'".$coldata."'";
				}
			}
		}
	    $page		= $this->get('page') ? (int)$this->get('page') : 1;
		$catid		= (int)$this->get('catid');

		
		if (empty($catid)) $this->redirect(url('member'));
		$cat=$this->cats[$catid];
		//$this->memberMsg(json_encode($cat,256));
		
		if($cat['typeid']==2){
			if(array_key_exists("redirect",$cat['setting']) && $cat['setting']['redirect']!=""){
					$this->redirect(url('member/'.$cat['setting']['redirect'],array('catid'=>$catid)));
			}else{
				$this->redirect(url('member/content/singlepage',$_REQUEST));
			}
		}
		
		$modelid	= (int)$this->cats[$catid]["modelid"];
		if (!isset($this->cmodel[$modelid])) $this->memberMsg(lang('a-con-2', array('1' => $modelid)));
		//Log::write("ContentController.php rwo-118 ::::: ".json_encode($this->group['setting'],JSON_UNESCAPED_UNICODE));
		if (!array_key_exists($catid,$this->group['setting']) || !in_array("view",$this->group['setting'][$catid])) $this->memberMsg(lang('m-con-12').$catid);
		
		$param		= array('page' => '{page}', 'catid' => $catid);
		if($this->get('userid'))$param		= array('page' => '{page}', 'modelid' => $modelid, 'userid'=>$this->get('userid'));//rox修改
	    $pagelist	= $this->instance('pagelist');
		$pagesize =$cat['pagesize'];
		$pagelist->loadconfig();
		if ($this->get('catid')) {
			$where		   = 'catid=' . (int)$this->get('catid') . ' AND ((userid=' . $this->memberinfo['id'] .' AND `status`>0) OR `status`=1 OR `status`=4)' ;
			$param['catid']	= $this->get('catid');
		} else {
			$where			= 'modelid=' . $modelid . ' AND ((userid=' . $this->memberinfo['id'] .' AND `status`>0) OR `status`=1 OR `status`=4)' ;
		}
		if ($this->get('userid'))$where.=' AND userid=' . (int)$this->get('userid') ;
		if ($this->get('kw')) {
			$where		   .= ' AND `title` LIKE "%' . $this->get('kw') . '%"';
			$param['kw']	= $this->get('kw');
		}
		$where.=' AND (`status`=1 OR `status`=4 OR userid=' . $this->memberinfo['id'].' )';
		//$ewhere=$this->post("where");
		$tablename=$this->cmodel[$modelid]['tablename'];
	    $data		= $this->content->from(array("c"=>"content_".$this->siteid))->join(array("e"=>$tablename),"c.id=e.id")->page_limit($page, $pagesize)->order('updatetime DESC')->where("c.".$where.$ewhere)->select();
	    $total		= $this->content->from(array("c"=>"content_".$this->siteid))->_count(null, $where);
	    $pagelist	= $pagelist->total($total)->url(url('member/content', $param))->num($pagesize)->page($page)->output();
		$fields=$this->cmodel[$modelid]['fields']['data'];
		$fields_text=$this->getFieldsText($this->cmodel[$modelid]['fields'], $data);
		
	    $this->view->assign(array(
	        'list'       => $data,
	        'page'       => $page,
			'model'		 => $this->cmodel[$modelid],
			'fields'	 => $fields,
			'permission'  => $this->membergroup[$this->memberinfo['groupid']]['setting'][$catid],
			'fields_text' => $fields_text,
			'modelid'    => $modelid,
			'catid'      => $catid,
			'catname'	 => $this->cats[$catid]['catname'],
			'group'		 => $this->group['setting'][$modelid],
			'userid'	 => $this->memberinfo['id'],
	        'pagelist'   => $pagelist,
			//'category'   => $this->tree->get_model_tree($this->cats, 0, null, '&nbsp;|-', $modelid, $this->memberinfo['modelid'], $this->memberinfo['groupid']),
			'countinfo'  => $this->getPosts(),
			'meta_title' => $this->cmodel[$modelid]['modelname'] . '-' . lang('member') . '-' . $this->site['SITE_NAME']
	    ));	
		$url_display= (is_file(MEMBER_DIR . $this->cats[$catid]['catdir'].DIRECTORY_SEPARATOR."content_list.html") ? $this->cats[$catid]['catdir'].DIRECTORY_SEPARATOR.'content_list' : 'content_list');
		$this->view->display($url_display);
	}

	/*
	 * 只调用数据管理,需要查看权限
	 */
	public function dataAction() {
		$ewhere="";
		if ($this->post('data')) {
	        $data  = $this->post('data');
			foreach($data as $colname=>$coldata){
				list($col,$op)=explode("|",$colname);
				if(!$op)$op=" =";
				$ewhere=" AND ".$col.$op."'".$coldata."'";
			}
		}
		$catid		= (int)$this->get('catid');
		if (empty($catid)) return null;
		$cat=$this->cats[$catid];
		$modelid	= (int)$this->cats[$catid]["modelid"];
		if (!isset($this->cmodel[$modelid])) $this->memberMsg(lang('a-con-2', array('1' => $modelid)));
		if (!array_key_exists($catid,$this->group['setting']) || !in_array("view",$this->group['setting'][$catid])) return lang('m-con-12');
		
		$param		= array('catid' => $catid);
		if($this->get('userid')){
			$param		= array( 'modelid' => $modelid, 'userid'=>$this->get('userid'));//rox修改
		}
		//$where		   = 'catid=' . (int)$this->get('catid') . ' AND ((userid=' . $this->memberinfo['id'] .' AND `status`>0) OR `status`=1 OR `status`=4)' ;
		$where		   = 'catid=' . (int)$this->get('catid') . ' AND ((userid=' . $this->memberinfo['id'] .' AND `status`>0) OR `status`=1 OR `status`=4)' ;
		$param['catid']	= $this->get('catid');

		if ($this->get('userid'))$where.=' AND userid=' . (int)$this->get('userid') ;
		if ($this->get('kw')) {
			$where		   .= ' AND `title` LIKE "%' . $this->get('kw') . '%"';
			$param['kw']	= $this->get('kw');
		}
		$where.=' AND (`status`=1 OR `status`=4 OR userid=' . $this->memberinfo['id'].' )';
		
		$tablename=$this->cmodel[$modelid]['tablename'];
	    if($this->get("dataonly")=="1"){
			$data		= $this->content->from($tablename)->where("1=1 ".$ewhere)->select();
		}else{
			$data		= $this->content->from(array("c"=>"content_".$this->siteid),"*")->join(array("e"=>$tablename),"c.id=e.id")->order('updatetime DESC')->where("c.".$where.$ewhere)->select();
		}
		//$data		= $this->content->from(array("c"=>"content_".$this->siteid))->join(array("e"=>$tablename),"c.id=e.id")->page_limit($page, $pagesize)->order('updatetime DESC')->where("c.".$where.$ewhere)->select();
	    $total		= $this->content->from(array("c"=>"content_".$this->siteid))->_count(null, $where);
		$fields=$this->cmodel[$modelid]['fields']['data'];
		$fields_text=$this->getFieldsText($this->cmodel[$modelid]['fields'], $data);
		echo json_encode($data,256);
	    /*echo json_encode(array(
	        'list'       => $data,
			'model'		 => $this->cmodel[$modelid],
			'fields'	 => $fields,
			'fields_text'=> $fields_text,
	    ),256);*/
		return;
	}

	public function singlepageAction(){
		//单网页
		$catid		= (int)$this->get('catid');
			$cat = $this->cats[$catid];
	        $cat['content'] = relatedlink($cat['content']);
			$this->view->assign($cat);
			//$this->view->assign(listSeo($cat, $page));
			//$this->memberMsg('member/' . (is_file(VIEW_DIR . SYS_THEME_DIR . 'member' . DIRECTORY_SEPARATOR . $this->cats[$catid]['catdir'].DIRECTORY_SEPARATOR."content_show.html") ? $this->cats[$catid]['catdir'].DIRECTORY_SEPARATOR.'content_show' : 'content_show'));
			//
			//$this->view->display('member/quexiantongji/content_show');
			$this->view->display('member/' . (is_file(VIEW_DIR . SYS_THEME_DIR . 'member' . DIRECTORY_SEPARATOR . $this->cats[$catid]['catdir'].DIRECTORY_SEPARATOR."content_show.html") ? $this->cats[$catid]['catdir'].DIRECTORY_SEPARATOR.'content_show' : 'content_show'));
	}
	
	
	/*
	 * 发布
	 */
	public function addAction() {
	    $catid   = (int)$this->get('catid');
		$modelid = $this->cats[$catid]['modelid'];
	    if (!isset($this->cmodel[$modelid])) $this->memberMsg(lang('m-con-10'));
	    $fields  = $this->cmodel[$modelid]['fields'];
	    if ($this->post('submit')) {
	        $data  = $this->post('data');
			if (empty($catid)) $catid = $data['catid'];
			$data['catid']=$catid;
			if (empty($catid)) $this->memberMsg(lang('m-con-8'));
			if (!isset($this->cats[$catid])) $this->memberMsg(lang('m-con-9', array('1' => $catid)));
			//投稿权限验证
			if ($this->cats[$catid]['child']) $this->memberMsg(lang('m-con-11'));
			//if (!$this->memberPost($this->group['setting'][$modelid])) $this->memberMsg(lang('m-con-12'));
			if (!in_array("add",$this->group['setting'][$catid])) $this->memberMsg(lang('m-con-12'));
		    //用户组验证
			//$this->postCheck($modelid);//发布数量验证
	        //if (empty($data['title'])) $this->memberMsg(lang('m-con-13'));
			$this->checkFields($fields, $data, 2);
			$data['userid']    = $this->memberinfo['id'];
	        $data['sysadd']    = 0;
			$data['status']    = !isset($this->group['postverify']) || $this->group['postverify'] ? 3 : 1;
	        $data['modelid']   = (int)$modelid;
	        $data['username']  = $this->memberinfo['username'];
			$data['realname']  = $this->memberinfo['nickname'];
	        $data['inputtime'] = $data['updatetime'] = time();
			//echo json_encode($data,256);
			$this->postEvent($data, 'before', 'member');	//发布前事件
	        $data['id']        = $result = $this->content->member(0, $this->cmodel[$modelid]['tablename'], $data);
	        if (!is_numeric($result)) $this->memberMsg($result);
			$this->set_post_count($data,1);//修改发布数量
			if ($data['status'] == 1) {	//审核通过
				$this->createShow($data);
				//$msg = '<a href="' . url('member/content/add', array('catid' => $catid)) . '" style="font-size:14px;">' . lang('m-con-14') . '</a>&nbsp;&nbsp;<a href="' . url('member/content/', array('modelid'=>$modelid)) . '" style="font-size:14px;">' . lang('m-con-15') . '</a>';
				//$this->memberMsg($msg, url('member/content/', array('modelid' => $modelid)), 1, 20);
				//$ret=array("success"=>1,"id":$data['id']);
				echo json_encode(array("success"=>1,"id"=>$data['id']));
				return;
			} else {	//等待审核
				$msg = '<a href="' . url('member/content/add', array('catid' => $catid)) . '" style="font-size:14px;">' . lang('m-con-14') . '</a>&nbsp;&nbsp;<a href="' . url('member/content/verify/') . '" style="font-size:14px;">' . lang('a-mod-138') . '</a>';
				$this->memberMsg($msg, url('member/content/verify', array('modelid' => $modelid)), 1, 20);
			}			
			$this->postEvent($data, 'later', 'member');	//发布后事件
	    }
		$this->view->assign(array(
			//'model'       => $this->cmodel[$modelid],
			'catname'     => $this->cats[$catid]['catname'],
			'catid'       => $catid,
			'fields'      => $this->cmodel[$modelid]['fields']['data'],
			'permission'  => $this->membergroup[$this->memberinfo['groupid']]['setting'][$catid],
			'arr_fields'  => $this->getFieldsList($this->cmodel[$modelid]['fields'], $data),
	        'data_fields' => $this->getFields($fields, $data),
			'meta_title'  => lang('m-con-16') . '-' . lang('member') . '-' . $this->site['SITE_NAME']
	    ));
	    //$this->view->display('member/content_add');
		$this->view->display('member/' . (is_file(VIEW_DIR . SYS_THEME_DIR . 'member' . DIRECTORY_SEPARATOR . $this->cats[$catid]['catdir'].DIRECTORY_SEPARATOR."content_add.html") ? $this->cats[$catid]['catdir'].DIRECTORY_SEPARATOR.'content_add' : 'content_add'));
	}
	
	/**
	 * 修改
	 */
    public function editAction() {
	    $id       = (int)$this->get('id');
	    //$data     = $this->content->where('sysadd=0 AND userid=' . $this->memberinfo['id'])->where('username=?', $this->memberinfo['username'])->where('id=' . $id)->select(false);
		$data     = $this->content->where('id=' . $id)->select(false);
	    $catid    = $data['catid'];
	    if (empty($data))  $this->memberMsg(lang('m-con-17'));
	    if (empty($catid)) $this->memberMsg(lang('m-con-18'));
		if ($data['status'] != 1) {	//该文档处于非审核状态时
			$data = $this->content->get_extend_data($id, $data); //获取内容扩展数据
			$data = $this->content->get_verify_data($id, $data); //获取审核表中数据
		}
	    $modelid  = $this->cats[$catid]['modelid'];
	    $fields   = $this->cmodel[$modelid]['fields'];
		
		//投稿权限验证
		if (!in_array("edit",$this->group['setting'][$catid]))$this->memberMsg(lang('m-con-12'));
		if ($this->post('submit')) {
	        //$data  = $this->post('data');
			$_data = $data;
	        unset($data);
	        $data  = $this->post('data');
			
			$this->checkFields($fields, $data, 2);
			$data['id']			= $id;
	        $data['sysadd']    	= 0;
	        $data['status']     = !isset($this->group['postverify']) || $this->group['postverify'] ? 3 : 1;
			$data['userid']		= $this->memberinfo['id'];
	        $data['modelid']    = (int)$modelid;
	        $data['username']	= $this->memberinfo['username'];
			$data['inputtime']  = $_data['inputtime'];
	        $data['updatetime'] = time();
	        $result = $this->content->member($id, $this->cmodel[$modelid]['tablename'], $data);
	        if (!is_numeric($result)) $this->memberMsg($result);
			
			if ($data['status'] == 1 || $data['status'] == 4) {	//审核通过
				$this->createShow($data);
				//$this->memberMsg(lang('success'), url('member/content/', array('modelid' => $modelid)), 1);
				echo json_encode(array("success"=>1,"id"=>$data['id']));
				//echo '{"success":1}';
				return ;
			} else {	//等待审核
				$this->memberMsg(lang('a-mod-139'), url('member/content/verify', array('modelid' => $modelid)), 1);
			}
			$this->set_post_count($id,$data,-1);
			return;		//由于采用ajax方式，所以直接返回
	    }
	    //附表内容
	    $table       = $this->model($this->cmodel[$modelid]['tablename']);
	    $table_data  = $table->find($id);
	    if ($table_data) $data = array_merge($data, $table_data); //合并主表和附表
		
	    $this->view->assign(array(
	        'data'		  => $data,
			'model'       => $this->cmodel[$modelid],
			'modelid'     => $modelid,
			'catid'		  => $catid,
			'catname'	  => $this->cats[$catid]['catname'],
			'fields'      => $this->cmodel[$modelid]['fields']['data'],
			'permission'  => $this->membergroup[$this->memberinfo['groupid']]['setting'][$catid],
			'arr_fields'  => $this->getFieldsList($this->cmodel[$modelid]['fields'],$data),
	        'data_fields' => $this->getFields($fields, $data)
	    ));
	    //$this->view->display('member/content_add');
		$this->view->display('member/' . (is_file(VIEW_DIR . SYS_THEME_DIR . 'member' . DIRECTORY_SEPARATOR . $this->cats[$catid]['catdir'].DIRECTORY_SEPARATOR."content_add.html") ? $this->cats[$catid]['catdir'].DIRECTORY_SEPARATOR.'content_add' : 'content_add'));
	}

	/**
	 * 查看
	 */
    public function showAction() {
	    $id       = (int)$this->get('id');
		$data     = $this->content->where('id=' . $id)->select(false);
	    $catid    = $data['catid'];
	    if (empty($data))  $this->memberMsg(lang('m-con-17'));
	    if (empty($catid)) $this->memberMsg(lang('m-con-18'));
		if ($data['status'] != 1) {								 //该文档处于非审核状态时
			$data = $this->content->get_extend_data($id, $data); //获取内容扩展数据
			$data = $this->content->get_verify_data($id, $data); //获取审核表中数据
		}
	    $modelid  = $this->cats[$catid]['modelid'];
	    $fields   = $this->cmodel[$modelid]['fields'];
		//权限验证
		if (!in_array("view",$this->group['setting'][$catid])) $this->memberMsg(lang('m-con-12'));
	    //附表内容
	    $table       = $this->model($this->cmodel[$modelid]['tablename']);
	    $table_data  = $table->find($id);
	    if ($table_data) $data = array_merge($data, $table_data); //合并主表和附表
		$this->view->assign(array(
	        'data'		  => $data,
			//'model'       => $this->cmodel[$modelid],
			'catid'       => $catid,
			'fields'      => $this->cmodel[$modelid]['fields']['data'],
			'permission'  => $this->membergroup[$this->memberinfo['groupid']]['setting'][$catid],
			'fields_text' => $this->getFieldsText($fields, [$data])
	    ));
	    //$this->view->display('member/content_show');
		$this->view->display('member/' . (is_file(VIEW_DIR . SYS_THEME_DIR . 'member' . DIRECTORY_SEPARATOR . $this->cats[$catid]['catdir'].DIRECTORY_SEPARATOR."content_show.html") ? $this->cats[$catid]['catdir'].DIRECTORY_SEPARATOR.'content_show' : 'content_show'));
	}

	/**
	 * 转载
	 */
    public function reprintAction() {
	    $id       = (int)$this->get('id');
	    //$data     = $this->content->where('sysadd=0 AND userid=' . $this->memberinfo['id'])->where('username=?', $this->memberinfo['username'])->where('id=' . $id)->select(false);
		$data     = $this->content->where('sysadd=0')->where('id=' . $id)->select(false);
	    $catid    = $data['catid'];
	    if (empty($data))  $this->memberMsg(lang('m-con-17'));
	    if (empty($catid)) $this->memberMsg(lang('m-con-18'));
		if ($data['status'] != 1) {	//该文档处于非审核状态时
			$data = $this->content->get_extend_data($id, $data); //获取内容扩展数据
			$data = $this->content->get_verify_data($id, $data); //获取审核表中数据
		}
	    $modelid  = $this->cats[$catid]['modelid'];
	    $fields   = $this->cmodel[$modelid]['fields'];
		//投稿权限验证
		//if (!$this->memberPost($this->cats[$catid]['setting']) || !$this->memberPost($this->cmodel[$modelid]['setting']['auth'])) $this->memberMsg(lang('m-con-12'));
		if (!$this->memberPost($this->group['setting'][$modelid])) $this->memberMsg(lang('m-con-12'));
	    if ($this->post('submit')) {
	        $data  = $this->post('data');
			$catid = $data['catid'];
			if (empty($catid)) $this->memberMsg(lang('m-con-8'));
			if (!isset($this->cats[$catid])) $this->memberMsg(lang('m-con-9', array('1' => $catid)));
			//投稿权限验证
			if ($this->cats[$catid]['child']) $this->memberMsg(lang('m-con-11'));
			//if (!$this->memberPost($this->cats[$catid]['setting']) || !$this->memberPost($this->cmodel[$modelid]['setting']['auth'])) $this->memberMsg(lang('m-con-12'));
			if (!$this->memberPost($this->group['setting'][$modelid])) $this->memberMsg(lang('m-con-12'));
		    //用户组验证
			$this->postCheck($modelid);
	        if (empty($data['title'])) $this->memberMsg(lang('m-con-13'));
			$this->checkFields($fields, $data, 2);
			$data['userid']    = $this->memberinfo['id'];
	        $data['sysadd']    = 0;
			$data['status']    = !isset($this->group['postverify']) || $this->group['postverify'] ? 3 : 1;
	        $data['modelid']   = (int)$modelid;
	        $data['username']  = $this->memberinfo['username'];
			$data['realname']  = $this->memberinfo['nickname'];
	        $data['inputtime'] = $data['updatetime'] = time();
			//$this->postEvent($data, 'before', 'member');	//发布前事件
	        $data['id']        = $result = $this->content->member(0, $this->cmodel[$modelid]['tablename'], $data);
	        if (!is_numeric($result)) $this->memberMsg($result);
			//$this->postEvent($data, 'later', 'member');	//发布后事件
			if ($data['status'] == 1) {	//审核通过
				$this->createShow($data);
				//$msg = '<a href="' . url('member/content/add', array('catid' => $data['catid'])) . '" style="font-size:14px;">' . lang('m-con-14') . '</a>&nbsp;&nbsp;<a href="' . url('member/content/', array('modelid'=>$modelid)) . '" style="font-size:14px;">' . lang('m-con-15') . '</a>';
				echo "发布成功!";
				return;
				//$this->memberMsg($msg, url('member/content/', array('modelid' => $modelid)), 1);
				
				
			} else {	//等待审核
				$msg = '<a href="' . url('member/content/add', array('catid' => $data['catid'])) . '" style="font-size:14px;">' . lang('m-con-14') . '</a>&nbsp;&nbsp;<a href="' . url('member/content/verify/') . '" style="font-size:14px;">' . lang('a-mod-138') . '</a>';
				$this->memberMsg($msg, url('member/content/verify', array('modelid' => $modelid)), 1, 20);
			}
	    }
	    //附表内容
	    $table       = $this->model($this->cmodel[$modelid]['tablename']);
	    $table_data  = $table->find($id);
	    if ($table_data) $data = array_merge($data, $table_data); //合并主表和附表
	    $this->view->assign(array(
	        'data'		  => $data,
			'model'       => $this->cmodel[$modelid],
			'modelid'     => $modelid,
			'category'    => $this->tree->get_model_tree($this->cats, 0, $catid, '&nbsp;|-', $modelid, $this->memberinfo['modelid'], $this->memberinfo['groupid']),
			'meta_title'  => lang('m-con-19') . '-' . lang('member') . '-' . $this->site['SITE_NAME'],
	        'data_fields' => $this->getFields($fields, $data)
	    ));
	    $this->view->display('member/content_add');
	}
	
	/**
	 * 删除文档
	 */
	public function delAction(){
	    $id    = (int)$this->get('id');
		$data  = $this->content->find($id);
		//$this->memberMsg(json_encode($id,256));
		$catid =$data['catid'];
		//if ($data['sysadd'] == 0 && $data['username'] == $this->memberinfo['username'] && $data['userid'] == $this->memberinfo['id']) {
		//if (!in_array("add",$this->group['setting'][$catid]))
		//$this->memberMsg(json_encode($id));
		if (!in_array("delete",$this->group['setting'][$catid])){
			$this->memberMsg(lang('m-con-23'));
		}else{
		    $this->content->update(array('status' => 0), 'id=' . $id);
			$this->set_post_count($data,-1);
			$file = str_replace(self::get_base_url(), '', $data['url']);
			if (file_exists($file)) @unlink($file);
			$this->memberMsg(lang('success'), '', 1);
		}
	}
	
	private function set_post_count($data,$count){
		$id=$data['id'];
		if (is_numeric($data['id'])) {
			$cnt_table=$this->content->prefix . 'member_count';	
			$cnt_table  = $this->model('member_count');
			$ipost  = $cnt_table->find($data['userid']);
		
			$modelid=$data['modelid'];
			$dpost[$modelid]=max($ipost['dpost'][$modelid]+$count,0);
			$post=max($ipost['post']+$count,0);
			$cnt_table->update(array('post' => $post, 'dpost' => $dpost), 'id=' . $data['userid']);
		}
		return $id;
	}
	
	/*
	 * 待审管理
	 */
	public function verifyAction() {
	    $page     = (int)$this->get('page');
		$page     = (!$page) ? 1 : $page;
		$verify	  = $this->model('content_' . $this->siteid . '_verify');
		$pagelist = $this->instance('pagelist');
	    $pagesize = isset($this->memberconfig['pagesize']) && $this->memberconfig['pagesize'] ? $this->memberconfig['pagesize'] : 8;
		$pagelist->loadconfig();
	    $where    = 'userid=' . $this->memberinfo['id'];
		$modelid  = (int)$this->get('modelid');
		if ($modelid) $where .= ' AND modelid=' . $modelid;
	    $data     = $verify->page_limit($page, $pagesize)->order(array('updatetime DESC'))->where($where)->select();
	    $total    = $verify->count(null, $where);
	    $pagelist = $pagelist->total($total)->url(url('member/content/verify', array('page' => '{page}', 'modelid' => $modelid)))->num($pagesize)->page($page)->output();
	    $this->view->assign(array(
	        'list'       => $data,
	        'page'       => $page,
	        'modelid'	 => $modelid,
	        'pagelist'   => $pagelist,
			'meta_title' => lang('a-mod-137') . '-' . lang('member') . '-' . $this->site['SITE_NAME']
	    ));
	    $this->view->display('member/verify');
	}
	
	/**
	 * 修改待审
	 */
    public function editverifyAction() {
	    $id       = (int)$this->get('id');
		$verify	  = $this->model('content_' . $this->siteid . '_verify');
	    $data     = $verify->where('userid=' . $this->memberinfo['id'])->where('id=' . $id)->select(false);
	    $catid    = $data['catid'];
	    if (empty($data))  $this->memberMsg(lang('m-con-17'));
	    if (empty($catid)) $this->memberMsg(lang('m-con-18'));
		if ($this->content->find($id)) $this->redirect(url('member/content/edit', array('id' => $id)));	//如果该内容存在于内容表中直接跳转到内容修改
		$data	  = string2array($data['content']);
	    $modelid  = $this->cats[$catid]['modelid'];
	    $fields   = $this->cmodel[$modelid]['fields'];
	    if ($this->post('submit')) {
	        $_data	= $data;
	        $data	= $this->post('data');
	        if (empty($data['title'])) $this->memberMsg(lang('m-con-13'));
	        if ($data['catid'] != $catid && $modelid != $this->cats[$data['catid']]['modelid']) $this->memberMsg(lang('m-con-35'));
			$this->checkFields($fields, $data, 2);
	        $data['sysadd']    	= 0;
			$data['userid']		= $this->memberinfo['id'];
	        $data['status']     = 3;
	        $data['modelid']    = (int)$modelid;
	        $data['username']	= $this->memberinfo['username'];
	        $data['updatetime'] = time();
	        if ($this->content->set_verify_data($id, $this->cmodel[$modelid]['tablename'], $data)) {
				$this->memberMsg(lang('success'), url('member/content/verify', array('modelid' => $modelid)), 1);
			} else {
				$this->memberMsg(lang('failure'), url('member/content/verify', array('modelid' => $modelid)), 1);
			}
	    }
	    $this->view->assign(array(
	        'data'		  => $data,
			'model'       => $this->cmodel[$modelid],
			'modelid'     => $modelid,
			'category'    => $this->tree->get_model_tree($this->cats, 0, $catid, '&nbsp;|-', $modelid, $this->memberinfo['modelid'], $this->memberinfo['groupid']),
			'meta_title'  => lang('m-con-19') . '-' . lang('member') . '-' . $this->site['SITE_NAME'],
	        'data_fields' => $this->getFields($fields, $data)
	    ));
	    $this->view->display('member/content_add');
	}
	
	/**
	 * 删除待审文档
	 */
	public function delverifyAction(){
	    $id		= (int)$this->get('id');
		$verify	= $this->model('content_' . $this->siteid . '_verify');
		$data	= $verify->find($id);
		if ($data['userid'] == $this->memberinfo['id']) {
		    $this->content->update(array('status' => 1), 'id=' . $id);
			$verify->delete('id=' . $id);
			$this->memberMsg(lang('success'), url('member/content/verify', array('modelid' => $data['modelid'])), 1);
		} else {
		    $this->memberMsg(lang('m-con-23'));
		}
	}
	
	/**
	 * 附件管理
	 */
	public function attachmentAction() {
		$dir  = urldecode($this->get('dir'));
	    $type = $this->get('type');
		$mdir = 'uploadfiles/member/' . $this->memberinfo['id'] . '/'; //会员附件目录
		$mdir = $type == 1 ? $mdir . 'file/' : $mdir . 'image/';
		if ($this->checkFileName($dir)) $this->memberMsg(lang('m-con-20'), url('member/content/attachment', array('type' => $type)));
		$dir  = substr($dir, 0, 1) == '/' ? substr($dir, 1) : $dir;
        $data = file_list::get_file_list($mdir . $dir . '/');
        $list = array();
        if ($data) {
            foreach ($data as $t) {
                $path = $mdir . $dir . '/' . $t;
                $ext  = is_dir($path) ? 'dir' : strtolower(trim(substr(strrchr($t, '.'), 1, 10)));
                $ico  = file_exists(basename(VIEW_DIR) . '/admin/images/ext/' . $ext . '.gif') ? $ext . '.gif' : $ext . '.png';
                $info = array();
                if (is_file($path)) {
				    if (strpos($t, '.thumb.') !== false) continue;
                    $info = array(
                        'ext'  => $ext,
                        'path' => $path,
                        'time' => date('Y-m-d H:i:s', filemtime($path)),
                        'size' => formatFileSize(filesize($path), 2)
                    );
                }
                $list[] = array(
                    'dir'   => urlencode($dir . '/' . $t),
                    'ico'   => $ico,
                    'url'   => is_dir($path) ? url('member/content/attachment', array('dir' => urlencode($dir . '/' . $t), 'type' => $type)) : '',
                    'name'  => $t,
					'path'  => $path,
                    'info'  => $info,
                    'isimg' => in_array($ext, array('gif','jpg','png','jpeg','bmp')) ? 1 : 0,
                    'isdir' => is_dir($path) ? 1 : 0
                );
            }
        }
        $this->view->assign(array(
            'dir'        => $dir,
			'type'       => $type,
            'list'       => $list,
            'pdir'       => url('member/content/attachment', array('dir' => urlencode(str_replace(basename($dir), '', $dir)), 'type' => $type)),
            'istop'      => $dir ? 1 : 0,
			'countsize'  => formatFileSize(count_member_size($this->memberinfo['id'], ($type == 1 ? 'file' : 'image')), 2),
			'meta_title' => lang('m-con-5') . '-' . lang('member') . '-' . $this->site['SITE_NAME']
	    ));
	    $this->view->display('member/attachment');
	}
	
	/**
	 * 删除附件
	 */
	public function delattachmentAction() {
	    $type = $this->get('type');
		$mdir = 'uploadfiles/member/' . $this->memberinfo['id'] . '/'; //会员附件目录
		if (!file_exists($mdir)) mkdir($mdir);
		$mdir = $type == 1 ? $mdir . 'file/' : $mdir . 'image/';
		if (!file_exists($mdir)) mkdir($mdir);
		$dir  = urldecode($this->get('dir'));
		$dir  = substr($dir, 0, 1) == '/' ? substr($dir, 1) : $dir;
		if (realpath($mdir . $dir) == false || strpos($dir, '../') !== false || strpos($dir, '..\\') !== false) $this->memberMsg(lang('m-con-21'));
		if (file_exists($mdir . $dir)) {
		    if (is_dir($mdir . $dir)) {
			    $this->delDir($mdir . $dir);
				$this->memberMsg(lang('success'), url('member/content/attachment', array('type' => $type)), 1);
			} else {
			    unlink($mdir . $dir);
				$this->memberMsg(lang('success'), url('member/content/attachment', array('type' => $type, 'dir' => urlencode(dirname($dir)))), 1);
			}
		} else {
		    $this->memberMsg(lang('m-con-22', array('1' => $dir)));
		}
	}
	
	/*
	 * 表单管理
	 */
	public function formAction() {
		$cid      = (int)$this->get('cid');
	    $type     = (int)$this->get('type');
		$page     = $this->get('page') ? (int)$this->get('page') : 1;
		$status   = isset($_GET['status']) ? (int)$this->get('status') : -1;
		$modelid  = (int)$this->get('modelid');
		if (!isset($this->form[$modelid]) || empty($this->form[$modelid])) $this->memberMsg(lang('m-con-24'));
	    $table    = $this->model($this->form[$modelid]['tablename']);
		if ($this->isPostForm() && $this->post('ids')) { //删除
	        $ids  = @implode(',', $this->post('ids'));
			if (empty($ids)) $this->memberMsg(lang('m-con-25'));
			$data = $table->where("userid=" . $this->memberinfo['id'] . " and username='" . $this->memberinfo['username'] . "' and id in(" . $ids . ")")->select();
			if (empty($data)) $this->memberMsg(lang('m-con-25'));
			foreach ($data as $t) {
				$file = substr(form_show_url($modelid, $t), strlen(Controller::get_base_url())); //去掉主域名
				$file = substr($file, 0, 9) == 'index.php' ? null : $file; //是否为动态链接
				if ($file && file_exists($file)) @unlink($file);
				$table->update(array('status'=>3), 'id=' . $t['id']);
			}
	    }
		$showme   = isset($this->form[$modelid]['joinid']) && isset($this->form[$modelid]['setting']['form']['showme']) ? $this->form[$modelid]['setting']['form']['showme'] : 0;
	    $pagelist = $this->instance('pagelist');
		$pagelist->loadconfig();
	    $pagesize = isset($this->memberconfig['pagesize']) && $this->memberconfig['pagesize'] ? $this->memberconfig['pagesize'] : 8;
		if ($this->form[$modelid]['joinid'] && $type && $showme) {
		    $where = empty($cid) ? '`cid` IN (SELECT `id` FROM `' . $this->content->prefix . 'content_' . $this->siteid . '` WHERE `modelid`=' . $this->form[$modelid]['joinid'] . ' AND `sysadd`=0 AND `status`>0 AND `userid`=' . $this->memberinfo['id'] . ' AND `username`="' . $this->memberinfo['username'] . '")' : '`cid` IN (SELECT `id` FROM `' . $this->content->prefix . 'content_' . $this->siteid . '` WHERE `modelid`=' . $this->form[$modelid]['joinid'] . ' AND `sysadd`=0 AND `status`>0 AND `userid`=' . $this->memberinfo['id'] . ' AND `username`="' . $this->memberinfo['username'] . '" AND id=' . $cid . ')';
		} else {
		    $where = (empty($cid) ? '' : '`cid`=' . $cid . ' AND ') . '`userid`=' . $this->memberinfo['id'] . ' AND `username`="' . $this->memberinfo['username'] . '"';
		}
		$where	 .= $status > 0 && $status < 3 ? ' AND `status`=' . $status : '';
	    $data     = $table->page_limit($page, $pagesize)->order('updatetime DESC')->where($where)->select();
		$total    = $table->count($this->form[$modelid]['tablename'], 'id', $where);
	    $pagelist = $pagelist->total($total)->url(url('member/content/form', array('modelid' => $modelid, 'type' => $type, 'status' => $status, 'page' => '{page}')))->num($pagesize)->page($page)->output();
	    $this->view->assign(array(
	        'list'		 => $data,
	        'page'       => $page,
			'type'       => $type,
			'form'       => $this->form[$modelid],
			'join'       => $this->form[$modelid]['joinid'] ? $this->form[$modelid]['joinname'] : 0,
			'status'	 => $status,
			'showme'     => $showme,
			'modelid'    => $modelid,
	        'pagelist'   => $pagelist,
	        'listdata'   => $data,
			'meta_title' => $this->form[$modelid]['joinname'] . $this->form[$modelid]['modelname'] . '-' . lang('member') . '-' . $this->site['SITE_NAME'],
			'showfields' => isset($this->form[$modelid]['setting']['form']['membershow']) ? $this->form[$modelid]['setting']['form']['membershow'] : array(),
	    ));
	    $this->view->display('member/form_list');
	}
	
	/*
	 * 修改表单内容
	 */
	public function formeditAction() {
	    $id		 = (int)$this->get('id');
		$modelid = (int)$this->get('modelid');
		if (empty($id)) $this->memberMsg(lang('m-con-28'));
		if (empty($modelid)) $this->memberMsg(lang('m-con-26'));
	    $fmodel  = $this->get_model('form');
		$model   = $fmodel[$modelid];
		if (empty($model)) $this->memberMsg(lang('m-con-27', array('1' => $modelid)));
		if (empty($model['setting']['form']['edit'])) $this->memberMsg(lang('a-mod-146'));
		$form    = $this->model($model['tablename']);
		$data    = $form->find($id);
		if (empty($data)) $this->memberMsg(lang('m-con-29'));
		if ($data['username'] != $this->memberinfo['username'] || $data['userid'] != $this->memberinfo['id']) $this->memberMsg(lang('m-con-29'));
		if ($this->isPostForm()) {
			$_data = $data;
			$data  = $this->post('data');
			$this->checkFields($model['fields'], $data, 2);
			//删除系统保留字段 	 	 	 	 	 	 	
			unset($data['cid'],$data['userid'],$data['username'],$data['listorder'],$data['status'],$data['inputtime'],$data['ip']);
			$data['status']		= empty($model['setting']['form']['check']) ? 1 : 0;
			$data['updatetime'] = time();
			if ($data['id']		= $form->set($id, $data)) {
				if (isset($model['setting']['form']['url']['tohtml']) && $model['setting']['form']['url']['tohtml'] && $data['status'] == 1) {
					$this->createForm($modelid, @array_merge($_data, $data));
				}
			    $this->memberMsg($data['status'] ? lang('success') : lang('for-9'), url('member/content/form', array('modelid' => $modelid)), 1);
			} else {
			    $this->memberMsg(lang('for-10'));
			}
		}
		$this->view->assign(array(
			'data'        => $data,
			'form'        => $model,
			'modelid'     => $modelid,
			'meta_title'  => $model['joinname'] . $model['modelname'] . '-' . lang('member') . '-' . $this->site['SITE_NAME'],
			'data_fields' => $this->getFields($model['fields'], $data),
		));
		$this->view->display('member/form_edit');
	}
	
	/**
	 * 会员扩展管理
	 */
	public function extendAction() {
		$page		= $this->get('page') ? (int)$this->get('page') : 1;
		$typeid		= (int)$this->get('typeid');
		$userid		= (int)$this->get('userid');
		$status		= isset($_GET['status']) ? (int)$this->get('status') : -1;
		$modelid	= (int)$this->get('modelid');
		$touserid	= (int)$this->get('touserid');
		if (!isset($this->emodel[$modelid])) $this->memberMsg(lang('a-mod-4'));
		$post		= !$this->memberPost($this->emodel[$modelid]['setting']['auth']);
		$admin		= $this->emodel[$modelid]['setting']['member']['admin'];
		$pagelist	= $this->instance('pagelist');
	    $pagesize	= isset($this->memberconfig['pagesize']) && $this->memberconfig['pagesize'] ? $this->memberconfig['pagesize'] : 8;
		$pagelist->loadconfig();
		
		$allow=$this->group['setting'][$modelid];
		if($typeid==1 && !$allow['allowview'])$this->memberMsg(lang('m-con-12'));
		if($typeid==0 && !$allow['allowpost'])$this->memberMsg(lang('m-con-12'));

		$extend		= $this->model($this->emodel[$modelid]['tablename']);	//实例化模型
		
		if ($typeid==0) {	//我提交的内容，具有删除权限
			if ($this->isPostForm() && $this->post('ids')) {
				$ids	= @implode(',', $this->post('ids'));
				if (empty($ids)) $this->memberMsg(lang('m-con-25'));
				$data	= $extend->where("id IN(" . $ids . ") AND userid=" . $this->memberinfo['id'] . " AND username='" . $this->memberinfo['username'] . "'")->select();
				if (empty($data)) $this->memberMsg(lang('m-con-25'));
				$_ids	= '';
				foreach ($data as $t) {
					$_ids .= $t['id'] . ',';
				}
				$extend->update(array('status' => 3), 'id IN(' . substr($_ids, 0, -1) . ')');
			} 
			$where	= 'userid=' . $this->memberinfo['id'] . ' AND `status`<>3';
			$where .= $touserid ? ' AND touserid=' . $touserid : '';
			$where .= $status > 0 && $status < 3 ? ' AND `status`=' . $status : '';
			$data	= $extend->page_limit($page, $pagesize)->order('updatetime DESC')->where($where)->select();
			$total	= $extend->count($this->form[$modelid]['tablename'], 'id', $where);
			$param	= array(
				'page'		=> '{page}',
				'typeid'	=> $typeid,
				'status'	=> $status,
				'modelid'	=> $modelid,
				'touserid'	=> $touserid
			);
			$plist	= $pagelist->total($total)->url(url('member/content/extend', $param))->num($pagesize)->page($page)->output();
		} else {	//其他人向我提交的内容，具有审核权限
			if ($this->isPostForm() && $this->post('ids')) {
				$ids	= @implode(',', $this->post('ids'));
				if (empty($ids)) $this->memberMsg(lang('m-con-25'));
				$data	= $extend->where("id IN(" . $ids . ") AND touserid=" . $this->memberinfo['id'])->select();
				if (empty($data)) $this->memberMsg(lang('m-con-25'));
				$_ids	= '';
				foreach ($data as $t) {
					$_ids .= $t['id'] . ',';
				}
				$extend->update(array('status' => 1), 'id IN(' . substr($_ids, 0, -1) . ')');
			} 
			$where	= 'touserid=' . $this->memberinfo['id'] . ' AND `status`<>3';
			$where .= $userid ? ' AND userid=' . $userid : '';
			$where .= $status > 0 && $status < 3 ? ' AND `status`=' . $status : '';
			$data	= $extend->page_limit($page, $pagesize)->order('updatetime DESC')->where($where)->select();
			$total	= $extend->count($this->form[$modelid]['tablename'], 'id', $where);
			$param	= array(
				'page'		=> '{page}',
				'typeid'	=> $typeid,
				'status'	=> $status,
				'modelid'	=> $modelid,
				'userid'	=> $userid
			);
			$plist	= $pagelist->total($total)->url(url('member/content/extend', $param))->num($pagesize)->page($page)->output();
		}
		//Log::write("ContentController.php rwo672".json_encode($this->getFieldsText($this->emodel[$modelid]['fields'], $data),JSON_UNESCAPED_UNICODE));
		//Log::write("ContentController.php rwo673".json_encode($data,JSON_UNESCAPED_UNICODE));
		$this->view->assign(array(
			//'list'			=> $data,
			'admin'			=> $admin,
			'typeid'		=> $typeid,
			'status'		=> $status,
			'showme'		=> $this->emodel[$modelid]['setting']['member']['showme'],
			'verify'		=> $this->emodel[$modelid]['setting']['member']['check'] && $admin,
			'modelid'		=> $modelid,
			'pagelsit'		=> $plist,
			'meta_title'	=> $this->emodel[$modelid]['modelname'] . '-' . lang('member') . '-' . $this->site['SITE_NAME'],
			'list_text'     => $this->getFieldsText($this->emodel[$modelid]['fields'], $data),
		));
		$this->view->display('member/' . (is_file(VIEW_DIR . SYS_THEME_DIR . 'member' . DIRECTORY_SEPARATOR . $this->emodel[$modelid]['listtpl']) ? substr($this->emodel[$modelid]['listtpl'], 0, -5) : 'extend_list'));
	}
	
	/*
	 * 修改会员扩展内容
	 */
	public function extendeditAction() {
	    $id			= (int)$this->get('id');
		$modelid	= (int)$this->get('modelid');
		if (!isset($this->emodel[$modelid])) $this->memberMsg(lang('a-mod-4'));
		$post		= $this->memberPost($this->emodel[$modelid]['setting']['auth']);
		$admin		= !$this->emodel[$modelid]['setting']['member']['admin'];
		if (!$admin && $post) $this->memberMsg(lang('m-con-12'));	//权限验证
		$extend		= $this->model($this->emodel[$modelid]['tablename']);	//实例化模型
		$data		= $extend->find($id);
		if (empty($data)) {
			$this->memberMsg(lang('m-con-29'));
		} elseif ($data['userid'] != $this->memberinfo['id'] && $data['touserid'] != $this->memberinfo['id']) {
			$this->memberMsg(lang('m-con-29'));
		}
		if ($this->isPostForm()) {
			if ($data['userid'] == $this->memberinfo['id']) {	//我的提交，修改操作
				$edit	= $this->post('data');
				$this->checkFields($this->emodel[$modelid]['fields'], $edit, 2);
				//删除系统保留字段 	 	 	 	 	 	 	
				unset($edit['touserid'],$edit['userid'],$edit['username'],$edit['status'],$edit['inputtime'],$edit['ip']);
				$edit['status']		= empty($this->emodel[$modelid]['setting']['member']['check']) ? 1 : 0;
				$edit['updatetime'] = time();
				$extend->update($edit, 'id=' . $id);
				$this->memberMsg($edit['status'] ? lang('success') : lang('for-9'), '', 1);
			} elseif ($data['touserid'] == $this->memberinfo['id'] && $admin && ($data['status'] == 0 || $data['status'] == 2)) {	//对我的提交，审核操作
				$edit['verify']		= $this->post('verify');
				$edit['status']		= $this->post('status');
				$extend->update($edit, 'id=' . $id);
				$this->memberMsg(lang('success'), '', 1);
			}
		}

		if ($data['userid'] == $this->memberinfo['id']) {	//我的提交
			$this->view->assign(array(
				'data'        => $data,
				'modelid'     => $modelid,
				'frommember'  => $this->memberinfo,
				'tomember'	  => get_member_info($data['touserid'], 1),
				'meta_title'  => $this->emodel[$modelid]['modelname'] . '-' . lang('member') . '-' . $this->site['SITE_NAME'],
				'data_fields' => $this->getFields($this->emodel[$modelid]['fields'], $data)
			));
			$this->view->display('member/extend_edit');
		} elseif ($data['touserid'] == $this->memberinfo['id'] && $admin && ($data['status'] == 0 || $data['status'] == 2)) {	//对我的提交，我具有管理权限
			$this->view->assign(array(
				'data'        => $data,
				'modelid'     => $modelid,
				'frommember'  => get_member_info($data['userid'], 1),
				'tomember'	  => $this->memberinfo,
				'meta_title'  => $this->emodel[$modelid]['modelname'] . '-' . lang('member') . '-' . $this->site['SITE_NAME'],
				'data_fields' => $this->getFields($this->emodel[$modelid]['fields'], $data),
				'list_text'   => $this->getFieldsText($this->emodel[$modelid]['fields'], $data),
			));
			$this->view->display('member/extend_verify');
		} else {	//对我提交的，无管理则查看权限
			$d[$id]=$data;
			$fields=$this->emodel[$modelid]['fields'];
			$list=$this->getFieldsText($fields, $d)[$id];
			$this->view->assign(array(
				'data'        => $list,
				'fields'      => $fields,
				'modelid'     => $modelid,
				'frommember'  => get_member_info($data['userid'], 1),
				'tomember'	  => $this->memberinfo,
				'meta_title'  => $this->emodel[$modelid]['modelname'] . '-' . lang('member') . '-' . $this->site['SITE_NAME'],	
			));
			$this->view->display('member/' . (is_file(VIEW_DIR . SYS_THEME_DIR . 'member' . DIRECTORY_SEPARATOR . $this->emodel[$modelid]['showtpl']) ? substr($this->emodel[$modelid]['showtpl'], 0, -5) : 'extend_show'));
		}
	}
	
    /**
	 * 标题是否重复检查
	 */
	public function ajaxtitleAction() {
	    $id    = $this->post('id');
	    $title = $this->post('title');
	    if (empty($title)) exit(lang('m-con-31'));
	    $where = $id ? "title='" . $title . "' and id<>" . $id : "title='" . $title . "'";
	    $data  = $this->content->getOne($where); 
	    if ($data) exit(lang('m-con-32'));
	    exit(lang('m-con-33'));
	}
	
	/**
	 * 发布数量检测
	 */
	private function postCheck($modelid) {
		$count = $this->model('member_count');
		$data  = $count->find($this->memberinfo['id']);
		if (empty($data)) return true;
		if (date('Y-m-d') != date('Y-m-d', $data['updatetime'])) {
		    //重置统计数据
			$data['post']       = 0;
			$data['dpost']      = null;
			$data['updatetime'] = time();
			$count->update($data, 'id=' . $this->memberinfo['id']);
		}
		$dpost=string2array($data['dpost']);
		$daily_post=$dpost[$modelid]?$dpost[$modelid]:0;
		//$daily_limit=$this->cmodel[$modelid]['setting']['auth']['modelpost']['member_'.$this->memberinfo['modelid'].'_daily'];
		$daily_limit=$this->group['setting'][$modelid]['allowpost'];
		$daily_limit=$daily_limit?$daily_limit:0;
		if ($daily_post >= $daily_limit) $this->memberMsg(lang('m-con-34', array('1' => $daily_limit)));
		//if ($data['post'] >= $this->group['allowpost']) $this->memberMsg(lang('m-con-34', array('1' => $this->group['allowpost'])));
	}
	
	/**
	 * 获取发布数量
	 */
	private function getPosts() {
		$count = $this->model('member_count');		
		$data  = $count->find($this->memberinfo['id']);		
		if (empty($data)) $count->insert(array('id' => $this->memberinfo['id'])); 		
		if (date('Y-m-d') != date('Y-m-d', $data['updatetime'])) {
		    //重置统计数据
			$data['post']       = 0;
			$data['dpost']      = null;
			$data['updatetime'] = time();
			$count->update($data, 'id=' . $this->memberinfo['id']);
		}
		$dpost=string2array($data['dpost']);
		$modelid =(int)$this->get('modelid');
		$daily_post=$dpost[$modelid]?$dpost[$modelid]:0;
		//$daily_limit=$this->cmodel[$modelid]['setting']['auth']['modelpost']['member_'.$this->memberinfo['modelid'].'_daily'];
		$daily_limit=$this->group['setting'][$modelid]['allowpost'];
		$daily_limit=$daily_limit?$daily_limit:0;
		return array('post' => $daily_post, 'posts' => $daily_limit);
		//return array('post' => $data['post'], 'posts' => $this->group['allowpost']);
	}
	
}