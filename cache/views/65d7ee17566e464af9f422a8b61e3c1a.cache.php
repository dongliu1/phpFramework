<?php include $this->_include('index-header');  $index_cat=116;$index_title=$cats[$index_cat]['catname']; /*首页默认显示内容*/  ?>
<style>
	#index-tabs.ui-widget-content{border:0}
	#index-tabs .ui-corner-all{border-radius: 0;}
	#index-tabs .ui-widget-header{border:0}
	#index-tabs .ui-tabs-panel{padding:0}
	#index-tabs .li-tab-tool{border:0;background:transparent !important;cursor:pointer;padding:1px 5px 0}
	#index-tabs li a{padding:.1em 1.5em .1em .5em}
	#index-tabs li .fa-close{display:none;color:#999;position:absolute;top:0;right:0}
	#index-tabs li .fa-close:hover{background:#f00;border-radius:2px;color:#eee}
	#index-tabs li:hover .fa-close{display:inline-block}

.sidebar-menu{list-style:none;margin:0;padding:0;font-size:1.1em;font-weight:400;}
.sidebar-menu>li{position:relative;margin:0;padding:0}
.sidebar-menu>li>a{padding:12px 5px 12px 15px;border-left:3px solid transparent;display:block;text-decoration: none;}
.sidebar-menu>li>a>.fa,.sidebar-menu>li>a>.glyphicon,.sidebar-menu>li>a>.ion{width:20px}
.sidebar-menu>li .badge,.sidebar-menu>li .label{margin-top:3px;margin-right:5px}
.sidebar-menu li.header{padding:10px 10px 10px 15px;font-size:12px}
.sidebar-menu>li.header .sidebar-toggle{display:inline-block;width:30px;text-align:center;} 
.sidebar-menu li>a>.fa-angle-left{width:auto;height:auto;padding:0;margin-right:10px;margin-top:3px}
.sidebar-menu li.active>a>.fa-angle-left{-webkit-transform:rotate(-90deg);-ms-transform:rotate(-90deg);-o-transform:rotate(-90deg);transform:rotate(-90deg)}
.sidebar-menu li.active>.treeview-menu{display:block}
.sidebar-menu .treeview-menu{display:none;list-style:none;padding:0;margin:0;padding-left:5px}
.sidebar-menu .treeview-menu .treeview-menu{padding-left:20px}
.sidebar-menu .treeview-menu>li{margin:0}
.sidebar-menu .treeview-menu>li>a{padding:5px 5px 5px 15px;text-decoration: none;display:block;/*font-size:14px*/}
.sidebar-menu .treeview-menu>li>a>.fa,.sidebar-menu .treeview-menu>li>a>.glyphicon,.sidebar-menu .treeview-menu>li>a>.ion{width:20px;margin:0px 10px}
.sidebar-menu .treeview-menu>li>a>.fa-angle-down,.sidebar-menu .treeview-menu>li>a>.fa-angle-left{width:auto}

.sidebar-mini.sidebar-collapse .content-wrapper,.sidebar-mini.sidebar-collapse .main-footer,.sidebar-mini.sidebar-collapse .right-side{margin-left:50px!important;z-index:840;height:100%;}
.sidebar-mini.sidebar-collapse .main-sidebar{-webkit-transform:translate(0,0);-ms-transform:translate(0,0);-o-transform:translate(0,0);transform:translate(0,0);width:50px!important;z-index:850}
.sidebar-mini.sidebar-collapse .sidebar-menu>li{position:relative}
.sidebar-mini.sidebar-collapse .sidebar-menu>li>a{margin-right:0}
.sidebar-mini.sidebar-collapse .sidebar-menu>li>a>span{border-top-right-radius:4px}
.sidebar-mini.sidebar-collapse .sidebar-menu>li:not(.treeview)>a>span{border-bottom-right-radius:4px}
.sidebar-mini.sidebar-collapse .sidebar-menu>li>.treeview-menu{padding-top:5px;padding-bottom:5px;border-bottom-right-radius:4px}
.sidebar-mini.sidebar-collapse .sidebar-menu>li:hover>.treeview-menu,.sidebar-mini.sidebar-collapse .sidebar-menu>li:hover>a>span:not(.pull-right){display:block!important;position:absolute;width:180px;left:50px}
.sidebar-mini.sidebar-collapse .sidebar-menu>li:hover>a>span{top:0;margin-left:-3px;padding:12px 5px 12px 20px;background-color:inherit}
.sidebar-mini.sidebar-collapse .sidebar-menu>li:hover>.treeview-menu{top:44px;margin-left:0}
.sidebar-mini.sidebar-collapse .main-sidebar .user-panel>.info,.sidebar-mini.sidebar-collapse .sidebar-form,.sidebar-mini.sidebar-collapse .sidebar-menu li.header span,.sidebar-mini.sidebar-collapse .sidebar-menu>li>.treeview-menu,.sidebar-mini.sidebar-collapse .sidebar-menu>li>a>.pull-right,.sidebar-mini.sidebar-collapse .sidebar-menu>li>a>span{display:none!important;-webkit-transform:translateZ(0)}
.sidebar-mini.sidebar-collapse .main-sidebar .logo{width:50px}
.sidebar-mini.sidebar-collapse .main-sidebar .logo>.logo-mini{display:block;margin-left:-15px;margin-right:-15px;font-size:18px}
.sidebar-mini.sidebar-collapse .main-sidebar .logo>.logo-lg{display:none}
.sidebar-mini.sidebar-collapse .main-header .navbar{margin-left:50px}

<!--.left-bottom{padding-left:15px;width:150px;position:absolute;bottom:0px;}
.left-bottom div{width:60px;display:inline-block;height:40px;border:0;color:#999;margin:5px;border-radius:4px;border:1px solid #999}
.left-bottom div>span{width:30px;float:right;padding:4px 5px 0 0;}
.left-bottom div>i{float:left;padding: 10px 0 0 5px;font-size:small}-->


</style>
	    <div class="middle-left">
	        <div class="menu-left" id="index-menu">
				<div class="left-top">
					<ul class="sidebar-menu">
					<?php echo $mynav; ?>
					</ul>
				</div>
				<!--<div class="left-bottom">
					<div><i class="fa fa-bell-o"></i><span>电站验收</span></div>
					<div><i class="fa fa-bell-o"></i><span>电站运维</span></div>
					<div><i class="fa fa-bell-o"></i><span>电站诊断</span></div>
					<div><i class="fa fa-bell-o"></i><span>金融服务</span></div>
				</div>-->
			</div>
        </div>
		<div class="middle-right">
			<div class="content-info">
			<div id="index-tabs" style="background:transparent">

			  <ul>
				<!--li id="li-tab-cat-<?php echo $index_cat; ?>"><a href="#tab-cat-<?php echo $index_cat; ?>">集团首页</a></li-->
				<li id="li_tab_tool_1" class="pull-right li-tab-tool"><span href="#" onclick="var tabid=$('#index-tabs>ul>li').eq($('#index-tabs').tabs('option','active')).attr('aria-controls');var aframe=$('#frame-'+tabid);$(aframe).attr('src',$(aframe).attr('src'));" class="text-muted"><i class="fa fa-refresh"></i></span></li>
			  </ul>
			  <div class="tab-content" id="index-tab-content" style="overflow-y:scroll;overflow-x:hidden;border-top:1px dotted #999;background:#e6e8e8">
				<!--div id="tabs-1">
					<iframe src="<?php echo url('member/content',array('catid'=>$index_cat)); ?>" width="100%" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes" ></iframe>
				</div-->
			  </div>
			</div>
			
			
			</div>
		</div>
  <script>
  $(function() {
    $("#index-tabs" ).tabs();
	rox_fn_addTabs({ id: "cat-<?php echo $index_cat; ?>", title: "<?php echo $index_title; ?>",url:"<?php echo url('member/content',array('catid'=>$index_cat)); ?>", close: true });
	$("#index-menu .sidebar-menu li a").off("click").on("click",function(){	//menu点击触发打开tab操作
		//console.log($(this).html());
		if($(this).attr("href")=="#") {
			$("#"+$(this).attr("tabid")+"-menu").toggle();
			return true;
		}else{
			rox_fn_addTabs({id: $(this).attr("tabid"), title: $(this).text(),url:$(this).attr("href"), close: true});
			return false;
		}
	});
	
	
	init_treeview();
	
	$(window).resize(function() { 
		fullwindows();
	});
	
	
	fullwindows();
  });

  
	var init_treeview=function(){
		$(".menu-left .treeview").on("click",function(){
			$(".treeview-menu",this).toggle();
		
		})
	
	}
	function fullwindows(){
		//$("#index-body").height($( window ).height()-15);
		mainHeight = $(document.body).height() - 50;//固定TAB中IFRAME高度
		$("iframe").height(mainHeight);
	}
	
	
	
	function openTab(tabLabel,id) {

            var id = "tabs-" + id,//生成tab页的id
              li = $(tabTemplate.replace(/#\{href\}/g, "#" + id).replace(/#\{label\}/g, tabLabel)),
              tabContentHtml = tabContent.val() || "Tab " + tabLabel + " content.",
              existing = tabs.find("[id='" + id + "']");
            if (existing.length == 0) {
                tabs.find(".ui-tabs-nav").append(li);
                tabs.append("<div id='" + id + "'><p>" + tabContentHtml + "</p></div>");
                tabs.tabs("refresh");
            }
            existing = tabs.find("[id='" + id + "']");
            var index = tabs.find(".ui-tabs-nav li").index(existing);
            tabs.tabs("option", "active", index);
        }

  
  //添加tab
var rox_fn_addTabs = function (obj) {
    tabid = "tab-" + obj.id;
    //$(".active").removeClass("active"); 
	
	
    if (!$("#" + tabid)[0]) {	//如果TAB不存在，创建一个新的TAB
        mainHeight = $(document.body).height() - 50;//固定TAB中IFRAME高度
        
		//.tabs( 'add' , url , label , [index] ) 
		title = '<li id="li-' + tabid + '"><a href="#' + tabid + '" aria-controls="' + tabid + '" role="tab" data-toggle="tab">' + obj.title+'</a>';
		if (obj.close) {
            title += ' <i class="fa fa-close tabclose""></i>';
        }
		title += '</li>';
        if (obj.content) {	//是否指定TAB内容
            content = '<div role="tabpanel" class="tab-pane" id="' + tabid + '">' + obj.content + '</div>';
        } else {//没有内容，使用IFRAME打开链接
            content = '<div role="tabpanel" class="tab-pane" id="' + tabid + '"><iframe id="frame-'+tabid+'" name="frame-'+tabid+'" src="' + obj.url + '" width="100%"  frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes" style="height:'+mainHeight+'px"></iframe></div>';
        }
		$("#index-tabs .li-tab-tool:eq(0)").before(title);
        $("#index-tab-content").append(content);
        $("#index-tabs").tabs("refresh");
		$("i.tabclose","#li-"+ tabid).on("click",function(){
			tabid=$(this).parent().attr("aria-controls");
			rox_fn_closeTab(tabid);
		})
    }
    
	$( "[href='#"+tabid+"']").trigger( "click" );
};
 
var rox_fn_closeTab = function (id) {
	var tabid=$("li.ui-tabs-active",'#index-tabs>ul').attr('aria-controls');
    //如果关闭的是当前激活的TAB，激活他的前一个TAB
	if (tabid == id) {
		$("#li-" + id).prev().find("a").trigger( "click" );
    }
    //关闭TAB
    $("#li-" + id).remove();
    $("#" + id).remove();
};

  </script>

<?php include $this->_include('footer'); ?>