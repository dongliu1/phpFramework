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
<script type="text/javascript">var sitepath = "<?php echo SITE_PATH;  echo ENTRY_SCRIPT_NAME; ?>";</script>
<script type="text/javascript">
function loadformtype(type) {
    $("#content").html('loading...');
	$.get("<?php echo url('admin/model/ajaxformtype/'); ?>&type="+type, function(data) {
		$("#content").html(data);
	});
	$('#hidetbody').show();
	$('#select-ed').show();
	if (type=='editor') {
		$('#hidetbody').hide();
	}
	if (type=='merge') {
		$('#hidetbody').hide();
	}
	if (type=='fields') {
		$('#hidetbody').hide();
	    $('#select-ed').hide();
	}
	if (type=='checkbox') {
		$('#hidetbody').hide();
	}
	if (type=='files') {
		$('#hidetbody').hide();
	}
	if (type=='date') {
		$('#hidetbody').hide();
	}
}
function ajaxname() {
	var field = $('#field').val();
	if (field == '') {
	    $.post(sitepath+'?c=api&a=pinyin&id='+Math.random(), { name:$('#name').val() }, function(data){ $('#field').val(data); });
	}
}
function setlength() {
	var type = new Array(); 
	type['BIGINT']='10';
	type['INT']='10';
	type['TINYINT']='3';
	type['SMALLINT']='5';
	type['MEDIUMINT']='8';
	type['DECIMAL']='10,2';
	type['CHAR']='50';
	type['VARCHAR']='255';
	type['TEXT']='255';
	var name = $('#type').val();
	if (name) {
	    v = type[name];
		$('#length').val(v);
	}
}
</script>
<title>admin</title>
</head>
<body style="font-weight: normal;">
<div class="subnav">
	<div class="content-menu ib-a blue line-x">
		<a href="<?php echo url('admin/model/index', array('typeid'=>$typeid)); ?>"><em><?php echo lang('a-aut-14'); ?></em></a><span>|</span>
		<a href="<?php echo url('admin/model/fields/', array('typeid'=>$typeid, 'modelid'=>$modelid)); ?>"><em><?php echo lang('a-aut-18'); ?></em></a><span>|</span>
		<a href="<?php echo url('admin/model/addfield/', array('typeid'=>$typeid, 'modelid'=>$modelid)); ?>" class="on"><em><?php echo lang('a-add'); ?></em></a><span>|</span>
		<a href="<?php echo url('admin/model/cache', array('typeid'=>$typeid)); ?>"><em><?php echo lang('a-cache'); ?></em></a>
		<span style="float:right"><?php echo $model_data['modelname']; ?></span>
	</div>
	<div class="bk10"></div>
	<div class="table-list">
		<form action="" method="post">
		<input name="modelid" type="hidden" value="<?php echo $modelid; ?>" />
		<input name="fieldid" type="hidden" value="<?php echo $data['fieldid']; ?>" />
		<table width="100%" class="table_form">
		<tr>
			<th width="200"><?php echo lang('a-mod-35'); ?>： </th>
			<td><?php echo $model_data['modelname']; ?></td>
		</tr>
		<tr>
			<th>字段分组： </th>
			<td><input class="input-text" type="text" id="fgroup" name="fgroup" value="<?php echo $data['fgroup']; ?>" size="30" /><div class="onShow"><?php echo lang('a-mod-38'); ?></div>
		</tr>
		<tr>
			<th><font color="red">*</font> <?php echo lang('a-mod-30'); ?>： </th>
			<td><input class="input-text" type="text" name="name" value="<?php echo $data['name']; ?>" size="30" id="name" onBlur="ajaxname()" required /><div class="onShow"><?php echo lang('a-mod-38'); ?></div></td>
		</tr>
		<tr>
			<th><font color="red">*</font> <?php echo lang('a-mod-39'); ?>： </th>
			<td><input class="input-text" type="text" id="field" name="field" value="<?php echo $data['field']; ?>" size="30" <?php if ($data[fieldid]) { ?>disabled<?php } ?> required /><div class="onShow"><?php echo lang('a-mod-40'); ?></div>
		</tr>
		<tr>
			<th><font color="red">*</font> <?php echo lang('a-mod-31'); ?>： </th>
			<td><select name="formtype" id="formtype" onChange="loadformtype(this.value)" <?php if ($data['fieldid']) { ?>disabled<?php } ?> required>
			<option value=""> -- </option>
			<?php if (is_array($formtype)) { $count=count($formtype);foreach ($formtype as $k=>$t) { ?>
			  <option value="<?php echo $k; ?>" <?php if ($k==$data['formtype']) { ?>selected<?php }  if (!in_array($k, array('checkbox', 'radio', 'select', 'textarea', 'password', 'input'))) { ?> class="merge_delete"<?php } ?>><?php echo $t; ?></option>
			<?php } } ?>
			</select>
			</td>
		</tr>
		<tr>
			<th><?php echo lang('a-mod-41'); ?>： </th>
			<td><div id="content">
			<?php 
			if ($data['fieldid']) { 
				$func = "form_" . $data['formtype'];
				$setting = var_export(string2array($data['setting']), true);
				if (function_exists($func)) {
					eval("echo " . $func . "(" . $setting . ");");
				}
			} ?>
			</div></td>
		</tr>
		<?php if (!in_array($data['formtype'], array('editor', 'merge', 'checkbox', 'files', 'date', 'fields'))) { ?>
		<tbody id="hidetbody">
		<tr>
			<th><font color="red">*</font> <?php echo lang('a-mod-32'); ?>： </th>
			<td>
			<?php if ($data['type']) {  echo $data['type'];  } else { ?>
			<select name="type" onChange="setlength()" id="type">
				<option value="">-</option>
				<option value="BIGINT"><?php echo lang('a-mod-43'); ?>(BIGINT)</option>
				<option value="INT"><?php echo lang('a-mod-43'); ?>(INT)</option>
				<option value="TINYINT"><?php echo lang('a-mod-44'); ?>(TINYINT)</option>
				<option value="SMALLINT"><?php echo lang('a-mod-45'); ?>(SMALLINT)</option>
				<option value="MEDIUMINT"><?php echo lang('a-mod-46'); ?>(MEDIUMINT)</option>
				<option value="">-</option>
				<option value="DECIMAL"><?php echo lang('a-mod-47'); ?>(DECIMAL)</option>
				<option value="">-</option>
				<option value="CHAR"><?php echo lang('a-mod-48'); ?>(CHAR)</option>
				<option value="VARCHAR"><?php echo lang('a-mod-49'); ?>(VARCHAR)</option>
				<option value="TEXT"><?php echo lang('a-mod-50'); ?>(TEXT)</option>
			</select>
			<div class="onShow"><?php echo lang('a-mod-42'); ?></div>
			<?php } ?>
			</td>
		</tr>
		<tr>
			<th><font color="red">*</font> <?php echo lang('a-mod-51'); ?>： </th>
			<td><?php if ($data['fieldid']) {  echo $data['length'];  } else { ?><input class="input-text" type="text" id="length" name="length" value="<?php echo $data['length']; ?>" size="30" />
			<div class="onShow"><?php echo lang('a-mod-52'); ?></div><?php } ?></td>
		</tr>
		<tr>
			<th><?php echo lang('a-mod-33'); ?>： </th>
			<td>
			<?php if ($data['indexkey']=='INDEX') {  echo lang('a-mod-53');  } else if ($data['indexkey']=='UNIQUE') {  echo lang('a-mod-54');  } else {  if ($data['fieldid']) {  echo lang('a-mod-55');  } else { ?>
				<select name="indexkey">
				<option value="">---</option>
				<option value="UNIQUE"><?php echo lang('a-mod-54'); ?></option>
				<option value="INDEX"><?php echo lang('a-mod-53'); ?></option>
				</select>
				<div class="onShow"><?php echo lang('a-mod-56'); ?></div>
				<?php }  } ?>
			</td>
		</tr>
		</tbody>
		<?php } ?>
		<tr>
			<th><?php echo lang('a-mod-57'); ?>： </th>
			<td><input class="input-text" type="text" name="tips" value="<?php echo $data['tips']; ?>" size="30" /><div class="onShow"><?php echo lang('a-mod-58'); ?></div></td>
		</tr>
		<?php if ($typeid==1) { ?>
		<tr>
			<th><?php echo lang('a-mod-59'); ?>：</th>
			<td>
			<input type="radio" <?php if (!isset($data['isshow']) || $data['isshow']==1) { ?>checked<?php } ?> value="1" name="isshow" /> <?php echo lang('a-mod-60'); ?>&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" <?php if (isset($data['isshow']) && $data['isshow']==0) { ?>checked<?php } ?> value="0" name="isshow" /> <?php echo lang('a-mod-61'); ?>
			<div class="onShow"><?php echo lang('a-mod-62'); ?></div>
			</td>
		</tr>
		<?php } ?>
		<tbody id="select-ed" style="<?php if (isset($data['formtype']) && $data['formtype']=='fields') { ?>display:none<?php } ?>" />
		<tr>
			<th><?php echo lang('a-mod-63'); ?>：</th>
			<td>
			<input <?php if ($data['formtype']=='merge') { ?>disabled<?php } ?> type="radio" <?php if (!isset($data['not_null']) || empty($data['not_null'])) { ?>checked<?php } ?> value="0" name="not_null" onclick="$('#pattern_data').hide();" /> <?php echo lang('a-mod-64'); ?>&nbsp;&nbsp;&nbsp;&nbsp;
			<input <?php if ($data['formtype']=='merge') { ?>disabled<?php } ?> type="radio" <?php if (isset($data['not_null']) && $data['not_null']) { ?>checked<?php } ?> value="1" name="not_null" onclick="$('#pattern_data').show();" /> <?php echo lang('a-mod-65'); ?>
			</td>
		</tr>
		</tbody>
		<tbody id="pattern_data" style="<?php if (!isset($data['not_null']) || empty($data['not_null'])) { ?>display:none<?php } ?>">
		<tr>
			<th><?php echo lang('a-mod-66'); ?>： </th>
			<td><input class="input-text" type="text" name="pattern" id="pattern" value="<?php echo $data['pattern']; ?>" size="40" /><select onChange="javascript:$('#pattern').val(this.value)" name="pattern_select">
			<option value=""><?php echo lang('a-mod-67'); ?></option>
			<option value="^[0-9.-]+$"><?php echo lang('a-mod-68'); ?></option>
			<option value="^[0-9-]+$"><?php echo lang('a-mod-69'); ?></option>
			<option value="^[A-Za-z]+$"><?php echo lang('a-mod-70'); ?></option>
			<option value="^[0-9A-Za-z]+$"><?php echo lang('a-mod-71'); ?></option>
			<option value="^[\w\-\.]+@[\w\-\.]+(\.\w+)+$">E-mail</option>
			<option value="^[0-9]{5,20}$">QQ</option>
			<option value="^http:\/\/"><?php echo lang('a-mod-72'); ?></option>
			<option value="^(1)[0-9]{10}$"><?php echo lang('a-mod-73'); ?></option>
			<option value="^[0-9-]{6,13}$"><?php echo lang('a-mod-74'); ?></option>
			<option value="^[0-9]{6}$"><?php echo lang('a-mod-75'); ?></option>
			</select><div class="onShow"><?php echo lang('a-mod-76'); ?></div>
			</td>
		</tr>
		<tr>
			<th><?php echo lang('a-mod-77'); ?>： </th>
			<td><input class="input-text" type="text" name="errortips" value="<?php echo $data['errortips']; ?>" size="30" /><div class="onShow"><?php echo lang('a-mod-78'); ?></div></td>
		</tr>
		</tbody>
		<tr>
			<th>&nbsp;</th>
			<td><input class="button" type="submit" name="submit" value="<?php echo lang('a-submit'); ?>" onClick="$('#load').show()" />
			<span id="load" style="display:none"><img src="<?php echo ADMIN_THEME; ?>images/loading.gif"></span></td>
		</tr>
		</table>
		</form>
	</div>
</div>
</body>
</html>