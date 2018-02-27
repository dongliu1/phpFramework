<?php
if (!defined('IN_RCMS')) exit();

/**
 * 模块权限配置信息
 */
return array(
    'index' => '首页',
	'dailywork' => array(
	    'name'   =>'日常办公', 
		'children' => array(
		    'config'      => '待办事宜',
			'config'      => '已办事宜',
			'config'      => '计划管理'
		)
    ),
	'dailywork' => '运行管理',
	'dailywork' => array(
	    'name'   =>'运行记录', 
		'children' => array(
		    'config'      => '交接班管理',
			'config'      => '排班管理'
		)
    ),
	'dailywork' => array(
	    'name'   =>'生产实时', 
		'children' => array(
		    'config'      => '集团级实时监视',
			'config'      => '设备状态监测',
			'config'      => '传感器状态监测'
		)
    ),
	'dailywork' => array(
	    'name'   =>'缺陷管理', 
		'children' => array(
		    'config'      => '缺陷追踪',
			'config'      => '缺陷统计'
		)
    ),
	'dailywork' => array(
	    'name'   =>'指标管理', 
		'children' => array(
		    'config'      => '运行指标管理',
			'config'      => '经营指标管理',
			'config'      => '能耗指标管理',
			'config'      => '电站损失量化分析',
			'config'      => '低效发电单元分析'
		)
    ),
	'dailywork' => array(
	    'name'   =>'班组运维统计', 
		'children' => array(
		    'config'      => '对标管理'
		)
    ),
	'dailywork' => array(
	    'name'   =>'工作票管理', 
		'children' => array(
		    'config'      => '电气一种工作票',
			'config'      => '电气二种工作票'
		)
    ),
	'dailywork' => array(
	    'name'   =>'操作票管理', 
		'children' => array(
		    'config'      => '操作票模板',
			'config'      => '操作票'
		)
    ),
	'dailywork' => array(
	    'name'   =>'设备管理', 
		'children' => array(
		    'config'      => '设备型号',
			'config'      => '设备台账',
			'config'      => '设备评估'
		)
    ),
	'dailywork' => array(
	    'name'   =>'系统设置', 
		'children' => array(
		    'config'      => '电站管理',
			'config'      => '角色管理',
			'config'      => '员工管理'
		)
    ),
);
?>