<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="off">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title><?php echo $sites[$siteid]['SITE_NAME']; ?>-<?php echo lang('admin'); ?></title>
<link href="<?php echo ADMIN_THEME; ?>images/index.css" rel="stylesheet" type="text/css" />
<link href="<?php echo ADMIN_THEME; ?>images/dialog.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<?php echo ADMIN_THEME; ?>js/jquery.min.js"></script>
<script type="text/javascript" src="<?php echo ADMIN_THEME; ?>js/dialog.js"></script>
<style type="text/css">
.objbody{overflow:hidden}
.treeview .subtree{display:none;padding-left:10px}

</style>
</head>
<body scroll="no" class="objbody">
<div class="header">
	<div class="logo lf"><a href="<?php echo SITE_PATH; ?>" target="_blank"><span class="invisible">RCMS</span></a></div>
    <div class="rt-col">
    	<div class="tab_style white cut_line text-r">
			<a href="http://www.rox.cn" target="_blank"><?php echo lang('a-com-12'); ?></a><span>|</span>
			<a href="http://www.rox.cn/help/" target="_blank"><?php echo lang('a-com-14'); ?></a>
        </div>
    </div>
    <div class="col-auto">
    	<div class="log white cut_line">
			<?php echo lang('a-com-15'); ?>！<?php echo $userinfo['username']; ?>&nbsp;<?php if ($userinfo['realname']) { ?>(<?php echo $userinfo['realname']; ?>)<?php } ?><span>|</span>
			<a href="javascript:;" onClick="logout();">[<?php echo lang('a-com-16'); ?>]</a><span>|</span>
			<a href="<?php echo $site_url;  echo SITE_PATH; ?>" target="_blank" id="site_homepage">[<?php echo $sites[$siteid]['SITE_NAME']; ?>] <?php echo lang('a-com-17'); ?></a>
    	</div>
        <ul class="nav white" id="top_menu">
        <?php if (is_array($menu['top'])) { $count=count($menu['top']);foreach ($menu['top'] as $k=>$t) { ?>
			<li id="_M<?php echo $k; ?>" class="<?php if ($k==0) { ?>on<?php } ?> top_menu"><a href="javascript:_M(<?php echo $k; ?>,<?php echo $t['select']; ?>,'<?php echo $t['url']; ?>','<?php echo lang($t['name']); ?>')" hidefocus="true" style="outline:none;"><?php echo lang($t['name']); ?></a></li>
		<?php } }  if (count($sites)>1 && $userinfo['site']==0) { ?>	<li class="tab_web"><a href="javascript:;" class=""><span><?php echo lang('a-sit-18'); ?></span></a></li><?php } ?>
        </ul>
    </div>
</div>
<div id="content">
	<div class="col-left left_menu">
    	<div id="Scroll">
			<div id="leftMain"></div>
		</div>
        <a href="javascript:;" id="openClose" style="outline-style: none; outline-color: invert; outline-width: medium;" hideFocus="hidefocus" class="open" title="open/close"><span class="hidden">open</span></a>
    </div>
	<div class="col-1 lf cat-menu" id="display_center_id" style="display:none" height="100%">
	<div class="content">
        	<iframe name="center_frame" id="center_frame" src="" frameborder="false" scrolling="auto" style="border:none" width="100%" height="auto" allowtransparency="true"></iframe>
            </div>
        </div>
    <div class="col-auto mr8">
		<div class="crumbs">
			<div class="shortcut cu-span">
				<a href="<?php echo url('admin/index/main'); ?>" target="right"><span><?php echo lang('a-men-8'); ?></span></a>
				<a href="<?php echo url('admin/index/cache'); ?>" target="right"><span><?php echo lang('a-men-19'); ?></span></a>
				<a href="<?php echo url('admin/index/updatemap'); ?>" target="right"><span><?php echo lang('a-men-53'); ?></span></a>
			</div>
			<?php echo lang('a-com-18'); ?>：<span id="current_pos"></span>
		</div>
    	<div class="col-1">
        	<div class="content" style="position:relative; overflow:hidden">
                <iframe name="right" id="rightMain" src="<?php echo url('admin/index/main'); ?>" frameborder="false" scrolling="auto" style="border:none; margin-bottom:30px" width="100%" height="auto" allowtransparency="true"></iframe>
                <div class="fav-nav">
					&copy; 2003-<?php echo date('Y'); ?>&nbsp;&nbsp;<strong><a class="rox-cms" href="http://www.rox.cn" target="_blank"><?php echo CMS_NAME; ?></a></strong>&nbsp;v<?php echo CMS_VERSION; ?> 
					(Update:<?php echo CMS_UPDATE; ?>)<span id="rcms_version"></span> &nbsp;&nbsp;&nbsp;&nbsp;
				</div>
        	</div>
        </div>
    </div>
</div>
<div class="tab-web-panel hidden" style="position:absolute; z-index:999; background:#fff">
<ul>
<?php if (is_array($sites)) { $count=count($sites);foreach ($sites as $sid=>$t) { ?>
	<li style="margin:0"><a href="<?php echo url('admin', array('siteid'=>$sid)); ?>"><?php echo $t['SITE_NAME']; ?></a></li>
<?php } } ?>
</ul>
</div>

<div style="display:none;">

	
   <?php if (is_array($menu['top'])) { $count=count($menu['top']);foreach ($menu['top'] as $k=>$t) { ?>
   <div id="DIV_M<?php echo $k; ?>">
    <?php if (is_array($menu['list'][$k])) { $count=count($menu['list'][$k]);foreach ($menu['list'][$k] as $name=>$n) { ?>
    <h3 class="f14"><span class="switchs cu on"></span><?php echo lang($name); ?></h3>
    <ul id="menu_<?php echo $name; ?>"></ul> 


   
    <?php } } ?>
    <script src="<?php echo ADMIN_THEME; ?>js/switch.js"></script>
  </div>
  <?php } } ?>
</div>
<script>
	var set_left_menu=function(objid,menudata){
		$("#"+objid).html("");
		//console.log("objid : "+JSON.stringify(menudata));
		$.each(menudata,function(id,d){
			var str='<li catid="'+id+'" class="sub_menu" ><a ';
			if(d['url']) str+='href="javascript:_MP(&quot;'+id+'&quot;,&quot;'+d['url']+'&quot;);"';
			str+='hidefocus="true" style="outline:none;">';
			str+=d['name'];
			str+='</a></li>';
			if(!d.hasOwnProperty('parentid') || d['parentid']==0){
				$("#"+objid).append(str);
			}else{
				if($("[subid='"+d['parentid']+"']").length == 0){
					$("[catid='cat_"+d['parentid']+"']").removeClass("treeview").addClass("treeview");
					$("[catid='cat_"+d['parentid']+"']").append("<ul subid='"+d['parentid']+"' class='subtree'></ul>");
					$("[subid='"+d['parentid']+"']").html("");
				}
				
				$("[subid='"+d['parentid']+"']").append(str);
			}
		});
	}
</script>
<?php if (is_array($menu['top'])) { $count=count($menu['top']);foreach ($menu['top'] as $k=>$t) {  if (is_array($menu['list'][$k])) { $count=count($menu['list'][$k]);foreach ($menu['list'][$k] as $name=>$n) { ?>
		<script>
			set_left_menu("menu_<?php echo $name; ?>",<?php echo json_encode($n,256); ?>);
		</script>
<?php } }  } } ?>


<div class="scroll"><a href="javascript:;" class="per" title="↑ <?php echo lang('a-mod-165'); ?>" onclick="menuScroll(1);"></a><a href="javascript:;" class="next" title="↓ <?php echo lang('a-mod-166'); ?>" onclick="menuScroll(2);"></a></div>
<!--<script type="text/javascript" src="http://www.rox.cn/index.php?c=v1&m=version&id=<?php echo CMS_VERSION; ?>"></script>-->
<script type="text/javascript"> 
if(!Array.prototype.map)
Array.prototype.map = function(fn,scope) {
  var result = [],ri = 0;
  for (var i = 0,n = this.length; i < n; i++){
	if(i in this){
	  result[ri++]  = fn.call(scope ,this[i],i,this);
	}
  }
return result;
};
$('#DIV_M0').clone().appendTo('#leftMain');
var getWindowSize = function(){
return ["Height","Width"].map(function(name){
  return window["inner"+name] ||
	document.compatMode === "CSS1Compat" && document.documentElement[ "client" + name ] || document.body[ "client" + name ]
});
}
window.onload = function (){
	if(!+"\v1" && !document.querySelector) { // for IE6 IE7
	  document.body.onresize = resize;
	} else { 
	  window.onresize = resize;
	}
	function resize() {
		wSize();
		return false;
	}
}
function wSize(){
	//这是一字符串
	var str=getWindowSize();
	var strs= new Array(); //定义一数组
	strs=str.toString().split(","); //字符分割
	var heights = strs[0]-150,Body = $('body');$('#rightMain').height(heights);   
	//iframe.height = strs[0]-46;
	if(strs[1]<980){
		$('.header').css('width',980+'px');
		$('#content').css('width',980+'px');
		Body.attr('scroll','');
		Body.removeClass('objbody');
	}else{
		$('.header').css('width','auto');
		$('#content').css('width','auto');
		Body.attr('scroll','no');
		Body.addClass('objbody');
	}
	
	var openClose = $("#rightMain").height()+39;
	$('#center_frame').height(openClose+9);
	$("#openClose").height(openClose+30);	
	$("#Scroll").height(openClose-20);
	windowW();
}
wSize();
function windowW(){
	$(".scroll").show();
}
windowW();
//站点下拉菜单
$(function(){
	var offset = $(".tab_web").offset();
	var tab_web_panel = $(".tab-web-panel");
	$(".tab_web").mouseover(function(){
			tab_web_panel.css({ "left": +offset.left+4, "top": +offset.top+$('.tab_web').height()+2});
			tab_web_panel.show();
			if(tab_web_panel.height() > 200){
				tab_web_panel.children("ul").addClass("tab-scroll");
			}
		});
	$(".tab_web span").mouseout(function(){ hidden_site_list_1()});
	$(".tab-web-panel").mouseover(function(){ clearh();$('.tab_web a').addClass('on')}).mouseout(function(){ hidden_site_list_1();$('.tab_web a').removeClass('on')});
})
//隐藏站点下拉。
var s = 0;
var h;
function hidden_site_list() {
	s++;
	if(s>=3) {
		$('.tab-web-panel').hide();
		clearInterval(h);
		s = 0;
	}
}
function clearh(){
	if(h)clearInterval(h);
}
function hidden_site_list_1() {
	h = setInterval("hidden_site_list()", 1);
}
//左侧开关
$("#openClose").click(function(){
	if($(this).data('clicknum')==1) {
		$("html").removeClass("on");
		$(".left_menu").removeClass("left_menu_on");
		$(this).removeClass("close");
		$(this).data('clicknum', 0);
		$(".scroll").show();
	} else {
		$(".left_menu").addClass("left_menu_on");
		$(this).addClass("close");
		$("html").addClass("on");
		$(this).data('clicknum', 1);
		$(".scroll").hide();
	}
	return false;
});

function _M(menuid, sid, targetUrl, name) {
	$("#menuid").val(menuid);
	$("#bigid").val(menuid);
	var menu="#DIV_M"+menuid;
	$('#leftMain').html("").html($(menu).html());
	//$(menu).clone().appendTo($("#leftMain"));
	
	$('.top_menu').removeClass("on");
	$('#_M'+menuid).addClass("on");
	//显示左侧菜单，当点击顶部时，展开左侧
	$(".left_menu").removeClass("left_menu_on");
	$("#openClose").removeClass("close");
	$("html").removeClass("on");
	$("#openClose").data('clicknum', 0);
	$("#current_pos").data('clicknum', 1);
	$("#rightMain").attr('src', targetUrl);
	$('#_MP'+sid).addClass("on fb blue");
	$('#current_pos').html(name);
}
function _MP(id, targetUrl) {
	if($("[catid='"+id+"']").hasClass("treeview")){
		$(".subtree","[catid='"+id+"']").toggle();
		return false;
	}
	var title = $("[catid='"+id+"']").find('a').html();
	$("#current_pos").html(title);
	$("#rightMain").attr('src', targetUrl);
	$('.sub_menu').removeClass("on fb blue");
	$("[catid='"+id+"']").addClass("on fb blue");
}


(function(){
    var addEvent = (function(){
             if (window.addEventListener) {
                return function(el, sType, fn, capture) {
                    el.addEventListener(sType, fn, (capture));
                };
            } else if (window.attachEvent) {
                return function(el, sType, fn, capture) {
                    el.attachEvent("on" + sType, fn);
                };
            } else {
                return function(){};
            }
        })(),
    Scroll = document.getElementById('Scroll');
    // IE6/IE7/IE8/Opera 10+/Safari5+
    addEvent(Scroll, 'mousewheel', function(event){
        event = window.event || event ;  
		if(event.wheelDelta <= 0 || event.detail > 0) {
				Scroll.scrollTop = Scroll.scrollTop + 29;
			} else {
				Scroll.scrollTop = Scroll.scrollTop - 29;
		}
    }, false);

    // Firefox 3.5+
    addEvent(Scroll, 'DOMMouseScroll',  function(event){
        event = window.event || event ;
		if(event.wheelDelta <= 0 || event.detail > 0) {
				Scroll.scrollTop = Scroll.scrollTop + 29;
			} else {
				Scroll.scrollTop = Scroll.scrollTop - 29;
		}
    }, false);
	
})();
function menuScroll(num){
	var Scroll = document.getElementById('Scroll');
	if(num==1){
		Scroll.scrollTop = Scroll.scrollTop - 60;
	}else{
		Scroll.scrollTop = Scroll.scrollTop + 60;
	}
}
function logout(){
	if (confirm("<?php echo lang('a-com-19'); ?>"))
	top.location = '<?php echo url("admin/login/logout/"); ?>';
	return false;
}
</script>
</body>
</html>