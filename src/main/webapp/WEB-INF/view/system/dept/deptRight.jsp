<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>部门列表---仓库管理系统 2.0</title>
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
	<blockquote class="layui-elem-quote quoteBox">
		<form class="layui-form">
			<div class="layui-form-item">
				<div class="layui-inline">
						<label class="layui-form-label">部门名称</label>
						<div class="layui-input-inline">
							<input type="text" name="name" id="name" autocomplete="off" class="layui-input " />
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">部门地址</label>
						<div class="layui-input-inline">
							<input type="text" name="loc" id="loc" autocomplete="off" class="layui-input " />
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">部门备注</label>
						<div class="layui-input-inline">
							<input type="text" name="remark" id="remark" autocomplete="off" class="layui-input " />
						</div>
					</div>
			</div>
			<div class="layui-form-item" align="center">
			<a class="layui-btn search_btn" data-type="reload">搜索</a>
			<button type="reset" class="layui-btn layui-btn-warm" >重置</button>
			</div>
		</form>
	</blockquote>
	<script type="text/html"  id="deptToolBar">
	<a class="layui-btn layui-btn-xs layui-btn layui-btn-normal" lay-event="add">添加</a>
	<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">批量删除</a>
	</script>
	<table id="deptList" lay-filter="deptList"></table>
	<!--操作-->
	<script type="text/html" id="deptListBar">
		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
		<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
	</script>
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
            	loc: $("#loc").val(),
       		 remark: $("#remark").val(),
       		 id:id
            }
        })
	}
layui.use(['form','layer','laydate','table','laytpl'],function(){
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        laydate = layui.laydate,
        laytpl = layui.laytpl,
        table = layui.table;

    //新闻列表
     tableIns = table.render({
        elem: '#deptList',
        url : '${ctx }/dept/queryAllDept.action',
        cellMinWidth : 95,
        page : true,
        toolbar: '#deptToolBar',
        defaultToolbar: ['filter', 'exports'],
        height : "full-125",
        limit : 10,
        limits : [10,15,20,25],
        id : "deptListTable",
        cols : [[
            {type: "checkbox", fixed:"left", width:50},
            {field: 'id', title: '部门编号', width:80, align:"center"},
            {field: 'pid', title: '父级部门编号',align:'center'},
            {field: 'name', title: '部门名称', align:'center'},
            {field: 'open', title: '是否展开', align:'center',templet:function(d){
                return d.open==1?"展开":"不展开";
            }},
            {field: 'parent', title: '是否父节点', align:'center',templet:function(d){
                return d.parent==1?"是":"不是";
            }},
            {field: 'remark', title: '备注', width:100,align:'center'},
            {field: 'loc', title: '地址', align:'center'},
          
            {field: 'available ', title: '是否可用', align:'center', templet:function(d){
                return d.available==1?"可用":"不可用";
            }},
            {field: 'ordernum', title: '排序码', align:'center'},
            {title: '操作', width:130, templet:'#deptListBar' ,fixed:"right",align:"center"}
        ]]
    });
    //监听头工具栏事件
    table.on('toolbar(deptList)', function(obj){
      var checkStatus = table.checkStatus(obj.config.id)
      ,data = checkStatus.data; //获取选中的数据
      switch(obj.event){
        case 'add':
        	addDept();
        break;
        case 'delete':
          if(data.length === 0){
            layer.msg('请选择一行');
          } else {
        	  //批量删除
              deptId = [];
              for (var i in data) {
                  deptId.push(data[i].id);
              }
              layer.confirm('确定删除选中的部门？', {icon: 3, title: '提示信息'}, function (index) {
              	 //将需要删除的deptId作为json参数传入 
                  $.post("${ctx}/dept/batchDeleteDept.action",{deptIds : JSON.stringify(deptId) },function(data){
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
    //添加部门
    function addDept(){
        var index = layui.layer.open({
            title : "添加部门",
            //area设置弹出层大小
            area:["800px","600px"],
            type : 2,
            content : "${ctx}/dept/toAddDept.action",
            success : function(layero, index){
                var body = layui.layer.getChildFrame('body', index);
                setTimeout(function(){
                    layui.layer.tips('点击此处返回部门列表', '.layui-layer-setwin .layui-layer-close', {
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
    //修改部门
    function updateDept(id){
        var index = layui.layer.open({
            title : "修改部门",
            //area设置弹出层大小
            area:["800px","600px"],
            type : 2,
            content : "${ctx}/dept/toUpdateDept.action?id="+id,
            success : function(layero, index){
                var body = layui.layer.getChildFrame('body', index);
                setTimeout(function(){
                    layui.layer.tips('点击此处返回部门列表', '.layui-layer-setwin .layui-layer-close', {
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
    table.on('tool(deptList)', function(obj){
        var layEvent = obj.event,
            data = obj.data;
        if(layEvent === 'edit'){ //编辑
        	updateDept(data.id);
        } else if(layEvent === 'del'){ //删除
            layer.confirm('确定删除'+data.id+'编号'+data.name+'部门？',{icon:3, title:'提示信息'},function(index){
                 $.post("${ctx}/dept/deleteDept.action",{
                	 id : data.id  //将需要删除的deptId作为参数传入
               },function(data){
            	   layer.msg(data.msg);
                    tableIns.reload();
                    window.parent.left.initTree();//刷新左边的树
                })
            });
        } else if(layEvent === 'look'){ //预览
            layer.alert("此功能需要前台展示，实际开发中传入对应的必要参数进行部门内容页面访问")
        }
    });
})
</script>
</body>
</html>