<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>登录日志---仓库管理系统 2.0</title>
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
	<blockquote class="layui-elem-quote quoteBox">
		<form class="layui-form">
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">登陆名称</label>
						<div class="layui-input-inline">
							<input type="text" name="loginname" id="loginname" autocomplete="off" class="layui-input " />
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">登陆IP</label>
						<div class="layui-input-inline">
							<input type="text" name="loginip" id="loginip" autocomplete="off"
								class="layui-input " >
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">开始日期</label>
						<div class="layui-input-inline">
							<input type="text" name="startDate" id="startDate"
								placeholder="yyyy-MM-dd HH:mm:ss"
								autocomplete="off" class="layui-input ">
						</div>
					</div>
				</div>
				<div class="layui-inline">
						<label class="layui-form-label">结束日期</label>
						<div class="layui-input-inline">
							<input type="text" name="endDate" id="endDate"
								placeholder="yyyy-MM-dd HH:mm:ss"
								autocomplete="off" class="layui-input ">
						</div>
					</div>
				</div>
				<div class="layui-form-item" align="center">
			<a class="layui-btn search_btn" data-type="reload">搜索</a>
			<button type="reset" class="layui-btn layui-btn-warm" >重置</button>
			</div>
		</form>
	</blockquote>
	<script type="text/html"  id="logInfoToolBar">
	<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">批量删除</a>
	</script>
	<table id="logInfoList" lay-filter="logInfoList"></table>
	<!--操作-->
	<script type="text/html" id="logInfoListBar">
		<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
	</script>
</form>
<script type="text/javascript" src="${ctx }/resources/layui/layui.js"></script>
<script type="text/javascript">
layui.use(['form','layer','laydate','table','laytpl'],function(){
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        laydate = layui.laydate,
        laytpl = layui.laytpl,
        table = layui.table;
  //日期
    laydate.render({
      elem: '#startDate'
    	  ,type: 'datetime'
    });
    laydate.render({
      elem: '#endDate'
    	  ,type: 'datetime'
    });
    //新闻列表
    var tableIns = table.render({
        elem: '#logInfoList',
        url : '${ctx }/logInfo/queryAllLogInfo.action',
        cellMinWidth : 95,
        page : true,
        toolbar: '#logInfoToolBar',
        defaultToolbar: ['filter', 'exports'],
        height : "full-125",
        limit : 10,
        limits : [10,15,20,25],
        id : "logInfoListTable",
        cols : [[
            {type: "checkbox", fixed:"left", width:50},
            {field: 'id', title: '日志ID', width:100, align:"center"},
            {field: 'loginname', title: '登陆用户信息'},
            {field: 'loginip', title: '登陆IP', align:'center'},
            {field: 'logintime', title: '登陆时间', align:'center'},
            {title: '操作', width:80, templet:'#logInfoListBar',fixed:"right",align:"center"}
        ]]
    });

    //监听头工具栏事件
    table.on('toolbar(logInfoList)', function(obj){
      var checkStatus = table.checkStatus(obj.config.id)
      ,data = checkStatus.data; //获取选中的数据
      switch(obj.event){
        case 'delete':
          if(data.length === 0){
            layer.msg('请选择一行');
          } else {
        	  //批量删除
              var  logInfoId = [];
              for (var i in data) {
                  logInfoId.push(data[i].id);
              }
              layer.confirm('确定删除选中的文章？', {icon: 3, title: '提示信息'}, function (index) {
            	  //将需要删除的logInfoId作为json参数传入 
                   $.post("${ctx}/logInfo/batchDeleteLogInfo.action",{logInfoIds:JSON.stringify(logInfoId)},function(data){
                 layer.msg(data.msg);
                  tableIns.reload();
                  layer.close(index);
                  })
              })
          }
        break;
      };
    });
    

    //搜索【此功能需要后台配合，所以暂时没有动态效果演示】
    $(".search_btn").on("click",function(){
            table.reload("logInfoListTable",{
                page: {
                    curr: 1 //重新从第 1 页开始
                },
                where: {
                		loginname: $("#loginname").val(),//搜索的关键字
               		 	loginip: $("#loginip").val(),
               			startDate: $("#startDate").val(),
                		endDate: $("#endDate").val()
                }
            })
    });

    //列表操作
    table.on('tool(logInfoList)', function(obj){
        var layEvent = obj.event,
            data = obj.data;
        if(layEvent === 'del'){ //删除
            layer.confirm('确定删除此日志？',{icon:3, title:'提示信息'},function(index){
                 $.post("${ctx}/logInfo/deleteLogInfo.action",{
                     id : data.id  //将需要删除的logInfoId作为参数传入
                 },function(data){
                	 layer.msg(data.msg);
                    tableIns.reload();
                    layer.close(index);
                 })
            });
        } else if(layEvent === 'look'){ //预览
            layer.alert("此功能需要前台展示，实际开发中传入对应的必要参数进行文章内容页面访问")
        }
    });
})
</script>
</body>
</html>