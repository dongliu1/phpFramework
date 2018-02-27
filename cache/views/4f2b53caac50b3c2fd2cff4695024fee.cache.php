<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title><?php echo $meta_title; ?></title>
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
<link rel="stylesheet" type="text/css" href="<?php echo JLIB_PATH; ?>jqueryui/light/jquery-ui.min.css" />
<link rel="stylesheet" type="text/css" href="<?php echo JLIB_PATH; ?>fonts/shenku/css/sk.css" />
<link rel="stylesheet" type="text/css" href="<?php echo JLIB_PATH; ?>fonts/awesome/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="<?php echo JLIB_PATH; ?>fonts/ionicons/ionicons.min.css" />
<link rel="stylesheet" type="text/css" href="<?php echo MEMBER_THEME; ?>themes/dark.css" />

<script type="text/javascript" src="<?php echo JLIB_PATH; ?>jquery/jquery.min.js"></script>
<script type="text/javascript" src="<?php echo JLIB_PATH; ?>momentjs/moment.min.js"></script>
<script type="text/javascript" src="<?php echo JLIB_PATH; ?>jqueryui/jquery-ui.min.js"></script>

<script type="text/javascript">
var sitepath = '<?php echo SITE_PATH;  echo ENTRY_SCRIPT_NAME; ?>';
var rcms_admin_document = "<?php echo $cats[$data['catid']]['setting']['document']; ?>";

function init_combotree(id,url){
	$('#'+id).combotree({
		url: url,
		required:true,
		loadFilter:function(rows){return treedata_convert(rows);}
	});
}

function treedata_convert(rows){
    var nodes = [];
	//生成根节点
	$.each(rows,function(id,row){
		if(!rows.hasOwnProperty(row.parentid)){
			nodes.push({id:row.id,text:row.name,idx:row.idx});
		}
	})
	//console.log(nodes);
    var toDo = new Array();
    for(var i=0; i<nodes.length; i++){toDo.push(nodes[i]);}
    while(toDo.length){
        var node = toDo.shift(); 
		$.each(rows,function(id,row){
			if (row.parentid == node.id){
                var child = {id:row.id,text:row.name,idx:row.idx};
                if (node.children){
                    node.children.push(child);
                } else {
                    node.children = [child];
                }
                toDo.push(child);
            }
		});
    }
    return nodes;
}
</script>
</head>
<body class="<?php echo $memberinfo['theme']; ?>" style="margin:0;overflow:scroll;width:100%">

