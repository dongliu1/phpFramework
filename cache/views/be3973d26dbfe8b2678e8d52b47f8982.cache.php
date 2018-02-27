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
<style>.group-name{width:200px;display:inline-block;}</style>
</head>
<body style="font-weight: normal;">
<div class="subnav">
	<div class="content-menu ib-a blue line-x">
		<a href="<?php echo url('admin/member/group/'); ?>"><em><?php echo lang('a-mem-30'); ?></em></a><span>|</span>
		<a href="<?php echo url('admin/member/group/', array('type'=>'add')); ?>" class="on"><em><?php echo lang('a-add'); ?></em></a><span>|</span>
		<a href="<?php echo url('admin/member/group/', array('type'=>'cache')); ?>"><em><?php echo lang('a-cache'); ?></em></a>
	</div>
	<div class="bk10"></div>
	<div class="table-list">
		<form action="" method="post">
			<input name="id" type="hidden" value="<?php echo $data['id']; ?>">
			<table width="100%" class="table_form">
			<tr>
				<th width="200"><font color="red">*</font> <?php echo lang('a-name'); ?>： </th>
				<td><input class="input-text" type="text" name="data[name]" value="<?php echo $data['name']; ?>" size="20" required />
				</td>
			</tr>
			<tr>
				<th width="200"><font color="red">*</font> <?php echo lang('a-modname'); ?>：</th>
				<td>
				<select name="data[modelid]" required>
				<?php if (is_array($mmodels)) { $count=count($mmodels);foreach ($mmodels as $t) { ?>
				<option value="<?php echo $t['modelid']; ?>" <?php if ($data['modelid']==$t['modelid']) { ?>selected<?php } ?>><?php echo $t['modelname']; ?></option>
				<?php } } ?>
				</select>
				</td>
			</tr>
			<tr>
				<th><?php echo lang('a-mem-76'); ?>： </th>
				<td><input class="input-text" type="text" name="data[credits]" value="<?php echo $data['credits']; ?>" size="20" />
				<div class="onShow"><?php echo lang('a-mod-209'); ?></div>
				</td>
			</tr>
			<!--tr>
				<th><?php echo lang('a-mem-78'); ?>： </th>
				<td><input class="input-text" type="text" name="data[allowpms]" value="<?php echo $data['allowpms']; ?>" size="20" />
				<div class="onShow"><?php echo lang('a-mem-86'); ?></div>
				</td>
			</tr>
			<tr>
				<th><?php echo lang('a-mem-79'); ?>： </th>
				<td><input class="input-text" type="text" name="data[filesize]" value="<?php echo $data['filesize']; ?>" size="20" />
				<div class="onShow"><?php echo lang('a-mem-87'); ?></div>
				</td>
			</tr>
			<tr>
				<th><?php echo lang('a-mem-80'); ?>： </th>
				<td>
				<input name="data[allowattachment]" type="radio" value="1" <?php if ($data['allowattachment']==1) { ?>checked<?php } ?> /> <?php echo lang('a-mem-83'); ?> 
				&nbsp;&nbsp;&nbsp;
				<input name="data[allowattachment]" type="radio" value="0" <?php if ($data['allowattachment']==0) { ?>checked<?php } ?> /> <?php echo lang('a-mem-84'); ?>
				<div class="onShow"><?php echo lang('a-mod-210'); ?></div>
				</td>
			</tr>
			<tr>
				<th><?php echo lang('a-mem-81'); ?>： </th>
				<td>
				<input name="data[auto]" type="radio" value="0" <?php if (empty($data['auto'])) { ?>checked<?php } ?> /> <?php echo lang('a-mem-83'); ?> 
				&nbsp;&nbsp;&nbsp;
				<input name="data[auto]" type="radio" value="1" <?php if ($data['auto']==1) { ?>checked<?php } ?> /> <?php echo lang('a-mem-84'); ?>
				<div class="onShow"><?php echo lang('a-mod-211'); ?></div></td>
			</tr-->
			<tr>
				<th><?php echo lang('a-ast-i'); ?></th>						
				<td>			
					<input class="setting_grouppost" name="data[setting][assets][]" catid="assets" type="checkbox" value="view" 
						<?php if ($data['setting']['assets'] && in_array('view',$data['setting']['assets'])) { ?>checked<?php } ?> onclick="set_grouppost();" />查看&nbsp; 
					<div name="grouppost_assets" style="display:inline-block;visibility:none;vertical-align: middle;">
						<input type="checkbox" name="data[setting][assets][]" value="set" 
							<?php if ($data['setting']['assets'] && in_array('set',$data['setting']['assets'])) { ?>checked<?php } ?> >设置&nbsp;
					</div>
				</td>
			</tr>
			<tr>
				<td colspan=2>
					<ul>
					<?php if (is_array($cats)) { $count=count($cats);foreach ($cats as $t) {  if ($t['authority']) {  $t['authority']=json_decode($t['authority']);$arrparents=explode(",",$t["arrparentid"]); ?>
					<li parentid="<?php echo $t['parentid']; ?>">
						<span class="group-name" title="<?php echo $t['catid']; ?>">
							<?php if (is_array($arrparents)) { $count=count($arrparents);foreach ($arrparents as $p) {  if ($p!=0) { ?> - <?php }  } }  echo $t['catname']; ?>
						</span>
						<span>	
							<?php if (is_array($t['authority'])) { $count=count($t['authority']);foreach ($t['authority'] as $a) { ?>
								<input type="checkbox" name="data[setting][<?php echo $t['catid']; ?>][]" value="<?php echo $a[1]; ?>" 
									<?php if (is_array($data['setting'][$t['catid']]) && in_array($a[1],$data['setting'][$t['catid']])) { ?>checked<?php } ?>  ><?php echo $a[0]; ?>&nbsp;
							<?php } } ?>
						</span>
					</li>
					<?php }  } } ?>
					</ul>
				
				
				</td>
			</tr>

			
			<script>
				function set_grouppost(){
					$(".setting_grouppost").each(function(index){
						var toshow=$(this).is(':checked');
						var catid=$(this).attr("catid");
						
						var obj=$('[name="grouppost_'+catid+'"]');
						if(toshow){
							$("input",obj).attr("disabled",false);
							$(obj).show();
						}else{
							$("input",obj).attr("disabled",true);
							$(obj).hide();										
						}
					});
				}
				set_grouppost();
			</script>
			
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