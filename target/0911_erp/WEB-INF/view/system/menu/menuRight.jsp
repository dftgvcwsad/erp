<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>菜单列表---仓库管理系统 2.0</title>
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
						<label class="layui-form-label">菜单名称</label>
						<div class="layui-input-inline">
							<input type="text" name="name" id="name" autocomplete="off" class="layui-input " />
						</div>
					</div>
					<div class="layui-inline">
					<a class="layui-btn search_btn" data-type="reload">搜索</a>
			<button type="reset" class="layui-btn layui-btn-warm" >重置</button>
					</div>
			</div>
		</form>
	</blockquote>
	<script type="text/html"  id="menuToolBar">
	<a class="layui-btn layui-btn-xs layui-btn layui-btn-normal" lay-event="add">添加</a>
	<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">批量删除</a>
	</script>
	<table id="menuList" lay-filter="menuList"></table>
	<!--操作-->
	<script type="text/html" id="menuListBar">
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
        elem: '#menuList',
        url : '${ctx }/menu/queryAllMenu.action',
        cellMinWidth : 95,
        page : true,
        toolbar: '#menuToolBar',
        defaultToolbar: ['filter', 'exports'],
        height : "full-125",
        limit : 10,
        limits : [10,15,20,25],
        id : "menuListTable",
        cols : [[
            {type: "checkbox", fixed:"left", width:50},
            {field: 'id', title: '菜单ID', width:80, align:"center"},
            {field: 'pid', title: '父级ID', width:80, align:"center"},
            {field: 'name', title: '菜单名称',align:'center'},
            {field: 'icon', title: '菜单图标', align:'center',templet:function(d){
                return "<i class='layui-icon'>"+d.icon+"</i>";
            }},
            {field: 'href', title: '菜单地址', align:'center'},
            {field: 'target', title: 'TARGET', align:'center'},
            {field: 'open ', title: '是否展开', align:'center',templet:function(d){
                return d.open==1?"展开":"不展开";
            }},
            {field: 'available', title: '是否可用', align:'center',templet:function(d){
                return d.available==1?"可用":"不可用";
            }},
            {field: 'ordernum', title: '排序码',align:'center'},
            {title: '操作', width:130, templet:'#menuListBar' ,fixed:"right",align:"center"}
        ]]
    });
    //监听头工具栏事件
    table.on('toolbar(menuList)', function(obj){
      var checkStatus = table.checkStatus(obj.config.id)
      ,data = checkStatus.data; //获取选中的数据
      switch(obj.event){
        case 'add':
        	addMenu();
        break;
        case 'delete':
          if(data.length === 0){
            layer.msg('请选择一行');
          } else {
        	  //批量删除
              menuId = [];
              for (var i in data) {
                  menuId.push(data[i].id);
              }
              layer.confirm('确定删除选中的菜单？', {icon: 3, title: '提示信息'}, function (index) {
              	 //将需要删除的menuId作为json参数传入 
                  $.post("${ctx}/menu/batchDeleteMenu.action",{permissionIds : JSON.stringify(menuId) },function(data){
              	   layer.msg(data.msg);
                  tableIns.reload();
                  window.parent.left.initTree();//刷新左边的树
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
    //添加菜单
    function addMenu(){
        var index = layui.layer.open({
            title : "添加菜单",
            //area设置弹出层大小
            area:["800px","600px"],
            type : 2,
            content : "${ctx}/menu/toAddMenu.action",
            success : function(layero, index){
                var body = layui.layer.getChildFrame('body', index);
                setTimeout(function(){
                    layui.layer.tips('点击此处返回菜单列表', '.layui-layer-setwin .layui-layer-close', {
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
    //修改菜单
    function updateMenu(id){
        var index = layui.layer.open({
            title : "修改菜单",
            //area设置弹出层大小
            area:["800px","600px"],
            type : 2,
            content : "${ctx}/menu/toUpdateMenu.action?id="+id,
            success : function(layero, index){
                var body = layui.layer.getChildFrame('body', index);
                setTimeout(function(){
                    layui.layer.tips('点击此处返回菜单列表', '.layui-layer-setwin .layui-layer-close', {
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
    table.on('tool(menuList)', function(obj){
        var layEvent = obj.event,
            data = obj.data;
        if(layEvent === 'edit'){ //编辑
        	updateMenu(data.id);
        } else if(layEvent === 'del'){ //删除
            layer.confirm('确定删除'+data.id+'编号'+data.name+'菜单？',{icon:3, title:'提示信息'},function(index){
                 $.post("${ctx}/menu/deleteMenu.action",{
                	 id : data.id  //将需要删除的menuId作为参数传入
               },function(data){
            	   layer.msg(data.msg);
                    tableIns.reload();
                    window.parent.left.initTree();//刷新左边的树
                })
            });
        } else if(layEvent === 'look'){ //预览
            layer.alert("此功能需要前台展示，实际开发中传入对应的必要参数进行菜单内容页面访问")
        }
    });
})
</script>
</body>
</html>