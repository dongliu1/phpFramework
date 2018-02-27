/*
 * RCMS
 */
if (undefined == rcms_admin_document) var rcms_admin_document="";
function preview(obj) {
	var filepath = $('#'+obj).val();
	if (filepath) {
		var content = '<img src="'+filepath+'?'+Math.random()+'" onload="if(this.width>$(window).width()/2)this.width=$(window).width()/2;" />';
	} else {
		var content = '没有图片';
	}
	art.dialog({title:'预览',fixed:true, content: content});
}

function file_info(obj) {
	var filepath = $('#'+obj).val();
	var content = '没有文件';
	if (filepath) {
		$.post(sitepath+'?c=api&a=fileinfo&id='+Math.random(), { file:filepath }, function(data){ 
			art.dialog({title:'文件信息',fixed:true, content: data});
		});
	} else {
		art.dialog({title:'文件信息',fixed:true, content: content});
	}
}

function uploadImage(obj, w, h, size) {
	var url = sitepath+'?c=attachment&a=image&w='+w+'&h='+h+'&size='+size+'&file='+$("#"+obj).val()+'&document='+rcms_admin_document;
	var winid = 'win_'+obj;
	art.dialog(
	    {id:winid, okVal:'确定', cancelVal:'取消', iframe:url, title:'上传', width:'470', height:'150', lock:true}, 
		function(){
		    var d = art.dialog({id:winid}).data.iframe;
			var filename = d.document.getElementById('filename').value;
			if (filename) {
				$("#"+obj).val(filename);
			} else {
			    alert('您还没有上传');
				return false;
			}
		},
		function(){
			art.dialog({id:winid}).close();
	    }
	);
	void(0);
}

function uploadFile(obj, type, size) {
	var url = sitepath+'?c=attachment&a=file&type='+type+'&size='+size+'&file='+$("#"+obj).val()+'&document='+rcms_admin_document;
	var winid = 'win_'+obj;
	art.dialog(
	    {id:winid, okVal:'确定', cancelVal:'取消', iframe:url, title:'上传', width:'470', height:'150', lock:true}, 
		function(){
		    var d = art.dialog({id:winid}).data.iframe;
			var filename = d.document.getElementById('filename').value;
			if (filename) {
				$("#"+obj).val(filename);
			} else {
			    alert('您还没有上传');
				return false;
			}
		},
		function(){
			art.dialog({id:winid}).close();
	    }
	);
	void(0);
}

function uploadFiles(obj, setting) {
	var url = sitepath+'?c=attachment&a=files&setting='+setting+'&document='+rcms_admin_document;
	var winid = 'win_'+obj;
	art.dialog(
	    {id:winid, okVal:'确定', cancelVal:'取消', iframe:url, title:'上传', width:'500', height:'420', lock:true}, 
		function(){
		    var d = art.dialog({id:winid}).data.iframe;
			var files = d.document.getElementById('att-status').innerHTML;
			var names = d.document.getElementById('att-name').innerHTML;
			var file = files.split('|');
			var name = names.split('|');
			for (var id in file) {
				var filepath = file[id];
				var filename = name[id];
	            if (filepath) {
					var c = '<li id="files_'+id+'">';
					c += '<input type="text" class="input-text" style="width:310px;" value="'+filepath+'" name="data['+obj+'][file][]">';
					c +='<input type="text" class="input-text" style="width:160px;" value="'+filename+'" name="data['+obj+'][alt][]">';
					c += '<a href="javascript:removediv(\''+id+'\');">移除</a> <a href="javascript:;" style="cursor:move;">排序</a></li>';
					$('#'+obj+'-sort-items').append(c);
				}
			}
			
		},
		function(){
			art.dialog({id:winid}).close();
	    }
	);
	void(0);
}

function get_kw() {
	$.post(sitepath+'?c=api&a=ajaxkw&id='+Math.random(), { data:$('#title').val() }, function(data){ 
        if(data && $('#keywords').val()=='') $('#keywords').val(data); 
	});
}

function removediv(fileid) {
	$('#files_'+fileid).remove();
}

function add_null_file(obj) {
    var id= parseInt(Math.random()*1000);
    var c = '<li id="files_'+id+'">';
	c += '<input type="text" class="input-text" style="width:310px;" value="" name="data['+obj+'][file][]">';
	c +='<input type="text" class="input-text" style="width:160px;" value="" name="data['+obj+'][alt][]">';
	c += '<a href="javascript:removediv(\''+id+'\');">'+'移除'+'</a> <a href="javascript:;" style="cursor:move;" title="'+'鼠标拖动即可'+'">'+'排序'+'</a></li>';
	$('#'+obj+'-sort-items').append(c);
}