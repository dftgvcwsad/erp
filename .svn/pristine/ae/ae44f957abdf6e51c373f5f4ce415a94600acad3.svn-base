<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>权限管理--左边的菜单树</title>
<link rel="stylesheet" href="${ctx }/resources/zTree/css/metroStyle/metroStyle.css" type="text/css">
<script type="text/javascript" src="${ctx }/resources/zTree/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${ctx }/resources/zTree/js/jquery.ztree.core.js"></script>
</head>
<body class="childrenBody">
	<ul id="treePermission" class="ztree"></ul>
</body>
<script type="text/javascript">
function zTreeOnClick(event, treeId, treeNode) {
	  //调用permissionRight页面的reloadTable  把treeNode.id传过去
	  window.parent.right.reloadTable(treeNode.id);
}
//多选树的加载
var setting = {
	data: {
		simpleData: {
			enable: true
		}
	},
	callback: {
		onClick: zTreeOnClick
	}
};
$(document).ready(function(){
	initTree();
});
function initTree() {
	$.post("${ctx}/permission/loadPermissionTree.action",function(json){
		$.fn.zTree.init($("#treePermission"), setting, json);
	});
}
</script>
</html>