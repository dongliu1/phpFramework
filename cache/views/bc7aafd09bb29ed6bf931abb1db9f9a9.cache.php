<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<?php echo ADMIN_THEME; ?>images/reset.css" rel="stylesheet" type="text/css" />
<link href="<?php echo ADMIN_THEME; ?>images/system.css" rel="stylesheet" type="text/css" />
<link href="<?php echo ADMIN_THEME; ?>images/dialog.css" rel="stylesheet" type="text/css" />
<link href="<?php echo ADMIN_THEME; ?>images/switchbox.css" rel="stylesheet" type="text/css" />
<link href="<?php echo ADMIN_THEME; ?>images/table_form.css" rel="stylesheet" type="text/css" />

<link href="<?php echo JLIB_PATH; ?>fonts/awesome/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="<?php echo JLIB_PATH; ?>fonts/ionicons/ionicons.min.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<?php echo ADMIN_THEME; ?>js/jquery.min.js"></script>
<script type="text/javascript">
var sitepath = "<?php echo SITE_PATH;  echo ENTRY_SCRIPT_NAME; ?>";
var rcms_admin_document = "<?php echo $setting['document']; ?>";
</script>
<script type="text/javascript" src="<?php echo LANG_PATH; ?>lang.js"></script>
<script type="text/javascript" src="<?php echo ADMIN_THEME; ?>js/core.js"></script>
<script type="text/javascript">
function ajaxdir() {
	var dir = $('#dir_text').val();
	if (dir == '') {
	    $.post(sitepath+'?c=api&a=pinyin&id='+Math.random(), { name:$('#dir').val() }, function(data){ $('#dir_text').val(data);set_tpl(data); });
	}
}
</script>
<title>admin</title>
</head>
<body style="font-weight: normal;">
<div class="subnav">
	<div class="content-menu ib-a blue line-x">
		<a href="<?php echo url('admin/category/'); ?>"><em><?php echo lang('a-cat-12'); ?></em></a><span>|</span>
		<a href="<?php echo url('admin/category/add'); ?>" class="on"><em><?php echo lang('a-cat-13'); ?></em></a><span>|</span>
		<?php if (admin_auth($userinfo['roleid'], 'category-url')) { ?><a href="<?php echo url('admin/category/url'); ?>"><em><?php echo lang('a-cat-14'); ?></em></a><span>|</span><?php }  if (admin_auth($userinfo['roleid'], 'category-cache')) { ?><a href="<?php echo url('admin/category/cache'); ?>"><em><?php echo lang('a-cache'); ?></em></a><?php } ?>
	</div>
	<div class="table-list">
		<form method="post" action="" id="myform" name="myform">
		<input type="hidden" value="<?php echo $catid; ?>" name="catid" />
		<input type="hidden" value="<?php echo $data['typeid']; ?>" name="typeid" />
		<div class="pad-10">
				<div class="col-tab">
					<ul class="tabBut cu-li">
						<li onClick="SwapTab('setting','on','',5,1);" class="on" id="tab_setting_1"><?php echo lang('a-cat-25'); ?></li>
						<li onClick="SwapTab('setting','on','',5,2);" id="tab_setting_2" class=""><?php echo lang('a-cat-26'); ?></li>
						<li onClick="SwapTab('setting','on','',5,3);" id="tab_setting_3" class=""><?php echo lang('a-cat-27'); ?></li>
						<li onClick="SwapTab('setting','on','',5,4);" id="tab_setting_4" class=""><?php echo lang('a-cat-28'); ?></li>
						<li onClick="SwapTab('setting','on','',5,5);" id="tab_setting_5" class=""><?php echo lang('a-cat-29'); ?></li>
					</ul>
					
					<div class="contentList pad-10" id="div_setting_1" style="display: block;">
					<table width="100%" class="table_form">
					<tbody>
					<tr>
						<th width="200"><font color="red">*</font> <?php echo lang('a-cat-16'); ?>：</th>
						<td>
						<input type="radio" value="1" name="data[typeid]" <?php if ($data[typeid]==1) { ?>checked<?php } ?> onClick="settype(1)"  <?php if ($catid) { ?>disabled<?php } ?> required /> <?php echo lang('a-cat-20'); ?>&nbsp;&nbsp;
						<input type="radio" value="2" name="data[typeid]" <?php if ($data[typeid]==2) { ?>checked<?php } ?> onClick="settype(2)" <?php if ($catid) { ?>disabled<?php } ?> required /> <?php echo lang('a-cat-21'); ?>&nbsp;&nbsp;
						<input type="radio" value="3" name="data[typeid]" <?php if ($data[typeid]==3) { ?>checked<?php } ?> onClick="settype(3)" <?php if ($catid) { ?>disabled<?php } ?> required /> <?php echo lang('a-cat-22'); ?>
						<div class="onShow"><?php echo lang('a-cat-30'); ?></div>
						</td>
					</tr>
					<tr class="type_1" style="display:none;">
						<th><font color="red">*</font> <?php echo lang('a-cat-17'); ?>：</th>
						<td>
						<select onChange="change_tpl(this.value)" id="modelid" name="data[modelid]" <?php if ($catid) { ?>disabled<?php } ?> />
						<option value=""> -- </option>
						<?php if (is_array($model)) { $count=count($model);foreach ($model as $t) { ?>
						<option value="<?php echo $t['modelid']; ?>" <?php if ($t['modelid']==$data['modelid']) { ?>selected<?php } ?>><?php echo $t['modelname']; ?></option>
						<?php } } ?>
						</select><div class="onShow"><?php echo lang('a-cat-31'); ?></div></td>
					</tr>
					<tr>
						<th><font color="red">*</font> <?php echo lang('a-cat-32'); ?>：</th>
						<td>
						<select id="parentid" name="data[parentid]">
						<option value="0"><?php echo lang('a-cat-33'); ?></option>
						<?php echo $category_select; ?>
						</select>
						</td>
					</tr>
					<?php if ($add) { ?>
					<tr>
						<th><?php echo lang('a-cat-34'); ?>：</th>
						<td>
						<input type="radio" value="0" name="addall" onclick='$("#addall").hide();$("#_addall").show();' checked /> <?php echo lang('a-no'); ?>&nbsp;&nbsp;
						<input type="radio" value="1" name="addall" onclick='$("#addall").show();$("#_addall").hide();' /> <?php echo lang('a-yes'); ?>
						</td>
					</tr>
					<tbody id='addall' style="display:none">
					<tr>
						<th><font color="red">*</font> <?php echo lang('a-cat-15'); ?>：</th>
						<td><textarea style="width:200px;height:110px" name="names" /></textarea>
						<div class="onShow"><?php echo lang('a-cat-35'); ?></div>
						</td>
					</tr>
					</tbody>
					<?php } ?>
					<tbody id='_addall'>
					<tr>
						<th><font color="red">*</font> <?php echo lang('a-cat-15'); ?>：</th>
						<td><input type="text" class="input-text" size="25" value="<?php echo $data['catname']; ?>" name="data[catname]" id="dir" onBlur="ajaxdir()" /></td>
					</tr>
					<tr>
						<th><font color="red">*</font> <?php echo lang('a-cat-36'); ?>：</th>
						<td><input type="text" class="input-text" size="25" value="<?php echo $data['catdir']; ?>" name="data[catdir]" id="dir_text" onchange="$('#data-showtpl').val('_'+$(this).val()+'_show.html')" /></td>
					</tr>
					<tr>
						<th><?php echo lang('a-mod-201'); ?>：</th>
						<td><input type="text" class="input-text" size="25" value="<?php echo $setting['document']; ?>" name="setting[document]" onBlur="set_document(this.value)" />
						<div id="result_document" class="onShow"><?php echo lang('a-mod-202'); ?></div></td>
					</tr>
					<tr>
						<th><?php echo lang('a-cat-37'); ?>：</th>
						<td><input type="text" class="input-text" size="50" value="<?php echo $data['image']; ?>" name="data[image]" id="image" />
						<input type="button" style="width:66px;cursor:pointer;" class="button" onClick="preview('image')" value="<?php echo lang('a-image'); ?>" />
						<input type="button" style="width:66px;cursor:pointer;" class="button" onClick="uploadImage('image')" value="<?php echo lang('a-upload'); ?>" />
						<div class="onShow"><?php echo lang('a-pic'); ?></div>
						</td>
					</tr>
					<tr>
						<th><?php echo lang('a-cat-37i'); ?>：<?php $dataicon=($data['icon'])?$data['icon']:'fa fa-bell-o'; ?></th>
						<td><input type="text" class="input-text" size="20" value="<?php echo $dataicon; ?>" name="data[icon]" id="icon" onchange="$('#data-icon').attr('class',$(this).val());" />
						<i class="<?php echo $dataicon; ?>" id="data-icon"></i>
						</td>
					</tr>
					</tbody>
					<tr>
						<th><?php echo lang('a-cat-38'); ?>：</th>
						<td>
						<input type="radio" <?php if (!isset($data['ismenu']) || $data['ismenu']==1) { ?>checked<?php } ?> value="1" name="data[ismenu]" /> <?php echo lang('a-yes'); ?>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" <?php if (isset($data['ismenu']) && $data['ismenu']==0) { ?>checked<?php } ?> value="0" name="data[ismenu]" /> <?php echo lang('a-no'); ?>
						<div class="onShow"><?php echo lang('a-cat-39'); ?></div>
						</td>
					</tr>
					<tr class="type_3" style="display:none;">
						<th><font color="red">*</font> <?php echo lang('a-cat-40'); ?>：</th>
						<td><input type="text" class="input-text" size="50" value="<?php echo $data['urlpath']; ?>" name="data[urlpath]" /></td>
					</tr>
					

					</tbody>
					</table>
					</div>

					<div class="contentList pad-10 hidden" id="div_setting_2" style="display: none;">
					<table width="100%" class="table_form ">
					<tbody>
					<tr class="type_1" <?php if ($data[typeid]!=1) { ?>style="display:none;"<?php } ?>>
						<th width="200"><?php echo lang('a-cat-42'); ?>：</th>
						<td>
						<input type="text" class="input-text" size="30" value="<?php echo $data['pagesize']; ?>" name="data[pagesize]">
						<div class="onShow"><?php echo lang('a-cat-43'); ?></div>
						</td>
					</tr>
					<tr class="type_1" <?php if ($data[typeid]!=1) { ?>style="display:none;"<?php } ?>>
						<th><?php echo lang('a-cat-44'); ?>：</th>
						<td id="category_template">
						<span id="categorytpl"><?php echo $data['catdir'].'/category.html'; ?></span>
						<!--input type="text" class="input-text" size="30" value="<?php echo $data['categorytpl']; ?>" name="data[categorytpl]" id="categorytpl"-->
						</td>
					</tr>
					<tr class="type_1" <?php if ($data[typeid]!=1) { ?>style="display:none;"<?php } ?>>
						<th><?php echo lang('a-cat-45'); ?>：</th>
						<td id="list_template">
						<span id="listtpl"><?php echo $data['catdir'].'/content_list.html'; ?></span>
						<!--input type="text" class="input-text" size="30" value="<?php echo $data['listtpl']; ?>" name="data[listtpl]" id="listtpl"-->
						</td>
					</tr>
					<tr class="type_1" <?php if ($data[typeid]!=1) { ?>style="display:none;"<?php } ?> >
						<th>
							显示页模板：</th>
						<td>
							<span id="showtpl"><?php echo $data['catdir'].'/content_show.html'; ?></span>
						</td>
					</tr>
					<tr class="type_1" <?php if ($data[typeid]!=1) { ?>style="display:none;"<?php } ?> >
						<th>
							添加/编辑页模板：</th>
						<td>
							<span id="addtpl"><?php echo $data['catdir'].'/content_add.html'; ?></span>
						</td>
					</tr>
					<tr class="type_2" <?php if ($data[typeid]!=2) { ?>style="display:none;"<?php } ?> >
						<?php $isRedirect=isset($setting["redirect"]); ?>
						<th><input type="radio" name="setting-showmethod" value="1" <?php if ($isRedirect) { ?>checked<?php } else { ?>disabled<?php } ?>  onclick="$('#data-redirect').show();$('#data-redirect').removeAttr('disabled');$('#data-showtpl').hide();">跳转至：</th>
						<td>
							<input id="data-redirect" name="setting[redirect]" value="<?php echo $setting['redirect']; ?>" <?php if (!$isRedirect) { ?>style="display:none"<?php } ?>>
						</td>
					</tr>
					<tr class="type_2" <?php if ($data[typeid]!=2) { ?>style="display:none;"<?php } ?> >
						<th>
							<input type="radio" name="setting-showmethod" value="2" <?php if (!$isRedirect) { ?>checked<?php } ?> onclick="$('#data-redirect').hide();$('#data-redirect').attr('disabled',true);$('#data-showtpl').show();">显示页：</th>
						<td>
							<span id="data-showtpl" <?php if ($isRedirect) { ?>style="display:none"<?php } ?>><?php echo $data['catdir'].'/content_show.html'; ?></span>
							<!--input type="text" class="input-text" size="30" value="<?php echo $data['showtpl']; ?>" id="data-showtpl" name="data[showtpl]"-->
						</td>
					</tr>
					</tbody>
					</table>
					</div>

					<div class="contentList pad-10 hidden" id="div_setting_3" style="display: none;">
					<table width="100%" class="table_form ">
					<tbody>
					<tr>
						<th width="200"><?php echo lang('a-cat-47'); ?>：</th>
						<td><input type="text" maxlength="60" size="60" value="<?php echo $data['meta_title']; ?>" id="meta_title" name="data[meta_title]" class="input-text"></td>
					</tr>
					<tr>
						<th><?php echo lang('a-cat-48'); ?>：</th>
						<td><textarea style="width:90%;height:40px" id="meta_keywords" name="data[meta_keywords]"><?php echo $data['meta_keywords']; ?></textarea></td>
					</tr>
					<tr>
						<th><?php echo lang('a-cat-49'); ?>：</th>
						<td><textarea style="width:90%;height:50px" id="meta_description" name="data[meta_description]"><?php echo $data['meta_description']; ?></textarea></td>
					</tr>
					</tbody>
					</table>
					</div>

					<div class="contentList pad-10 hidden" id="div_setting_4" style="display: none;">
					<table width="100%" class="table_form">
					<?php if ($data['child']) { ?>
					<tr>
						<th width="200"><?php echo lang('a-cat-91'); ?>：</th>
						<td>
						<input name="data[synpost]" type="checkbox" value="1" checked="" />&nbsp;&nbsp;<?php echo lang('a-yes'); ?>
						</td>
					</tr>
					<?php } ?>
					<tr>
						<th width="200"><?php echo lang('a-mod-215'); ?>：</th>
						<td>
						<input id="setting_verify" name="setting[verify][enable]" type="checkbox" value="<?php echo $setting['verify']['enable']; ?>" <?php if (!empty($setting['verify']['enable'])) { ?>checked<?php } ?> onClick="set_verify_enable();">&nbsp;<?php echo lang('a-mod-217'); ?>
						</td>
					</tr>
					<tbody id="setting_verify_enable" <?php if (empty($setting['verify']['enable'])) { ?>style="display:none"<?php } ?> class="sub">
					<tr>
						<th></th>
						<td>
							<?php if (is_array($rolemodel)) { $count=count($rolemodel);foreach ($rolemodel as $t) { ?>
							<input name="setting[verify][role][]" type="checkbox" value="<?php echo $t['roleid']; ?>" <?php if ($t['roleid']==1) { ?>disabled<?php }  if (@in_array($t['roleid'], $setting['verify']['role'])) { ?>checked<?php } ?> />
							<?php echo $t['rolename']; ?>&nbsp;
							<?php } } ?>
							<div class="onShow"><?php echo lang('a-mod-218'); ?></div>
						</td>
					</tr>
					</tbody>

					<tr>
						<th><?php echo lang('a-cat-97'); ?>：</th>
						<td>
						<input id="setting_admin" name="setting[admin][disable]" type="checkbox" value="<?php echo $setting['admin']['disable']; ?>" <?php if (!empty($setting['admin']['disable'])) { ?>checked<?php } ?> onClick="set_admin_disable();">&nbsp;<?php echo lang('a-mod-181'); ?>
						</td>
					</tr>
					<tbody id="setting_admin_disable" <?php if (empty($setting['admin']['disable'])) { ?>style="display:none"<?php } ?> class="sub">
					<tr>
						<th></th>
						<td>
							<?php if (is_array($rolemodel)) { $count=count($rolemodel);foreach ($rolemodel as $t) { ?>
							<input name="setting[admin][role][]" type="checkbox" value="<?php echo $t['roleid']; ?>" <?php if ($t['roleid']==1) { ?>disabled<?php }  if (@in_array($t['roleid'], $setting['admin']['role'])) { ?>checked<?php } ?> />
							<?php echo $t['rolename']; ?>&nbsp;
							<?php } } ?>
							<div class="onShow"><?php echo lang('a-cat-98'); ?></div>
						</td>
					</tr>
					</tbody>

					<tr>
						<th><?php echo lang('a-cat-92'); ?>：</th>
						<td>
						<input id="setting_guest" name="setting[guest][add]" type="checkbox" value="<?php echo $setting['guest']['add']; ?>"<?php if (isset($setting['guest']['add'])) { ?> checked<?php } ?> onClick="set_guest_add();">&nbsp;<?php echo lang('a-cat-51'); ?>
						</td>
					</tr>
					<tbody id="setting_guest_add"  style="<?php if (empty($setting['guest']['add'])) { ?>display:none;<?php } ?>" class="sub">
					<tr>
						<th></th>
						<td>
						<?php echo lang('a-cat-93'); ?>：
						<input class="input-text" id="_guestpost" type="text" name="setting[guest][post]" value="<?php echo empty($setting['guest']['post'])?1:$setting['guest']['post'];  ?>" size="10"/>
						</td>
					</tr>
					</tbody>
					
					<tr>
						<th><?php echo lang('a-cat-96').lang('a-men-61'); ?></th>
						<td><textarea id="_data_authority" name="data[authority]" style="height:100px">
						<?php if ($add) {  $data['authority']='[["查看","view"],["添加","add"],["删除","delete"],["修改","edit"]]';  }  echo json2textarea(json_decode($data['authority'],true)); ?></textarea><div class="onShow"><?php echo lang('a-mod-103'); ?></div></td>
					</table>
					</div>

					<div class="contentList pad-10 hidden" id="div_setting_5" style="display: none;">
					<table width="100%" class="table_form">
					<tbody>
					<tr>
						<th width="200"><?php echo lang('a-cat-57'); ?>： </th>
						<td><input name="setting[url][use]" type="radio" value="1" <?php if ($setting['url']['use']) { ?>checked<?php } ?> onClick="setURL(1)"> <?php echo lang('a-open'); ?> 
						&nbsp;&nbsp;&nbsp;
						<input name="setting[url][use]" type="radio" value="0" <?php if (!$setting['url']['use']) { ?>checked<?php } ?> onClick="setURL(0)"> <?php echo lang('a-close'); ?> </td>
					</tr>
					</tbody>
					<tbody id="url">
					<tr>
						<th><?php echo lang('a-cat-58'); ?>： </th>
						<td><input name="setting[url][tohtml]" type="radio" value="1" <?php if ($setting['url']['tohtml']) { ?>checked<?php } ?> onClick="$('#html').show()"> <?php echo lang('a-yes'); ?>  
						&nbsp;&nbsp;&nbsp;
						<input name="setting[url][tohtml]" type="radio" value="0" <?php if (!$setting['url']['tohtml']) { ?>checked<?php } ?> onClick="$('#html').hide()"> <?php echo lang('a-no'); ?> </td>
					</tr>
					<tr id="html" style="display:<?php if ($setting['url']['tohtml']) { ?>table-row<?php } else { ?>none<?php } ?>">
						<th><?php echo lang('a-cat-59'); ?>： </th>
						<td><input class="input-text" type="text" name="setting[url][htmldir]" value="<?php if (isset($setting['url']['htmldir'])) {  echo $setting['url']['htmldir'];  } else { ?>html<?php } ?>" size="15"/>
						<div class="onShow"><?php echo lang('a-cat-60'); ?></div>
						</td>
					</tr>
					<tr>
						<th><?php echo lang('a-cat-61'); ?>： </th>
						<td><input id="url_list" class="input-text" type="text" name="setting[url][list]" value="<?php echo $setting['url']['list']; ?>" size="40"/>
						<div class="onShow">&nbsp;<a href="javascript:win_category();"><?php echo lang('a-cat-62'); ?></a></div>
						</td>
					</tr>
					<tr>
						<th><?php echo lang('a-cat-63'); ?>： </th>
						<td><input id="url_list_page" class="input-text" type="text" name="setting[url][list_page]" value="<?php echo $setting['url']['list_page']; ?>" size="40"/>
						<div class="onShow">&nbsp;<a href="javascript:win_category();"><?php echo lang('a-cat-62'); ?></a></div>
						</td>
					</tr>
					<tr>
						<th><?php echo lang('a-cat-64'); ?>： </th>
						<td><input id="url_show" class="input-text" type="text" name="setting[url][show]" value="<?php echo $setting['url']['show']; ?>" size="40"/>
						<div class="onShow">&nbsp;<a href="javascript:win_show();"><?php echo lang('a-cat-62'); ?></a></div>
						</td>
					</tr>
					<tr>
						<th><?php echo lang('a-cat-65'); ?>： </th>
						<td><input id="url_show_page" class="input-text" type="text" name="setting[url][show_page]" value="<?php echo $setting['url']['show_page']; ?>" size="40"/>
						<div class="onShow">&nbsp;<a href="javascript:win_show();"><?php echo lang('a-cat-62'); ?></a></div>
						</td>
					</tr>
					<?php if (isset($data) && $data['parentid']!=0) { ?>
					<tr>
						<th><?php echo lang('a-cat-66'); ?>： </th>
						<td><input class="input-text" id="url_catjoin" type="text" name="setting[url][catjoin]" value="<?php if (isset($setting['url']['catjoin'])) {  echo $setting['url']['catjoin'];  } else { ?>/<?php } ?>" size="5"/>
						<div class="onShow"><?php echo lang('a-cat-67'); ?></div></td>
					</tr>
					<tr>
						<th><?php echo lang('a-cat-68'); ?>： </th>
						<td>&nbsp;<a href="javascript:import_url();"><?php echo lang('a-cat-69'); ?></a></td>
					</tr>
					<?php } ?>
					</tbody>
					</table>
					</div>
					
					<div class="bk15"></div>
					<input type="submit" class="button" value="<?php echo lang('a-submit'); ?>" name="submit" />
				</div>
		</div>
		</form>
	</div>
</div>
</body>
</html>
<script type="text/javascript">
function SwapTab(name,cls_show,cls_hide,cnt,cur){
	for(i=1;i<=cnt;i++){
		if(i==cur){
			$('#div_'+name+'_'+i).show();
			$('#tab_'+name+'_'+i).attr('class',cls_show);
		}else{
			$('#div_'+name+'_'+i).hide();
			$('#tab_'+name+'_'+i).attr('class',cls_hide);
		}
	}
}

function settype(id) {
	$(".type_1").hide();
	$(".type_2").hide();
	$(".type_3").hide();
	$(".type_"+id).show();
}

function set_tpl(catdir) {
	//var catdir=$("#catdir").val();
	$("#categorytpl").html(catdir+"/category.html");
	$("#listtpl").html(catdir+"/content_list.html");
	$("#data-showtpl").html(catdir+"/content_show.html");
}

settype(<?php echo $data[typeid]; ?>);

function setURL(id) {
	if (id) {
		$("#url").show();
		$("input","#url").attr("disabled",false);
	} else {
		$("#url").hide();
		$("input","#url").attr("disabled",true);
	}
}
setURL(<?php echo $setting['url']['use']; ?>);

function win_category() {
    var body = '<style>.table-list td,.table-list th{ padding-left:12px; font-weight:normal;}.table-list thead th{ height:30px; background:#eef3f7; border-bottom:1px solid #d5dfe8; font-weight:normal}.table-list tbody td,.table-list .btn{ border-bottom: #eee 1px solid; padding-top:5px; padding-bottom:5px}</style><table width="350" border="0" cellpadding="1" cellspacing="0" class="table-list"><tr><td width="15%"><?php echo lang('a-cat-70'); ?></td><td width="85%">&nbsp;</td></tr><tr><td>{dir}</td><td><?php echo lang('a-cat-71'); ?></td></tr><tr><td>{pdir}</td><td><?php echo lang('a-cat-72'); ?></td></tr><tr><td>{page}</td> <td><?php echo lang('a-cat-73'); ?></td></tr><tr><td>{id}</td><td><?php echo lang('a-cat-74'); ?></td></tr><tr><td><?php echo lang('a-mod-154'); ?></td><td>&nbsp;</td></tr><tr><td colspan="2">1、<?php echo lang('a-mod-155'); ?><br>2、<?php echo lang('a-mod-156'); ?><br>3、<?php echo lang('a-mod-157'); ?><br></td></tr><tr><td><?php echo lang('a-cat-75'); ?></td><td>&nbsp;</td></tr><td colspan="2">1、<?php echo lang('a-cat-77'); ?><br>2、<?php echo lang('a-cat-78'); ?><br>3、<?php echo lang('a-cat-79'); ?><br></td></tr><tr><td><?php echo lang('a-cat-81'); ?></td><td>&nbsp;</td></tr><td colspan="2"><?php echo lang('a-cat-82'); ?>：{pdir}/ <?php echo lang('a-cat-83'); ?>：news/china/。<br><?php echo lang('a-cat-82'); ?>：list-{dir}.html <?php echo lang('a-cat-83'); ?>：list-china.html。<br><?php echo lang('a-cat-82'); ?>：list-{id}-{page}.html <?php echo lang('a-cat-83'); ?>：list-1-1.html。<br></td></tr></table>';
    window.top.art.dialog({title:'<?php echo lang('a-cat-82'); ?>',fixed:true, content: body});
}
function win_show() {
    var body = '<style>.table-list td,.table-list th{ padding-left:12px; font-weight:normal;}.table-list thead th{ height:30px; background:#eef3f7; border-bottom:1px solid #d5dfe8; font-weight:normal}.table-list tbody td,.table-list .btn{ border-bottom: #eee 1px solid; padding-top:5px; padding-bottom:5px}</style><table width="350" border="0" cellpadding="1" cellspacing="0" class="table-list"><tr><td width="15%"><?php echo lang('a-cat-70'); ?></td><td width="85%">&nbsp;</td></tr><tr><td>{dir}</td><td><?php echo lang('a-cat-71'); ?></td></tr><tr><td>{pdir}</td><td><?php echo lang('a-cat-72'); ?></td></tr><tr><td>{page}</td> <td><?php echo lang('a-cat-73'); ?></td></tr><tr><td>{id}</td><td><?php echo lang('a-cat-76'); ?></td></tr><tr><tr><td>{y}</td><td><?php echo lang('a-cat-84'); ?></td></tr><tr><tr><td>{m}</td><td><?php echo lang('a-cat-85'); ?></td></tr><tr><tr><td>{d}</td><td><?php echo lang('a-cat-86'); ?></td></tr><tr><td><?php echo lang('a-mod-154'); ?></td><td>&nbsp;</td></tr><tr><td colspan="2">1、<?php echo lang('a-mod-155'); ?><br>2、<?php echo lang('a-mod-156'); ?><br>3、<?php echo lang('a-mod-157'); ?><br></td></tr><tr><td><?php echo lang('a-cat-75'); ?></td><td>&nbsp;</td></tr><td colspan="2">1、<?php echo lang('a-cat-77'); ?><br>2、<?php echo lang('a-cat-78'); ?><br>3、<?php echo lang('a-cat-80'); ?><br></td></tr><tr><td><?php echo lang('a-cat-81'); ?></td><td>&nbsp;</td></tr><td colspan="2"><?php echo lang('a-cat-82'); ?>：{pdir}/{id}.html <?php echo lang('a-cat-83'); ?>：news/china/10.html。<br><?php echo lang('a-cat-82'); ?>：show-{dir}.html <?php echo lang('a-cat-83'); ?>：show-10.html。<br><?php echo lang('a-cat-82'); ?>：show-{id}-{page}.html <?php echo lang('a-cat-83'); ?>：show-10-1.html。<br></td></tr></table>';
    window.top.art.dialog({title:'<?php echo lang('a-cat-82'); ?>',fixed:true, content: body});
}
function import_url() {
    $.getJSON('<?php echo url('admin/category/ajaximport', array('catid'=>$data['parentid'])); ?>&'+Math.random(), function(data){
	    if (data.status==1) {
		    $('#url_list').val(data.list);
		    $('#url_list_page').val(data.list_page);
		    $('#url_show').val(data.show);
		    $('#url_show_page').val(data.show_page);
		    $('#url_catjoin').val(data.catjoin);
		} else {
		    alert('<?php echo lang('a-cat-87'); ?>');
		}
	});
}
function set_document(dir) {
	var reg = /^[a-zA-Z_0-9]+$/; 
	var r = dir.match(reg);
	if (dir!='' && r==null) {
		$("#result_document").addClass("onError");
		$("#result_document").html("<?php echo lang('a-mod-203'); ?>");
	} else {
		$("#result_document").addClass("onCorrect");
		$("#result_document").removeClass("onError");
		$("#result_document").html("&nbsp;");
		rcms_admin_document=dir;
	}
}

function set_verify_enable(){
	if($("#setting_verify").val()==1){
		$("#setting_verify_enable").hide();
		$("input","#setting_verify_enable").attr("disabled",true);
		$("#setting_verify").val(0);
	}else{
		$("#setting_verify_enable").show();
		$("input","#setting_verify_enable").attr("disabled",false);
		$("#setting_verify").val(1);
	}
}

function set_admin_disable(){
	if($("#setting_admin").val()==1){
		$("#setting_admin_disable").hide();
		$("input","#setting_admin_disable").attr("disabled",true);
		$("#setting_admin").val(0);
	}else{
		$("#setting_admin_disable").show();
		$("input","#setting_admin_disable").attr("disabled",false);
		$("#setting_admin").val(1);
	}
}

function set_guest_add(){
	if($("#setting_guest").val()==1){
		$("#setting_guest_add").hide();
		$("input","#setting_guest_add").attr("disabled",true);
		$("#setting_guest").val(0);
	}else{
		$("#setting_guest_add").show();
		$("input","#setting_guest_add").attr("disabled",false);
		$("#setting_guest").val(1);
	}
}
</script>