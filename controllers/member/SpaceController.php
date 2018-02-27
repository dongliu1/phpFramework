<?php

class SpaceController extends Member {
    
    public function __construct() {
		parent::__construct();
	}
	
	/**
	 * 会员资料
	 */
	public function indexAction() {

		if ($this->post('submit') && $this->post('form')=='search') {
	        $kw = $this->post('kw');
	    } elseif ($this->post('submit_status_1') && $this->post('form')=='status_1') {
	        foreach ($_POST as $var=>$value) {
	            if (strpos($var, 'del_')!==false) {
	                $ids = str_replace('del_', '', $var);
					list($_id, $_mid) = explode('_', $ids);
	                $this->member->update(array('status'=>1), 'id=' . $_id);
	            }
	        }
	    } elseif ($this->post('submit_status_0') && $this->post('form')=='status_0') {
	        foreach ($_POST as $var=>$value) {
	            if (strpos($var, 'del_')!==false) {
	                $ids = str_replace('del_', '', $var);
					list($_id, $_mid) = explode('_', $ids);
	                $this->member->update(array('status'=>0), 'id=' . $_id);
	            }
	        }
	    }
	    $kw       = $kw ? $kw : $this->get('kw');
		$page     = (int)$this->get('page');
		$page     = (!$page) ? 1 : $page;
		$modelid  = (int)$this->get('modelid');
		$groupid  = (int)$this->get('groupid');
		$status   = (int)$this->get('status');
	    $pagelist = $this->instance('pagelist');
		$pagelist->loadconfig();
	    $where    = 'status=1 ';
	    if ($kw) $where .= " and (username like '%" . $kw . "%' or nickname like '%" . $kw . "%' )";
	    $total    = $this->member->count('member', null, $where);
	    $pagesize = isset($this->site['SITE_ADMIN_PAGESIZE']) && $this->site['SITE_ADMIN_PAGESIZE'] ? $this->site['SITE_ADMIN_PAGESIZE'] : 8;
	    $urlparam = array();
	    if ($kw)        $urlparam['kw']      = $kw;
	    $urlparam['page']   = '{page}';
		$where.=" and spacestatus>0 ";
	    $data     = $this->member->where($where)->page_limit($page, $pagesize)->order(array('status ASC', 'regdate DESC', 'id DESC'))->select();//findAll($fields);		
		$fields="id,username,nickname";		
		$where=" status=1 and spacestatus=2 ";
		$recommend= $this->member->where($where)->page_limit($page, $pagesize)->order(array('status ASC', 'regdate DESC', 'id DESC'))->select();//->findAll($fields);
	    $pagelist = $pagelist->total($total)->url(url('admin/member/index', $urlparam))->num($pagesize)->page($page)->output();
		$count    = array();
		$count[1] = $this->member->count('member', null, 'status=1');
		$count[$status] = $total;
	    $this->view->assign(array(
	        'kw'			=> $kw,
	        'list'			=> $data,
			'recommend'		=> $recommend,
	        'page'			=> $page,
			'count'			=> $count,
			'status'		=> $status,
	        'pagelist'		=> $pagelist,
	        'membermodel'	=> $this->membermodel,
	        'membergroup'	=> $this->membergroup,
			'memberextend'	=> $this->cache->get('model_member_extend')
	    ));
	    $this->view->display('member/space_list');
	}

	public function showAction() {
	    $id    = (int)$this->get('userid');
		$name  = $this->get('username');
		if (empty($id) && empty($name)) $this->msg(lang('m-spa-0'));
		$data  = $id ? $this->member->find($id) : $this->member->getOne('username=?', $name);
		if (empty($data)) $this->msg(lang('m-spa-1', array('1'=>$id ? '#' . $id : $name)));
		$model = $this->membermodel[$data['modelid']];
		$data['nickname'] = $data['nickname'] ? $data['nickname'] : $data['username'];
		if ($model) {
		    $table = $this->model($model['tablename']);
			$_data = $table->find($data['id']);
	        $data  = array_merge($data, $_data); //合并主表和附表
			$data  = $this->getFieldData($model, $data);
		}
		$data['avatar'] = image($data['avatar']);
		if ($this->memberconfig['uc_use'] == 1 && function_exists('uc_api_mysql')) {
			$uc = uc_api_mysql('user', 'get_user', array('username'=> $data['username']));
			if ($uc != 0) {
			    $data['uid']    = $uc[0];
				$data['avatar'] = UC_API . '/avatar.php?uid=' . $data['uid'] . '&size=middle';
			}
		}
		unset($data['password']);
		$this->view->assign($data);
		$this->view->assign(array(
			'meta_title' => lang('m-spa-2', array('1'=>$data['nickname'])) . '-' . $this->site['SITE_NAME'],
			'userid'     => $data['id'],
			'tablename'  => $model['tablename'],
			'modelname'  => $model['modelname'],
			'groupname'  => $this->membergroup[$data['groupid']]['name'],
			'page'       => $this->get('page') ? $this->get('page') : 1,
	    ));
	    $this->view->display('member/space_show');
	}	
}