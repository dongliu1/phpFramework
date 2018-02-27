<?php include $this->_include('header'); ?>
<script src="<?php echo JLIB_PATH; ?>highcharts/highcharts.min.js"></script>
<script src="<?php echo JLIB_PATH; ?>highcharts/highcharts-more.js"></script>
<style>
.table-query-zone .button-wh{width:128px;height:18px;}
.table-query-zone .button.easyui-combotree{width:108px;}
.table-function-zone{padding:0;}
</style>
<body class="skin-blue tabs-body" style="overflow-x:hidden">
		<div class="table-above" >
			<form action="" method="post">
				<div class="table-query-zone">
					所在市州：<input type="text" class="button easyui-combotree" value="" name="data[shebeileibie|=]" data-options="url:'<?php echo url('api/linkagelist',array('id'=>1,'isAssets'=>1)); ?>',method:'get',required:true,loadFilter:function(rows){return treedata_convert(rows);}" />
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

<div class="flex-col page-main" >
	
		<div class="table-content flex-row" >
			<table class="datatable" border="0" cellpadding="0" cellspacing="0" width="100%">
				<thead>
					<tr>
						<td width="22" align="right"><input name="selectc" id="selectc" type="checkbox" onClick="setC()"></td>
						<td>客户名称</td>
						<td>行业</td>
						<td>属地</td>
						<td>联系人</td>
						
						<td>操作</td>
					</tr>
				</thead>
				<tbody>
					<?php if (is_array($fields_text)) { $count=count($fields_text);foreach ($fields_text as $t) { ?>
					<tr>
						<td><input name="ids[]" type="checkbox" class="selectc" value="<?php echo $t['id']; ?>" /></td>
						<td title="<?php echo $t['clientcode']; ?>"><a href="javascript:dlg_detail('<?php echo $t['clientcode']; ?>');"><?php echo $t['clientname']; ?></a></td>
						<td><?php echo $t['sector']; ?></td>
						<td><?php echo $t['locationcode']; ?></td>
						<td><?php echo $t['clientcontact']; ?></td>
						<td>
						<a href="javascript:dlg_detail('<?php echo $t['clientcode']; ?>');">详情</a>
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
		
		<div class="datatablepage flex-row">
			<table width="100%" border="0">
			  <tr>
				<td align="right"><?php echo $pagelist; ?></td>
			  </tr>
			</table>
		</div>
	  


	<div class="flex-item flex-row" >
		<?php include $this->_include('blocks/clientdetail/usage');  include $this->_include('blocks/clientdetail/price');  include $this->_include('blocks/clientdetail/cost');  include $this->_include('blocks/clientdetail/stock'); ?>
	</div>

</div>

<!--Wrapper End-->
<script language="javascript">


function dlg_detail(id){
	var url="<?php echo url('member/content/data',array('catid'=>110,'dataonly'=>1)); ?>";
	$.post(url,{'data':{'clientcode':id}},function(data){
		var usage=[],price=[],cost=[];
		$.each(data,function(i,idata){
			usage.push({x:idata.usagetime,y:idata.usage-0});
			price.push({x:idata.usagetime,y:idata.price-0});
			cost.push({x:idata.usagetime,y:idata.price*idata.usage});
		});
		init_clientdetail_usage("chart-clientdetail-usage",usage);
		init_clientdetail_price("chart-clientdetail-price",price);
		init_clientdetail_cost("chart-clientdetail-cost",cost);
		init_clientdetail_stock("chart-clientdetail-stock",cost);
		console.log(data);
	},"json")
}


</script>
</body>
<?php include $this->_include('footer'); ?>