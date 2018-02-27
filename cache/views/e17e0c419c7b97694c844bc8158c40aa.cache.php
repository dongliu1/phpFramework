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
<title>admin</title>
</head>
<body style="font-weight: normal;">
<div class="subnav">
	<div class="content-menu ib-a blue line-x">
		<a href="<?php echo url('admin/linkage/list', array('keyid'=>$keyid)); ?>"><em><?php echo lang('a-lin-0'); ?></em></a><span>|</span>
		<a href="javascript:;" class="on"><em><?php echo lang('a-add'); ?></em></a><span>|</span>
		<a href="<?php echo url('admin/linkage/cache'); ?>"><em><?php echo lang('a-cache'); ?></em></a>
	</div>
	<div class="bk10"></div>
	<div class="table-list">
		<form action="" method="post">
		<table width="100%" class="table_form">
		<tr>
			<th width="200"><?php echo lang('a-lin-16'); ?>： </th>
			<td>
			<?php echo $select; ?>
			</td>
		</tr>
		<tr>
		    <th valign="top"><?php echo lang('a-lin-13'); ?>： </th>
		    <td>
			<?php if ($edit) { ?>
			<input class="input-text" type="text" name="name" value="<?php echo $data['name']; ?>" size="30"/>
			<?php } else { ?>
			<textarea style="height:110px;width:150px;" class="inputtext" id="name" cols="20" rows="2" name="name"></textarea>
			<div class="onShow"><?php echo lang('a-lin-17'); ?></div>
			<?php } ?>
			</td>
		</tr>
		<tr>
		    <th valign="top"><?php echo lang('a-ind-88'); ?>： </th>
		    <td>
			<input class="inputtext" name="data[idx]" value="<?php echo $data['idx']; ?>">
			</td>
		</tr>
		<tr>
		    <th valign="top"><?php echo lang('a-mod-41'); ?>： </th>
		    <td>
			<input class="inputtext" name="data[setting]" value="<?php echo $data['setting']; ?>">
			</td>
		</tr>
		<tr>
			<th>&nbsp;</th>
			<td><input class="button" type="submit" name="submit" value="<?php echo lang('a-submit'); ?>" /></td>
		</tr>
		</table>
		</form>
	</div>
</div>
</body>
</html>