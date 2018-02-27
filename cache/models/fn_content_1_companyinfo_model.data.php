<?php
if (!defined('IN_RCMS')) exit();
return array (
  'types' => 
  array (
    'id' => 'int',
    'catid' => 'int',
    'content' => 'blob',
    'code' => 'string',
    'pcode' => 'string',
    'companyname' => 'string',
    'isdependent' => 'string',
    'childrencount' => 'int',
    'location' => 'string',
    'planttype' => 'string',
    'capacity' => 'string',
    'alias1' => 'string',
    'alias2' => 'string',
  ),
  'fields' => 
  array (
    0 => 'id',
    1 => 'catid',
    2 => 'content',
    3 => 'code',
    4 => 'pcode',
    5 => 'companyname',
    6 => 'isdependent',
    7 => 'childrencount',
    8 => 'location',
    9 => 'planttype',
    10 => 'capacity',
    11 => 'alias1',
    12 => 'alias2',
  ),
  'primary_key' => 'id',
);