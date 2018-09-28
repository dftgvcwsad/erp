<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>任务列表---仓库管理系统 2.0</title>
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
	<table id="taskList" lay-filter="taskList"></table>
	<!--操作-->
	<script type="text/html" id="taskListBar">
		<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="toDoTask">办理任务</a>
		<a class="layui-btn layui-btn-xs" lay-event="toViewProcessImage">查看流程图</a>
	</script>
<script type="text/javascript" src="${ctx }/resources/layui/layui.js"></script>
<script type="text/javascript">
var  tableIns;
layui.use(['form','layer','laydate','table','laytpl'],function(){
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        laytpl = layui.laytpl,
        table = layui.table;
    //待办任务列表
  tableIns= table.render({
        elem: '#taskList',
        url : '${ctx }/workFlow/queryCurrentUserTask.action',
        cellMinWidth : 95,
        toolbar: true,
        defaultToolbar: ['filter'],
        page : true,
        height : "full-125",
        limit : 10,
        limits : [10,15,20,25],
        id : "taskListTable",
        cols : [[
            {field: 'id', title: '任务ID', width:80, align:"center"},
            {field: 'name', title: '任务名称', align:"center"},
            {field: 'createTime', title: '任务创建时间',width:200, align:"center"},
            {field: 'assignee', title: '任务办理人', align:'center'},
            {title: '操作', width:170, templet:'#taskListBar',fixed:"right",align:"center"}
        ]]
    });
    //办理任务
    function toDoTask(data){
        var index = layui.layer.open({
            title : "办理任务",
            //area设置弹出层大小
            area:["800px","600px"],
            type : 2,
            content : "${ctx}/workFlow/toDoTask.action?taskId="+data.id,
            success : function(layero, index){
                var body = layui.layer.getChildFrame('body', index);
                setTimeout(function(){
                    layui.layer.tips('点击此处返回任务列表', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                },500)
            }
        })
       // layui.layer.full(index);//最大化窗口
        //改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
        $(window).on("resize",function(){
            layui.layer.full(index);
        })
    }
    //列表操作
    table.on('tool(taskList)', function(obj){
        var layEvent = obj.event,
            data = obj.data;
        if(layEvent === 'toDoTask'){ //办理任务
        	toDoTask(data);
        }else if(layEvent === 'toViewProcessImage'){ //查看任务图
        	toViewProcessImage(data.id);
        } 
    });
})
</script>
</body>
</html>