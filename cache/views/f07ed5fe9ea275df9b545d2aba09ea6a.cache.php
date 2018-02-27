<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<META NAME="ROBOTS" CONTENT="NOINDEX,NOFOLLOW">
<title><?php echo $SITE_NAME;  echo lang('admin'); ?></title>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link href="<?php echo ADMIN_THEME; ?>images/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<?php echo ADMIN_THEME; ?>js/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
    $("#user").focus();
});
</script>
</head>
<body>
<div id="header">
	<div class="width">
    	<div class="logo"><a href="<?php echo SITE_PATH; ?>" target="_blank"><img src="<?php echo ADMIN_THEME; ?>images/logo.png" border="0" /></a></div>
    </div>
</div>
<div class="login">
	<div class="login_bg">
    	<div class="login_box">
			<ul>
			<form action="" method="post">
			<li><input type="text" id="user" class="tx" onblur="this.className='tx'" onfocus="this.className='in'" name="username"/></li>
			<li><input type="password" id="pwd" class="tx" onblur="this.className='tx'" onfocus="this.className='in'" name="password" /></li>
			<?php if ($SITE_ADMIN_CODE) { ?>
			<li><input name="code" type="text" class="ipt" onblur="this.className='ipt'" onfocus="this.className='int'" onclick="this.value=''" value="<?php echo lang('a-com-23'); ?>"/>
			<span style="padding-right:10px;"><img id="code" src="<?php echo url('api/captcha/', array('width'=>90, 'height'=>32)); ?>" align="absmiddle" title="<?php echo lang('a-com-24'); ?>" onclick="this.src='<?php echo url('api/captcha/', array('width'=>90, 'height'=>32)); ?>&'+Math.random();" style="cursor:pointer;"></span></li>
			<?php } ?>
			<input type="submit" class="btn" name="submit" value="<?php echo lang('a-login'); ?>" style="cursor:pointer;" />
			</form>
			</ul>
        </div>
    </div>
</div>
<div id="footer">
	<div class="footer">
    <p><a href="http://www.rox.cn/free/" target="_blank"><?php echo lang('a-com-12'); ?></a> |&nbsp;
	<a href="http://www.rox.cn" target="_blank"><?php echo lang('a-com-13'); ?></a></p>
    <p class="ptop">Powered by <?php echo CMS_NAME; ?> v<?php echo CMS_VERSION; ?> © 2011-<?php echo date('Y'); ?> RCMS Inc, Processed in <?php echo runtime(); ?> second(s).</p>
    </div>
</div>
</body>
</html>
