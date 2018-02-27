<?php
if (!defined('IN_RCMS')) exit();
return array (
  'types' => 
  array (
    'userid' => 'int',
    'site' => 'int',
    'username' => 'string',
    'password' => 'string',
    'salt' => 'string',
    'roleid' => 'int',
    'lastloginip' => 'string',
    'lastlogintime' => 'int',
    'loginip' => 'string',
    'logintime' => 'int',
    'email' => 'string',
    'realname' => 'string',
    'usermenu' => 'blob',
  ),
  'fields' => 
  array (
    0 => 'userid',
    1 => 'site',
    2 => 'username',
    3 => 'password',
    4 => 'salt',
    5 => 'roleid',
    6 => 'lastloginip',
    7 => 'lastlogintime',
    8 => 'loginip',
    9 => 'logintime',
    10 => 'email',
    11 => 'realname',
    12 => 'usermenu',
  ),
  'primary_key' => 'userid',
);