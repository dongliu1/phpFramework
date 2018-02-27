<?php
define('IN_RCMS', true);
$config = require '../config/config.ini.php';
$name   = isset($config['ADMIN_NAMESPACE']) ? $config['ADMIN_NAMESPACE'] : 'admin';
header('Location: ../index.php?s=' . $name);