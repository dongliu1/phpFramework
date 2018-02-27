<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<?php echo ADMIN_THEME; ?>images/reset.css" rel="stylesheet" type="text/css" />
<link href="<?php echo ADMIN_THEME; ?>images/system.css" rel="stylesheet" type="text/css" />
<link href="<?php echo ADMIN_THEME; ?>images/dialog.css" rel="stylesheet" type="text/css" />
<link href="<?php echo ADMIN_THEME; ?>images/main.css" rel="stylesheet" type="text/css" />
<link href="<?php echo ADMIN_THEME; ?>images/switchbox.css" rel="stylesheet" type="text/css" />
<link href="<?php echo ADMIN_THEME; ?>images/table_form.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<?php echo ADMIN_THEME; ?>js/jquery.min.js"></script>
<script type="text/javascript">
function del(id){
	if(confirm('<?php echo lang('a-lin-9'); ?>')){
		var url = "<?php echo url('admin/linkage/del/',array('keyid'=>$keyid)); ?>&id="+id;
		window.location.href=url;
	}
}
</script>
<title>admin</title>
</head>
<body style="font-weight: normal;">
<div class="subnav">
	<div class="content-menu ib-a blue line-x">
		<a href="<?php echo url('admin/linkage/'); ?>"><em><?php echo lang('a-men-34'); ?></em></a><span>|</span>
		<?php if (admin_auth($userinfo['roleid'], 'linkage-list')) { ?><a href="<?php echo url('admin/linkage/list', array('keyid'=>$keyid)); ?>" class="on"><em><?php echo lang('a-lin-0'); ?></em></a><span>|</span><?php }  if (admin_auth($userinfo['roleid'], 'linkage-addson')) { ?><a href="<?php echo url('admin/linkage/addson', array('keyid'=>$keyid)); ?>"><em><?php echo lang('a-add'); ?></em></a><span>|</span><?php }  if (admin_auth($userinfo['roleid'], 'linkage-cache')) { ?><a href="<?php echo url('admin/linkage/cache'); ?>"><em><?php echo lang('a-cache'); ?></em></a><?php } ?>
	</div>
	<div class="bk10"></div>
	<div class="table-list">
		<form name="myform" action="" method="post">
		<table width="100%" cellspacing="0">
		<thead>
		<tr>
			<th width="50"><?php echo lang('a-order'); ?></th>
			<th width="60" align="left">ID</th>
			<th align="left"><?php echo lang('a-lin-13'); ?></th>
			<th align="left"><?php echo lang('a-ind-88'); ?></th>
			<th align="left"><?php echo lang('a-mod-41'); ?></th>
			<th align="left"><?php echo lang('a-option'); ?></th>
		</tr>
		</thead>
		<tbody>
		<?php echo $list; ?>
		<tr>
			<td colspan="4"><input <?php if (!admin_auth($userinfo['roleid'], 'linkage-editson')) { ?>disabled<?php } ?> type="submit" class="button" name="submit" value="<?php echo lang('a-order'); ?>" /><div class="onShow"><?php echo lang('a-lin-15'); ?></div><?php echo $pagelist; ?></td>
		</tr>
		</tbody>
		</table>
		</form>
	</div>
</div>
<script type="text/javascript">
function setC() {
	if($("#deletec").attr('checked')) {
		$(".deletec").attr("checked",true);
	} else {
		$(".deletec").attr("checked",false);
	}
}
</script>
</body>
</html>