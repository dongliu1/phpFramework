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
<script type="text/javascript" src="<?php echo ADMIN_THEME; ?>js/dialog.js"></script>
<title>admin</title>
</head>
<body style="font-weight: normal;">
<div class="subnav">
	<div class="content-menu ib-a blue line-x">
		<a href="<?php echo url('admin/category'); ?>"><em><?php echo lang('a-cat-12'); ?></em></a><span>|</span>
		<a href="<?php echo url('admin/content/index', array('catid'=>$catid)); ?>" <?php if ($a=='index' && $recycle==0) { ?>class="on"<?php } ?>><em><?php echo lang('a-con-19'); ?>(<?php echo $total; ?>)</em></a><span>|</span>
		<a href="<?php echo url('admin/content/verify', array('status'=>3, 'catid'=>$catid)); ?>" <?php if ($status==3) { ?>class="on"<?php } ?>><em><?php echo lang('a-con-21'); ?>(<?php echo $count[1]; ?>)</em></a><span>|</span>
		<a href="<?php echo url('admin/content/verify', array('status'=>2, 'catid'=>$catid)); ?>" <?php if ($status==2) { ?>class="on"<?php } ?>><em><?php echo lang('a-con-22'); ?>(<?php echo $count[2]; ?>)</em></a><span>|</span>
		<a href="<?php echo url('admin/content/index', array('recycle'=>1, 'catid'=>$catid)); ?>" <?php if ($recycle==1) { ?>class="on"<?php } ?>><em><?php echo lang('a-con-23'); ?>(<?php echo $count[0]; ?>)</em></a><span>|</span>
		<?php if (admin_auth($userinfo['roleid'], 'content-add')) { ?><a href="<?php echo url('admin/content/add', array('catid'=>$catid)); ?>"><em><?php echo lang('a-con-24'); ?></em></a><?php } ?>
	</div>
	<div class="bk10"></div>
	<div class="explain-col">
		<form action="" method="post">
		<input name="form" type="hidden" value="search" />
		<?php echo lang('a-con-25'); ?>： 
		<select id="catid" name="catid">
			<option value="0"> ---- </option>
			<?php echo $category; ?>
		</select>
		&nbsp;&nbsp;
		<select name="stype">
			<option selected="" value="0"><?php echo lang('a-con-26'); ?></option>
			<option value="1"><?php echo lang('a-con-27'); ?></option>
			<option value="2"><?php echo lang('a-con-28'); ?></option>
		</select>
		<input type="text" class="input-text" size="25" name="kw" /><input type="submit" class="button" value="<?php echo lang('a-search'); ?>" name="submit" />
		</form>
	</div>
	<div class="bk10"></div>
	<div class="table-list">
		<form action="" method="post" name="myform">
		<input name="form" id="list_form" type="hidden" value="order" />
		<table width="100%">
		<thead>
		<tr>
			<th width="20" align="left"><input name="deletec" id="deletec" type="checkbox" onClick="setC()" /></th>
			<th width="40" align="left"><?php echo lang('a-order'); ?></th>
			<th width="40" align="left">ID </th>
			<th align="left" id="t_title"><?php echo lang('a-con-26'); ?></th>
			<th width="80" align="left"><?php echo lang('a-con-29'); ?></th>
			<th width="50" align="left"><?php echo lang('a-con-30'); ?></th>
			<th width="120" align="left"><?php echo lang('a-con-31'); ?></th>
			<th align="left"><?php echo lang('a-option'); ?></th>
		</tr>
		</thead>
		<tbody>
		<?php if (is_array($list)) { $count=count($list);foreach ($list as $t) { ?>
		<tr>
			<td align="left"><input name="del_<?php echo $t['id']; ?>_<?php echo $t['catid']; ?>" type="checkbox" class="deletec" /></td>
			<td align="left"><input type="text" name="order_<?php echo $t['id']; ?>" class="input-text" style="width:25px; height:15px;" value="<?php echo $t['listorder']; ?>"></td>
			<td align="left"><?php echo $t['id']; ?></td>
			<td align="left">
			<div id="s_title" style="height:20px;overflow: hidden;">
			<a href="<?php if ($a!='index') {  echo url('admin/content/editverify',array('id'=>$t['id']));  } else {  echo url('admin/content/edit',array('id'=>$t['id']));  } ?>" title="<?php echo $t['title']; ?>"><?php echo $t['title']; ?></a>
			</div>
			</td>
			<td align="left"><a href="<?php echo url('admin/content/index',array('catid'=>$t['catid'],'modelid'=>$t['modelid'])); ?>"><?php echo $cats[$t['catid']]['catname']; ?></a></td>
			<td align="left"><a <?php if ($t['sysadd']) { ?>style="color:red;" title="<?php echo lang('a-con-35'); ?>"<?php } ?> href="<?php echo url('admin/content/index',array('kw'=>$t['username'],'modelid'=>$t['modelid'],'stype'=>($t['sysadd']?2:1))); ?>"><?php echo $t['username']; ?></a></td>
			<td align="left"><span style="<?php if (date('Y-m-d', $t['updatetime']) == date('Y-m-d')) { ?>color:#F00<?php } ?>"><?php echo date(TIME_FORMAT, $t['updatetime']); ?></span></td>
			<td align="left">
			<?php if ($a=='verify') {  $del = url('admin/content/delverify/',array('catid'=>$t['catid'],'id'=>$t['id'])); if (admin_auth($userinfo['roleid'], 'content-editverify')) { ?><a href="<?php echo url('admin/content/editverify',array('id'=>$t['id'])); ?>"><?php echo lang('a-edit'); ?></a> | <?php }  if (admin_auth($userinfo['roleid'], 'content-delverify')) { ?><a href="javascript:;" clz="1" onClick="if(confirm('<?php echo lang('a-confirm'); ?>')){ window.location.href='<?php echo $del; ?>'; }"><?php echo lang('a-del'); ?></a> <?php }  } else {  if (is_array($join)) { $count=count($join);foreach ($join as $j) { ?>
				<a href="<?php echo url('admin/form/list',array('cid'=>$t['id'], 'modelid'=>$j['modelid'])); ?>"><?php echo $j['modelname']; ?></a> |
				<?php } }  $del = url('admin/content/del/',array('catid'=>$t['catid'],'id'=>$t['id']));?>
				<a href="<?php echo $site_url;  echo $t['url']; ?>" clz="1" target="_blank"><?php echo lang('a-cat-23'); ?></a> | 
				<?php if (admin_auth($userinfo['roleid'], 'content-edit')) { ?><a href="<?php echo url('admin/content/edit',array('id'=>$t['id'])); ?>"><?php echo lang('a-edit'); ?></a> | <?php }  if (admin_auth($userinfo['roleid'], 'content-del')) { ?><a href="javascript:;" clz="1" onClick="if(confirm('<?php echo lang('a-confirm'); ?>')){ window.location.href='<?php echo $del; ?>'; }"><?php echo lang('a-del'); ?></a> <?php }  } ?>
			</td>
		</tr>
		<?php } } ?>
		<tr>
			<td colspan="8" align="left">
			<input <?php if (!admin_auth($userinfo['roleid'], 'content-edit')) { ?>disabled<?php } ?> type="submit" class="button" value="<?php echo lang('a-order'); ?>" name="submit_order" onClick="$('#list_form').val('order')" <?php if ($a=='verify') { ?>disabled<?php } ?> />&nbsp;
			<input <?php if (($a=='index' && !admin_auth($userinfo['roleid'], 'content-del')) || ($a=='verify' && !admin_auth($userinfo['roleid'], 'content-delverify'))) { ?>disabled<?php } ?> type="submit" class="button" value="<?php echo lang('a-del'); ?>" name="submit_del" onClick="$('#list_form').val('del');return confirm_del();" />&nbsp;
			<?php if ($a=='verify') { ?>
			<input <?php if (!admin_auth($userinfo['roleid'], 'content-verify')) { ?>disabled<?php } ?> type="submit" class="button" value="<?php echo lang('a-con-36'); ?>" name="submit_status_1" onClick="$('#list_form').val('status_1')" />&nbsp;
			<input <?php if (!admin_auth($userinfo['roleid'], 'content-verify')) { ?>disabled<?php } ?> type="submit" class="button" value="<?php echo lang('a-con-37'); ?>" name="submit_status_0" onClick="$('#list_form').val('status_0')" />&nbsp;
			<input <?php if (!admin_auth($userinfo['roleid'], 'content-verify')) { ?>disabled<?php } ?> type="submit" class="button" value="<?php echo lang('a-con-38'); ?>" name="submit_status_2" onClick="$('#list_form').val('status_2')" />&nbsp;
			<?php } else {  if ($recycle) { ?>
			<input <?php if (!admin_auth($userinfo['roleid'], 'content-edit')) { ?>disabled<?php } ?> type="submit" class="button" value="<?php echo lang('a-con-36'); ?>" name="submit_status_1" onClick="$('#list_form').val('status_1')" />&nbsp;
			<?php } else { ?>
			<input <?php if (!admin_auth($userinfo['roleid'], 'content-edit')) { ?>disabled<?php } ?> type="submit" class="button" value="<?php echo lang('a-con-39'); ?>" name="submit_status_3" onClick="$('#list_form').val('status_3')" />&nbsp;
			<?php }  echo lang('a-con-40'); ?>
			<select name="movecatid">
			<option value="0"> ---- </option>
			<?php echo $category; ?>
			</select>
			<input <?php if (!admin_auth($userinfo['roleid'], 'content-edit')) { ?>disabled<?php } ?> type="submit" class="button" value="<?php echo lang('a-con-41'); ?>" name="submit_move" onClick="$('#list_form').val('move')" />&nbsp;
			<?php } ?>
			</td>
		</tr>    
		</tbody>
		</table>
		<?php echo str_replace('<a>共' . $total . '条</a>', '<a>耗时' . runtime() . '秒</a><a>共' . $total . '条</a>', $pagelist); ?>
		</form>
	</div>
</div>
<script type="text/javascript">
$(function(){
    window.top.art.dialog({id:'clz'}).close();
	/*$('a').click(
		function(){
		    var clz = $(this).attr('clz');
			if (clz != '1') 
				window.top.art.dialog({ id:'clz',title:'loading',fixed:true,lock:false,
			content: '<img src="<?php echo ADMIN_THEME; ?>images/onLoad.gif">' });
		}
	);*/
    $('input[type="submit"]').click(
		function(){
            window.top.art.dialog({ id:'clz',title:'loading',fixed:true,lock:false,content: '<img src="<?php echo ADMIN_THEME; ?>images/onLoad.gif">' });
		}
	);
	if ($(document).width() <= 900) {
	    $('#s_title').css('width', '150px');
		$('#t_title').attr('width', '150');
	}
});
function confirm_del() {
    if (confirm('<?php echo lang('a-confirm'); ?>')) { 
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
</body>
</html>