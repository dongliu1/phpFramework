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
	if(confirm('<?php echo lang('a-mod-29'); ?>')){
		var url = "<?php echo url('admin/model/delfield/',array('typeid'=>$typeid)); ?>&fieldid="+id;
		window.location.href=url;
	}
}
</script>
<title>admin</title>
</head>
<body>
<form action="" method="post">
<div class="subnav">
	<div class="content-menu ib-a blue line-x">
		<a href="<?php echo url('admin/model/index',     array('typeid'=>$typeid)); ?>"><em><?php echo lang('a-aut-14'); ?></em></a><span>|</span>
		<a href="<?php echo url('admin/model/fields/',   array('typeid'=>$typeid, 'modelid'=>$modelid)); ?>" class="on"><em><?php echo lang('a-aut-18'); ?></em></a><span>|</span>
		<?php if (admin_auth($userinfo['roleid'], 'model-addfield')) { ?><a href="<?php echo url('admin/model/addfield/', array('typeid'=>$typeid, 'modelid'=>$modelid)); ?>"><em><?php echo lang('a-add'); ?></em></a><span>|</span><?php }  if (admin_auth($userinfo['roleid'], 'model-cache')) { ?><a href="<?php echo url('admin/model/cache', array('typeid'=>$typeid)); ?>"><em><?php echo lang('a-cache'); ?></em></a><?php } ?>
		<span style="float:right"><?php echo $modelname; ?></span>
	</div>
	<div class="bk10"></div>
	<div class="table-list">
	    <form action="" method="post">
		<table width="100%">
		<thead>
		<tr>
			<th width="40" align="left"><?php echo lang('a-order'); ?></th>
			<th width="80" align="left">分组</th>
			<th width="120" align="left"><?php echo lang('a-name'); ?></th>
			<th width="90" align="left"><?php echo lang('a-mod-30'); ?></th>
			<th width="80" align="left"><?php echo lang('a-mod-31'); ?></th>
			<th width="80" align="left"><?php echo lang('a-mod-32'); ?></th>
			<th width="50" align="left"><?php echo lang('a-mod-33'); ?></th>
			<th align="left"><?php echo lang('a-option'); ?></th>
		</tr>
		</thead>
		<tbody>
		<?php if ($isnewsmodel==1 && $typeid == 1) { ?>
		<tr>
			<td align="left"></td>
			<td align="left"></td>
			<td align="left">title</td>
			<td align="left"><?php echo $content['title']['name']; ?></td>
			<td align="left"><?php if ($content['title']['show']) {  echo lang('a-mod-60');  } else {  echo lang('a-mod-61');  } ?></td>
			<td align="left"> </td>
			<td align="left"> </td>
			<td align="left"><?php if (admin_auth($userinfo['roleid'], 'model-editfield')) { ?><a href="<?php echo url('admin/model/ajaxedit/',array('modelid'=>$modelid,'name'=>'title')); ?>"><?php echo lang('a-edit'); ?></a><?php } ?></td>
		</tr>
		<tr>
			<td align="left"></td>
			<td align="left"></td>
			<td align="left">keywords</td>
			<td align="left"><?php echo $content['keywords']['name']; ?></td>
			<td align="left"><?php if ($content['keywords']['show']) {  echo lang('a-mod-60');  } else {  echo lang('a-mod-61');  } ?></td>
			<td align="left"> </td>
			<td align="left"> </td>
			<td align="left"><?php if (admin_auth($userinfo['roleid'], 'model-editfield')) { ?><a href="<?php echo url('admin/model/ajaxedit/',array('modelid'=>$modelid,'name'=>'keywords')); ?>"><?php echo lang('a-edit'); ?></a><?php } ?></td>
		</tr>
		<tr height="25">
			<td align="left"></td>
			<td align="left"></td>
			<td align="left">thumb</td>
			<td align="left"><?php echo $content['thumb']['name']; ?></td>
			<td align="left"><?php if ($content['thumb']['show']) {  echo lang('a-mod-60');  } else {  echo lang('a-mod-61');  } ?></td>
			<td align="left"> </td>
			<td align="left"> </td>
			<td align="left"><?php if (admin_auth($userinfo['roleid'], 'model-editfield')) { ?><a href="<?php echo url('admin/model/ajaxedit/',array('modelid'=>$modelid,'name'=>'thumb')); ?>"><?php echo lang('a-edit'); ?></a><?php } ?></td>
		</tr>
		<tr>
			<td align="left"></td>
			<td align="left"></td>
			<td align="left">description</td>
			<td align="left"><?php echo $content['description']['name']; ?></td>
			<td align="left"><?php if ($content['description']['show']) {  echo lang('a-mod-60');  } else {  echo lang('a-mod-61');  } ?></td>
			<td align="left"> </td>
			<td align="left"> </td>
			<td align="left"><?php if (admin_auth($userinfo['roleid'], 'model-editfield')) { ?><a href="<?php echo url('admin/model/ajaxedit/',array('modelid'=>$modelid,'name'=>'description')); ?>"><?php echo lang('a-edit'); ?></a><?php } ?></td>
		</tr>
		<?php }  if (is_array($list)) { $count=count($list);foreach ($list as $t) { ?>
		<tr style="<?php if ($t['formtype']=='merge') { ?>background-color:#FFC<?php } else if ($t['formtype']=='fields') { ?>background-color:#EEF3F7<?php } ?>">
			<td align="left">
			<input type="text" name="order_<?php echo $t['fieldid']; ?>" class="input-text" style="width:25px;height:15px;" value="<?php echo $t['listorder']; ?>"></td>
			<td align="left"><?php echo $t['fgroup']; ?></td>
			<td align="left"><?php echo $t['field']; ?></td>
			<td align="left"><?php echo $t['name']; ?></td>
			<td align="left"><?php if ($t['formtype']=='merge') {  echo lang('a-mod-34');  } else {  echo $t['formtype'];  } ?></td>
			<td align="left"><?php echo $t['type']; ?></td>
			<td align="left"><?php echo $t['indexkey']; ?></td>
			<td align="left">
			<?php if (admin_auth($userinfo['roleid'], 'model-editfield')) { ?><a href="<?php echo url('admin/model/editfield/',array('typeid'=>$typeid,'fieldid'=>$t['fieldid'])); ?>"><?php echo lang('a-edit'); ?></a> | <?php }  if (admin_auth($userinfo['roleid'], 'model-disable')) { ?><a href="<?php echo url('admin/model/disable/',array('typeid'=>$typeid,'fieldid'=>$t['fieldid'])); ?>"><?php if ($t['disabled']==1) { ?><font color="#FF0000"><?php echo lang('a-qi'); ?></font><?php } else {  echo lang('a-jin');  } ?></a> | <?php }  if (admin_auth($userinfo['roleid'], 'model-del')) {  if ($t['field'] == 'content') { ?><a href="javascript:;" style="color:#ACA899"><?php echo lang('a-del'); ?></a> <?php } else { ?><a href="javascript:del(<?php echo $t['fieldid']; ?>);"><?php echo lang('a-del'); ?></a> <?php }  } ?></td>
		</tr>
		<?php } } ?>
		<tr>
			<td colspan="7" align="left"><input <?php if (!admin_auth($userinfo['roleid'], 'model-editfield')) { ?>disabled<?php } ?> class="button" type="submit" name="submit" value="<?php echo lang('a-order'); ?>" /></td>
		</tr>
		</tbody>
		</table>
	    </form>
	</div>
</div>
</body>
</html>