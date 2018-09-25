<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>流程部署列表---仓库管理系统 2.0</title>
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
		<fieldset class="layui-elem-field layui-field-title">
    		<legend>查询条件</legend>
		</fieldset>
		<form class="layui-form"  id="searchForm" method="post">
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">部署名称</label>
						<div class="layui-input-inline">
							<input type="text" name="deploymentName" id="deploymentName" autocomplete="off" class="layui-input " />
						</div>
					</div>
					<div class="layui-inline">
					<a class="layui-btn search_btn" data-type="reload">搜索</a>
					<button type="reset" class="layui-btn layui-btn-warm" >重置</button>
					</div>
				</div>
		</form>
	<script type="text/html"  id="processDeploymentToolBar">
	<a class="layui-btn layui-btn-xs layui-btn layui-btn-normal" lay-event="add">添加部署</a>
	</script>
	<table id="processDeploymentList" lay-filter="processDeploymentList"></table>
	<table id="processDefList" lay-filter="processDefList"></table>
	<!--操作-->
	<script type="text/html" id="processDeploymentListBar">
		<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
		<a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="viewProcessImge">查看流程图</a>
	</script>
<script type="text/javascript" src="${ctx }/resources/layui/layui.js"></script>
<script type="text/javascript">
var tableInDeploy;
var tableInProcessDef;
layui.use(['form','layer','laydate','table','laytpl'],function(){
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        laytpl = layui.laytpl,
        table = layui.table;
   
    //部署列表
    tableInDeploy = table.render({
        elem: '#processDeploymentList',
        url : '${ctx }/workFlow/queryAllProcessDeployment.action',
        cellMinWidth : 95,
        page : true,
        toolbar: '#processDeploymentToolBar',
        defaultToolbar: [],
        height : "full-400",
        limit : 10,
        limits : [10,15,20,25],
        id : "processDeploymentListTable",
        cols : [[
            {type: "checkbox", fixed:"left", width:50},
            {field: 'id', title: '部署ID', width:80, align:"center"},
            {field: 'name', title: '部署名称', width:230, align:"center"},
            {field: 'deploymentTime', title: '部署时间',  align:"center"},
            {title: '操作', width:180, templet:'#processDeploymentListBar',fixed:"right",align:"center"}
        ]]
    });
    //流程定义列表
    tableInProcessDef = table.render({
        elem: '#processDefList',
        url : '${ctx }/workFlow/queryAllprocessDef.action',
        cellMinWidth : 95,
        page : true,
        toolbar: true,
        defaultToolbar: [],
        height : "full-400",
        limit : 10,
        limits : [10,15,20,25],
        id : "processDefListTable",
        cols : [[
            {type: "checkbox", fixed:"left", width:50},
            {field: 'id', title: '流程定义ID', width:80, align:"center"},
            {field: 'name', title: '定义名称', width:230, align:"center"},
            {field: 'key', title: '定义KEY', width:230, align:"center"},
            {field: 'version', title: '流程定义版本',  align:"center"},
            {field: 'deploymentId', title: '部署ID',  align:"center"},
            {field: 'resourceName', title: '资源名称[bpmn]',  align:"center"},
            {field: 'diagramResourceName', title: '资源名称[png]',  align:"center"}
        ]]
    });
    //搜索【此功能需要后台配合，所以暂时没有动态效果演示】
    $(".search_btn").on("click",function(){
        table.reload("processDeploymentListTable",{
            page: {
                curr: 1 //重新从第 1 页开始
            },
            where: {
            	deploymentName: $("#deploymentName").val()//搜索的关键字
            }
        })
         table.reload("processDefListTable",{
            page: {
                curr: 1 //重新从第 1 页开始
            },
            where: {
            	deploymentName: $("#deploymentName").val()//搜索的关键字
            }
        })
    });
    //监听头工具栏事件
    table.on('toolbar(processDeploymentList)', function(obj){
      var checkStatus = table.checkStatus(obj.config.id)
      ,data = checkStatus.data; //获取选中的数据
      switch(obj.event){
      case 'add':
      	addProcessDeployment();
      break;
      };
    });
    //添加流程部署
    function addProcessDeployment(){
        var index = layui.layer.open({
            title : "添加流程部署",
            //area设置弹出层大小
            area:["700px","300px"],
            type : 2,
            content : "${ctx}/workFlow/toAddProcessDeployment.action",
            success : function(layero, index){
                var body = layui.layer.getChildFrame('body', index);
            }
        })
       // layui.layer.full(index);//最大化窗口
        //改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
        $(window).on("resize",function(){
            layui.layer.full(index);
        })
    }
    //列表操作
    table.on('tool(processDeploymentList)', function(obj){
        var layEvent = obj.event,
            data = obj.data;
        if(layEvent === 'del'){ //删除
            layer.confirm('确定删除此流程部署？',{icon:3, title:'提示信息'},function(index){
                 $.post("${ctx}/workFlow/deleteDeployment.action",{
                	 deploymentId : data.id  //将需要删除的roleId作为参数传入
                 },function(data){
                	 layer.msg(data.msg);
                	 tableInDeploy.reload();
                	 tableInProcessDef.reload();
                    layer.close(index);
                 })
            });
        } else if(layEvent === 'viewProcessImge'){ //查看流程图
        	viewProcessImge(data);
        }
    });
    function viewProcessImge(data) {
    	var index = layui.layer.open({
            title : "【"+data.name+"】的流程图",
            //area设置弹出层大小
            area:["500px","600px"],
            type : 2,
            content : "${ctx}/workFlow/toViewProcessImge.action?deploymentId="+data.id,
            success : function(layero, index){
            }
        })
       // layui.layer.full(index);//最大化窗口
        //改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
        $(window).on("resize",function(){
            layui.layer.full(index);
        })
	}
})
</script>
</body>
</html>