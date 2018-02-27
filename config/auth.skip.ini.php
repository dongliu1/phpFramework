<?php 
if (!defined('IN_RCMS')) exit();

/**
 * 不需要权限验证的模块
 */
return array(
    'defalut'=>array(),
	'admin'=>array(
        'index-index',
		'index-updatecache',
        'index-main',
        'login'
    )
);

?>