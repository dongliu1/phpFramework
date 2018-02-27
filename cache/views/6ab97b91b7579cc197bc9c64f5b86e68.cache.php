<div class="flex-item box" id="chart-companygen2"></div>

<script language="javascript">
$(function () {
	var systemRate=[],waterRate=[],fireRate=[],windRate=[],solarRate=[];
	var system=[],water=[],fire=[],wind=[],solar=[],categories=[];
	var curMonth=0,idx=-1;
	$.each(data_companygen,function(key,idata){
		if(idata.month!=curMonth){
			categories.push(idata.month);
			curMonth=idata.month;
			idx++;
		}
		system.push(idata.hoursused-0);
	});
	var height=$('#chart-companygen2').get(0).offsetHeight;
	$('#chart-companygen2').highcharts({
	//var chart = new Highcharts.Chart('chart-companygen0', {
		title: {
			text: '利用小时数',
			//x: -20,
		},
		xAxis: {
			categories: categories,
			tickInterval: 4
		},
		yAxis: {
			title: {
				text: ''
			},
		},
		credits:{
			enabled:false
		},
		exporting:{
			enabled:false
		},
		tooltip: {
			valueSuffix: '小时',
			shared:true,
			valueDecimals:0
		},
		plotOptions:{
			
			series:{
				marker: { enabled: false } 
			}
			
		},
		series: [{
			name: '系统',
			data: system
		}]
	});
});

</script>