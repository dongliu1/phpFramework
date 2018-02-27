<?php
if (!defined('IN_RCMS')) exit();

/**
 * 管理后台菜单项
 */
 
return array (
    /**
	 * 顶部菜单
	 * 格式 array(
	 *          id => array ('name'=>'菜单(语言包)名称', 'url'=>'菜单地址', 'select'=>'选中左侧菜单id号' 'option'=>array(该菜单对应左侧子菜单的权限规则)),
	 *      )
	 */
    'top' => array (
                0 => array('name' => lang('a-men-0'), 'url' => url('admin/index/main'),     'select' => '1',   'option' => ''),
				2 => array('name' => lang('a-men-2'), 'url' => url('admin/category/index'), 'select' => '201', 'option' => array('category-index', 'model-index', 'attachment-index', 'position-index', 'content-index', 'relatedlink-index', 'block-index', 'linkage-index','assets-index', 'form-index')),
				3 => array('name' => lang('a-men-5'), 'url' => url('admin/member/index'),   'select' => '301', 'option' => array('member-index', 'member-config', 'member-group', 'member-pms','member-extend')),
				5 => array('name' => lang('a-men-7'), 'url' => url('admin/plugin/index'),   'select' => '501', 'option' => array('plugin-index')),
				1 => array('name' => lang('a-men-11'), 'url' => url('admin/assets/index'),   'select' => '101', 'option' => array('index-config', 'user-index','auth-index','index-log','index-attack', 'ip-index', 'site-config', 'site-index','block-index')),
				6 => array('name' => lang('a-men-4'), 'url' => url('admin/html/index'),     'select' => '601', 'option' => array('html-index', 'html-cache')),
				4 => array('name' => 'a-men-1', 'url' => url('admin/theme/index'),    'select' => '401', 'option' => array('theme-index', 'theme-cache')),
            ),
	/**
	 * 顶部菜单对应的左侧菜单列表
	 * 格式 array(
	 *          顶部id => array (
	 *              '左侧菜单分组(语言包)名称' => array(
	 *                  '左侧菜单唯一标示' => array ('name'=>'菜单(语言包)名称', 'url'=>'菜单地址', 'option'=>'当前菜单的权限规则'),
	 *              ),
	 *          ),
	 *      )
	 */
	'list' => array(
	            0 => array(
					'a-men-9'  => array(
						1 => array('name' => lang('a-men-8'), 'url' => url('admin/index/main'), 'option' => ''),
					),
					'a-men-10' => array(
						4 => array('name' => CMS_NAME, 'sys' => 1)
					),
				),
			    1 => array(
					'a-men-20' => array(
						108 => array('name' => lang('a-men-21'), 'url' => url('admin/user/add'),	 'option' => 'user-add'),
						109 => array('name' => lang('a-men-22'), 'url' => url('admin/user/index'), 'option' => 'user-index'),
						110 => array('name' => lang('a-men-23'), 'url' => url('admin/auth/index'), 'option' => 'auth-index'),
						111 => array('name' => lang('a-men-24'), 'url' => url('admin/auth/cache'), 'option' => 'auth-cache'),
					),
					'a-men-1'  =>array(
						101 => array('name' => lang('a-ast-i'), 'url' => url('admin/assets/index'),      'option' => 'assets-index'),
						
						102 => array('name' => lang('a-men-30'), 'url' => url('admin/block/index'),        'option' => 'block-index')
					),
					'a-men-11' => array(
						
						103 => array('name' => lang('a-men-65'), 'url' => url('admin/index/config', array('type'=>1)),	'option' => 'index-config'),
						104 => array('name' => lang('a-men-14'), 'url' => url('admin/index/config', array('type'=>2)),	'option' => 'index-config'),
						105 => array('name' => lang('a-men-15'), 'url' => url('admin/index/config', array('type'=>3)),	'option' => 'index-config'),
						106 => array('name' => lang('a-men-16'), 'url' => url('admin/index/config', array('type'=>4)),	'option' => 'index-config'),
						107 => array('name' => lang('a-men-17'), 'url' => url('admin/index/config', array('type'=>5)),	'option' => 'index-config'),
						108 => array('name' => lang('a-men-18'), 'url' => url('admin/index/log'),    						'option' => 'index-log'),
						//109 => array('name' => lang('a-men-66'), 'url' => url('admin/index/attack'), 						'option' => 'index-attack'),
						110 => array('name' => lang('a-men-67'), 'url' => url('admin/ip/index'),     						'option' => 'ip-index'),
					),
					
				),
				2 => array(
					'a-men-29' => array(
						
					),
					/*'a-men-2a' => array(
						
					),*/
					'a-men-59' => array(
						
					),
					'a-men-74' => array(
						201 => array('name' => lang('a-men-26'), 'url' => url('admin/category/index'),     'option' => 'category-index'),
						288 => array('name' => lang('a-men-31'), 'url' => url('admin/position/index'),     'option' => 'position-index'),
						287 => array('name' => lang('a-men-32'), 'url' => url('admin/tag/index'),          'option' => 'tag-index'),
						286 => array('name' => lang('a-men-33'), 'url' => url('admin/relatedlink/index'),  'option' => 'relatedlink-index'),
						285 => array('name' => lang('a-men-34'), 'url' => url('admin/linkage/index'),      'option' => 'linkage-index'),
						204 => array('name' => lang('a-men-35'), 'url' => url('admin/content/updateurl/'), 'option' => 'content-updateurl'),
					),
					
				),
				3 => array(
					'a-men-36' => array(
						301 => array('name' => lang('a-men-37'),	'url' => url('admin/member/index'),                    'option' => 'member-index'),
						
						303 => array('name' => lang('a-men-39'),	'url' => url('admin/member/group'),                    'option' => 'member-group'),
					),
					'a-mod-167' => array(
						302 => array('name' => lang('a-men-38'),	'url' => url('admin/member/pms'),                      'option' => 'member-pms'),
					),
					'a-men-41' => array(
						305 => array('name' => lang('a-men-42'), 'url' => url('admin/member/config', array('type'=>'user')),    'option' => 'member-confg'),
						306 => array('name' => lang('a-men-43'), 'url' => url('admin/member/config', array('type'=>'reg')),     'option' => 'member-confg'),
						307 => array('name' => lang('a-men-44'), 'url' => url('admin/member/config', array('type'=>'oauth')),   'option' => 'member-confg'),
						308 => array('name' => lang('a-men-45'), 'url' => url('admin/member/config', array('type'=>'email')),   'option' => 'member-confg'),
						309 => array('name' => lang('a-men-46'), 'url' => url('admin/member/config', array('type'=>'ucenter')), 'option' => 'member-confg'),
					)
				),
				4 => array(
					'a-men-47' => array(
						401 => array('name' => lang('a-men-48'), 'url' => url('admin/theme/index'), 'option' => 'theme-index'),
						402 => array('name' => lang('a-men-71'), 'url' => url('admin/theme/demo'),  'option' => 'theme-demo'),
						403 => array('name' => lang('a-men-19'), 'url' => url('admin/theme/cache'), 'option' => 'theme-cache'),
					),
					'a-men-25' => array(
						285 => array('name' => lang('a-men-34'), 'url' => url('admin/linkage/index'),      'option' => 'linkage-index'),
						203 => array('name' => lang('a-men-28'), 'url' => url('admin/attachment/index'),   'option' => 'attachment-index'),
						202 => array('name' => lang('a-men-27'), 'url' => url('admin/model/index'),        'option' => 'model-index'),
						701 => array('name' => lang('a-men-60'), 'url' => url('admin/model/index', array('typeid'=>3)), 'option' => 'model-index'),
					),
					'a-men-36i' => array(
						304 => array('name' => lang('a-men-40'),	'url' => url('admin/model/index', array('typeid'=>2)), 'option' => 'model-index'),
						311 => array('name' => lang('a-mod-167a'), 'url' => url('admin/model/index', array('typeid'=>4)), 'option' => 'model-index'),
					),
					'a-men-72' => array(
						121 => array('name' => lang('a-men-12'), 'url' => url('admin/site/config'),	'option' => 'site-config'),
						122 => array('name' => lang('a-men-73'), 'url' => url('admin/site/index'),	'option' => 'site-index'),
					),
		        ),
				6 => array(
					'a-men-49' => array(
						601 => array('name' => lang('a-men-50'), 'url' => url('admin/html/index'),          'option' => 'html-index'),
						602 => array('name' => lang('a-men-51'), 'url' => url('admin/html/clear'),          'option' => 'html-clear'),
						603 => array('name' => lang('a-men-52'), 'url' => url('admin/index/cache'),         'option' => 'index-cache'),
						604 => array('name' => lang('a-men-53'), 'url' => url('admin/index/updatemap'),     'option' => 'index-updatemap'),
						605 => array('name' => lang('a-men-54'), 'url' => url('admin/content/updateurl/'),  'option' => 'content-updateurl'),
					),
					'a-men-55' => array(
						606 => array('name' => lang('a-men-56'), 'url' => url('admin/html/indexc'),	'option' => 'html-indexc'),
						607 => array('name' => lang('a-men-57'), 'url' => url('admin/html/category'),	'option' => 'html-category'),
						608 => array('name' => lang('a-men-58'), 'url' => url('admin/html/show'),		'option' => 'html-show'),
						609 => array('name' => lang('a-men-70'), 'url' => url('admin/html/form'),	    'option' => 'html-form'),
					)
		        ),
				5 => array(
				    'a-men-61' => array(
						501 => array('name' => lang('a-men-61'), 'url' => url('admin/plugin/index'), 'option' => 'plugin-index'),
					),
				),
			)
);