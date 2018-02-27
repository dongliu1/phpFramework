<?php
if (!defined('IN_RCMS')) exit();
return array (
  'types' => 
  array (
    'id' => 'int',
    'catid' => 'int',
    'clientcode' => 'string',
    'content' => 'blob',
    'usagetime' => 'string',
    'price' => 'real',
    'usage' => 'real',
    'cost' => 'real',
  ),
  'fields' => 
  array (
    0 => 'id',
    1 => 'catid',
    2 => 'clientcode',
    3 => 'content',
    4 => 'usagetime',
    5 => 'price',
    6 => 'usage',
    7 => 'cost',
  ),
  'primary_key' => 'id',
);