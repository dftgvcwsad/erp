<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>用户列表---仓库管理系统 2.0</title>
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
						<label class="layui-form-label">用户名称</label>
						<div class="layui-input-inline">
							<input type="text" name="name" id="name" autocomplete="off" class="layui-input " />
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">用户地址</label>
						<div class="layui-input-inline">
							<input type="text" name="address" id="address" autocomplete="off" class="layui-input " />
						</div>
					</div>
			</div>
			<div class="layui-form-item" align="center">
			<a class="layui-btn search_btn" data-type="reload">搜索</a>
			<button type="reset" class="layui-btn layui-btn-warm" >重置</button>
			</div>
		</form>
	</blockquote>
	<script type="text/html"  id="userToolBar">
	<a class="layui-btn layui-btn-xs layui-btn layui-btn-normal" lay-event="add">添加</a>
	<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">批量删除</a>
	</script>
	<table id="userList" lay-filter="userList"></table>
	<!--操作-->
	<script type="text/html" id="userListBar">
		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
		<a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="resetPwd">重置密码</a>
		<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
		<a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="allocationRole">分配角色</a>
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
            	address: $("#address").val(),
       		 deptid:id
            }
        })
	}
	var layer;
layui.use(['form','layer','laydate','table','laytpl'],function(){
	 layer = parent.layer === undefined ? layui.layer : top.layer;
    var form = layui.form,
        $ = layui.jquery,
        laydate = layui.laydate,
        laytpl = layui.laytpl,
        table = layui.table;

    //新闻列表
     tableIns = table.render({
        elem: '#userList',
        url : '${ctx }/user/queryAllUser.action',
        cellMinWidth : 95,
        page : true,
        toolbar: '#userToolBar',
        defaultToolbar: ['filter', 'exports'],
        height : "full-125",
        limit : 10,
        limits : [10,15,20,25],
        id : "userListTable",
        cols : [[
            {type: "checkbox", fixed:"left", width:50},
            {field: 'id', title: '用户ID', width:80, align:"center"},
            {field: 'name', title: '用户名称',align:'center'},
            {field: 'deptname', title: '所在部门', align:'center'},
            {field: 'loginname', title: '登陆名称', align:'center'},
            {field: 'leadername', title: '直接领导', align:'center'},
            {field: 'address', title: '用户地址', align:'center'},
            {field: 'hiredate', title: '入职时间', align:'center'},
            {field: 'remark', title: '用户备注', align:'center'},
            {field: 'sex', title: '性别', align:'center',templet:function(d){
                return d.sex==1?"男":"女";
            }},
            {field: 'imgpath ', title: '用户头像', align:'center', templet:function(d){
                return "<img width=20px height=20px alt=无效地址  src='"+d.imgpath+"'></img>";
            }},
            {field: 'available ', title: '是否可用', align:'center', templet:function(d){
                return d.available==1?"可用":"不可用";
            }},
            {field: 'pwd', title: '密码', align:'center',templet:function(d){
                return "*******";
            }},
            {field: 'ordernum', title: '排序码', align:'center'},
            {title: '操作', width:300, templet:'#userListBar' ,fixed:"right",align:"center"}
        ]]
    });
    //监听头工具栏事件
    table.on('toolbar(userList)', function(obj){
      var checkStatus = table.checkStatus(obj.config.id)
      ,data = checkStatus.data; //获取选中的数据
      switch(obj.event){
        case 'add':
        	addUser();
        break;
        case 'delete':
          if(data.length === 0){
            layer.msg('请选择一行');
          } else {
        	  //批量删除
              userId = [];
              for (var i in data) {
                  userId.push(data[i].id);
              }
              layer.confirm('确定删除选中的用户？', {icon: 3, title: '提示信息'}, function (index) {
              	 //将需要删除的userId作为json参数传入 
                  $.post("${ctx}/user/batchDeleteUser.action",{userIds : JSON.stringify(userId) },function(data){
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
    //添加用户
    function addUser(){
        var index = layui.layer.open({
            title : "添加用户",
            //area设置弹出层大小
            area:["800px","600px"],
            type : 2,
            content : "${ctx}/user/toAddUser.action",
            success : function(layero, index){
                var body = layui.layer.getChildFrame('body', index);
                setTimeout(function(){
                    layui.layer.tips('点击此处返回用户列表', '.layui-layer-setwin .layui-layer-close', {
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
    //修改用户
    function updateUser(id){
        var index = layui.layer.open({
            title : "修改用户",
            //area设置弹出层大小
            area:["800px","600px"],
            type : 2,
            content : "${ctx}/user/toUpdateUser.action?id="+id,
            success : function(layero, index){
                var body = layui.layer.getChildFrame('body', index);
                setTimeout(function(){
                    layui.layer.tips('点击此处返回用户列表', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                },500)
            }
        })
       // layui.layer.full(index);//最大化窗口
        //改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
        $(window).on("resize",function(){
            layer.full(index);
        })
    }
    //列表操作
    table.on('tool(userList)', function(obj){
        var layEvent = obj.event,
            data = obj.data;
        if(layEvent === 'edit'){ //编辑
        	updateUser(data.id);
        } else if(layEvent === 'del'){ //删除
            layer.confirm('确定删除'+data.id+'编号'+data.name+'用户？',{icon:3, title:'提示信息'},function(index){
                 $.post("${ctx}/user/deleteUser.action",{
                	 id : data.id  //将需要删除的userId作为参数传入
               },function(data){
            	   layer.msg(data.msg);
                    tableIns.reload();
                })
            });
        } else if(layEvent === 'resetPwd'){ //重置密码
        	 layer.confirm('确定重置'+data.id+'编号'+data.name+'用户的密码？',{icon:3, title:'提示信息'},function(index){
                 $.post("${ctx}/user/resetUserPwd.action",{
                	 id : data.id  
               },function(data){
            	   layer.msg(data.msg);
                    tableIns.reload();
                })
            });
        }else if (layEvent==='allocationRole') {
        	allocationRole(data);
		}
    });
    function allocationRole(user) {
    	var index = layui.layer.open({
            title : "【"+user.name+"】用户分配角色页面",
            //area设置弹出层大小
            area:["800px","600px"],
            type : 2,
            content : "${ctx}/user/toAllocationRole.action?id="+user.id,
            success : function(layero, index){
                var body = layui.layer.getChildFrame('body', index);
                setTimeout(function(){
                    layui.layer.tips('点击此处返回用户列表', '.layui-layer-setwin .layui-layer-close', {
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
})
</script>
</body>
</html>