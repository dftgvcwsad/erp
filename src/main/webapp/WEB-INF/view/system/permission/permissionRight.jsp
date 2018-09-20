<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>权限列表---仓库管理系统 2.0</title>
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
						<label class="layui-form-label">权限名称</label>
						<div class="layui-input-inline">
							<input type="text" name="name" id="name" autocomplete="off" class="layui-input " />
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">权限编码</label>
						<div class="layui-input-inline">
							<input type="text" name="percode" id="percode" autocomplete="off" class="layui-input " />
						</div>
					</div>
					<div class="layui-inline">
					<a class="layui-btn search_btn" data-type="reload">搜索</a>
			<button type="reset" class="layui-btn layui-btn-warm" >重置</button>
					</div>
			</div>
		</form>
	</blockquote>
	<script type="text/html"  id="permissionToolBar">
	<a class="layui-btn layui-btn-xs layui-btn layui-btn-normal" lay-event="add">添加</a>
	<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">批量删除</a>
	</script>
	<table id="permissionList" lay-filter="permissionList"></table>
	<!--操作-->
	<script type="text/html" id="permissionListBar">
		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
		<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
	</script>
</form>
<script type="text/javascript" src="${ctx }/resources/layui/layui.js"></script>
<script type="text/javascript" src="${ctx }/resources/zTree/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
var tableIns;
	function reloadTable(id) {
		tableIns.reload({
            page: {
                curr: 1 //重新从第 1 页开始
            },
            where: {
            	name: $("#name").val(),//搜索的关键字
            	percode: $("#percode").val(),
            	id:id
            }
        })
	}
layui.use(['form','layer','table','laytpl'],function(){
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        laytpl = layui.laytpl,
        table = layui.table;
    var provider;
    //新闻列表
     tableIns = table.render({
        elem: '#permissionList',
        url : '${ctx }/permission/queryAllPermission.action',
        cellMinWidth : 95,
        page : true,
        toolbar: '#permissionToolBar',
        defaultToolbar: ['filter', 'exports'],
        height : "full-125",
        limit : 10,
        limits : [10,15,20,25],
        id : "permissionListTable",
        cols : [[
            {type: "checkbox", fixed:"left", width:50},
            {field: 'id', title: '权限ID', width:80, align:"center"},
            {field: 'pid', title: '父级ID', width:80, align:"center"},
            {field: 'name', title: '权限名称',align:'center'},
            {field: 'percode', title: '权限编码', align:'center'},
            {field: 'available', title: '是否可用', align:'center',templet:function(d){
                return d.available==1?"可用":"不可用";
            }},
            {field: 'ordernum', title: '排序码',align:'center'},
            {title: '操作', width:130, templet:'#permissionListBar' ,fixed:"right",align:"center"}
        ]]
    });
    //监听头工具栏事件
    table.on('toolbar(permissionList)', function(obj){
      var checkStatus = table.checkStatus(obj.config.id)
      ,data = checkStatus.data; //获取选中的数据
      switch(obj.event){
        case 'add':
        	addPermission();
        break;
        case 'delete':
          if(data.length === 0){
            layer.msg('请选择一行');
          } else {
        	  //批量删除
              permissionId = [];
              for (var i in data) {
                  permissionId.push(data[i].id);
              }
              layer.confirm('确定删除选中的权限？', {icon: 3, title: '提示信息'}, function (index) {
              	 //将需要删除的permissionId作为json参数传入 
                  $.post("${ctx}/permission/batchDeletePermission.action",{permissionIds : JSON.stringify(permissionId) },function(data){
              	   layer.msg(data.msg);
                  tableIns.reload();
                  })
              })
          }
        break;
      };
    });
    //搜索【此功能需要后台配合，所以暂时没有动态效果演示】
    $(".search_btn").on("click",function(){
    	reloadTable(null);
    });
    //添加权限
    function addPermission(){
        var index = layui.layer.open({
            title : "添加权限",
            //area设置弹出层大小
            area:["800px","600px"],
            type : 2,
            content : "${ctx}/permission/toAddPermission.action",
            success : function(layero, index){
                var body = layui.layer.getChildFrame('body', index);
                setTimeout(function(){
                    layui.layer.tips('点击此处返回权限列表', '.layui-layer-setwin .layui-layer-close', {
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
    //修改权限
    function updatePermission(id){
        var index = layui.layer.open({
            title : "修改权限",
            //area设置弹出层大小
            area:["800px","600px"],
            type : 2,
            content : "${ctx}/permission/toUpdatePermission.action?id="+id,
            success : function(layero, index){
                var body = layui.layer.getChildFrame('body', index);
                setTimeout(function(){
                    layui.layer.tips('点击此处返回权限列表', '.layui-layer-setwin .layui-layer-close', {
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
    table.on('tool(permissionList)', function(obj){
        var layEvent = obj.event,
            data = obj.data;
        if(layEvent === 'edit'){ //编辑
        	updatePermission(data.id);
        } else if(layEvent === 'del'){ //删除
            layer.confirm('确定删除'+data.id+'编号'+data.name+'权限？',{icon:3, title:'提示信息'},function(index){
                 $.post("${ctx}/permission/deletePermission.action",{
                	 id : data.id  //将需要删除的permissionId作为参数传入
               },function(data){
            	   layer.msg(data.msg);
                    tableIns.reload();
                })
            });
        } else if(layEvent === 'look'){ //预览
            layer.alert("此功能需要前台展示，实际开发中传入对应的必要参数进行权限内容页面访问")
        }
    });
})
</script>
</body>
</html>