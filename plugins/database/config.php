<?php
if (!defined('IN_RCMS')) exit('No permission resources');

return array(
    'name'			=> '数据库工具',
    'fields'		=> array(),
    'typeid'		=> 1,
    'author'		=> 'rcms',
    'version'		=> '1.5',
    'description'	=> "数据备份功能根据您的选择备份全部RCMS数据，导出的数据文件可用“数据恢复”功能或 phpMyAdmin 导入。"
);