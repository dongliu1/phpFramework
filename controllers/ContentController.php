<?php

class ContentController extends Common {
    
    public function __construct() {
		parent::__construct();
	}
	
	public function indexAction() {
		listAction();
	}
	/**
	 * 栏目列表页
	 */
	public function listAction() {
	    $page   = $this->get('page') ? (int)$this->get('page') : 1;
	    $catid  = (int)$this->get('catid');
	    $catdir = $this->get('catdir');
	    if ($catdir && empty($catid)) $catid = $this->cats_dir[$catdir];
	    $cat	= $this->cats[$catid];
	    if (empty($cat)) {
		    header('HTTP/1.1 404 Not Found');
			$this->msg(lang('con-0', array('1' => ($catdir && empty($catid) ? $catdir : $catid))));
		}
	    if ($cat['typeid'] == 1) {
	        //内部栏目
			$this->view->assign($cat);
			$this->view->assign(listSeo($cat, $page));
	        $this->view->assign(array(
	            'page'    => $page,
	            'catid'   => $catid,
	            'pageurl' => urlencode($this->getCaturl($cat, '{page}'))
	        ));
	        //$this->view->display(substr(($cat['child'] == 1 ? $cat['categorytpl'] : $cat['listtpl']), 0, -5));
			$disp_file=$cat['child'] == 1 ? $cat['categorytpl'] : $cat['listtpl'];
			$this->view->display((is_file(VIEW_DIR . SYS_THEME_DIR . $disp_file) ? substr($disp_file, 0, -5) : 'list'));	
	    } elseif ($cat['typeid'] == 2) {
	        //单网页
			$cat = $this->get_content_page($cat, 0, $page);
	        $cat['content'] = relatedlink($cat['content']);
			$this->view->assign($cat);
			$this->view->assign(listSeo($cat, $page));
	        //$this->view->display(substr($cat['showtpl'], 0, -5));
			$this->view->display((is_file(VIEW_DIR . SYS_THEME_DIR . $cat['showtpl']) ? substr($cat['showtpl'], 0, -5) : 'show'));	
	    } else {
	        //外部链接
	        header('Location: ' . $cat['url']);
	    }
	}
	
	/**
	 * 内容详细页
	 */
	public function showAction() {
	    $id		= (int)$this->get('id');
	    $page	= $this->get('page') ? (int)$this->get('page') : 1;
	    $data	= $this->content->find($id);	//查询当前文档数据
	    $model	= $this->get_model();	//获取模型缓存
	    $catid	= $data['catid'];	//赋值栏目id
	    $cat	= $this->cats[$catid];	//获取当前文档的栏目数据
	    if (empty($data) || $data['status'] == 0) {	//判断数据是否存在或文档状态是否通过
		    header('HTTP/1.1 404 Not Found');
		    $this->msg(lang('con-1', array('1' => $id)));
		} elseif (!isset($model[$data['modelid']]) || empty($model[$data['modelid']])) {	//判断模型是否存在
			header('HTTP/1.1 404 Not Found');
			$this->msg(lang('con-3', array('1' => $id)));
		} elseif (empty($cat)) {	//判断栏目是否存在
		    header('HTTP/1.1 404 Not Found');
			$this->msg(lang('con-0', array('1' => ($catdir && empty($catid) ? $catdir : $catid))));
		}
	    $table	= $this->model($model[$data['modelid']]['tablename']);
	    $_data	= $table->find($id);	//附表数据查询
	    $data	= array_merge($data, $_data); //合并主表和附表
		$data	= $this->getFieldData($model[$cat['modelid']], $data);	//格式化部分数据类型
		$data	= $this->get_content_page($data, 1, $page);	//内容分页和子标题
	    $data['content'] = relatedlink($data['content']);	//关联链接
		$prev_page = $this->content->getOne("`catid`=$catid AND `id`<$id AND `status`=1 ORDER BY `id` DESC", null, 'title,url,hits');	//上一篇文章
		$next_page = $this->content->getOne("`catid`=$catid AND `id`>$id AND `status`=1", null, 'title,url,hits');	//下一篇文章
	    $this->view->assign(array(
	        'cat'       => $cat,
	        'page'      => $page,
	        'pageurl'   => urlencode(getUrl($data, '{page}')),
	        'prev_page' => $prev_page,
	        'next_page' => $next_page
	    ));
	    $this->view->assign($data);
	    $this->view->assign(showSeo($data, $page));
		//$this->view->display(substr($cat['showtpl'], 0, -5));
		$this->view->display((is_file(VIEW_DIR . SYS_THEME_DIR . $cat['showtpl']) ? substr($cat['showtpl'], 0, -5) : 'show'));	    
	}
	
	/**
	 * 内容搜索
	 */
	public function searchAction() {
		$kw    = $this->get('kw');
		$kw    = urldecode($kw);
		$sql   = null;
		$page  = (int)$this->get('page') > 0 ? (int)$this->get('page') : 1;
	    $param = $this->getParam();
		if ($this->site['SITE_SEARCH_TYPE'] == 2) {
		    //Sphinx
			if (empty($kw)) $this->msg(lang('con-5'));
		    App::auto_load('sphinxapi');
            $cl   = new SphinxClient ();
			$host = $this->site['SITE_SEARCH_SPHINX_HOST'];
			$prot = $this->site['SITE_SEARCH_SPHINX_PORT'];
			$name = $this->site['SITE_SEARCH_SPHINX_NAME'];
			$start= ($page - 1) * (int)$this->site['SITE_SEARCH_PAGE'];
			$limit= (int)$this->site['SITE_SEARCH_PAGE'];
            $cl->SetServer($host, 9312);
            $cl->SetMatchMode(SPH_MATCH_ALL);
            $cl->SetSortMode(SPH_SORT_EXTENDED, 'updatetime DESC');
            $cl->SetLimits($start, $limit);
			$res = $cl->Query($kw, $this->site['SITE_SEARCH_SPHINX_NAME']);
			if ($res['total']) {
			    $ids     = '';
				foreach ($res['matches'] as $cid=>$val) {
				    $ids .= $cid . ',';
				}
				$ids     = substr($ids, -1) == ',' ? substr($ids, 0, -1) : $ids;
			    $total   = $res['total'];
				$pageurl = $this->site['SITE_SEARCH_URLRULE'] ? str_replace('{id}', urlencode($kw), $this->site['SITE_SEARCH_URLRULE']) : url('content/search', array('kw' => urlencode($kw), 'page' => '{page}'));
				$sql     = 'SELECT id,modelid,catid,url,thumb,title,keywords,description,username,updatetime,inputtime from ' . $this->content->prefix . 'content_' . $this->siteid . ' WHERE id IN (' . $ids . ') ORDER BY updatetime DESC LIMIT ' . $limit;
			}
		} else {
		    //普通搜索
		    $search  = $this->model('search');
			$start   = ($page - 1) * (int)$this->site['SITE_SEARCH_PAGE'];
			$limit   = $this->site['SITE_SEARCH_PAGE'] ? (int)$this->site['SITE_SEARCH_PAGE'] : 10;
			$cache   = (int)$this->site['SITE_SEARCH_INDEX_CACHE'];
		    $result  = $search->getData((int)$this->get('id'), $cache, $param, $start, $limit, $this->site['SITE_SEARCH_KW_FIELDS'], $this->site['SITE_SEARCH_KW_OR']);
			$kw      = $result['keywords'];
			$sql     = $result['sql'];
			$total   = $result['total'];
			$catid   = $result['catid'];
			$modelid = $result['modelid'];
			$pageurl = $this->site['SITE_SEARCH_URLRULE'] ? str_replace('{id}', $result['id'], $this->site['SITE_SEARCH_URLRULE']) : url('content/search', array('id' => $result['id'], 'page' => '{page}'));
		}
		if ($sql) {
			$pagelist = $this->instance('pagelist');
			$pagelist->loadconfig();
			$data     = $this->content->execute($sql, true, $this->site['SITE_SEARCH_DATA_CACHE']);
			$pagelist = $pagelist->total($total)->url($pageurl)->num($this->site['SITE_SEARCH_PAGE'])->page($page)->output();
	    } else {
		    $data     = array();
			$total    = 0;
			$pagelist = '';
		}
	    $this->view->assign(listSeo($cat, $page, $kw));
	    $this->view->assign(array(
			'id'         => $id,
			'kw'         => $kw,
			'model'      => $this->get_model(),
			'catid'      => $catid,
			'modelid'    => $modelid,
	        'searchpage' => $pagelist,
	        'searchdata' => $data,
			'searchnums' => $total
	    ));
	    $this->view->display('search');
	}
	
	/**
	 * 游客投稿
	 */
	public function postAction() {
		if ($this->post('select') && $this->isPostForm()) $this->redirect(url('content/post', array('catid' => (int)$this->post('catid'))));
		$catid = (int)$this->get('catid');
		$tree  = $this->instance('tree');
		$tree->config(array('id' => 'catid', 'parent_id' => 'parentid', 'name' => 'catname'));
		if (empty($catid)) {
			$icats="";
			foreach ($this->cats as $key=>$val){
				if(isset($val['setting']['guestpost']) && !empty($val['setting']['guestpost'])){
					$icats.='<input name="catid" type="radio" value="'.$key.'">' .$val['setting']['guestpost'].$val['catname'];
				}
			}
			$this->view->assign(array(
				'select'     => 1,
				//'category'   => $tree->get_tree($this->cats, 0, null, '&nbsp;|-', true, 0, 0, true),
				'category'   => $icats,
				'meta_title' =>	lang('a-cat-94') . '-' . $this->site['SITE_NAME']
			));
			$this->view->display('guest_post');
		} else {
			if (!isset($this->cats[$catid])) $this->msg(lang('m-con-9', array('1' => $catid)), null, 1);
			$model    = $this->get_model();
			$modelid  = $this->cats[$catid]['modelid'];
			if (!isset($model[$modelid])) $this->msg(lang('m-con-10'), null, 1);
			//投稿权限验证
			if (isset($this->cats[$catid]['setting']['guestpost']) && $this->cats[$catid]['setting']['guestpost']) {
				//验证投稿数量
				$where = 'userid=0 AND username="' . client::get_user_ip() . '" AND inputtime between ' . strtotime(date('Y-m-d 0:0:0')) . ' and ' . strtotime(date('Y-m-d 23:59:59'));
				$count = $this->content->_count(null, $where);
				if ($count >= $this->cats[$catid]['setting']['guestpost']) $this->msg(lang('a-cat-95', array('1' => $this->cats[$catid]['setting']['guestpost'])), null, 1);
			} else {
				$this->msg(lang('m-con-12'), null, 1);
			}
			$fields = $model[$modelid]['fields'];
			if ($this->cats[$catid]['child']) $this->msg(lang('m-con-11'), null, 1);
			if ($this->post('data') && $this->isPostForm()) {
				if (!$this->checkCode($this->post('code'))) $this->msg(lang('for-4'), null, 1);
				$data = $this->post('data');
				$data['catid']     = $catid;
				$data['userid']    = 0;
				$data['sysadd']    = 0;
				$data['status']    = 4;
				$data['modelid']   = (int)$modelid;
				$data['realname']  = $data['realname']."[".$data['username']."]";
				$data['description']  = " 发布IP：".client::get_user_ip()." 发布时间：".time();
				$data['inputtime'] = $data['updatetime'] = time();
				if (empty($data['title'])) $this->msg(lang('m-con-13'), null, 1);
				$this->checkFields($fields, $data, 3);
				//Log::write("Defalut ContentController.php row211 ".json_encode($data,JSON_UNESCAPED_UNICODE));
				$result = $this->content->member(0, $model[$modelid]['tablename'], $data);
				if (!is_numeric($result)) $this->msg($result, null, 1);
				$this->msg(lang('a-cat-96'), url('content/post'), 1, 5);
			}
			//自定义字段
			$data_fields = $this->getFields($fields);
			$this->view->assign(array(
				'model'       => $model[$modelid],
				'catid'       => $catid,
				'meta_title'  => lang('a-cat-94') . '-' . $this->site['SITE_NAME'],
				'data_fields' => $data_fields
			));
			$this->view->display('guest_post');
		}
	}
}