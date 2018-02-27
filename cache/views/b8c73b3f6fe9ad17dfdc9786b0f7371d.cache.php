<?php include $this->_include('header'); ?>
<style>
.table-query-zone .button-wh{width:128px;height:18px;}
.table-query-zone .button.easyui-combotree{width:108px;}
.table-function-zone{padding:0;}
</style>
<body class="skin-blue tabs-body" style="overflow-x:hidden">
<div class="container">
	<div class="table-above" >
		<form action="" method="post">
			<div class="table-query-zone">
				所在地市：<input type="text" class="button easyui-combotree" value="" name="data[shebeileibie|=]" data-options="url:'<?php echo url('api/linkagelist',array('id'=>1,'isAssets'=>1)); ?>',method:'get',required:true,loadFilter:function(rows){return treedata_convert(rows);}" />
				行业：<input type="text" class="button easyui-combotree" value="" name="data[shebeileibie|=]" data-options="url:'<?php echo url('api/linkagelist',array('id'=>1,'isAssets'=>0,'parent_id'=>0)); ?>',method:'get',required:true,loadFilter:function(rows){return treedata_convert(rows);}" />
				用电量：<!--<input type="text" class="button-wh" value="" name="data[time|>=]" /> 
						-- <input type="text" class="button-wh" value="" name="data[time|>=]" />-->
						<input type="text" class="button-wh" value="" name="timefrom" /> 
						-- <input type="text" class="button-wh" value="" name="timeto" />
				<input type="submit" class="button" value="查询" name="submit" />
			</div>
			<div class="pull-right">
				<input type="button" class="button" value="添加" name="button" onclick="dlg_addnew();" />
			</div>
		</form>
		<div class="table-function-zone">
			
		</div>
	</div>
	<div class="table-content" >
	<table class="datatable" border="0" cellpadding="0" cellspacing="0" width="100%">
		<thead>
			<tr>
				<td width="22" align="right"><input name="selectc" id="selectc" type="checkbox" onClick="setC()"></td>
				<?php if (is_array($fields)) { $count=count($fields);foreach ($fields as $f) {  if ($f['isshow']>0) { ?><td><?php echo $f['name']; ?></td><?php }  } } ?>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
			<?php if (is_array($fields_text)) { $count=count($fields_text);foreach ($fields_text as $t) { ?>
			<tr>
				<td><input name="ids[]" type="checkbox" class="selectc" value="<?php echo $t['id']; ?>" /></td>
				<?php if (is_array($fields)) { $count=count($fields);foreach ($fields as $f) {  if ($f['isshow']>0) { ?><td><?php echo clearhtml($t[$f["field"]]); ?></td><?php }  } } ?>
				<td>
				<a href="javascript:dlg_detail(<?php echo $t['id']; ?>);">详情</a>
				<?php if ($t['userid']==$memberinfo['id']) { ?>
				<a href="javascript:dlg_edit(<?php echo $t['id']; ?>);">修改</a>
				<a href="javascript:;" onClick="dlg_delete(<?php echo $t['id']; ?>)">删除</a>
				<?php }  if ($t['status']==4) {  if ($group['allowreprint']) { ?>
				<a href="<?php echo url('member/content/reprint/', array('id'=>$t['id'])); ?>">转发</a>
				<?php }  } ?>
				</td>
			</tr>
			<?php } } ?>
		</tbody>
	</table>
	</div>
	
	<div class="datatablepage">
		<table width="100%" border="0">
		  <tr>
			<td align="right"><?php echo $pagelist; ?></td>
		  </tr>
		</table>
	</div>
   


</div>
<!--Wrapper End-->
<script language="javascript">

function treedata_convert(rows){
    var nodes = [];
	//生成根节点
	$.each(rows,function(id,row){
		if(!rows.hasOwnProperty(row.parentid)){
			nodes.push({id:row.id,text:row.name});
		}
	})
	
    var toDo = new Array();
    for(var i=0; i<nodes.length; i++){toDo.push(nodes[i]);}
    while(toDo.length){
        var node = toDo.shift(); 
		$.each(rows,function(id,row){
			if (row.parentid == node.id){
                var child = {id:row.id,text:row.name};
                if (node.children){
                    node.children.push(child);
                } else {
                    node.children = [child];
                }
                toDo.push(child);
            }
		});
    }
    return nodes;
}

function setC() {
	if($("#selectc").attr('checked')) {
		$(".selectc").attr("checked",true);
	} else {
		$(".selectc").attr("checked",false);
	}
}

function dlg_detail(id){
	var dlgid="content_detail_"+id;
	var ddialog=$("body").append("<div id='"+dlgid+"'><iframe src='<?php echo url('member/content/show'); ?>&id="+id+"'></iframe></div>");
	//$( "#dialog" ).dialog({
	//console.log()
	//$( "#"+dlgid ).load("<?php echo url('member/content/show'); ?>&id="+id,function(){
		$( "#"+dlgid ).dialog({"title":"详情 - <?php echo $catname; ?>",width:700,height:500,modal: true,close: function(){ $(this).remove(); },onClose: function(){ $(this).remove(); }});
	//})
}

function dlg_addnew(){
	var dlgid="content_add";
	var ddialog=$("body").append("<div id='"+dlgid+"'><iframe src='<?php echo url('member/content/add', array('catid'=>$catid)); ?>' height='400px' style='border:none;width:100%;overflow-x:hidden'></iframe></div>");
	//$( "#"+dlgid ).load("<?php echo url('member/content/add', array('catid'=>$catid)); ?>",function(){
		$( "#"+dlgid ).dialog({"title":"添加 - <?php echo $catname; ?>",width:700,modal: true,close: function(){ $(this).remove(); },onClose: function(){ $(this).remove(); } });
	//})
}

function dlg_edit(id){
	var dlgid="content_add";
	var ddialog=$("body").append("<div id='"+dlgid+"'><iframe src='<?php echo url('member/content/edit'); ?>&id="+id+"' height='400px' style='border:none;width:100%;overflow-x:hidden'></iframe></div>");
	//$( "#"+dlgid ).load("<?php echo url('member/content/add', array('catid'=>$catid)); ?>",function(){
		$( "#"+dlgid ).dialog({"title":"编辑 - <?php echo $catname; ?>",width:700,modal: true,close: function(){ $(this).remove(); },onClose: function(){ $(this).remove(); }});
	//})
}

function dlg_delete(id){
	if(confirm('确认删除吗？')){ window.location.href="<?php echo url('member/content/del'); ?>&id="+id; }
}
</script>
</body>
<?php include $this->_include('footer'); ?>