<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<?php echo ADMIN_THEME; ?>images/reset.css" rel="stylesheet" type="text/css" />
<link href="<?php echo ADMIN_THEME; ?>images/system.css" rel="stylesheet" type="text/css" />
<link href="<?php echo ADMIN_THEME; ?>images/main.css" rel="stylesheet" type="text/css" />
<link href="<?php echo ADMIN_THEME; ?>images/switchbox.css" rel="stylesheet" type="text/css" />
<link href="<?php echo ADMIN_THEME; ?>images/table_form.css" rel="stylesheet" type="text/css" />
<link href="<?php echo JLIB_PATH; ?>fonts/awesome/font-awesome.min.css"  rel="stylesheet" type="text/css">
<!--[if IE 7]>
<link rel="stylesheet" href="<?php echo ADMIN_THEME; ?>fonts/font-awesome-ie7.css">
<![endif]-->
<script type="text/javascript" src="<?php echo ADMIN_THEME; ?>js/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	if ($(document).width() <= 900) {
	    $('#s_title').css('width', '200px');
	}
});
function del(id) {
	if (confirm('<?php echo lang('a-cat-11'); ?>')) {
	    $('#load').show();
		var url = "<?php echo url('admin/category/del/'); ?>&catid="+id;
		window.location.href=url;
	}
}
function confirm_del() {
    if (confirm('<?php echo lang('a-confirm'); ?>')) {
	    $('#load').show();
		return true; 
	} else {
	    return false;
	}
}
function setC() {
	if($("#deletec").attr('checked')) {
		$(".deletec").attr("checked",true);
	} else {
		$(".deletec").attr("checked",false);
	}
}
</script>
<title>admin</title>
</head>
<body style="font-weight: normal;">
<div class="subnav">
	<div class="content-menu ib-a blue line-x">
		<a href="<?php echo url('admin/category/'); ?>" class="on"><em><?php echo lang('a-cat-12'); ?></em></a><span>|</span>
		<?php if (admin_auth($userinfo['roleid'], 'category-add')) { ?><a href="<?php echo url('admin/category/add'); ?>"><em><?php echo lang('a-cat-13'); ?></em></a><span>|</span><?php }  if (admin_auth($userinfo['roleid'], 'category-url')) { ?><a href="<?php echo url('admin/category/url'); ?>"><em><?php echo lang('a-cat-14'); ?></em></a><span>|</span><?php }  if (admin_auth($userinfo['roleid'], 'category-cache')) { ?><a href="<?php echo url('admin/category/cache'); ?>"><em><?php echo lang('a-cache'); ?></em></a><?php } ?>
	</div>
	<div class="bk10"></div>
	<div class="table-list">
		<form action="" method="post" name="myform">
		<table width="100%">
		<thead>
		<tr>
			<th width="20" align="left"><input name="deletec" id="deletec" type="checkbox" onClick="setC()" /></th>
			<th width="40" align="left"><?php echo lang('a-order'); ?></th>
			<th width="20" align="left">ID </th>
			<th width="200" id="s_title" align="left"><?php echo lang('a-cat-15'); ?></th>
			<th width="70"  align="left"><?php echo lang('a-cat-16'); ?></th>
			<th width="150" align="left"><?php echo lang('a-cat-17'); ?></th>
			<th width="30" align="left"><?php echo lang('a-cat-18'); ?></th>
			<th width="40" align="left"><?php echo lang('a-cat-19'); ?></th>
			<th width="40" align="left"><?php echo lang('a-con-128'); ?></th>
			<th align="left"><?php echo lang('a-con-29').lang('a-option'); ?></th>
			
		</tr>
		</thead>
		<tbody>
		<?php if (is_array($list)) { $count=count($list);foreach ($list as $t) { ?>
		<tr>
			<td align="left"><input name="ids[]" type="checkbox" value="<?php echo $t['catid']; ?>" class="deletec" /></td>
			<td align="left"><input type="text" name="order_<?php echo $t['catid']; ?>" class="input-text" style="width:25px; height:15px;" value="<?php echo $t['listorder']; ?>"></td>
			<td align="left"><?php echo $t['catid']; ?></td>
			<td align="left" title="<?php echo $t['catdir']; ?>"><?php echo str_replace($t['catname'], ' <a href="' . url('admin/category/edit',array('catid'=>$t['catid'])) . '">' . $t['catname'] . '</a>', $t['prefix']); ?></td>
			<td align="left">
			<?php if ($t['typeid']==1) { ?><font color="#666666"><?php echo lang('a-cat-20'); ?></font><?php }  if ($t['typeid']==2) { ?><font color="#0000FF"><?php echo lang('a-cat-21'); ?></font><?php }  if ($t['typeid']==3) { ?><font color="#FF0000"><?php echo lang('a-cat-22'); ?></font><?php } ?>
			</td>
			<td align="left"><?php if ($t['modelid']) {  echo $model[$t['modelid']]['modelname'];  } ?></td>
			<td align="left">&nbsp;<?php if ($t['ismenu']) {  echo lang('a-yes');  } else { ?><font color="#FF0000"><?php echo lang('a-no'); ?></font><?php } ?></td>
			<td align="left"><?php echo $cats[$t['catid']]['items']; ?></td>
			<td align="left">
			<?php if ($t['typeid']==1 && !$t['child'] && !admin_post_auth($userinfo['roleid'], $cats[$t['catid']]['setting'])) { ?><a href="<?php echo url('admin/content/add', array('catid'=>$t['catid'], 'modelid'=>$t['modelid'])); ?>"><?php echo lang('a-post'); ?></a><?php } ?>
			</td>
			<td align="left">
			<?php if ($t['modelid']==0) {  if (admin_auth($userinfo['roleid'], 'category-edit')) { ?><a href="<?php echo url('admin/category/singlepage_edit',array('catid'=>$t['catid'])); ?>" class="fa fa-eye" style="color:#2360A2;" title="<?php echo lang('a-edit'); ?>"></i></a> | <?php } ?>
				
				<a href="<?php echo url('admin/category/edit',array('catid'=>$t['catid'])); ?>" class="fa fa-pencil" title="<?php echo lang('a-cat-23'); ?>"></a> |
				
				<?php if (admin_auth($userinfo['roleid'], 'category-del')) { ?><a href="javascript:del(<?php echo $t['catid']; ?>);" class="fa fa-trash" style="color:#aaa;" title="<?php echo lang('a-del'); ?>"> </a><?php }  } else { ?>
				<a href="<?php echo url('admin/content',array('catid'=>$t['catid'])); ?>" class="fa fa-eye" title="<?php echo lang('a-cat-23'); ?>"></a> | 
				<?php if (admin_auth($userinfo['roleid'], 'category-add')) { ?><a <?php if ($t['typeid']!=3) { ?>href="<?php echo url('admin/category/add',array('catid'=>$t['catid'])); ?>"<?php } ?>href="javascript:;" class="fa fa-plus-circle" style="color:#43800A;" title="<?php echo lang('a-add').lang('a-con-29'); ?>"></a> | <?php }  if (admin_auth($userinfo['roleid'], 'category-edit')) { ?><a href="<?php echo url('admin/category/edit',array('catid'=>$t['catid'])); ?>" class="fa fa-pencil" style="color:#2360A2;" title="<?php echo lang('a-edit'); ?>"></i></a> | <?php }  if (admin_auth($userinfo['roleid'], 'category-del')) { ?><a href="javascript:del(<?php echo $t['catid']; ?>);" class="fa fa-trash" style="color:#aaa;" title="<?php echo lang('a-del'); ?>"> </a><?php }  } ?>
			</td>
		</tr>
		<?php } } ?>
		<tr>
			<td colspan="9" align="left">
				<input <?php if (!admin_auth($userinfo['roleid'], 'category-del')) { ?>disabled<?php } ?> type="submit" class="button" value="<?php echo lang('a-del'); ?>" name="delete" onclick="return confirm_del()" />&nbsp;
				<input <?php if (!admin_auth($userinfo['roleid'], 'category-edit')) { ?>disabled<?php } ?> type="submit" class="button" value="<?php echo lang('a-order'); ?>" name="submit" onClick="$('#load').show()" />&nbsp;<div class="onShow"><?php echo lang('a-cat-24'); ?></div>
				<span id="load" style="display:none"><img src="<?php echo ADMIN_THEME; ?>images/loading.gif"></span>
			</td>
		</tr>
		</tbody>
		</table>
		</form>
    </div>
</div>
</body>
</html>