<div class="flex-item box" id="chart-clientdetail-price"></div>

<script language="javascript">
$(function () {
	//init_clientdetail_usage("chart-clientdetail-price");
});

var init_clientdetail_price=function(objid,seriedata){
	$('#'+objid).highcharts({
	//var chart = new Highcharts.Chart(objid, {
		chart:{animation:false},
		title: { text: '年均电价', },
		xAxis: { },
		yAxis: { title: { text: '' }, },
		credits:{ enabled:false },
		exporting:{ enabled:false },
		legend: { enabled: false },
		tooltip: {
			valueSuffix: '元/kWh',
			shared:true,
			valueDecimals:3
		},
		plotOptions:{ series:{ 
			animation:false,
			marker: { enabled: false }  
		}},
		series: [{
			name: '年均电价',
			data: seriedata
		}]
	});
}

</script>