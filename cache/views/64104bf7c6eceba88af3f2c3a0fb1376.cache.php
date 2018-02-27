<div class="flex-item box" id="chart-user10"></div>

<script language="javascript">


$(function () {
	<?php $return = $this->_listdata("table=content_1_clientflow join=content_1_clientinfo on=clientcode usagetime=2012 order=cost num=10"); extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) {  } } ?>
	var data=<?php echo json_encode($return,256); ?>;
	console.log(data);
	var cost=[],categories=[];
	$.each(data,function(key,idata){
		categories.push(idata.clientname);
		cost.push({y:idata.cost-0});
	});
	
	//var chart = new Highcharts.Chart('chart-gridflow', {
	$('#chart-user10').highcharts({
		title: {
			text: '用户电费排名',
			x: -20
		},
		xAxis: {
			categories: categories,
			tickInterval: 3,
			labels: {  enabled: false },
		},
		yAxis: { title: { text: '' } },
		credits:{ enabled:false },
		exporting:{ enabled:false },
		tooltip: {
			valueSuffix: '万元',
			shared:true,
			valueDecimals:0,
			
		},
		legend: {
			layout: 'horizontal',
			align: 'center',
			verticalAlign: 'bottom',
			borderWidth: 0,
			enabled:false
		},
		plotOptions:{
			column:{
				pointWidth:20
			}
		},
		series: [{
			name: '电费',
			data: cost
		}]
	});

});

</script>