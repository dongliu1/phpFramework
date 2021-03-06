<div class="flex-item box" id="chart-trends"></div>

<script language="javascript">
$(function () {
	<?php $return = $this->_listdata("table=content_1_gridflow"); extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) {  } } ?>
	var data=<?php echo json_encode($return,256); ?>;
	var genReal=[],topLoad=[],saleReal=[],categories=[];
	$.each(data,function(key,idata){
		categories.push(idata.month);
		genReal.push({y:idata.monthlyGenReal-0});
		topLoad.push({y:idata.monthlyTopLoad-0});
		saleReal.push({y:idata.saleReal-0});
	});
	
	//var chart = new Highcharts.Chart('chart-gridflow', {
	$('#chart-trends').highcharts({
		title: {
			text: '发电量',
			x: -20
		},
		xAxis: {
			categories: categories,
			tickInterval: 3
		},
		yAxis: {
			title: {
				text: '百分比（%）'
			}
		},
		credits:{
			//enabled:false
		},
		exporting:{
			enabled:false
		},
		tooltip: {
			valueSuffix: '%',
			shared:true,
			valueDecimals:0
		},
		legend: {
			layout: 'horizontal',
			align: 'center',
			verticalAlign: 'bottom',
			borderWidth: 0
		},
		series: [{
			name: '实际发电量',
			data: genReal
		}/*,{
			name: '最高负荷',
			data: topLoad
		}*/,{
			name: '南网销售电量',
			type: 'column',
			data: saleReal
		}]
	});
});

</script>