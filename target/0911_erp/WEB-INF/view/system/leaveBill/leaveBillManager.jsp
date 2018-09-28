<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>请假单列表---仓库管理系统 2.0</title>
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
						<label class="layui-form-label">请假标题</label>
						<div class="layui-input-inline">
							<input type="text" name="title" id="title" autocomplete="off" class="layui-input " />
						</div>
					</div>
					<div class="layui-inline">
           			 <label class="layui-form-label" >请假内容</label>
            			<div class="layui-input-inline">
                			<input type="text" name="content"  id="content" autocomplete="off" class="layui-input">
           	 			</div>
        			</div>
					<div class="layui-inline">
						<label class="layui-form-label">开始日期</label>
						<div class="layui-input-inline">
							<input type="text" name="startDate" id="startDate"
								lay-verify="datetime"  placeholder="yyyy-MM-dd HH:mm:ss"
								autocomplete="off" class="layui-input ">
						</div>
					</div>
				<div class="layui-inline">
						<label class="layui-form-label">结束日期</label>
						<div class="layui-input-inline">
							<input type="text" name="endDate" id="endDate"
								lay-verify="datetime"  placeholder="yyyy-MM-dd HH:mm:ss"
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
	<script type="text/html"  id="leaveBillToolBar">
	<a class="layui-btn layui-btn-xs layui-btn layui-btn-normal" lay-event="add">添加</a>
	</script>
	<table id="leaveBillList" lay-filter="leaveBillList"></table>
	<!--操作-->
	<script type="text/html" id="leaveBillListBar">
 {{#  if(d.state  == 0){ }}
    	<a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
		<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
		<a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="startProcess">提交申请</a>
  {{#  } else if(d.state ==1) { }}
	<a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="look">审批查询</a>
  {{#  } else if(d.state ==2) { }}
	<a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="look">审批查询</a>
  {{#  } else if(d.state ==3) { }}
		<a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
		<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
  {{#  } }}
	</script>
</form>
<script type="text/javascript" src="${ctx }/resources/layui/layui.js"></script>
<script type="text/javascript" src="${ctx }/resources/zTree/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
var tableIns;
function reloadTable() {
	tableIns.reload({
	 page: {
         curr: 1 //重新从第 1 页开始
     },
     where: {
    	 	title: $("#title").val(),//搜索的关键字
    	 	content: $("#content").val(),
    		startDate: $("#startDate").val(),
     		endDate: $("#endDate").val()
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
  //日期
    laydate.render({
      elem: '#startDate'
    	  ,type: 'datetime'
    });
    laydate.render({
      elem: '#endDate'
    	  ,type: 'datetime'
    });
   
    //请假单列表
    tableIns = table.render({
        elem: '#leaveBillList',
        url : '${ctx }/leaveBill/queryAllLeaveBill.action',
        cellMinWidth : 95,
        page : true,
        toolbar: '#leaveBillToolBar',
        defaultToolbar: ['filter', 'exports'],
        height : "full-125",
        limit : 10,
        limits : [10,15,20,25],
        id : "leaveBillListTable",
        cols : [[
            {type: "checkbox", fixed:"left", width:50},
            {field: 'id', title: '请假单ID', width:80, align:"center"},
            {field: 'title', title: '请假单标题', width:200, align:"center"},
            {field: 'content', title: '请假单详情',width:200, align:"center"},
            {field: 'days', title: '请假天数', align:"center"},
            {field: 'leavetime', title: '请假时间', align:'center'},
            {field: 'username', title: '请假人', align:'center'},
            {field: 'state', title: '状态',  align:'center',templet:function(data){
            	var state=data.state;
            	if(state==0){
            		return "<font color=red>未提交</font>";
            	}
            	else if(state==1){
            		return "<font color=green>审批中</font>";
            	}
            	else if(state==2){
            		return "<font color=blue>审批完成</font>";
            	}
            	else if(state==3){
            		return "<font color=gray>已放弃</font>";
            	}else{
            		return "<font color=yellow>未知状态</font>";
            	}
            }},
            {title: '操作', width:170, templet:'#leaveBillListBar',fixed:"right",align:"center"}
        ]]
    });

    //监听头工具栏事件
    table.on('toolbar(leaveBillList)', function(obj){
      var checkStatus = table.checkStatus(obj.config.id)
      ,data = checkStatus.data; //获取选中的数据
      switch(obj.event){
      case 'add':
      	addLeaveBill();
      break;
      };
    });
    //添加请假单
    function addLeaveBill(){
        var index = layui.layer.open({
            title : "添加请假单",
            //area设置弹出层大小
            area:["800px","600px"],
            type : 2,
            content : "${ctx}/leaveBill/toAddLeaveBill.action",
            success : function(layero, index){
                var body = layui.layer.getChildFrame('body', index);
                
                setTimeout(function(){
                    layui.layer.tips('点击此处返回请假单列表', '.layui-layer-setwin .layui-layer-close', {
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
    //修改请假单
    function updateLeaveBill(id){
        var index = layui.layer.open({
            title : "修改请假单",
            //area设置弹出层大小
            area:["800px","600px"],
            type : 2,
            content : "${ctx}/leaveBill/toUpdateLeaveBill.action?id="+id,
            success : function(layero, index){
                var body = layui.layer.getChildFrame('body', index);
                
                setTimeout(function(){
                    layui.layer.tips('点击此处返回请假单列表', '.layui-layer-setwin .layui-layer-close', {
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
    table.on('tool(leaveBillList)', function(obj){
        var layEvent = obj.event,
            data = obj.data;
        if(layEvent === 'edit'){ //修改
        	updateLeaveBill(data.id);
        }else if(layEvent === 'del'){ //删除
            layer.confirm('确定删除'+data.username+'的请假单？',{icon:3, title:'提示信息'},function(index){
                 $.post("${ctx}/leaveBill/deleteLeaveBill.action",{
                     id : data.id  //将需要删除的leaveBillId作为参数传入
                 },function(data){
                	 layer.msg(data.msg);
                    tableIns.reload();
                    layer.close(index);
                 })
            });
        } else if(layEvent === 'startProcess'){ //提交申请
        	  layer.confirm('确定提交'+data.title+'的请假单？',{icon:3, title:'提示信息'},function(index){
                  $.post("${ctx}/workFlow/startLeaveBillProcess.action",{
                      id : data.id  
                  },function(data){
                 	 layer.msg(data.msg);
                     tableIns.reload();
                     layer.close(index);
                  })
             });
        }
    });
})
</script>
</body>
</html>