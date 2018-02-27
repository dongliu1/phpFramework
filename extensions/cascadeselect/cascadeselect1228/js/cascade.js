



var pa_pageSize = 12;

var allProId = null;
var cityIdAll = null;
var cs_tab_layer1_TotalPage = null;

var data_layer = [];		//各层的数据源
var data_disp=[];			//各层的显示数据
var page_current= [];		//各层的当前显示页面
var page_total=[];			//各层的总页面数
var layers = [
	{"label":"热门城市","level":0},
	{"label":"省份", },
	{"label":"城市", },
	{"label":"区县", }
] ;
var url="/extensions/cascadeselect/cascadeselect1228/data/address.json";

(function() {

	for(i=0;i<layers.length;i++){
		getLayerData(i);
	}
	var clkIndex;
	var currentClass;

	var thisObj;
	var autocompleteCityDiv = "<div class='cs_autocomplete'><ul></ul></div>";
	$("body").append(autocompleteCityDiv);
	var cascadeSelectDiv = "<div name='start_div' class='cascadeSelectDiv'>\
		<div class='tabs clearfix'>\
		<ul class=''>\
			<li><a href='javascript:' class='current' tb='cs_tab_layer0'>热门城市</a></li>\
			<li><a href='javascript:' tb='cs_tab_layer1'>省份</a></li>\
			<li><a href='javascript:' tb='cs_tab_layer2' id='cs_tab_layer2'>城市</a></li>\
			<li><a href='javascript:' tb='cs_tab_layer3' id='cs_tab_layer3'>区县</a></li>\
		</ul>\
		</div>\
		\
		<div class='cs-content'>\
			<div class='cs_tab_layer0 invis'><div class='pre'><a></a></div><div class='list'><ul></ul></div><div class='next'><a></a></div></div>\
			<div class='cs_tab_layer1 invis'><div class='pre'><a></a></div><div class='list'><ul></ul></div>\
				<div class='next'><a class='cs-enabled'></a></div>\
			</div>\
			<div class='cs_tab_layer2 invis'>\
				<div class='pre'><a></a></div>\
				<div class='list'>\
					<ul>\
					</ul>\
				</div>\
				<div class='next'><a class='cs-enabled'></a></div>\
			</div>\
			<div class='cs_tab_layer3 invis'>\
				<div class='pre'><a></a></div>\
				<div class='list'>\
					<ul>\
					</ul>\
				</div>\
				<div class='next'><a class='cs-enabled'></a></div>\
			</div>\
		</div>\
		</div>";
	$("body").append(cascadeSelectDiv);
	
	$("body").delegate(".proCityQuery,.proCityQueryAll", ($.browser.opera ? "keypress": "keyup"),function(event) {
		if ($(".cs_autocomplete:visible").size() == 0) {
			$(".backifname").hide();
		}
		$(".provinceCity").hide();
		$(".cascadeSelectDiv").hide();
		if ($(this).hasClass("proCityQueryAll"))
		 {
			if ($("body").data("data_layer1") == null) {
				getLayerData(1);
			}
			if ($("body").data("data_layer2") == null) {
				getLayerData(2);
			}
			if ($("body").data("data_layer3") == null) {
				getLayerData(3);
			}
			init_hot_page();show_layer_at_page(1,1);				///////////////////////////////////////////////////////////////////////////////////////////
			currentClass = "proCityQueryAll";
			clkIndex = $("body").find(".proCityQueryAll").index(this);
			data_layer[2] = $("body").data("data_layer2");
			data_layer[1] = $("body").data("data_layer1");
			data_layer[3] = $("body").data("data_layer3");
			thisObj = $(this);
		}
		if ($(this).hasClass("proCityQuery"))
		 {
			if ($("body").data("allExistProvinces") == null) {
				sendProvinceAjax();
			}
			if ($("body").data("allExistCitys") == null) {
				sendCitiesAjax();
			}
			if ($("body").data("allExistCountys") == null) {
				sendCountiesAjax();
			}
			currentClass = "proCityQuery";
			clkIndex = $("body").find(".proCityQuery").index(this);
			data_layer[2] = $("body").data("allExistCitys");
			data_layer[1] = $("body").data("allExistProvinces");
			data_layer[3] = $("body").data("allExistCountys");
			thisObj = $(this);
		}
		lastKeyPressCode = event.keyCode;
		switch (lastKeyPressCode) {
		case 40:
			$(".cs_autocomplete").trigger("selNext");
			return false;
			break;
		case 38:
			$(".cs_autocomplete").trigger("selPrev");
			return false;
			break;
		case 13:
			$(".cs_autocomplete").trigger("enter");
			return false;
			break;
		}
		v = $.trim($(this).val());
		if (v == "" || v == null) {
			return false;
		}
		$(".provinceCity").hide();
		var o = $(this).offset();
		var l = o.left;
		var t = o.top;
		var w = $(this).width();
		var h = $(this).outerHeight();
		var htmlArr = [];
		var autoWidth;
		for (i = 0; i < data_layer[3].length; i++) {
			if (v.toUpperCase() === data_layer[3][i].pinYinChar.substring(0, v.length)) {
				htmlArr[htmlArr.length] = "<li><a class='allcityClass' href='javascript:' provinceId=" + data_layer[3][i].provinceId + " cityId=" + data_layer[3][i].cityId + " countyId=" + data_layer[3][i].id + ">" + data_layer[3][i].cityName + "-" + data_layer[3][i].name + " (<span style='color:red'>" + v.toUpperCase() + "</span>" + data_layer[3][i].pinYinChar.substring(v.length, data_layer[3][i].pinYinChar.length) + ")</a></li>";
				if (htmlArr.length > 9) {
					break;
					return false;
				}
				autoWidth = autoWidth < (data_layer[3][i].cityName + data_layer[3][i].name + data_layer[3][i].pinYinChar).length ? (data_layer[3][i].cityName + data_layer[3][i].name + data_layer[3][i].pinYinChar).length: autoWidth;
				continue;
			};
			if (v === data_layer[3][i].name.substring(0, v.length)) {
				htmlArr[htmlArr.length] = "<li><a class='allcityClass' href='javascript:' provinceId=" + data_layer[3][i].provinceId + " cityId=" + data_layer[3][i].cityId + " countyId=" + data_layer[3][i].id + ">" + data_layer[3][i].cityName + "-" + "<span style='color:red'>" + v + "</span>" + data_layer[3][i].name.substring(v.length, data_layer[3][i].name.length) + " (" + data_layer[3][i].pinYinChar + ")</a></li>";
				if (htmlArr.length > 9) {
					break;
					return false;
				}
				autoWidth = autoWidth < (data_layer[3][i].cityName + data_layer[3][i].name + data_layer[3][i].pinYinChar).length ? (data_layer[3][i].cityName + data_layer[3][i].name + data_layer[3][i].pinYinChar).length: autoWidth;
				continue;
			};
			if (v.toLowerCase() === data_layer[3][i].pinYin.substring(0, v.length)) {
				htmlArr[htmlArr.length] = "<li><a class='allcityClass' href='javascript:' provinceId=" + data_layer[3][i].provinceId + " cityId=" + data_layer[3][i].cityId + " countyId=" + data_layer[3][i].id + ">" + data_layer[3][i].cityName + "-" + data_layer[3][i].name + " (<span style='color:red'>" + v.toLowerCase() + "</span>" + data_layer[3][i].pinYin.substring(v.length, data_layer[3][i].pinYin.length) + ")</a></li>"
				if (htmlArr.length > 9) {
					break;
					return false;
				}
				autoWidth = autoWidth < (data_layer[3][i].cityName + data_layer[3][i].name + data_layer[3][i].pinYin).length ? (data_layer[3][i].cityName + data_layer[3][i].name + data_layer[3][i].pinYin).length: autoWidth;
				continue;
			};
		}
		for (i = 0; i < data_layer[2].length; i++) {
			if (v.toUpperCase() === data_layer[2][i].cityShortPY.substring(0, v.length)) {
				htmlArr[htmlArr.length] = "<li><a class='allcityClass' href='javascript:' provinceId=" + data_layer[2][i].provinceId + " cityId=" + data_layer[2][i].id + ">" + data_layer[2][i].name + " (<span style='color:red'>" + v.toUpperCase() + "</span>" + data_layer[2][i].cityShortPY.substring(v.length, data_layer[2][i].cityShortPY.length) + ")</a></li>";
				if (htmlArr.length > 9) {
					break;
					return false;
				}
				autoWidth = autoWidth < (data_layer[2][i].name + data_layer[2][i].cityShortPY).length ? (data_layer[2][i].name + data_layer[2][i].cityShortPY).length: autoWidth;
				continue;
			};
			if (v === data_layer[2][i].name.substring(0, v.length)) {
				htmlArr[htmlArr.length] = "<li><a class='allcityClass' href='javascript:' provinceId=" + data_layer[2][i].provinceId + " cityId=" + data_layer[2][i].id + "><span style='color:red'>" + v + "</span>" + data_layer[2][i].name.substring(v.length, data_layer[2][i].name.length) + " (" + data_layer[2][i].cityShortPY + ")</a></li>";
				if (htmlArr.length > 9) {
					break;
					return false;
				}
				autoWidth = autoWidth < (data_layer[2][i].name + data_layer[2][i].cityShortPY).length ? (data_layer[2][i].name + data_layer[2][i].cityShortPY).length: autoWidth;
				continue;
			};
			if (v.toLowerCase() === data_layer[2][i].cityPinyin.substring(0, v.length)) {
				htmlArr[htmlArr.length] = "<li><a class='allcityClass' href='javascript:' provinceId=" + data_layer[2][i].provinceId + " cityId=" + data_layer[2][i].id + ">" + data_layer[2][i].name + " (<span style='color:red'>" + v.toLowerCase() + "</span>" + data_layer[2][i].cityPinyin.substring(v.length, data_layer[2][i].cityPinyin.length) + ")</a></li>"
				if (htmlArr.length > 9) {
					break;
					return false;
				}
				autoWidth = autoWidth < (data_layer[2][i].name + data_layer[2][i].cityPinyin).length ? (data_layer[2][i].name + data_layer[2][i].cityPinyin).length: autoWidth;
				continue;
			};
		};
		if (htmlArr == "" || htmlArr == null) {
			$(".cs_autocomplete ul").html("<li class='none'>对不起,没有找到该城市</li>");
			return false;
		} else {
			$(".cs_autocomplete ul").html(htmlArr.join("")).find("li:first").addClass("current");
		};
		if (autoWidth < 200) {
			autoWidth = 200;
		}
		$(".cs_autocomplete").css("width", autoWidth).css("top", t + h).css("left", l).show();
		$(".backifname").show();
		$("html").click(function() {
			$(".cs_autocomplete").hide();
			$(".backifname").hide();
		});
	});
	$("body").delegate(".cs_autocomplete li", "hover", 
		function() {
			$(this).addClass("current").siblings().removeClass("current");
		},
		function() {
			$(this).removeClass("current");
		}
	);

	$(".cs_autocomplete").delegate("", "selNext",function() {
			var next = $(this).find("li.current").next();
			if (next.size() > 0) {
				next.addClass("current").siblings().removeClass("current");
			}
			 else {
				$(".cs_autocomplete li").removeClass("current").first().addClass("current");
			};
		});
	$(".cs_autocomplete").delegate("", "selPrev",function() {
			var prev = $(this).find("li.current").prev();
			if (prev.size() > 0) {
				prev.addClass("current").siblings().removeClass("current");
			}
			 else {
				$(".cs_autocomplete li").removeClass("current").last().addClass("current");
			};
		});
	$(".cs_autocomplete").delegate("", "enter",function(event) {
			var cur = $(this).find("li.current");
			if (cur.size() > 0) {
				cur.find("a").trigger("click");
			};
		});
	$("body").delegate(".cs_autocomplete li a.allcityClass", "click",function() {
			var vm = $(this).text();
			var provinceId = $(this).attr("provinceId");
			var cityId = $(this).attr("cityId");
			var countyId = $(this).attr("countyId");
			var provinceName;
			var cityName;
			var rtn;
			for (i = 0; i < data_layer[1].length; i++) {
				if (data_layer[1][i].id == provinceId) {
					provinceName = data_layer[1][i].name;
				};
			}
			for (i = 0; i < data_layer[2].length; i++) {
				if (data_layer[2][i].id == cityId) {
					cityName = data_layer[2][i].name;
				}
			}
			if (currentClass == "proCityQueryAll") {
				$("body").data("pAllId", provinceId);
				$("body").data("cAllId", cityId);
				$("body").data("aAllId", countyId);
				$("body").data("pAllName", provinceName);
				$("body").data("nameOfcs_tab_layer2", cityName);
			}
			if (currentClass == "proCityQuery") {
				$("body").data("pId", provinceId);
				$("body").data("cId", cityId);
				$("body").data("aId", countyId);
				$("body").data("pName", provinceName);
				$("body").data("nameOfCity", cityName);
			}
			vm = vm.split("(");
			countyName = $.trim(vm[0]);
			if (countyId == null || countyName == cityName)
			 {
				if (currentClass == "proCityQuery")
				 {
					thisObj.trigger("click");
					counties = [];
					var j = 0;
					$.each(data_layer[3],
					function(i, county) {
						if (county.cityId == cityId) {
							counties[j++] = county;
						}
					});
					countyTotalPage = Math.ceil(counties.length / pa_pageSize);
					$(".provinceCity").find(".tabs").find("a").removeClass("current");
					$(".provinceCity .tabs").find("#county").addClass("current");
					$(".cs-content .city .list a").removeClass("current");
					$(".provinceCity").find(".cs-content").children().hide();
					$(".provinceCity").find(".cs-content").find(".county").show();
					$(".cs-content .cs_tab_layer1 .list a").removeClass("current");
					countyPage(1);
				}
				 else if (currentClass == "proCityQueryAll")
				 {
					thisObj.trigger("click");
					countiesAll = [];
					var j = 0;
					$.each(data_layer[3],
					function(i, county) {
						if (county.cityId == cityId && county.name != cityName) {
							countiesAll[j++] = county;
						}
					});
					countyTotalPageAll = Math.ceil(countiesAll.length / pa_pageSize);
					$(".cascadeSelectDiv").find(".tabs").find("a").removeClass("current");
					$(".cascadeSelectDiv .tabs").find("#cs_tab_layer3").addClass("current");
					$(".cs-content .cs_tab_layer2 .list a").removeClass("current");
					$(".cascadeSelectDiv").find(".cs-content").children().hide();
					$(".cascadeSelectDiv").find(".cs-content").find(".cs_tab_layer3").show();
					$(".cs-content .cs_tab_layer1 .list a").removeClass("current");
					show_layer_by_page(3,1);
				}
			}
			 else
			 {
				rtn = provinceName + "-" + countyName;
				if (currentClass == "proCityQueryAll")
				 {
					$("body").find(".proCityQueryAll").eq(clkIndex).val(rtn);
					$("body").find(".proCityQueryAll").eq(clkIndex).trigger("change");
					$(".cascadeSelectDiv").find(".tabs").find("a").removeClass("current");
					$(".cascadeSelectDiv").find(".tabs").find("a[tb=cs_tab_layer0]").addClass("current");
					$(".cascadeSelectDiv .cs-content .list a").removeClass("current");
					$(".cascadeSelectDiv .cs-content .list a input").removeClass("current");
				}
				if (currentClass == "proCityQuery")
				 {
					$("body").find(".proCityQuery").eq(clkIndex).val(rtn);
					$("body").find(".proCityQuery").eq(clkIndex).trigger("change", [cityId, countyId]);
					$(".provinceCity").find(".tabs").find("a").removeClass("current");
					$(".provinceCity").find(".tabs").find("a[tb=hotCity]").addClass("current");
					$(".provinceCity .cs-content .list a").removeClass("current");
					$(".provinceCity .cs-content .list a input").removeClass("current");
				}
			}
			$(".cs_autocomplete").hide();
			$(".backifname").hide();
			return false;
		});

})();


$(".proCitySelAll_Img").bind('click',function(event) {
		event.stopPropagation();
		$(this).prev().trigger("click");
	});
$(".proCitySelAll").bind('click',function(event) {
		if ($("body").data("data_layer2") == null) {
			getLayerData(2);
		}
		
		$(this).select();
		$(".provinceCity").hide();
		$(".cascadeSelectDiv").hide();
		$(".cs_autocomplete").hide();
		var o2 = $(this).offset();
		var l2 = o2.left;
		var t2 = o2.top;
		var h2 = $(this).outerHeight();
		$(".cascadeSelectDiv").css("top", t2 + h2).css("left", l2).toggle();
		$(".cascadeSelectDiv").click(function(event) {
			event.stopPropagation();
		});
		event.stopPropagation();
		$("html").click(function() {
			$(".cascadeSelectDiv").hide();
		});
		$("input.proCitySelAll").removeClass("current2");
		$(this).addClass("current2");
		$(".cascadeSelectDiv").find(".tabs").find("a").removeClass("current");
		$(".cascadeSelectDiv").find(".tabs").find("a[tb=cs_tab_layer0]").addClass("current");
		$(".cascadeSelectDiv").find(".cs-content").children().hide();
		$(".cascadeSelectDiv").find(".cs-content").find(".cs_tab_layer0").show();
		if ($("body").data("data_layer1") == null) {
			getLayerData(1);
		}
		if ($("body").data("data_layer3") == null) {
			getLayerData(3);
		}
		show_layer_at_page(1,1);
		$(".cascadeSelectDiv").find(".tabs").find("a").click(function() {
			if ($(this).attr("tb") == "cs_tab_layer2" && $(".cs_tab_layer1 .list .current").val() == null) {
				return;
			};
			if ($(this).attr("tb") == "cs_tab_layer3" && $(".cs_tab_layer2 .list .current").val() == null && $(".cs_tab_layer0 .list .current").val() == null) {
				return;
			};
			$(".cascadeSelectDiv").find(".tabs").find("a").removeClass("current");
			$(this).addClass("current");
			var tb = $(this).attr("tb");
			$(".cascadeSelectDiv").find(".cs-content").children().hide();
			$(".cascadeSelectDiv").find(".cs-content").find("." + tb).show();
		});
	});

function json2str(o) {
	var arr = [];
	var fmt = function(s) {
		if (typeof s == 'object' && s != null) return json2str(s);
		return /^(string|number)$/.test(typeof s) ? "'" + s + "'": s;
	};
	for (var i in o) arr.push("'" + i + "':" + fmt(o[i]));
	return '{' + arr.join(',') + '}';
}

function getLayerData(layer) {
	$.ajax({
		type: "get",
		url: layers[layer].url,
		async: false,
		dataType: "json",
		success: function(data) {
			data_layer[layer] = data.items;
			$("body").data("data_layer"+layer, data.items);
			if(layer==0){init_hot_page();}
			if(layer==1){data_disp[layer]=data.items;show_layer_at_page(1,1);}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown)
		 {
			alert(textStatus);
		}
	});
}


function init_hot_page() {
	console.log(json2str(data_layer[0]));
	$.each(data_layer[0],
	function(i, city) {
		if (city.hotCity) {
			$(".cs_tab_layer0 .list ul").append("<li><a><input type='button' style='background:none;border:0px;cursor: pointer;' onclick=hotCityAddrInputAll(\'" + city.provinceId + "," + city.id + "," + city.name + "\') id='" + city.id + "' value='" + city.name + "'></a></li>");
		}
	});
}

$(".pre a").bind('click',function() {
	if ($(this).hasClass("cs-enabled")) {
		var cs_tab_layer=$(this).closest(".invis");
		for(i=1;i<4;i++){			
			if($(cs_tab_layer).hasClass("cs_tab_layer"+i)){
				var ilayer=i;
				if (page_current[i] == 1) {
					return;
				}
				show_layer3_by_page(page_current[i] - 1);
			}
		}			
	}
});

$(".next a").bind('click',function() {
		if ($(this).hasClass("cs-enabled")) {
			var cs_tab_layer=$(this).closest(".invis");
			for(i=1;i<4;i++){			
				if($(cs_tab_layer).hasClass("cs_tab_layer"+i)){
					var ilayer=i;
					var ipage=page_current[i] + 1;
					show_layer_at_page(ilayer,ipage);
				}
			}			
		}
	});


function json2str(o) {
	var arr = [];
	var fmt = function(s) {
		if (typeof s == 'object' && s != null) return json2str(s);
		return /^(string|number)$/.test(typeof s) ? "'" + s + "'": s;
	};
	for (var i in o) arr.push("'" + i + "':" + fmt(o[i]));
	return '{' + arr.join(',') + '}';
}


function show_layer_by_parent(layer,parentindex) {
	if(layer==layers.length){addrInputAll(layer,parentindex);}	///输出选择结果
	i=parentindex;
	parentid = data_layer[layer-1][i].id;
	//$("body").data("pAllName", data_layer[layer-1][i].name);
	//$("body").data("pAllId", parentid);
	data_disp[layer] = [];
	var j = 0;
	$.each(data_layer[layer],
		function(i, item) {		
			if (item.parentid == parentid) {
				data_disp[layer][j++] = item;
			}
		});
	var totalpage = Math.ceil(data_disp[layer].length / pa_pageSize);
	$(".cascadeSelectDiv").find(".tabs").find("a").removeClass("current");
	$(".cascadeSelectDiv .tabs").find("#cs_tab_layer"+layer).addClass("current");
	$(".cs-content .cs_tab_layer"+(layer-1)+" .list a").removeClass("current");
	$(".cs-content .cs_tab_layer"+(layer-1)+" .list a[id='" + parentid + "']").addClass("current");
	$(".cascadeSelectDiv").find(".cs-content").children().hide();
	$(".cascadeSelectDiv").find(".cs-content").find(".cs_tab_layer"+layer).show();
	show_layer_at_page(layer,1);
}

function show_layer_at_page(layer,page) {
	var layerclass=$(".cs_tab_layer"+layer);
	$(".list ul li",layerclass).remove();
	var totalpage = Math.ceil(data_disp[layer].length / pa_pageSize);
	var end;
	var start;
	start = (page - 1) * pa_pageSize;
	end = start + pa_pageSize;
	if(totalpage==1){
		$(".pre a",layerclass).removeClass("cs-enabled");
		$(".next a",layerclass).removeClass("cs-enabled");
	}else if (page == 1) {
		$(".pre a",layerclass).removeClass("cs-enabled");
		$(".next a",layerclass).addClass("cs-enabled");
	}else if(page==totalpage){
		start = (page - 1) * pa_pageSize;
		end = data_disp[layer].length;
		$(".pre a",layerclass).addClass("cs-enabled");
		$(".next a",layerclass).removeClass("cs-enabled");		
	}else {
		$(".pre a",layerclass).addClass("cs-enabled");
		$(".next a",layerclass).addClass("cs-enabled");
	}

	for (var i = start; i < end; i++) {
		var itemid = data_disp[layer][i].id;
		var itemname = data_disp[layer][i].name;
		var li = $('<li><a style="background: none repeat scroll 0% 0% transparent; border: 0px none;" href="javascript:onclick=show_layer_by_parent(' + (layer+1) + ',' + i + ');" id="' + itemid + '">' + itemname + '</a></li>');
		$(".list ul",layerclass).append(li);
	}
	page_current[layer]=page;
}


function addrInputAll(layer,i) {
	var countyId = $.trim(countiesAll[i].id);
	$(".cs-content .cs_tab_layer0 .list a input").removeClass("current");
	$(".cs-content .cs_tab_layer0 .list a input[id='" + cityIdAll + "']").addClass("current");
	$(".cs-content .cs_tab_layer3 .list a").removeClass("current");
	$(".cs-content .cs_tab_layer3 .list a[id='" + countyId + "']").addClass("current");
	allProId = $("body").data("pAllId");
	cityIdAll = $("body").data("cAllId");
	var p = null;
	$.each(data_layer[1],
	function(i, province) {
		if (province.id == allProId) {
			p = province.name;
			return false;
		}
	});
	var c = null;
	$.each(data_layer[2],
	function(i, city) {
		if (city.id == cityIdAll) {
			c = city.name;
			return false;
		}
	});
	var a = null;
	$.each(countiesAll,
	function(i, county) {
		if (county.id == countyId) {
			a = county.name;
			return false;
		}
	});
	var nameValue = $("input.current2");
	nameValue.removeClass("iGrays");
	$(".cascadeSelectDiv").hide();
	var rtn = p + "-" + c + "-" + a;
	$("input.current2").val(rtn);
	$(".backifname").hide();
	var nameValue = $("input.current2").attr("name");
	if (nameValue == "consignor.addrProCity") {
		$("#provinceId").val(allProId);
		$("#cityId").val(cityIdAll);
	}
	if (nameValue == "order.caddrProCity")
	 {
		$("input[name='order.caddrProCity']").trigger("change");
	}
	if (nameValue == "consigneeInfo.addrProCity")
	 {
		$("input[name='consigneeInfo.addrProCity']").trigger("change");
	}
	if (nameValue == 'template.caddrProCity')
	 {
		$("input[name='template.caddrProCity']").trigger("change");
	}
}
function hotCityAddrInputAll(proCityId) {
	allProId = proCityId.split(",")[0];
	cityIdAll = proCityId.split(",")[1];
	var cityCurName = proCityId.split(",")[2];
	$("body").data("nameOfcs_tab_layer2", cityCurName);
	$("body").data("pAllId", allProId);
	$("body").data("cAllId", cityIdAll);
	$.each(data_layer[1],
	function(i, pro) {
		if (pro.id == allProId) {
			$("body").data("pAllName", pro.name);
		}
	});
	countiesAll = [];
	var j = 0;
	$.each(data_layer[3],
	function(i, county) {
		if (county.cityId == cityIdAll) {
			countiesAll[j++] = county;
		}
	});
	countyTotalPageAll = Math.ceil(countiesAll.length / pa_pageSize);
	$(".cascadeSelectDiv").find(".tabs").find("a").removeClass("current");
	$(".cascadeSelectDiv .tabs").find("#cs_tab_layer3").addClass("current");
	$(".cs-content .cs_tab_layer2 .list a").removeClass("current");
	$(".cs-content .cs_tab_layer2 .list a[id='" + cityIdAll + "']").addClass("current");
	$(".cascadeSelectDiv").find(".cs-content").children().hide();
	$(".cascadeSelectDiv").find(".cs-content").find(".cs_tab_layer3").show();
	$(".cs-content .cs_tab_layer1 .list a").removeClass("current");
	show_layer3_by_page(1);
}
