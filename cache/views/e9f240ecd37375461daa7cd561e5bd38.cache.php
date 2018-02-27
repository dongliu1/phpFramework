<div class="flex-item box" id="chart-companygen0"></div>

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
			system[idx]=idata.real;
			systemRate.push(y);
		}else if(idata.companycode=="YN_water"){
			water[idx]=idata.real;
			waterRate.push(y);
		}else if(idata.companycode=="YN_fire"){
			fire[idx]=idata.real;
			fireRate.push(y);
		}else if(idata.companycode=="YN_wind"){
			wind[idx]=idata.real;
			windRate.push(y);
		}else if(idata.companycode=="YN_solar"){
			solar[idx]=idata.real;
			solarRate.push(y);
		}
	});
	$('#chart-companygen0').highcharts({
	//var chart = new Highcharts.Chart('chart-companygen0', {
		title: {
			text: '发电计划完成率',
			//x: -20,
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
		},
		credits:{
			enabled:false
		},
		exporting:{
			enabled:false
		},
		tooltip: {
			valueSuffix: '%',
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
			data: systemRate
		},{
			name: '水电',
			type: 'column',
			data: waterRate
		},{
			name: '火电',
			type: 'column',
			data: fireRate
		},{
			name: '风电',
			type: 'column',
			data: windRate
		},{
			name: '光伏',
			type: 'column',
			data: solarRate
		}]
	});
});

</script>