<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>商品列表---仓库管理系统 2.0</title>
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
						<label class="layui-form-label">商品名称</label>
						<div class="layui-input-inline">
							<input type="text" name="goodsname" id="goodsname" autocomplete="off" class="layui-input " />
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">商品批号</label>
						<div class="layui-input-inline">
							<input type="text" name="productcode" id="productcode" autocomplete="off" class="layui-input " />
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">商品规格</label>
						<div class="layui-input-inline">
							<input type="text" name="size" id="size" autocomplete="off" class="layui-input " />
						</div>
					</div>
			</div>
			<div class="layui-form-item" align="center">
			<a class="layui-btn search_btn" data-type="reload">搜索</a>
			<button type="reset" class="layui-btn layui-btn-warm" >重置</button>
			</div>
		</form>
	</blockquote>
	<script type="text/html"  id="goodsToolBar">
	<a class="layui-btn layui-btn-xs layui-btn layui-btn-normal" lay-event="add">添加</a>
	<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">批量删除</a>
	</script>
	<table id="goodsList" lay-filter="goodsList"></table>
	<!--操作-->
	<script type="text/html" id="goodsListBar">
		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
		<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
	</script>
</form>
<script type="text/javascript" src="${ctx }/resources/layui/layui.js"></script>
<script type="text/javascript" src="${ctx }/resources/zTree/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
var tableIns;
	function reloadTable(id) {
		if(id===0){
			id=null;
		}
		tableIns.reload({
            page: {
                curr: 1 //重新从第 1 页开始
            },
            where: {
            	goodsname: $("#goodsname").val(),//搜索的关键字
            	productcode: $("#productcode").val(),
            	size: $("#size").val(),
            	providerid:id
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
        elem: '#goodsList',
        url : '${ctx }/goods/queryAllGoods.action',
        cellMinWidth : 95,
        page : true,
        toolbar: '#goodsToolBar',
        defaultToolbar: ['filter', 'exports'],
        height : "full-125",
        limit : 10,
        limits : [10,15,20,25],
        id : "goodsListTable",
        cols : [[
            {type: "checkbox", fixed:"left", width:50},
            {field: 'id', title: '商品编号', width:80, align:"center"},
            {field: 'goodsname', title: '商品名称',align:'center'},
            {field: 'providername', title: '供应商名称',align:'center',templet:function(d){
            	$.ajax({
            	    url: '${ctx}/provider/queryProviderById.action',
            	    data:"id="+d.providerid,
            	    async: false,
            	    success: function(data) {
            	    	 provider= data.providername;
            	    }
            	});
                  return   provider;
            }},
            {field: 'produceplace', title: '商品产地', align:'center'},
            {field: 'size', title: '商品规格', align:'center'},
            {field: 'goodspackage', title: '商品包装', align:'center'},
            {field: 'promitcode', title: '生产批号', align:'center'},
            {field: 'produceplace', title: '批准文号', align:'center'},
            {field: 'description', title: '描述', align:'center'},
            {field: 'providerid', title: '供应商编号', align:'center'},
            {field: 'available', title: '是否可用', align:'center',templet:function(d){
                return d.available==1?"可用":"不可用";
            }},
            {field: 'number', title: '库存数量', align:'center'},
            {field: 'dangernum', title: '预警库存', align:'center'},
            {field: 'goodsimg', title: '商品图片', align:'center', templet:function(d){
                return "<img width=20px height=20px alt=无效地址  src='${ctx}/"+d.goodsimg+"'></img>";
            }},
            {title: '操作', width:130, templet:'#goodsListBar' ,fixed:"right",align:"center"}
        ]]
    });
    //监听头工具栏事件
    table.on('toolbar(goodsList)', function(obj){
      var checkStatus = table.checkStatus(obj.config.id)
      ,data = checkStatus.data; //获取选中的数据
      switch(obj.event){
        case 'add':
        	addGoods();
        break;
        case 'delete':
          if(data.length === 0){
            layer.msg('请选择一行');
          } else {
        	  //批量删除
              goodsId = [];
              for (var i in data) {
                  goodsId.push(data[i].id);
              }
              layer.confirm('确定删除选中的商品？', {icon: 3, title: '提示信息'}, function (index) {
              	 //将需要删除的goodsId作为json参数传入 
                  $.post("${ctx}/goods/batchDeleteGoods.action",{goodsIds : JSON.stringify(goodsId) },function(data){
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
    //添加商品
    function addGoods(){
        var index = layui.layer.open({
            title : "添加商品",
            //area设置弹出层大小
            area:["800px","600px"],
            type : 2,
            content : "${ctx}/goods/toAddGoods.action",
            success : function(layero, index){
                var body = layui.layer.getChildFrame('body', index);
                setTimeout(function(){
                    layui.layer.tips('点击此处返回商品列表', '.layui-layer-setwin .layui-layer-close', {
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
    //修改商品
    function updateGoods(id){
        var index = layui.layer.open({
            title : "修改商品",
            //area设置弹出层大小
            area:["800px","600px"],
            type : 2,
            content : "${ctx}/goods/toUpdateGoods.action?id="+id,
            success : function(layero, index){
                var body = layui.layer.getChildFrame('body', index);
                
                setTimeout(function(){
                    layui.layer.tips('点击此处返回商品列表', '.layui-layer-setwin .layui-layer-close', {
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
    table.on('tool(goodsList)', function(obj){
        var layEvent = obj.event,
            data = obj.data;
        if(layEvent === 'edit'){ //编辑
        	updateGoods(data.id);
        } else if(layEvent === 'del'){ //删除
            layer.confirm('确定删除'+data.id+'编号'+data.goodsname+'商品？',{icon:3, title:'提示信息'},function(index){
                 $.post("${ctx}/goods/deleteGoods.action",{
                	 id : data.id  //将需要删除的goodsId作为参数传入
               },function(data){
            	   layer.msg(data.msg);
                    tableIns.reload();
                })
            });
        } else if(layEvent === 'look'){ //预览
            layer.alert("此功能需要前台展示，实际开发中传入对应的必要参数进行商品内容页面访问")
        }
    });
})
</script>
</body>
</html>