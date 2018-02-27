<div class="flex-item box" id="chart-companygen1"></div>

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
		var y=idata.real/idata.plan*100;
		if(idata.companycode=="YN_00"){
			system.push(idata.real-0);
			systemRate.push(y);
		}else if(idata.companycode=="YN_water"){
			water.push(idata.real-0);
			waterRate.push(y);
		}else if(idata.companycode=="YN_fire"){
			fire.push(idata.real-0);
			fireRate.push(y);
		}else if(idata.companycode=="YN_wind"){
			wind.push(idata.real-0);
			windRate.push(y);
		}else if(idata.companycode=="YN_solar"){
			solar.push(idata.real-0);
			solarRate.push(y);
		}
	});
	var height=$('#chart-companygen1').get(0).offsetHeight;
	$('#chart-companygen1').highcharts({
	//var chart = new Highcharts.Chart('chart-companygen1', {
		title: {
			text: '发电量占比',
			x: -20,
			type: 'column'
		},
		xAxis: {
			categories: categories,
			tickInterval: 4
		},
		yAxis: {
			title: {
				//text: '百分比（%）'
				text: ''
			},
			lineWidth:1,
			lineColor:'#ccc',
			plotLines: [{
				value: 0,
				width: 1,
				color: '#808080'
			}]
		},
		credits:{
			enabled:false
		},
		exporting:{
			enabled:false
		},
		tooltip: {
			valueSuffix: '万kWh',
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
			column: {
				stacking: 'normal'
			},
		},
		series: [/*{
			name: '系统完成率',
			data: systemRate
		},*/{
			name: '火电',
			type: 'column',
			data: fire
		},{
			name: '风电',
			type: 'column',
			data: wind
		},{
			name: '光伏',
			type: 'column',
			data: solar
		},{
			name: '水电',
			type: 'column',
			data: water
		},]
	});
});

</script>