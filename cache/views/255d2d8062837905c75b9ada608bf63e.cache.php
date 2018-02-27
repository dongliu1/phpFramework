<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title><?php echo $meta_title; ?></title>
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
<link rel="stylesheet" type="text/css" href="<?php echo JLIB_PATH; ?>jqueryui/light/jquery-ui.min.css" />
<link rel="stylesheet" type="text/css" href="<?php echo JLIB_PATH; ?>fonts/shenku/css/sk.css" />
<link rel="stylesheet" type="text/css" href="<?php echo JLIB_PATH; ?>fonts/awesome/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="<?php echo JLIB_PATH; ?>fonts/ionicons/ionicons.min.css" />
<!-- <link rel="stylesheet" type="text/css" href="<?php echo MEMBER_THEME; ?>_rsc/style.css" /> -->
<!-- <link rel="stylesheet" type="text/css" href="<?php echo MEMBER_THEME; ?>_rsc/skins.css" /> -->
<link rel="stylesheet" type="text/css" href="<?php echo MEMBER_THEME; ?>themes/dark.css" />

<script type="text/javascript" src="<?php echo JLIB_PATH; ?>jquery/jquery.min.js"></script>
<script type="text/javascript" src="<?php echo JLIB_PATH; ?>momentjs/moment.min.js"></script>
<script type="text/javascript" src="<?php echo JLIB_PATH; ?>jqueryui/jquery-ui.min.js"></script>
<script>
	$(function(){
		
	})
	function succession(){
		$("#handover").dialog({
			title: '交接班管理',
			width: 800,
			height: 400,
			closed: false,
			cache: false,
			href: '<?php echo MEMBER_THEME; ?>duty_change.html',
			modal: true
		});
	}
</script>
</head>
<body class="index-body skin-blue <?php echo $memberinfo['theme']; ?>">
<!--Header-->

	<div id="header" class="header">
    	<div id="top">
		    <a class="logo" href="<?php echo url('member'); ?>" ><cite>BernardRao</cite></a>
			
        	<div class="right-info">
				<div class="menu-info" style="display:none">
					<div class="info-item">
						<span class="info-title">今日上网电量</span>
						<span class="value">2935.72</span>
						<span class="unit">kWh</span>
					</div>
					<div class="info-item">
						<span class="info-title">累计上网电量</span>
						<span class="value">283910</span>
						<span class="unit">kWh</span>
					</div>
				</div>
				<div class="menu-user">
					<ul>
					<?php if ($memberinfo) { ?>
					<li>欢迎您，<a href="<?php echo url('member/info/edit/'); ?>"><?php if ($memberinfo['nickname']) {  echo $memberinfo['nickname'];  } else {  echo $memberinfo['username'];  } ?></a></li>
					<!-- <li><a href="javascript:void(0)" onclick="succession()"><i class="icon-guanli"></i><span>交班</span></a></li> -->
					<!-- <li><a href="javascript:void(0)" onclick="succession()"><i class="icon-guanli"></i><span>接班</span></a></li> -->
					<!-- <li><a href="<?php echo url('member/content/'); ?>"><i class="icon-guanli"></i><span>管理</span></a></li> -->
					<!-- <li><a href="<?php echo url('member/pms/inbox'); ?>"><i class="icon-youjian"></i>消息</a></li> -->
					<!-- <li><a href="<?php echo url('member/login/switch'); ?>"><i class="icon-zhuxiao"></i>切换</a></li> -->
					<li><a href="<?php echo url('member/login/out'); ?>"><i class="icon-zhuxiao"></i>退出</a></li>
					<?php } else { ?>
					<li><a href="<?php echo url('member/register'); ?>">注册</a></li>
					<li><a href="<?php echo url('member/login'); ?>">登录</a></li>
					<?php } ?>
					</ul>
				</div>
            </div>
        </div>
		<div id="handover"></div>
    </div>
	
<!--Header End-->