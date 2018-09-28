<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色分配权限</title>
<link rel="stylesheet" href="${ctx }/resources/zTree/css/metroStyle/metroStyle.css" type="text/css">
<link rel="stylesheet" href="${ctx }/resources/layui/css/layui.css" media="all" />
<script type="text/javascript" src="${ctx }/resources/zTree/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${ctx }/resources/zTree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${ctx }/resources/zTree/js/jquery.ztree.excheck.js"></script>
</head>
<body>
	<div  id="permissionTree" class="ztree"></div>
	<div style="text-align: center;">
		<a href="javascript:void(0)" class="layui-btn" onclick="saveRolePermission()" >确认分配</a>
	</div>
	<script type="text/javascript" src="${ctx }/resources/layui/layui.js"></script>
</body>
<script type="text/javascript">
//多选树的加载
	var setting = {
			data: {
				simpleData: {
					enable: true
				}
			},
			check:{
				enable:true
			}
		};
	$(document).ready(function(){
		initTree();
	});
	function initTree(){
		$.post("${ctx}/role/loadRolePermission.action?id=${roleId}",function(json){
			$.fn.zTree.init($("#permissionTree"), setting, json);
		})
	}
	var layer;
	layui.use('layer',function(){
		layer=layui.layer;
	})

	function saveRolePermission() {
		var treeObj = $.fn.zTree.getZTreeObj("permissionTree");
  		//得到zTree里被选择的菜单对象
  		var nodes = treeObj.getCheckedNodes(true);
  		 var  roleId = [];
         for (var i in nodes) {
             roleId.push(nodes[i].id);
         }
         $.post("${ctx}/role/saveRolePermission.action",{id:'${roleId}',roleIds:JSON.stringify(roleId)},function(data){
             layer.msg(data.msg);
           //关闭窗口
             var index = parent.layer.getFrameIndex(window.name);
             parent.layer.close(index);
              })
              return false;
	}
</script>
</html>