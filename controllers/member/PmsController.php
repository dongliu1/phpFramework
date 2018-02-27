<?php

class PmsController extends Member {

    private $pms;
	private $roster;
    
    public function __construct() {
		parent::__construct();
		$this->isLogin(); //登录验证//判断审核
		if (!$this->memberinfo['status']) $this->memberMsg(lang('m-con-0'));
		$this->pms   = $this->model('member_pms');
		$this->roster= $this->model('member_roster');
		$inbox       = $this->pms->count('member_pms', 'id', 'hasview=0 AND toid=' . $this->memberinfo['id']); //未读收件箱短信条数
		$navigation=array(
		    'send'   => array('name'=> lang('m-pms-0'), 'url'=> url('member/pms/send')),
		    'inbox'  => array('name'=> lang('m-pms-1'), 'url'=> url('member/pms/inbox')),
		    'outbox' => array('name'=> lang('m-pms-2'), 'url'=> url('member/pms/outbox')),
			'roster' => array('name'=> lang('m-roster-1'), 'url'=> url('member/roster/index')),
		);
		$this->view->assign('navigation', $navigation);
		$this->view->assign('inbox', $inbox);
	}
	
	/*
	 * 发送
	 */
	public function sendAction() {
	    if ($this->isPostForm()) {
		    $this->postCheck(); //发送数量检测
			$data = $this->post('data');
			if (empty($data['tonames'])) $this->memberMsg(lang('m-pms-3'));
			if (empty($data['content'])) $this->memberMsg(lang('m-pms-4'));
			//if (empty($data['title']) || empty($data['content'])) $this->memberMsg(lang('m-pms-4'));
			//if ($data['tonames'] == $this->memberinfo['username']) $this->memberMsg(lang('m-pms-5'));
			$tos=explode(';', $data['tonames']);
			$sendcount=count($tos);//发送数量
			$this->postCheck($sendcount);
			$success=0;
			foreach ($tos as $to) {
				$t=explode('[', str_replace(']', '', $to));
				$username=trim($t[1]);
				if($username){
					if ($username == $this->memberinfo['username']) $this->memberMsg(lang('m-pms-5'));
					$data['toname']=$username;
					$memberinfodata   = $this->member->from(null, 'id')->where('username=?', $username)->select(false);
					if (!$memberinfodata) $this->memberMsg($username.lang('m-pms-6'));
					$data['toid']     = $memberinfodata['id'];
					$data['sendtime'] = time();	
					$data['sendname'] = $this->memberinfo['username'];
					//$sendname_roster=$this->roster->getFirst("myid=".$memberinfodata['id'],null, "nickname");
					//$data['sendname'] = $sendname_roster?$sendname_roster:$this->memberinfo['username'];
					$data['sendid']   = $this->memberinfo['id'];
					$data['isadmin']  = 0;
					$data['hasview']  = 0;
					$id = $this->pms->insert($data);
					if (empty($id)) $this->memberMsg(lang('m-pms-7'));
					//增加会员统计数量
					$success++;					
				}	
			}
			$this->pms->query('UPDATE ' . $this->member->prefix . 'member_count SET pms=pms+'.$success.' WHERE id=' . $this->memberinfo['id']);
			$this->memberMsg(lang('success'), url('member/pms/outbox'), 1);			
	    }
		$this->view->assign(array(
		    'isinbox'    => 1,
		    'meta_title' => lang('m-pms-0') . '-' . lang('member') . '-' . $this->site['SITE_NAME'],
		));
	    $this->view->display('member/pms_send');
	}
	
	/*
	 * 收件箱
	 */
	public function inboxAction() {
		//$where   = 'toid=' . $this->memberinfo['id'] . ' and todel=0';
		$where   = '(toid=' . $this->memberinfo['id'] . ' or sendid=' . $this->memberinfo['id'] . ')and todel=0';
	    if ($this->isPostForm()) {
		    $ids = $this->post('ids');
			if (empty($ids)) $this->memberMsg(lang('m-inf-11'));
			foreach ($ids as $id) {
			    $id  = (int)$id;
				if ($id) {
					$row = $this->pms->find($id, 'todel,senddel');
					if ($row) {
						if ($row['senddel']) {
							$this->pms->delete($where . ' and id=' . $id); //删除
						} else {
							$this->pms->update(array('todel'=>1), $where . ' and id=' . $id);
						}
					}
				}
			}
	    }
	    $page     = (int)$this->get('page');
		$page     = (!$page) ? 1 : $page;
	    $pagelist = $this->instance('pagelist');
		$pagelist->loadconfig();
		$total    = $this->pms->count('member_pms', 'id', $where);
	    $pagesize = isset($this->memberconfig['pagesize']) && $this->memberconfig['pagesize'] ? $this->memberconfig['pagesize'] : 8;
	    $data     = $this->pms->page_limit($page, $pagesize)->where($where)->order(array('hasview ASC', 'isadmin DESC', 'sendtime DESC'))->select();
	    $pagelist = $pagelist->total($total)->url($url)->num($pagesize)->page($page)->output();
	    $dbroster = $this->roster->getAll('myid=?', $this->memberinfo['id'], "id,userid,username,nickname"); 
		$roster   =array();		
		foreach($dbroster as $row){
			$roster[$row["username"]]=$row["nickname"];
		}
		$this->view->assign(array(
		    'roster'     => $roster,
			'data'       => $data,
		    'list'       => $data,
			'pagelist'   => $pagelist,
		    'meta_title' => lang('m-pms-1') . '-' . lang('member') . '-' . $this->site['SITE_NAME'],
			'countinfo'  => $this->getPosts(),
		));
	    $this->view->display('member/pms_list');
	}
	
	/*
	 * 已发送
	 */
	public function outboxAction() {
		$where   = 'sendid=' . $this->memberinfo['id'] . ' and sendname="' . $this->memberinfo['username'] . '" and senddel=0 and isadmin=0';
	    if ($this->isPostForm()) {
		    $ids = $this->post('ids');
			if (empty($ids)) $this->memberMsg(lang('m-inf-11'));
			foreach ($ids as $id) {
			    $id  = (int)$id;
				if ($id) {
					$row = $this->pms->find($id, 'todel,senddel');
					if ($row) {
						if ($row['todel']) {
							//删除
							$this->pms->delete($where . ' and id=' . $id);
						} else {
							$this->pms->update(array('senddel'=>1), $where . ' and id=' . $id);
						}
					}
				}
			}
	    }
	    $page     = (int)$this->get('page');
		$page     = (!$page) ? 1 : $page;
	    $pagelist = $this->instance('pagelist');
		$pagelist->loadconfig();
		$total    = $this->pms->count('member_pms', 'id', $where);
	    $pagesize = isset($this->memberconfig['pagesize']) && $this->memberconfig['pagesize'] ? $this->memberconfig['pagesize'] : 8;
	    $data     = $this->pms->page_limit($page, $pagesize)->where($where)->order('sendtime DESC')->select();
	    $pagelist = $pagelist->total($total)->url($url)->num($pagesize)->page($page)->output();
		//log::write("pmsController.php row144".json_encode($data,JSON_UNESCAPED_UNICODE));
		//$dbroster = $this->roster->where('myid=' . $this->memberinfo['id'] );
		$dbroster = $this->roster->getAll('myid=?', $this->memberinfo['id'], "id,userid,username,nickname"); 
		$roster   =array();		
		foreach($dbroster as $row){
			$roster[$row["username"]]=$row["nickname"];
		}
		//log::write("pmsController.php row144".json_encode($roster,JSON_UNESCAPED_UNICODE));
	    $this->view->assign(array(
			'roster'     => $roster,
		    'data'       => $data,
			'pagelist'   => $pagelist,
		    'meta_title' => lang('m-pms-2') . '-' . lang('member') . '-' . $this->site['SITE_NAME'],
			'countinfo'  => $this->getPosts(), 
		));
	    $this->view->display('member/pms_list');
	}
	
	/*
	 * 阅读
	 */
	public function readAction() {
	    $id   = (int)$this->get('id');
		if (empty($id)) $this->memberMsg(lang('m-pms-8'));
		$data = $this->pms->find($id); //获取短信内容
		if (empty($data)) $this->memberMsg(lang('m-pms-9'));
		if (($data['sendname'] == $this->memberinfo['username'] && $data['sendid'] == $this->memberinfo['id'] && $data['isadmin'] == 0) || ($data['toname'] == $this->memberinfo['username'] && $data['toid'] == $this->memberinfo['id'])) {
		    if ($data['toid'] == $this->memberinfo['id'] && !$data['hasview']) $this->pms->update(array('hasview'=>1), 'id=' . $id);
			$url  = $data['sendid'] == $this->memberinfo['id'] && $data['sendname'] == $this->memberinfo['username'] && $data['isadmin'] == 0 ? url('member/pms/outbox') : url('member/pms/inbox');

			if($userid=$data['isadmin'] == 0 ){
				$userid=($data['sendid'] == $this->memberinfo['id'] && $data['sendname'] == $this->memberinfo['username'] )? $data['toid'] : $data['sendid'];
				$where   = ' (toid=' . $userid . ' or sendid=' . $userid . ') and todel=0 and isadmin=0 and sendtime<='.$data['sendtime'];
			}else{
				$where   = 'isadmin=1 and sendid=' . $data['sendid'] . ' and toid='.$this->memberinfo['id'].' and todel=0 and sendtime<='.$data['sendtime'];
			}
			$list     = $this->pms->page_limit(1, 10)->where($where)->order('sendtime DESC')->select();//获取该用户列表
			$this->view->assign(array(
				'list'		 => $list,
				//'data'       => $data,
				'meta_title' => lang('m-pms-10') . '-' . lang('member') . '-' . $this->site['SITE_NAME'],
				'backurl'    => $url,
			));
			$this->view->display('member/pms_read');
		} else {
		    $this->memberMsg(lang('m-pms-9'));
		}
	}
	
	/**
	 * 用户名验证
	 */
	public function checkuserAction() {
	    $username = $this->get('username');
		if (empty($username)) exit(lang('m-pms-11'));
		$strlen   = strlen($username);
		if (!preg_match('/^[a-zA-Z0-9_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]+$/', $username)) {
			exit(lang('m-pms-12'));
		} elseif ( 20 < $strlen || $strlen < 2 ) {
			exit(lang('m-pms-12'));
		}
		if ($username == $this->memberinfo['username']) exit(lang('m-pms-5'));
		$member = $this->member->from(null, 'id')->where('username=?', $username)->select(false);
		if (!$member) exit(lang('m-pms-13'));
	}
	
	/**
	 * 发送数量检测
	 */
	private function postCheck($num=1) {
		$count = $this->model('member_count');
		$data  = $count->find($this->memberinfo['id']);
		if (empty($data)) return true;
		if (date('Y-m-d') != date('Y-m-d', $data['updatetime'])) {
		    //重置统计数据
			$data['pms']        = 0;
			$data['updatetime'] = time();
			$count->update($data, 'id=' . $this->memberinfo['id']);
		}
		if ($data['pms'] >= $this->membergroup[$this->memberinfo['groupid']]['allowpms']- $num) {
		    $this->memberMsg(lang('m-pms-14', array('1'=>$this->membergroup[$this->memberinfo['groupid']]['allowpms'])));
		}
	}
	
	/**
	 * 获取发送数量
	 */
	private function getPosts() {
		$count = $this->model('member_count');
		$data  = $count->find($this->memberinfo['id']);
		if (empty($data)) return true;
		if (date('Y-m-d') != date('Y-m-d', $data['updatetime'])) {
		    //重置统计数据
			$data['pms']        = 0;
			$data['updatetime'] = time();
			$count->update($data, 'id=' . $this->memberinfo['id']);
		}
		return array('post'=>$data['pms'], 'posts'=>$this->membergroup[$this->memberinfo['groupid']]['allowpms']);
	}
}