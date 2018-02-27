<?php
if (!defined('IN_RCMS')) exit();
return array (
  'types' => 
  array (
    'id' => 'int',
    'name' => 'string',
    'modelid' => 'int',
    'credits' => 'int',
    'allowpost' => 'int',
    'allowpms' => 'int',
    'allowattachment' => 'int',
    'postverify' => 'int',
    'auto' => 'int',
    'filesize' => 'int',
    'listorder' => 'int',
    'disabled' => 'int',
    'setting' => 'blob',
  ),
  'fields' => 
  array (
    0 => 'id',
    1 => 'name',
    2 => 'modelid',
    3 => 'credits',
    4 => 'allowpost',
    5 => 'allowpms',
    6 => 'allowattachment',
    7 => 'postverify',
    8 => 'auto',
    9 => 'filesize',
    10 => 'listorder',
    11 => 'disabled',
    12 => 'setting',
  ),
  'primary_key' => 'id',
);