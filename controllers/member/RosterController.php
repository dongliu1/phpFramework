<?php

class RosterController extends Member {
	private $pms;
	private $roster;
    
    public function __construct() {
		parent::__construct();
		$this->isLogin(); //登录验证//判断审核
		if (!$this->memberinfo['status']) $this->memberMsg(lang('m-con-0'));
		$this->roster= $this->model('member_roster');
		$this->pms   = $this->model('member_pms');
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
	 * 联系人列表
	 */
	public function indexAction() {
		$where   = 'myid=' . $this->memberinfo['id'] ;
	    if ($this->isPostForm()) {
			$ids = $this->post('ids');
			if (empty($ids)) $this->memberMsg(lang('m-inf-11'));
			$this->roster->delete($where . ' and ids in(' . $id . ')' ); //删除
	    }
	    $page     = (int)$this->get('page');
		$page     = (!$page) ? 1 : $page;
	    $pagelist = $this->instance('pagelist');
		$pagelist->loadconfig();
		$total    = $this->roster->count('member_roster', 'id', $where);
	    $pagesize = isset($this->memberconfig['pagesize']) && $this->memberconfig['pagesize'] ? $this->memberconfig['pagesize'] : 8;
	    $data     = $this->roster->page_limit($page, $pagesize)->where($where)->order(array('isfav ASC', 'updatetime DESC', 'createtime DESC'))->select();
	    $pagelist = $pagelist->total($total)->url($url)->num($pagesize)->page($page)->output();
	    $this->view->assign(array(
		    'data'       => $data,
		    'list'       => $data,
			'pagelist'   => $pagelist,
		    'meta_title' => lang('m-roster-1') . '-' . lang('member') . '-' . $this->site['SITE_NAME']
		));
	    $this->view->display('member/roster_index');
	}	
	
	/*
	 * 编辑联系人
	 * 通过 get:id
	 */
	public function editAction() {
		$id=$this->get('id');
		if (!$id) $this->memberMsg(lang('m-inf-11'));		
	    if ($this->isPostForm()) {
			$data  = $this->post('data');
			$data['updatetime']=time();
			$this->roster->update($data,'id=' . $id  ); //删除
			$url=url('member/roster/index');
			$this->memberMsg("已经成功保存",$url);
	    }
		$data=$this->roster->find($id); 
		if($data){
			$this->view->assign(array(
				'data'       => $data,
				'list'       => $data,
				'pagelist'   => $pagelist,
				'meta_title' => lang('m-roster-1') . '-' . lang('member') . '-' . $this->site['SITE_NAME']
			));
			$this->view->display('member/roster_edit');
		}
		//return false;
	}	
	
	/*
	 * ajax添加联系人
	 * 通过get：id 或者 username/nickname
	 */
	public function ajaxaddAction() {
		$where = 'myid='   . $this->memberinfo['id'] ;	
		$id=$this->get('id');
		$username=$this->get('username');
		if($id){
			$where.= ' and userid=' . $id;
		}elseif($username){
			$where.= ' and (username="' . $username.'" or nickname="' . $username.'")';;
		}
		$isadded=$this->roster->count('member_roster', 'id', $where); //未读收件箱短信条数		
		if(!$isadded){
			$data=array();
			if($id){
				$data=$this->member->getOne("id=".$id, null, null);	
			}elseif($username){
				$data=$this->member->getOne('username="' . $username.'" or nickname="' . $username.'"', null, null);	
			}
			if($data){
				//$data=$this->member->getOne("id=3", null, null);
				$data['id']=null;
				$data['myid']=$this->memberinfo['id'];
				$data['myusername']=$this->memberinfo['username'];
				$data['userid']=$this->get('id');
				$data['createtime']=time();
				$data['updatetime']=time();

				//Log::write($data,JSON_UNESCAPED_UNICODE);
				$this->roster->insert($data);
				$rt["succeed"]=true;
				$rt["text"]="添加成功";
				echo json_encode($rt);
			}else{
				$rt["succeed"]=false;
				$rt["text"]="未找到客户";
				echo json_encode($rt);
			}
		}else{
			$rt["succeed"]=false;
			$rt["text"]="通讯录中已有该客户";
			echo json_encode($rt);
		}
	}	

	/*
	 * ajax联系人列表
	 * 通过get：id 或者 username/nickname
	 */
	public function ajaxlistAction() {
		if ($this->isLogin(1)){	//未登陆
			$member= $this->model('member');
			$where = '';$username=$this->get('username');
			if($username)$where.= 'concat(username,nickname) like "%' . $username.'%"';
			$data   = $this->member->from(null, 'id,username,nickname')->page_limit(1, 10)->order(array('credits DESC', 'regdate DESC', 'id DESC'))->select();
			foreach ($data as $key=>$row) {
				echo "<li onclick='setuser(this);' title='".$row['nickname']."[".$row['username']."]'>".$row['nickname']."</li>";
			}
		}else{					//已登陆
			$roster= $this->model('member_roster');
			$where = 'myid='   . $this->memberinfo['id'] ;	
			$username=$this->get('username');
			if($username)$where.= ' and concat(username,nickname) like "%' . $username.'%"';;
			$data=$roster->getAll($where, null, "id,userid,username,nickname"); 
			foreach ($data as $key=>$row) {
				echo "<li onclick='setuser(this);'>".$row['nickname']."[".$row['username']."]</li>";
			}
		}
	}	
}