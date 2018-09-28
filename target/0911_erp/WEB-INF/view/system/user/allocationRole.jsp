<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>用户分配角色列表---仓库管理系统 2.0</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${ctx }/resources/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="${ctx }/resources/css/public.css" media="all" />
</head>
<body class="childrenBody">
<form class="layui-form">
	<table id="roleList" lay-filter="roleList"></table>
	<script type="text/html"  id="userToolBar">
	<a class="layui-btn layui-btn layui-btn-normal" lay-event="saveRole">保存</a>
	</script>
</form>
<script type="text/javascript" src="${ctx }/resources/layui/layui.js"></script>
<script type="text/javascript" src="${ctx }/resources/zTree/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
var tableIns;
layui.use(['form','layer','laydate','table'],function(){
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        table = layui.table;
   
    //角色列表
    tableIns = table.render({
        elem: '#roleList',
        url : '${ctx }/user/queryUserAllRole.action?id=${userVo.id}',
        cellMinWidth : 95,
        toolbar: '#userToolBar',
        defaultToolbar: [],
        id : "roleListTable",
        cols : [[
            {type: "checkbox", fixed:"left", width:50},
            {field: 'id', title: '角色ID', width:80, align:"center"},
            {field: 'name', title: '角色名称', width:230, align:"center"},
            {field: 'remark', title: '角色备注',  align:"center"}
        ]]
    });
    //监听头工具栏事件
    table.on('toolbar(roleList)', function(obj){
      var checkStatus = table.checkStatus(obj.config.id)
      ,data = checkStatus.data; //获取选中的数据
      switch(obj.event){
        case 'saveRole':
        	  //批量保存角色
              userId = [];
              for (var i in data) {
                  userId.push(data[i].id);
              }
              layer.confirm('确定保存角色？', {icon: 3, title: '提示信息'}, function (index) {
              	 //将需要批量保存角色的rid作为json参数传入 
                  $.post("${ctx}/user/saveUserRole.action",{id:'${userVo.id}',userIds : JSON.stringify(userId) },function(data){
              	   layer.msg(data.msg);
                  tableIns.reload();
                  })
              })
        break;
      };
    });
})
  
</script>
</body>
</html>