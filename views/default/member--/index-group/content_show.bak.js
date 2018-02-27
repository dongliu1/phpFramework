
	var mapsize={"width":730,"height":365};
	var myinfo={"id":"china","width":730,"height":365,"type":"json","scale":1000};
	var addressId=["china"];
	var submaps=[];
	$(function () {
		draw_map();
		$(".knob").knob({'min':0,'max':100,step:0.1});
		init_chart();
		$("#return-icon").on("click",function(){
			var map_id=addressId.pop();
			var prev_id=addressId[addressId.length-1];
			load_map_by_zipcode(prev_id);
			if(addressId.length==1){
				$("#return-icon").hide();
			}
		})
	});
	
	function init_chart(){
		Highcharts.setOptions({
			colors: ['#7BB4EB', '#90EC7D']
		});
	    $('#barChart').highcharts({
			chart: {
				type: 'column',
				backgroundColor: 'rgba(0,0,0,0)',
				marginLeft:60,
				marginRight:120
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
						color:'#aaa'
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
					'15',
					'16',
					'17'
				]
			},
			yAxis: {
				title:null,
				enable:false,
				min: 0,
				labels:{
					style:{
						color:'#aaa'
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
				layout:'vertical',
				floating: true,
				align: 'right',
				verticalAlign: 'top',
				x: 0,
				y: 0,
				itemStyle:{
					color:'#aaa'
				}
			},
			plotOptions: {
				column: {
					pointPadding: 0.2,
					borderWidth: 0
				}
			},
			series: [{
				name: '日发电量',
				data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]

			},{
				name: '日减排量',
				data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2]

			}]
		});
	}
	
	var draw_map=function(){
		$.getJSON( mappath+myinfo.id+"."+myinfo.type, function( data ) {
			myinfo["parent"]=null;
			myinfo["data"]=data;
			//set_myinfo(data);
			init_svg_paper("map");
		});
	}
	
	var init_svg_paper=function(containerid){//xmlns="http://www.w3.org/2000/svg"
		$("#"+containerid).html("").width(myinfo.width).height(myinfo.height);
		var _svg = d3.select("#"+containerid).append("svg").attr("width", myinfo.width).attr("height", myinfo.height).append("g");
		var _g_chart=_svg.append("g").attr("id","svg_chart").attr("transform", "translate(0,0)");
		var _g_basemap=_svg.append("g").attr("id","svg_basemap").attr("transform", "translate(0,0)");
		_svg.append("use").attr("xlink:href", "#svg_chart");	//chart在顶层
		var projection=nrender_map("svg_basemap");
		render_chart("svg_chart",["daily","total"],projection);
	}
	
	var get_bounds=function(features){	//get_bounds
		var bounds=[[180,90],[-180,-90]];
		$.each(features,function(i,d){
			$.each(d.geometry.coordinates,function(j,e){
				$.each(e,function(k,f){
					//console.log(f);
					if($.isArray(f[0])){
						$.each(f,function(l,g){
							bounds[0][0]=Math.min(bounds[0][0],g[0]);
							bounds[0][1]=Math.min(bounds[0][1],g[1]);
							bounds[1][0]=Math.max(bounds[1][0],g[0]);
							bounds[1][1]=Math.max(bounds[1][1],g[1]);
						});
					}else{
						bounds[0][0]=Math.min(bounds[0][0],f[0]);
						bounds[0][1]=Math.min(bounds[0][1],f[1]);
						bounds[1][0]=Math.max(bounds[1][0],f[0]);
						bounds[1][1]=Math.max(bounds[1][1],f[1]);
					}
				});
			})
			
		});
		console.log(JSON.stringify(bounds));
		return bounds;
	}
	
	var set_myinfo=function(data){		//生成scale、显示高度、中心点等
		//console.log(data.features);
		var b = get_bounds(data.features);
		//console.log(JSON.stringify(b));
		var _x=(b[1][0]-(-b[0][0]))/2;
		var _y=(b[1][1]-(-b[0][1]))/2;
		var _height=mapsize.width*(b[1][1] - b[0][1])/(b[1][0] - b[0][0]);

		var _myheight=b[1][1] - b[0][1];
		var _mywidth=b[1][0] - b[0][0];
		
		var _height=0,_width=0;
		if((mapsize.width/_mywidth)<(mapsize.height/_myheight)){
			_height=mapsize.width*_myheight/_mywidth;
			_width=mapsize.width;
		}else{
			_width=mapsize.height*_mywidth/_myheight;
			_height=mapsize.height;
		}
		//console.log(_width+" :::::: "+_height)

		
		_scale=myinfo.scale;
		myinfo={"data":data,"scale":_scale,"center":[_x,_y],"width":myinfo.width,"height":_height,"parent":myinfo}; 
	}
	
	var nrender_map=function(containerid){
	
		var width  = myinfo.width;
		var height = myinfo.height;
		var json=myinfo.data;

		//d3.json("nld.json", function(json) {
		// create a first guess for the projection
		var center = d3.geo.centroid(json)
		var scale  = 120;
		var offset = [width/2, height/2];
		var projection = d3.geo.mercator().scale(scale).center(center)
		  .translate(offset);
		myinfo["center"]=center;
		// create the path
		var path = d3.geo.path().projection(projection);
		//console.log(path(json));
		// using the path determine the bounds of the current map and use 
		// these to determine better values for the scale and translation
		console.log(scale);
		var bounds  = path.bounds(json);
		var hscale  = scale*width  / (bounds[1][0] - bounds[0][0]);
		//console.log(bounds[1][0] - bounds[0][0]);
		var vscale  = scale*height / (bounds[1][1] - bounds[0][1]);
		//console.log(bounds[1][1] - bounds[0][1]);
		var scale   = (hscale < vscale) ? hscale : vscale;
		//console.log(scale);
		var offset  = [width - (bounds[0][0]/2) - (bounds[1][0]/2),
						height - (bounds[0][1]/2) - (bounds[1][1]/2)];
		// new projection
		projection = d3.geo.mercator().center(center)
		.scale(scale*.8).translate(offset);
		path = path.projection(projection);

		var _g=d3.select("#"+containerid);

		_g.selectAll("path")
			.data( json.features )
			.enter()
			.append("path")
			.attr("stroke","#999")
			.attr("stroke-width",1)
			.attr("fill","#ccc")
			.attr("d", path )
			.on("mouseover",function(d,i){
				d3.select(this).attr("fill","#C7C6BE");
			})
			.on("mouseout",function(d,i){
				d3.select(this).attr("fill","#ccc");
			})
			.on("click",function(d,i){
				var zipcode=json.features[i]["properties"]["id"];
				if(addressId.length<3){
					$("#return-icon").show();
					addressId.push(zipcode);
				}
				load_map_by_zipcode(zipcode);
			});
		return projection;
	}
	
	var load_map_by_zipcode=function(zipcode){
		console.log(zipcode);
		myinfo={"id":zipcode,"type":"json","width":myinfo.width,"parent":myinfo}; 
		$.getJSON( mappath+myinfo.id+"."+myinfo.type, function( gdata ) {
			set_myinfo(gdata);
			init_svg_paper("map");
		});
	}
	
	
	var render_map=function(containerid){
		var _g=d3.select("#"+containerid);
		var mapdata=myinfo.data.features;
		var _projection = d3.geo.mercator()
						.center(myinfo.center)//经纬度
						.scale(myinfo.scale*.8)
						.translate([myinfo.width/2, myinfo.height/2]);
	
		var _path = d3.geo.path().projection(_projection);
		_g.selectAll("path")
			.data( mapdata )
			.enter()
			.append("path")
			.attr("stroke","#999")
			.attr("stroke-width",1)
			.attr("fill","#ccc")
			.attr("d", _path )
			.on("mouseover",function(d,i){
				d3.select(this).attr("fill","#C7C6BE");
			})
			.on("mouseout",function(d,i){
				d3.select(this).attr("fill","#ccc");
			})
			.on("click",function(d,i){
				var zipcode=mapdata[i]["properties"]["id"];
				console.log(zipcode)
				
				myinfo={"id":zipcode,"type":myinfo.type,"width":myinfo.width,"parent":myinfo}; 
				$.getJSON( mappath+myinfo.id+"."+myinfo.type, function( gdata ) {
					console.log(gdata);
					set_myinfo(gdata);
					//draw_map();
					//myinfo["data"]=gdata;
					init_svg_paper("map");
				});
			});
	}

	var render_chart=function(containerid,datacolumn,projection){
		var datalength=datacolumn.length;
		var _g=d3.select("#"+containerid);
		d3.json(SITE_PATH+"config/powerplant.json", function(error, _root) {
			if (error) return console.error(error);
			var barwidth=_root.barwidth;
			var color=_root.color;	
			var shifting=barwidth*datalength/2;
			/*var _projection = d3.geo.mercator()
							.center(myinfo.center)//经纬度
							.scale(myinfo.scale)
							.translate([myinfo.width/2, myinfo.height/2]);
			*/
			var datamax={};
			$.each(_root.data,function(i,d){
				$.each(datacolumn,function(j,colname){
					if(i==0)datamax[colname]=d.values[colname];
					datamax[colname]=Math.max(datamax[colname],d.values[colname]);
				});
			});
			console.log(datamax);
			$.each(_root.data,function(i,d){
				//渲染 电站的椭圆
				var plantinfo={};
				plantinfo["coord"]=projection(d.coordinates);
				plantinfo["coord"][1]-=5;//向上移动一点
				plantinfo["rx"]=25;
				plantinfo["ry"]=15;
				plantinfo["id"]=d.id;
				render_ellipse("svg_chart",plantinfo);
			
				//渲染 数据的 bar
				$.each(datacolumn,function(j,colname){
					var dmax=datamax[colname];
					var bardata={};
					bardata["height"]=20*d.values[colname]/dmax;
					bardata["width"]=barwidth;
					bardata["id"]=d.id;
					bardata["color"]=color[colname];
					bardata["coord"]=projection(d.coordinates);
					bardata["coord"][0]=bardata.coord[0]-shifting+(j*barwidth);
					bardata["coord"][1]=bardata.coord[1]-bardata.height;
					render_databar("svg_chart",bardata);
				});
			})
			
		});
	}

	var render_ellipse=function(chartid,plantinfo){
	  d3.select("#"+chartid).append('ellipse')
		.attr('cx', plantinfo.coord[0])
		.attr('cy', plantinfo.coord[1])
		.attr("rx", plantinfo.rx)
		.attr("ry", plantinfo.ry)
		.attr("fill","transparent")
		.attr('id',"chart_ellipse_"+plantinfo.id)
		.on("mouseover",function(){
			d3.select(this).transition().duration(100).attr("fill","#ecefe4");
		})
		.on("mouseout",function(){
			d3.select(this).transition().duration(100).attr("fill","transparent");
		}).on("click",function(){
			//console.log(plantinfo);
			window.parent.rox_fn_addTabs({id: "cat-94", title: "电站首页",url:url+"&id="+plantinfo.id, close: true});
			//location.href=url+"&id="+plantinfo.id; 
			

			/*
			var zipcode=65;
			myinfo={"id":zipcode,"type":myinfo.type,"width":myinfo.width,"parent":myinfo}; 
			
			//$.post( "{url('member/index/geofile')}&id="+zipcode, function( gdata ) {
				gdata={"type":"FeatureCollection","features":[{"type":"Feature","geometry":{"type":"Polygon","coordinates":[[[118.873505941,31.1050208397],[114.868757797,32.1031674608],[110.86307266,31.100348122],[114.858295955,31.097631],[114.855774745,31.0957663916],[114.856621538,31.0946460905],[114.859090494,31.095834],[114.861800527,31.0969319694],[114.866409715,31.0984716736],[114.871509387,31.100662],[114.879200297,31.1021833563],[114.878914381,31.1075194167],[118.873505941,31.1050208397]]]}}]};
				console.log(gdata);
				//gdata=$.parseJSON(gdata);
				//myinfo["scale"]=50;
				//set_myinfo($.parseJSON(gdata));
			//$.getJSON( mappath+myinfo.id+"."+myinfo.type, function( gdata ) {
				set_myinfo(gdata);//console.log(gdata);
				init_svg_paper("map");
			//});*/
			return false;
		});
	}
	
	var render_databar=function(chartid,d){
	  d3.select("#"+chartid).append("rect")
		.attr('y', d.coord[1])
		.attr('x', d.coord[0])
		.attr('height', d.height)
		.attr('width', d.width)
		.attr('id',d.id)
		.attr("fill", d.color)
		.on("mouseover",function(){
			d3.select("#chart_ellipse_"+d.id).transition().duration(100).attr("fill","#ecefe4");
		})
		.on("mouseout",function(){
			d3.select("#chart_ellipse_"+d.id).transition().duration(100).attr("fill","transparent");
		});
	
	}