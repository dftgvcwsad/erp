<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>供应商列表---仓库管理系统 2.0</title>
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
						<label class="layui-form-label">供应商名称</label>
						<div class="layui-input-inline">
							<input type="text" name="providername" id="providername" autocomplete="off" class="layui-input " />
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">供应商电话</label>
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
	<script type="text/html"  id="providerToolBar">
	<a class="layui-btn layui-btn-xs layui-btn layui-btn-normal" lay-event="add">添加</a>
	<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">批量删除</a>
	</script>
	<table id="providerList" lay-filter="providerList"></table>
	<!--操作-->
	<script type="text/html" id="providerListBar">
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
    	 providername: $("#providername").val(),//搜索的关键字
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

    //供应商列表
   tableIns = table.render({
        elem: '#providerList',
        url : '${ctx }/provider/queryAllProvider.action',
        cellMinWidth : 95,
        page : true,
        toolbar: '#providerToolBar',
        defaultToolbar: ['filter', 'exports'],
        height : "full-125",
        limit : 10,
        limits : [10,15,20,25],
        id : "providerListTable",
        cols : [[
            {type: "checkbox", fixed:"left", width:50},
            {field: 'id', title: '供应商ID', width:80, align:"center"},
            {field: 'providername', title: '供应商名称'},
            {field: 'zip', title: '供应商邮编', align:'center'},
            {field: 'address', title: '供应商地址', align:'center'},
            {field: 'telephone', title: '供应商电话', align:'center'},
            {field: 'connectionperson', title: '联系人', align:'center'},
            {field: 'phone', title: '联系人电话', align:'center'},
            {field: 'bank', title: '开户行', align:'center'},
            {field: 'account', title: '账号信息', align:'center'},
            {field: 'email', title: '联系人信箱', align:'center'},
            {field: 'fax', title: '供应商传真', align:'center'},
            {field: 'available ', title: '是否可用', align:'center', templet:function(d){
                return d.available==1?"可用":"不可用";
            }},
            {title: '操作', width:150, templet:'#providerListBar',fixed:"right",align:"center"}
        ]]
    });
   //监听头工具栏事件
   table.on('toolbar(providerList)', function(obj){
     var checkStatus = table.checkStatus(obj.config.id)
     ,data = checkStatus.data; //获取选中的数据
     switch(obj.event){
     case 'add':
     	addProvider();
     break;
       case 'delete':
         if(data.length === 0){
           layer.msg('请选择一行');
         } else {
       	  //批量删除
             var  providerId = [];
             for (var i in data) {
                 providerId.push(data[i].id);
             }
             layer.confirm('确定删除选中的供应商？', {icon: 3, title: '提示信息'}, function (index) {
           	  //将需要删除的providerId作为json参数传入 
                  $.post("${ctx}/provider/batchDeleteProvider.action",{providerIds:JSON.stringify(providerId)},function(data){
                layer.msg(data.msg);
                 tableIns.reload();
                 layer.close(index);
                 })
             })
         }
       break;
     };
   });
   //添加供应商
   function addProvider(){
       var index = layui.layer.open({
           title : "添加供应商",
           //area设置弹出层大小
           area:["800px","600px"],
           type : 2,
           content : "${ctx}/provider/toAddProvider.action",
           success : function(layero, index){
               var body = layui.layer.getChildFrame('body', index);
               
               setTimeout(function(){
                   layui.layer.tips('点击此处返回供应商列表', '.layui-layer-setwin .layui-layer-close', {
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
   //修改供应商
   function updateProvider(id){
       var index = layui.layer.open({
           title : "修改供应商",
           //area设置弹出层大小
           area:["800px","600px"],
           type : 2,
           content : "${ctx}/provider/toUpdateProvider.action?id="+id,
           success : function(layero, index){
               var body = layui.layer.getChildFrame('body', index);
               setTimeout(function(){
                   layui.layer.tips('点击此处返回供应商列表', '.layui-layer-setwin .layui-layer-close', {
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
   table.on('tool(providerList)', function(obj){
       var layEvent = obj.event,
           data = obj.data;
       if(layEvent === 'edit'){ //修改
       	updateProvider(data.id);
       }else if(layEvent === 'del'){ //删除
           layer.confirm('确定删除'+data.providername+'供应商？',{icon:3, title:'提示信息'},function(index){
                $.post("${ctx}/provider/deleteProvider.action",{
                    id : data.id  //将需要删除的providerId作为参数传入
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