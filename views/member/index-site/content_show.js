var show_time=[];
var show_data=[];
$(function () {
	show_time=["8-5","8-6","8-7","8-8","8-9","8-10","8-11","8-12","8-13","8-14"];
	init_timenode();
	/**init_scroll();*/
	init_tab();
	init_alarm_chart();
	init_mixed_chart(show_time);
	init_svg();
	$(".knob").knob({'min':0,'max':100,step:0.1});
});
function init_scroll(){
	var scrollFunc = function (e) {
	var direct = 0;
	e = e || window.event;
	if (e.wheelDelta) { //判断浏览器IE，谷歌滑轮事件 
	if (e.wheelDelta > 0) { //当滑轮向上滚动时
		console.log("IE向上滚动");
	}
	if (e.wheelDelta < 0) { //当滑轮向下滚动时
		console.log("IE向下滚动");
	}
	} else if (e.detail) { //Firefox滑轮事件
	if (e.detail> 0) { //当滑轮向上滚动时
		console.log("Firefox向上滚动");
	}
	if (e.detail< 0) { //当滑轮向下滚动时
		console.log("Firefox向下滚动");
	}
	}
	}
	//给页面绑定滑轮滚动事件
	if (document.addEventListener) {
	document.addEventListener('DOMMouseScroll', scrollFunc, false);
	}
	//滚动滑轮触发scrollFunc方法
	window.onmousewheel = document.onmousewheel = scrollFunc; 
}
function init_timenode(){
	var month_1=[1,3,5,7,8,10,12];
	var month_2=[4,6,9,11];
	$(".time-add").click(function(){
		show_time=[];
		$(".time-node").text(function(index,oldcontent){
			var time_arr=oldcontent.split("/");
			var cur_day=Number(time_arr[2])+10;
			var cur_month=Number(time_arr[1]);
			var cur_year=Number(time_arr[0]);
			var max_day;
			if(cur_month==2){
				if(cur_year%4==0){
					max_day=29;
				}else{
					max_day=28;
				}
				if(cur_day>max_day){
					cur_day=cur_day-max_day;
					cur_month=cur_month+1;
				}
			}else{
				month_1.forEach(function(index){
					if(cur_month==index&&cur_month<12){
						if(cur_day>31){
							cur_day=cur_day-31;
							cur_month=cur_month+1;
						}
					}else if(cur_month==index&&cur_month==12){
						if(cur_day>31){
							cur_day=cur_day-31;
							cur_month=1;
							cur_year=cur_year+1;
						}
					}
					return;
				})
				month_2.forEach(function(index){
					if(cur_month==index){
						if(cur_day>30){
							cur_day=cur_day-30;
							cur_month=cur_month+1;
						}
					}
					return;
				})
			}
			var cur_time=cur_month+'/'+cur_day;
			var cur_show_time=cur_month+'-'+cur_day;
			var cur_date=cur_year+'/'+cur_time;
			store_value(cur_show_time);
			return cur_date;
		});
		init_mixed_chart(show_time);
	})
	
	
	
	$(".time-reduce").click(function(){
		show_time=[];
		$(".time-node").text(function(index,oldcontent){
			var time_arr=oldcontent.split("/");
			var cur_day=Number(time_arr[2])-10;
			var cur_month=Number(time_arr[1]);
			var cur_year=Number(time_arr[0]);
			var min_day;
			if(cur_month==2){
				if(cur_day<1){
					cur_day=cur_day+31;
					cur_month=cur_month-1;
				}
			}else{
				month_1.forEach(function(index){
					if(cur_month==8){
						if(cur_day<1){
							cur_day=cur_day+31;
							cur_month=cur_month-1;
						}
					}else if(cur_month==3){
						if(cur_year%4==0){
							min_day=29;
						}else{
							min_day=28;
						}
						if(cur_day<1){
							cur_day=cur_day+min_day;
							cur_month=cur_month-1;
						}
					}else if(cur_month==1){
						if(cur_day<1){
							cur_day=cur_day+31;
							cur_month=12;
							cur_year=cur_year-1;
						}
					}else{
						if(cur_month==index){
							if(cur_day<1){
								cur_day=cur_day+30;
								cur_month=cur_month-1;
							}
						}
					}
					return;
				})
				month_2.forEach(function(index){
					if(cur_month==index){
						if(cur_day<1){
							cur_day=cur_day+31;
							cur_month=cur_month-1;
						}
					}
					return;
				})
			}
			var cur_time=cur_month+'/'+cur_day;
			var cur_show_time=cur_month+'-'+cur_day;
			var cur_date=cur_year+'/'+cur_time;
			store_value(cur_show_time);
			return cur_date;
		});
		init_mixed_chart(show_time);
	})
}

function store_value(time){
	show_time.push(time);
}

function init_light(){
	$("#test-gon").css("fill","#A34B0A");
	$("#test-gon").fadeOut("slow",function(){
		$("#test-gon").fadeIn("slow",function(){
			init_light();
		})
	})
}

function init_svg(){
	$("#svgchart").load("jlibs/svg/squareChart.svg",null,function(){
		$("svg",this).attr({"width":"65%","height":"75%"});
		$(".test-poly").css("cursor","pointer");
		$(".test-poly").click(function(){
			$(this).css("fill","#ffff31");
		});
		$(".test-poly").mouseover(function(){
			$("#svg-tips").show();
			var offset=$(this).offset();
			var tips_top=offset.top+21;
			var tips_left=offset.left-80;
			$("#svg-tips").css({"top":tips_top,"left":tips_left});
			
		})
		$(this).mouseout(function(){
			$("#svg-tips").hide();
		})
		init_light();
	});
}
function init_tab(){
	$('.tab-style').on('click',function(){
		$('.tab-style').removeClass('tab-active');
		$(this).addClass('tab-active');
		if($(this).attr("id")){
			$("#tabChart").hide();
			$("#orderChart").show();
		}else{
			$("#tabChart").show();
			$("#orderChart").hide();
		}
	});
	$('.tab-static-style').on('click',function(){
		$('.tab-static-style').removeClass('tab-active');
		$(this).addClass('tab-active');
		if($(this).attr("id")){
			$("#svgchart").hide();
			$("#configChart").show();
		}else{
			$("#svgchart").show();
			$("#configChart").hide();
		}
	});
}
function init_alarm_chart(){
	Highcharts.setOptions({
		colors: ['#FF8202', '#3F97D1']
	});
	$('#tabChart').highcharts({
		chart: {
			type: 'column',
			backgroundColor: 'rgba(0,0,0,0)',
			marginLeft:60,
			marginRight:120,
			marginTop:20
		},
		exporting:{
			enabled:false
		},
		title: {
			text:null
		},
		xAxis: {
			labels:{
				style:{
					color:'#ccc',
					fill:'#ccc'
				}
			},
			categories: [
				'06',
				'07',
				'08',
				'09',
				'10',
				'11',
				'12',
				'13',
				'14',
				'15'
			]
		},
		yAxis: {
			title:null,
			min: 0,
			labels:{
				style:{
					color:'#ccc',
					fill:'#ccc'
				}
			},
			gridLineDashStyle:'dot',
			allowDecimals: false
		},
		tooltip: {
            formatter: function() {
                return '<b>'+ this.x +'</b><br/>'+
                    this.series.name +': '+ this.y +'<br/>'+
                    'Total: '+ this.point.stackTotal;
            }
        },
		legend:{
			layout:'vertical',
			floating: true,
			align: 'right',
			verticalAlign: 'top',
			x: 0,
			y: 0,
			itemStyle:{
				color:'#aaa',
				fill:'#aaa'
			}
		},
		plotOptions: {
			column: {
				stacking: 'normal'
			},
			series:{
				pointPadding: 0, //数据点之间的距离值
               groupPadding: 0, //分组之间的距离值
               borderWidth: 0,
               shadow: false,
               pointWidth:18 //柱子之间的距离值
			}
		},
		series: [{
			name: '告警总数',
			data: [11, 3, 11, 13, 0, 0, 0,0,0,15],
			stack:'male'

		},{
			name: '未处理告警数',
			data: [4, 8, 0, 6, 0, 0, 0,0,2,0],
			stack:'male'
		}]
	});
}
function init_mixed_chart(show_time){
	Highcharts.setOptions({
		colors: ['#FF8202', '#3F97D1','#3AE2DF','#ccc']
	});
	$('#mixedChart').highcharts({
		chart: {
			backgroundColor: 'rgba(0,0,0,0)',
			marginLeft:70,
			marginRight:70,
			marginTop:30
		},
		exporting:{
			enabled:false
		},
		title: {
			text:null
		},
		xAxis: {
			labels:{
				style:{
					color:'#aaa',
					fill:'#aaa'
				}
			},
			categories: show_time
		},
		yAxis: {
			title:null,
			enable:false,
			min: 0,
			labels:{
				style:{
					color:'#aaa',
					fill:'#aaa'
				}
			},
			gridLineDashStyle:'dot'
		},
		tooltip: {
			headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
			pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
				'<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
			footerFormat: '</table>',
			shared: false,
			useHTML: false
		},
		legend:{
			layout:'horizontal',
			floating: true,
			align: 'right',
			verticalAlign: 'top',
			x: -80,
			y: -10,
			itemStyle:{
				color:'#aaa',
				fill:'#aaa'
			}
		},
		plotOptions: {
			column: {
				pointPadding: 0.2,
				borderWidth: 0
			}
		},
		series: [{
			type: 'column',
			name: '日发电量(kw.h)',
			data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1]

		},{
			type: 'column',
			name: '日减排量(t)',
			data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2]

		},{
            name: '实际PR',
            data: [250, 269, 295, 245, 282, 215, 252, 265, 233, 283]
        }, {
            name: '基准PR',
            data: [222, 288, 257, 213, 217, 220, 248, 241, 231, 241]
        }]
	});
}