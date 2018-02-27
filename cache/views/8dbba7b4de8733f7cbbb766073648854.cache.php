<div class="flex-item box" id="chart-gridflow"></div>

<script language="javascript">

$(window).resize(function() {
   console.log($('#chart-gridflow').height());
});

$(function () {
	<?php $return = $this->_listdata("table=content_1_gridflow"); extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) {  } } ?>
	var data=<?php echo json_encode($return,256); ?>;
	var genRate=[],saleRate=[],loadRate=[],categories=[];
	$.each(data,function(key,idata){
		categories.push(idata.month);
		genRate.push({y:idata.monthlyGenReal/idata.monthlyGenPlan*100});
		saleRate.push({y:idata.saleReal/idata.salePlan*100});
		loadRate.push({y:idata.monthlyLoadRate-0});
	});
	
	//var chart = new Highcharts.Chart('chart-gridflow', {
	$('#chart-gridflow').highcharts({
		title: {
			text: '完成率',
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
		plotOptions:{
			column:{
				pointWidth:20
			}
		},
		series: [{
			name: '发电完成率',
			data: genRate
		},{
			name: '售电完成率',
			data: saleRate
		},{
			name: '发电负荷率',
			type: 'column',
			data: loadRate
		}]
	});

});

</script>