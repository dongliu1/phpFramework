
var data_layer1 = null;
var data_layer2 = null;
var data_layer3 = null;
var allProId = null;
var cityIdAll = null;
var cs_tab_layer1TotalPage = null;
var pa_pageSize = 12;
var pa_currentPage = 1;

(function() {
	
	var clkIndex;
	var currentClass;
	var data_disp_layer1;
	var data_disp_layer2;
	var data_disp_layer3;
	var thisObj;
	var autocompleteCityDiv = "<div class='cs_autocomplete'><ul></ul></div>";
	$("body").append(autocompleteCityDiv);
	var cascadeSelectDiv = "<div name='start_div' class='cascadeSelectDiv'>\
		<div class='tabs clearfix'>\
		<ul class=''>\
			<li><a href='javascript:' class='current' tb='cs_tab_hot'>热门城市</a></li>\
			<li><a href='javascript:' tb='cs_tab_layer1'>省份</a></li>\
			<li><a href='javascript:' tb='cs_tab_layer2' id='cs_tab_layer2'>城市</a></li>\
			<li><a href='javascript:' tb='cs_tab_layer3' id='cs_tab_layer3'>区县</a></li>\
		</ul>\
		</div>\
		\
		<div class='cs-content'>\
			<div class='cs_tab_hot invis'><div class='pre'><a></a></div><div class='list'><ul></ul></div><div class='next'><a></a></div></div>\
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
				sendAllProvinceAjax();
			}
			if ($("body").data("data_layer2") == null) {
				getAllCitiesData();
			}
			if ($("body").data("data_layer3") == null) {
				sendAllCountiesAjax();
			}
			currentClass = "proCityQueryAll";
			clkIndex = $("body").find(".proCityQueryAll").index(this);
			data_layer2 = $("body").data("data_layer2");
			data_layer1 = $("body").data("data_layer1");
			data_layer3 = $("body").data("data_layer3");
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
			data_layer2 = $("body").data("allExistCitys");
			data_layer1 = $("body").data("allExistProvinces");
			data_layer3 = $("body").data("allExistCountys");
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
		for (i = 0; i < data_layer3.length; i++) {
			if (v.toUpperCase() === data_layer3[i].pinYinChar.substring(0, v.length)) {
				htmlArr[htmlArr.length] = "<li><a class='allcityClass' href='javascript:' provinceId=" + data_layer3[i].provinceId + " cityId=" + data_layer3[i].cityId + " countyId=" + data_layer3[i].id + ">" + data_layer3[i].cityName + "-" + data_layer3[i].areaName + " (<span style='color:red'>" + v.toUpperCase() + "</span>" + data_layer3[i].pinYinChar.substring(v.length, data_layer3[i].pinYinChar.length) + ")</a></li>";
				if (htmlArr.length > 9) {
					break;
					return false;
				}
				autoWidth = autoWidth < (data_layer3[i].cityName + data_layer3[i].areaName + data_layer3[i].pinYinChar).length ? (data_layer3[i].cityName + data_layer3[i].areaName + data_layer3[i].pinYinChar).length: autoWidth;
				continue;
			};
			if (v === data_layer3[i].areaName.substring(0, v.length)) {
				htmlArr[htmlArr.length] = "<li><a class='allcityClass' href='javascript:' provinceId=" + data_layer3[i].provinceId + " cityId=" + data_layer3[i].cityId + " countyId=" + data_layer3[i].id + ">" + data_layer3[i].cityName + "-" + "<span style='color:red'>" + v + "</span>" + data_layer3[i].areaName.substring(v.length, data_layer3[i].areaName.length) + " (" + data_layer3[i].pinYinChar + ")</a></li>";
				if (htmlArr.length > 9) {
					break;
					return false;
				}
				autoWidth = autoWidth < (data_layer3[i].cityName + data_layer3[i].areaName + data_layer3[i].pinYinChar).length ? (data_layer3[i].cityName + data_layer3[i].areaName + data_layer3[i].pinYinChar).length: autoWidth;
				continue;
			};
			if (v.toLowerCase() === data_layer3[i].pinYin.substring(0, v.length)) {
				htmlArr[htmlArr.length] = "<li><a class='allcityClass' href='javascript:' provinceId=" + data_layer3[i].provinceId + " cityId=" + data_layer3[i].cityId + " countyId=" + data_layer3[i].id + ">" + data_layer3[i].cityName + "-" + data_layer3[i].areaName + " (<span style='color:red'>" + v.toLowerCase() + "</span>" + data_layer3[i].pinYin.substring(v.length, data_layer3[i].pinYin.length) + ")</a></li>"
				if (htmlArr.length > 9) {
					break;
					return false;
				}
				autoWidth = autoWidth < (data_layer3[i].cityName + data_layer3[i].areaName + data_layer3[i].pinYin).length ? (data_layer3[i].cityName + data_layer3[i].areaName + data_layer3[i].pinYin).length: autoWidth;
				continue;
			};
		}
		for (i = 0; i < data_layer2.cities.length; i++) {
			if (v.toUpperCase() === data_layer2.cities[i].cityShortPY.substring(0, v.length)) {
				htmlArr[htmlArr.length] = "<li><a class='allcityClass' href='javascript:' provinceId=" + data_layer2.cities[i].provinceId + " cityId=" + data_layer2.cities[i].id + ">" + data_layer2.cities[i].name + " (<span style='color:red'>" + v.toUpperCase() + "</span>" + data_layer2.cities[i].cityShortPY.substring(v.length, data_layer2.cities[i].cityShortPY.length) + ")</a></li>";
				if (htmlArr.length > 9) {
					break;
					return false;
				}
				autoWidth = autoWidth < (data_layer2.cities[i].name + data_layer2.cities[i].cityShortPY).length ? (data_layer2.cities[i].name + data_layer2.cities[i].cityShortPY).length: autoWidth;
				continue;
			};
			if (v === data_layer2.cities[i].name.substring(0, v.length)) {
				htmlArr[htmlArr.length] = "<li><a class='allcityClass' href='javascript:' provinceId=" + data_layer2.cities[i].provinceId + " cityId=" + data_layer2.cities[i].id + "><span style='color:red'>" + v + "</span>" + data_layer2.cities[i].name.substring(v.length, data_layer2.cities[i].name.length) + " (" + data_layer2.cities[i].cityShortPY + ")</a></li>";
				if (htmlArr.length > 9) {
					break;
					return false;
				}
				autoWidth = autoWidth < (data_layer2.cities[i].name + data_layer2.cities[i].cityShortPY).length ? (data_layer2.cities[i].name + data_layer2.cities[i].cityShortPY).length: autoWidth;
				continue;
			};
			if (v.toLowerCase() === data_layer2.cities[i].cityPinyin.substring(0, v.length)) {
				htmlArr[htmlArr.length] = "<li><a class='allcityClass' href='javascript:' provinceId=" + data_layer2.cities[i].provinceId + " cityId=" + data_layer2.cities[i].id + ">" + data_layer2.cities[i].name + " (<span style='color:red'>" + v.toLowerCase() + "</span>" + data_layer2.cities[i].cityPinyin.substring(v.length, data_layer2.cities[i].cityPinyin.length) + ")</a></li>"
				if (htmlArr.length > 9) {
					break;
					return false;
				}
				autoWidth = autoWidth < (data_layer2.cities[i].name + data_layer2.cities[i].cityPinyin).length ? (data_layer2.cities[i].name + data_layer2.cities[i].cityPinyin).length: autoWidth;
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
			for (i = 0; i < data_layer1.length; i++) {
				if (data_layer1[i].id == provinceId) {
					provinceName = data_layer1[i].provinceName;
				};
			}
			for (i = 0; i < data_layer2.cities.length; i++) {
				if (data_layer2.cities[i].id == cityId) {
					cityName = data_layer2.cities[i].name;
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
					$.each(data_layer3,
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
					$.each(data_layer3,
					function(i, county) {
						if (county.cityId == cityId && county.areaName != cityName) {
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
					allCountyPage(1);
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
					$(".cascadeSelectDiv").find(".tabs").find("a[tb=cs_tab_hot]").addClass("current");
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
			getAllCitiesData();
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
		$(".cascadeSelectDiv").find(".tabs").find("a[tb=cs_tab_hot]").addClass("current");
		$(".cascadeSelectDiv").find(".cs-content").children().hide();
		$(".cascadeSelectDiv").find(".cs-content").find(".cs_tab_hot").show();
		if ($("body").data("data_layer1") == null) {
			sendAllProvinceAjax();
		}
		if ($("body").data("data_layer3") == null) {
			sendAllCountiesAjax();
		}
		$(".cascadeSelectDiv").find(".tabs").find("a").click(function() {
			if ($(this).attr("tb") == "cs_tab_layer2" && $(".cs_tab_layer1 .list .current").val() == null) {
				return;
			};
			if ($(this).attr("tb") == "cs_tab_layer3" && $(".cs_tab_layer2 .list .current").val() == null && $(".cs_tab_hot .list .current").val() == null) {
				return;
			};
			$(".cascadeSelectDiv").find(".tabs").find("a").removeClass("current");
			$(this).addClass("current");
			var tb = $(this).attr("tb");
			$(".cascadeSelectDiv").find(".cs-content").children().hide();
			$(".cascadeSelectDiv").find(".cs-content").find("." + tb).show();
		});
	});
$(".province .pre a").bind('click',function() {
		var provincePage = parseInt($('#provincePage').html());
		if (provincePage == 1) {
			return;
		}
		viewProvince(provincePage - 1);
	});
$(".city .pre a").bind('click',function() {
		var cityPages = parseInt($('#cityPage').html());
		if (cityPages == 1) {
			return;
		}
		cityPage(cityPages - 1);
	});
$(".county .pre a").bind('click',function() {
		var countyPages = parseInt($('#countyPage').html());
		if (countyPages == 1) {
			return;
		}
		countyPage(countyPages - 1);
	});

$(".province .next a").bind('click',function() {
		var provincePage = parseInt($('#provincePage').html());
		provinceTotalPage = countProvincePages();
		if (provincePage == provinceTotalPage) {
			return;
		}
		viewProvince(provincePage + 1);
	});
$(".city .next a").bind('click',function() {
	if ($(this).hasClass("cs-enabled")) {
		var cityPages = parseInt($('#cityPage').html());
		cityPage(cityPages + 1);
	}
});
$(".county .next a").bind('click',function() {
	if ($(this).hasClass("cs-enabled")) {
		var countyPages = parseInt($('#countyPage').html());
		countyPage(countyPages + 1);
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
function countProvincePages() {
	provinceTotalPage = Math.ceil(provinces.length / pa_pageSize);
	return provinceTotalPage;
}

function viewHotCities() {
	$.each(cities,
	function(i, city) {
		if (city.hotCity) {
			$(".hotCity .list ul").append("<li><a><input type='button' style='background:none;border:0px;cursor: pointer;' onclick=hotCityAddrInput(\'" + city.provinceId + "," + city.id + "," + city.name + "\') id='" + city.id + "' value='" + city.name + "'></a></li>");
		}
	});
}
function viewProvince(page) {
	$(".province .list ul li").remove();
	console.log("row454 "+page);
	if (page == 1) {
		$(".province .pre a").removeClass("cs-enabled");
		$(".province .next a").addClass("cs-enabled");
	} else {
		$(".province .pre a").addClass("cs-enabled");
		$(".province .next a").addClass("cs-enabled");
	}
	var end;
	var start;
	if (page == provinceTotalPage) {
		start = (page - 1) * pa_pageSize;
		end = provinces.length;
		$(".province .next a").removeClass("cs-enabled");
	} else {
		start = (page - 1) * pa_pageSize;
		end = start + pa_pageSize;
	}
	for (var i = start; i < end; i++) {
		var p_id = provinces[i].id;
		var p_name = provinces[i].provinceName;
		if (provinces[i].provinceName == '内蒙古自治区') {
			p_name = '内蒙古';
		} else if (provinces[i].provinceName == '黑龙江省') {
			p_name = '黑龙江';
		} else {
			p_name = provinces[i].provinceName.substr(0, 2);
		}
		var li = $('<li><a style="background: none repeat scroll 0% 0% transparent; border: 0px none;" href="javascript:onclick=viewCities(' + i + ');" id="' + p_id + '">' + p_name + '</a></li>');
		$(".province .list ul").append(li);
	}
	$(".province .list #provincePage").remove();
	$(".province .list").append("<label id='provincePage' style='display:none;'>" + page + "</label>");
}
function viewCities(i) {
	proId = provinces[i].id;
	$("body").data("pName", provinces[i].provinceName);
	$("body").data("pId", proId);
	citys = [];
	var j = 0;
	$.each(cities,
	function(i, city) {
		if (city.provinceId == proId) {
			citys[j++] = city;
		}
	});
	cityTotalPage = Math.ceil(citys.length / pa_pageSize);
	$(".provinceCity").find(".tabs").find("a").removeClass("current");
	$(".provinceCity .tabs").find("#city").addClass("current");
	$(".cs-content .province .list a").removeClass("current");
	$(".cs-content .province .list a[id='" + proId + "']").addClass("current");
	$(".provinceCity").find(".cs-content").children().hide();
	$(".provinceCity").find(".cs-content").find(".city").show();
	cityPage(1);
}
function cityPage(page) {
	$(".city .list ul li").remove();
	$(".cs_tab_layer2 .list ul li").remove();
	if (page == 1) {
		$(".city .pre a").removeClass("cs-enabled");
	} else {
		$(".city .pre a").addClass("cs-enabled");
	}
	var start;
	var end;
	if (page <= 1) {
		page = 1;
		$(".city .pre a").removeClass("cs-enabled");
		$(".city .next a").addClass("cs-enabled");
	}
	if (cityTotalPage == 1) {
		$(".city .next a").removeClass("cs-enabled");
		$(".city .pre a").removeClass("cs-enabled");
	}
	if (page >= cityTotalPage) {
		page = cityTotalPage;
		$(".city .next a").removeClass("cs-enabled");
		start = (page - 1) * pa_pageSize;
		end = citys.length;
	} else if (page == 1) {
		start = (page - 1) * pa_pageSize;
		end = start + pa_pageSize;
		$(".city .pre a").removeClass("cs-enabled");
		$(".city .next a").addClass("cs-enabled");
	} else {
		start = (page - 1) * pa_pageSize;
		end = start + pa_pageSize;
		$(".city .next a").addClass("cs-enabled");
		$(".city .pre a").addClass("cs-enabled");
	}
	for (var i = start; i < end; i++) {
		var c_id = citys[i].id;
		var cityName = citys[i].name.substr(0, 4);
		var li = $('<li><a href="javascript:onclick=viewCounties(' + i + ')" id="' + c_id + '">' + cityName + '</a></li>');
		$(".city .list ul").append(li);
	}
	$(".city .list #cityPage").remove();
	$(".city .list").append("<label id='cityPage' style='display:none;'>" + page + "</label>");
}
function viewCounties(i) {
	cityId = citys[i].id;
	$("body").data("cId", cityId);
	var nameOfCity = $.trim(citys[i].name);
	$("body").data("nameOfCity", nameOfCity);
	counties = [];
	var j = 0;
	$.each(areas,
	function(i, county) {
		if (county.cityId == cityId) {
			counties[j++] = county;
		}
	});
	countyTotalPage = Math.ceil(counties.length / pa_pageSize);
	$(".provinceCity").find(".tabs").find("a").removeClass("current");
	$(".provinceCity .tabs").find("#county").addClass("current");
	$(".cs-content .city .list a").removeClass("current");
	$(".cs-content .city .list a[id='" + cityId + "']").addClass("current");
	$(".provinceCity").find(".cs-content").children().hide();
	$(".provinceCity").find(".cs-content").find(".county").show();
	countyPage(1);
}
function countyPage(page) {
	var nameValue = $("input.current1").attr("name");
	var nameOfProvince = $("body").data("pName");
	var cityCurName = $("body").data("nameOfCity");
	$("input.current1").removeClass("iGrays");
	$("input.current1").val(nameOfProvince + "-" + cityCurName);
	$(".county .list ul li").remove();
	if (page == 1) {
		$(".county .pre a").removeClass("cs-enabled");
	} else {
		$(".county .pre a").addClass("cs-enabled");
	}
	var start;
	var end;
	if (page <= 1) {
		page = 1;
		$(".county .pre a").removeClass("cs-enabled");
		$(".county .next a").addClass("cs-enabled");
	}
	if (countyTotalPage == 1) {
		$(".county .next a").removeClass("cs-enabled");
		$(".county .pre a").removeClass("cs-enabled");
	}
	if (page >= countyTotalPage) {
		page = countyTotalPage;
		$(".county .next a").removeClass("cs-enabled");
		start = (page - 1) * pa_pageSize;
		end = counties.length;
	} else if (page == 1) {
		start = (page - 1) * pa_pageSize;
		end = start + pa_pageSize;
		$(".county .pre a").removeClass("cs-enabled");
		$(".county .next a").addClass("cs-enabled");
	} else {
		start = (page - 1) * pa_pageSize;
		end = start + pa_pageSize;
		$(".county .next a").addClass("cs-enabled");
		$(".county .pre a").addClass("cs-enabled");
	}
	for (var i = start; i < end; i++) {
		var c_id = counties[i].id;
		var countyName = counties[i].areaName.substr(0, 4);;
		var li = $('<li><a href="javascript:onclick=addrInput(' + i + ')" id="' + c_id + '">' + countyName + '</a></li>');
		$(".county .list ul").append(li);
	}
	$(".county .list #countyPage").remove();
	$(".county .list").append("<label id='countyPage' style='display:none;'>" + page + "</label>");
}
function addrInput(i) {
	var countyId = $.trim(counties[i].id);
	$(".cs-content .hotCity .list a input").removeClass("current");
	$(".cs-content .hotCity .list a input[id='" + cityId + "']").addClass("current");
	$(".cs-content .county .list a").removeClass("current");
	$(".cs-content .county .list a[id='" + countyId + "']").addClass("current");
	proId = $("body").data("pId");
	cityId = $("body").data("cId");
	var p = null;
	$.each(provinces,
	function(i, province) {
		if (province.id == proId) {
			p = province.provinceName;
			return false;
		}
	});
	var c = null;
	$.each(cities,
	function(i, city) {
		if (city.id == cityId) {
			c = city.name;
			return false;
		}
	});
	var a = null;
	$.each(counties,
	function(i, county) {
		if (county.id == countyId) {
			a = county.areaName;
			return false;
		}
	});
	$("input.current1").removeClass("iGrays");
	$(".provinceCity").hide();
	var rtn = p + "-" + c + "-" + a;
	$("input.current1").val(rtn);
	$(".backifname").hide();
	var nameValue = $("input.current1").attr("name");
	if (nameValue == 'order.sdeptProCity')
	 {
		$("#deptCityId").val(cityId);
		$("input[name='order.sdeptProCity']").trigger("change", [cityId, countyId]);
	}
	if (nameValue == 'consignor.deptProCity')
	 {
		$("input[name='consignor.deptProCity']").trigger("change", [cityId, countyId]);
	}
	if (nameValue == 'template.sdeptProCity')
	 {
		$("input[name='template.sdeptProCity']").trigger("change", [cityId, countyId]);
	}
}
function hotCityAddrInput(proCityId) {
	proId = proCityId.split(",")[0];
	cityId = proCityId.split(",")[1];
	var cityCurName = proCityId.split(",")[2];
	$("body").data("nameOfCity", cityCurName);
	$("body").data("pId", proId);
	$("body").data("cId", cityId);
	$.each(provinces,
	function(i, pro) {
		if (pro.id == proId) {
			$("body").data("pName", pro.provinceName);
		}
	});
	counties = [];
	var j = 0;
	$.each(areas,
	function(i, county) {
		if (county.cityId == cityId) {
			counties[j++] = county;
		}
	});
	countyTotalPage = Math.ceil(counties.length / pa_pageSize);
	$(".provinceCity").find(".tabs").find("a").removeClass("current");
	$(".provinceCity .tabs").find("#county").addClass("current");
	$(".cs-content .city .list a").removeClass("current");
	$(".cs-content .city .list a[id='" + cityId + "']").addClass("current");
	$(".provinceCity").find(".cs-content").children().hide();
	$(".provinceCity").find(".cs-content").find(".county").show();
	$(".cs-content .cs_tab_layer1 .list a").removeClass("current");
	countyPage(1);
}

function sendCitiesAjax() {
	$.ajax({
		type: "get",
		url: '/optcloud/extensions/cascadeselect/data/queryAllCities.json',
		async: false,
		dataType: "json",
		success: function(data) {
			cities = data.cities;
			$("body").data("allExistCitys", data);
			viewHotCities();
		},
		error: function(XMLHttpRequest, textStatus, errorThrown)
		 {
			alert("网络繁忙，请稍后再试！");
		}
	});
}
function sendAllProvinceAjax() {
	$.ajax({
		type: "get",
		url: '/optcloud/extensions/cascadeselect/data/queryAllProvinces.json',
		async: false,
		dataType: "json",
		success: function(data) {
			data_layer1 = data.provinces;
			$("body").data("data_layer1", data_layer1);
			viewAllProvince(1);
		},
		error: function(XMLHttpRequest, textStatus, errorThrown)
		 {
			alert(textStatus);
		}
	});
}
function getAllCitiesData() {
	$.ajax({
		type: "get",
		url: '/optcloud/extensions/cascadeselect/data/queryCities.json',
		async: false,
		dataType: "json",
		success: function(data) {
			data_layer2 = data.cities;
			$("body").data("data_layer2", data);
			viewAllHot();
		},
		error: function(XMLHttpRequest, textStatus, errorThrown)
		 {
			alert(textStatus);
		}
	});
}
function sendAllCountiesAjax(){
	$.ajax({
		type: "get",
		url: "/optcloud/extensions/cascadeselect/data/queryAllAreas.json",
		async: false,
		dataType: "json",
		success: function(data) {
			data_layer3 = data.areas;
			$("body").data("data_layer3", data.areas);
		},
		error: function(XMLHttpRequest, textStatus, errorThrown)
		 {
			alert("网络繁忙，请稍后再试！");
		}
	});
}
function viewAllHot() {
	$.each(data_layer2,
	function(i, city) {
		if (city.hotCity) {
			$(".cs_tab_hot .list ul").append("<li><a><input type='button' style='background:none;border:0px;cursor: pointer;' onclick=hotCityAddrInputAll(\'" + city.provinceId + "," + city.id + "," + city.name + "\') id='" + city.id + "' value='" + city.name + "'></a></li>");
		}
	});
}
$(".cs_tab_layer1 .pre a").bind('click',function() {
		var provincePage1 = parseInt($('#provincePage1').html());
		if (provincePage1 == 1) {
			return;
		}
		viewAllProvince(provincePage1 - 1);
	});
$(".cs_tab_layer2 .pre a").bind('click',function() {
		var cityPages1 = parseInt($('#cityPage1').html());
		if (cityPages1 == 1) {
			return;
		}
		show_layer2_by_page(cityPages1 - 1);
	});
$(".cs_tab_layer3 .pre a").bind('click',function() {
		var countyPages = parseInt($('#countyPage1').html());
		if (countyPages == 1) {
			return;
		}
		allCountyPage(countyPages - 1);
	});
$(".cs_tab_layer1 .next a").bind('click',function() {
		var provincePage1 = parseInt($('#provincePage1').html());
		cs_tab_layer1TotalPage = countAllProvincePages();
		if (provincePage1 >= cs_tab_layer1TotalPage) {
			return;
		}
		viewAllProvince(provincePage1 + 1);
	});
$(".cs_tab_layer2 .next a").bind('click',function() {
		if ($(this).hasClass("cs-enabled")) {
			var cityPages1 = parseInt($('#cityPage1').html());
			show_layer2_by_page(cityPages1 + 1);
		}
	});
$(".cs_tab_layer3 .next a").bind('click',function() {
		if ($(this).hasClass("cs-enabled")) {
			var countyPages = parseInt($('#countyPage1').html());
			allCountyPage(countyPages + 1);
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
function countAllProvincePages() {
	cs_tab_layer1TotalPage = Math.ceil(data_layer1.length / pa_pageSize);
	return cs_tab_layer1TotalPage;
}
function viewAllProvince(page) {
	$(".cs_tab_layer1 .list ul li").remove();
	if (page == 1) {
		$(".cs_tab_layer1 .pre a").removeClass("cs-enabled");
		$(".cs_tab_layer1 .next a").addClass("cs-enabled");
	} else {
		$(".cs_tab_layer1 .pre a").addClass("cs-enabled");
		$(".cs_tab_layer1 .next a").addClass("cs-enabled");
	}
	var end;
	var start;
	if (page == cs_tab_layer1TotalPage) {
		start = (page - 1) * pa_pageSize;
		end = data_layer1.length;
		$(".cs_tab_layer1 .next a").removeClass("cs-enabled");
	} else {
		start = (page - 1) * pa_pageSize;
		end = start + pa_pageSize;
	}
	for (var i = start; i < end; i++) {
		var p_id = data_layer1[i].id;
		var p_name = data_layer1[i].provinceName;
		if (data_layer1[i].provinceName == '内蒙古自治区') {
			p_name = '内蒙古';
		} else if (data_layer1[i].provinceName == '黑龙江省') {
			p_name = '黑龙江';
		} else {
			p_name = data_layer1[i].provinceName.substr(0, 2);
		}
		var li = $('<li><a style="background: none repeat scroll 0% 0% transparent; border: 0px none;" href="javascript:onclick=show_layer2_by_parent(' + i + ');" id="' + p_id + '">' + p_name + '</a></li>');
		$(".cs_tab_layer1 .list ul").append(li);
	}
	$(".cs_tab_layer1 .list #provincePage1").remove();
	$(".cs_tab_layer1 .list").append("<label id='provincePage1' style='display:none;'>" + page + "</label>");
}
function show_layer2_by_parent(i) {
	parentid = data_layer1[i].id;
	$("body").data("pAllName", data_layer1[i].provinceName);
	$("body").data("pAllId", parentid);
	data_disp_layer2 = [];
	var j = 0;
	$.each(data_layer2,
		function(i, item) {
			//console.log(item.id);
			if (item.provinceId == parentid) {
				data_disp_layer2[j++] = item;
			}
		});
	allCityTotalPage = Math.ceil(data_disp_layer2.length / pa_pageSize);
	$(".cascadeSelectDiv").find(".tabs").find("a").removeClass("current");
	$(".cascadeSelectDiv .tabs").find("#cs_tab_layer2").addClass("current");
	$(".cs-content .cs_tab_layer1 .list a").removeClass("current");
	$(".cs-content .cs_tab_layer1 .list a[id='" + parentid + "']").addClass("current");
	$(".cascadeSelectDiv").find(".cs-content").children().hide();
	$(".cascadeSelectDiv").find(".cs-content").find(".cs_tab_layer2").show();
	show_layer2_by_page(1);
}
function show_layer2_by_page(page) {
	$(".cs_tab_layer2 .list ul li").empty();
	$(".cs_tab_layer2 .list ul li").remove();
	if (page == 1) {
		$(".cs_tab_layer2 .pre a").removeClass("cs-enabled");
	} else {
		$(".cs_tab_layer2 .pre a").addClass("cs-enabled");
	}
	var start;
	var end;
	if (page <= 1) {
		page = 1;
		$(".cs_tab_layer2 .pre a").removeClass("cs-enabled");
		$(".cs_tab_layer2 .next a").addClass("cs-enabled");
	}
	if (allCityTotalPage == 1) {
		$(".cs_tab_layer2 .next a").removeClass("cs-enabled");
		$(".cs_tab_layer2 .pre a").removeClass("cs-enabled");
	}
	if (page >= allCityTotalPage) {
		page = allCityTotalPage;
		$(".cs_tab_layer2 .next a").removeClass("cs-enabled");
		start = (page - 1) * pa_pageSize;
		end = data_disp_layer2.length;
	} else if (page == 1) {
		start = (page - 1) * pa_pageSize;
		end = start + pa_pageSize;
		$(".cs_tab_layer2 .pre a").removeClass("cs-enabled");
		$(".cs_tab_layer2 .next a").addClass("cs-enabled");
	} else {
		start = (page - 1) * pa_pageSize;
		end = start + pa_pageSize;
		$(".cs_tab_layer2 .next a").addClass("cs-enabled");
		$(".cs_tab_layer2 .pre a").addClass("cs-enabled");
	}
	for (var i = start; i < end; i++) {
		var c_id = data_disp_layer2[i].id;
		var cityName = data_disp_layer2[i].name.substr(0, 4);
		var li = $('<li><a href="javascript:onclick=viewAllCounties(' + i + ')" id="' + c_id + '">' + cityName + '</a></li>');
		$(".cs_tab_layer2 .list ul").append(li);
	}
	$(".cs_tab_layer2 .list #cityPage1").remove();
	$(".cs_tab_layer2 .list").append("<label id='cityPage1' style='display:none;'>" + page + "</label>");
}
function viewAllCounties(i) {
	cityIdAll = data_layer2[i].id;
	$("body").data("cAllId", cityIdAll);
	var cityname = $.trim(data_layer2[i].name);
	$("body").data("nameOfcs_tab_layer2", cityname);
	countiesAll = [];
	var j = 0;
	$.each(data_layer3,
	function(i, countys) {
		if (countys.cityId == cityIdAll) {
			countiesAll[j++] = countys;
		}
	});
	countyTotalPageAll = Math.ceil(countiesAll.length / pa_pageSize);
	$(".cascadeSelectDiv").find(".tabs").find("a").removeClass("current");
	$(".cascadeSelectDiv .tabs").find("#cs_tab_layer3").addClass("current");
	$(".cs-content .cs_tab_layer2 .list a").removeClass("current");
	$(".cs-content .cs_tab_layer2 .list a[id='" + cityIdAll + "']").addClass("current");
	$(".cascadeSelectDiv").find(".cs-content").children().hide();
	$(".cascadeSelectDiv").find(".cs-content").find(".cs_tab_layer3").show();
	allCountyPage(1);
}
function allCountyPage(page) {
	var nameOfProvince = $("body").data("pAllName");
	var cityCurrentName = $("body").data("nameOfcs_tab_layer2");
	$("input.current2").removeClass("iGrays");
	$("input.current2").val(nameOfProvince + "-" + cityCurrentName);
	$(".cs_tab_layer3 .list ul li").remove();
	if (page == 1) {
		$(".cs_tab_layer3 .pre a").removeClass("cs-enabled");
	} else {
		$(".cs_tab_layer3 .pre a").addClass("cs-enabled");
	}
	var start;
	var end;
	if (page <= 1) {
		page = 1;
		$(".cs_tab_layer3 .pre a").removeClass("cs-enabled");
		$(".cs_tab_layer3 .next a").addClass("cs-enabled");
	}
	if (countyTotalPageAll == 1) {
		$(".cs_tab_layer3 .next a").removeClass("cs-enabled");
		$(".cs_tab_layer3 .pre a").removeClass("cs-enabled");
	}
	if (page >= countyTotalPageAll) {
		page = countyTotalPageAll;
		$(".cs_tab_layer3 .next a").removeClass("cs-enabled");
		start = (page - 1) * pa_pageSize;
		end = countiesAll.length;
	} else if (page == 1) {
		start = (page - 1) * pa_pageSize;
		end = start + pa_pageSize;
		$(".cs_tab_layer3 .pre a").removeClass("cs-enabled");
		$(".cs_tab_layer3 .next a").addClass("cs-enabled");
	} else {
		start = (page - 1) * pa_pageSize;
		end = start + pa_pageSize;
		$(".cs_tab_layer3 .next a").addClass("cs-enabled");
		$(".cs_tab_layer3 .pre a").addClass("cs-enabled");
	}
	for (var i = start; i < end; i++) {
		var c_id = countiesAll[i].id;
		var countyName = countiesAll[i].areaName.substr(0, 4);;
		var li = $('<li><a href="javascript:onclick=addrInputAll(' + i + ')" id="' + c_id + '">' + countyName + '</a></li>');
		$(".cs_tab_layer3 .list ul").append(li);
	}
	$(".cs_tab_layer3 .list #countyPage1").remove();
	$(".cs_tab_layer3 .list").append("<label id='countyPage1' style='display:none;'>" + page + "</label>");
}
function addrInputAll(i) {
	var countyId = $.trim(countiesAll[i].id);
	$(".cs-content .cs_tab_hot .list a input").removeClass("current");
	$(".cs-content .cs_tab_hot .list a input[id='" + cityIdAll + "']").addClass("current");
	$(".cs-content .cs_tab_layer3 .list a").removeClass("current");
	$(".cs-content .cs_tab_layer3 .list a[id='" + countyId + "']").addClass("current");
	allProId = $("body").data("pAllId");
	cityIdAll = $("body").data("cAllId");
	var p = null;
	$.each(data_layer1,
	function(i, province) {
		if (province.id == allProId) {
			p = province.provinceName;
			return false;
		}
	});
	var c = null;
	$.each(data_layer2,
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
			a = county.areaName;
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
	$.each(data_layer1,
	function(i, pro) {
		if (pro.id == allProId) {
			$("body").data("pAllName", pro.provinceName);
		}
	});
	countiesAll = [];
	var j = 0;
	$.each(data_layer3,
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
	allCountyPage(1);
}
