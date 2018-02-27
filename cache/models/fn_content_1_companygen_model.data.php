<?php
if (!defined('IN_RCMS')) exit();
return array (
  'types' => 
  array (
    'id' => 'int',
    'catid' => 'int',
    'content' => 'blob',
    'month' => 'string',
    'companycode' => 'string',
    'companyname' => 'string',
    'plan' => 'real',
    'real' => 'real',
    'nextplan' => 'real',
    'annualsum' => 'real',
    'hoursused' => 'real',
  ),
  'fields' => 
  array (
    0 => 'id',
    1 => 'catid',
    2 => 'content',
    3 => 'month',
    4 => 'companycode',
    5 => 'companyname',
    6 => 'plan',
    7 => 'real',
    8 => 'nextplan',
    9 => 'annualsum',
    10 => 'hoursused',
  ),
  'primary_key' => 'month',
);