<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>客户列表---仓库管理系统 2.0</title>
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
						<label class="layui-form-label">客户名称</label>
						<div class="layui-input-inline">
							<input type="text" name="customername" id="customername" autocomplete="off" class="layui-input " />
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">客户电话</label>
						<div class="layui-input-inline">
							<input type="text" name="telephone" id="telephone" autocomplete="off" class="layui-input " />
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">联系人</label>
						<div class="layui-input-inline">
							<input type="text" name="connectionperson" id="connectionperson" autocomplete="off" class="layui-input " />
						</div>
					</div>
			</div>
			<div class="layui-form-item" align="center">
			<a class="layui-btn search_btn" data-type="reload">搜索</a>
			<a class="layui-btn search_btn layui-btn layui-btn-warm" data-type="reload">重置</a>
			</div>
		</form>
	</blockquote>
	<script type="text/html"  id="customerToolBar">
	<a class="layui-btn layui-btn-xs layui-btn layui-btn-normal" lay-event="add">添加</a>
	<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">批量删除</a>
	</script>
	<table id="customerList" lay-filter="customerList"></table>
	<!--操作-->
	<script type="text/html" id="customerListBar">
		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
		<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
	</script>
</form>
<script type="text/javascript" src="${ctx }/resources/layui/layui.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
var tableIns;
function reloadTable() {
	tableIns.reload({
	 page: {
         curr: 1 //重新从第 1 页开始
     },
     where: {
    	 customername: $("#customername").val(),//搜索的关键字
    	 telephone: $("#telephone").val(),
    	 connectionperson: $("#connectionperson").val()
     }
	})
}
layui.use(['form','layer','table','laytpl'],function(){
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        laytpl = layui.laytpl,
        table = layui.table;

    //客户列表
   tableIns = table.render({
        elem: '#customerList',
        url : '${ctx }/customer/queryAllCustomer.action',
        cellMinWidth : 95,
        page : true,
        toolbar: '#customerToolBar',
        defaultToolbar: ['filter', 'exports'],
        height : "full-125",
        limit : 10,
        limits : [10,15,20,25],
        id : "customerListTable",
        cols : [[
            {type: "checkbox", fixed:"left", width:50},
            {field: 'id', title: '客户ID', width:80, align:"center"},
            {field: 'customername', title: '客户名称'},
            {field: 'zip', title: '客户邮编', align:'center'},
            {field: 'address', title: '客户地址', align:'center'},
            {field: 'telephone', title: '客户电话', align:'center'},
            {field: 'connectionperson', title: '联系人', align:'center'},
            {field: 'phone', title: '联系人电话', align:'center'},
            {field: 'bank', title: '开户行', align:'center'},
            {field: 'account', title: '账号信息', align:'center'},
            {field: 'email', title: '联系人信箱', align:'center'},
            {field: 'fax', title: '客户传真', align:'center'},
            {field: 'available ', title: '是否可用', align:'center', templet:function(d){
                return d.available==1?"可用":"不可用";
            }},
            {title: '操作', width:150, templet:'#customerListBar',fixed:"right",align:"center"}
        ]]
    });
   //监听头工具栏事件
   table.on('toolbar(customerList)', function(obj){
     var checkStatus = table.checkStatus(obj.config.id)
     ,data = checkStatus.data; //获取选中的数据
     switch(obj.event){
     case 'add':
     	addCustomer();
     break;
       case 'delete':
         if(data.length === 0){
           layer.msg('请选择一行');
         } else {
       	  //批量删除
             var  customerId = [];
             for (var i in data) {
                 customerId.push(data[i].id);
             }
             layer.confirm('确定删除选中的客户？', {icon: 3, title: '提示信息'}, function (index) {
           	  //将需要删除的customerId作为json参数传入 
                  $.post("${ctx}/customer/batchDeleteCustomer.action",{customerIds:JSON.stringify(customerId)},function(data){
                layer.msg(data.msg);
                 tableIns.reload();
                 layer.close(index);
                 })
             })
         }
       break;
     };
   });
   //添加客户
   function addCustomer(){
       var index = layui.layer.open({
           title : "添加客户",
           //area设置弹出层大小
           area:["800px","600px"],
           type : 2,
           content : "${ctx}/customer/toAddCustomer.action",
           success : function(layero, index){
               var body = layui.layer.getChildFrame('body', index);
               
               setTimeout(function(){
                   layui.layer.tips('点击此处返回客户列表', '.layui-layer-setwin .layui-layer-close', {
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
   //搜索【此功能需要后台配合，所以暂时没有动态效果演示】
   $(".search_btn").on("click",function(){
   	reloadTable();
   });
   //修改客户
   function updateCustomer(id){
       var index = layui.layer.open({
           title : "修改客户",
           //area设置弹出层大小
           area:["800px","600px"],
           type : 2,
           content : "${ctx}/customer/toUpdateCustomer.action?id="+id,
           success : function(layero, index){
               var body = layui.layer.getChildFrame('body', index);
               setTimeout(function(){
                   layui.layer.tips('点击此处返回客户列表', '.layui-layer-setwin .layui-layer-close', {
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
   table.on('tool(customerList)', function(obj){
       var layEvent = obj.event,
           data = obj.data;
       if(layEvent === 'edit'){ //修改
       	updateCustomer(data.id);
       }else if(layEvent === 'del'){ //删除
           layer.confirm('确定删除'+data.customername+'客户？',{icon:3, title:'提示信息'},function(index){
                $.post("${ctx}/customer/deleteCustomer.action",{
                    id : data.id  //将需要删除的customerId作为参数传入
                },function(data){
               	 layer.msg(data.msg);
                   tableIns.reload();
                   layer.close(index);
                })
           });
       } else if(layEvent === 'look'){ //预览
       }
   });
})
</script>
</body>
</html>