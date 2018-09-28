<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>办理任务</title>
<link rel="stylesheet" href="${ctx }/resources/layui/css/layui.css" media="all">
<link rel="stylesheet" href="${ctx }/resources/css/public.css" media="all" />
</head>
<body>
	<form id="layuiFm" class="layui-form" action="#" method="post" 
		lay-filter="doUpdateLeaveBill">
		<div class="layui-form-item">
			<div class="layui-block">
				<label class="layui-form-label">请假标题</label>
				<div class="layui-input-block">
					<input type="text" name="title" id="title" disabled="disabled" lay-verify="required" value="【${loginUser.name}】的请假单"
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
		<div class="layui-inline">
				<label class="layui-form-label">请假天数</label>
				<div class="layui-input-inline">
					<input type="text" name="days" id="days" disabled="disabled"  lay-verify="number" autocomplete="off"
					 class="layui-input"  value="${leaveBill.days }" >
				</div>
				 </div>
				<div class="layui-inline">
						<label class="layui-form-label">开始时间</label>
						<div class="layui-input-inline">
							<input type="text" disabled="disabled" name="leavetime" id="leavetime" 
								 autocomplete="off" class="layui-input "  value="<fmt:formatDate value="${leaveBill.leavetime }" pattern="yyyy-MM-dd HH:mm:ss"/>">
						</div>
					</div>
			</div>
		<div class="layui-form-item">
				<label class="layui-form-label">请假单详情</label>
				<div class="layui-input-block">
					<textarea disabled="disabled"  name="content"  id="content"  class="layui-textarea" >${leaveBill.content }</textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">批注</label>
				<div class="layui-input-block">
					<textarea placeholder="请输入批注信息"  name="comment"  id="comment"  class="layui-textarea" ></textarea>
				</div>
			</div>
		<div class="layui-form-item" align="center">
			<div>
				<c:forEach items="${outcomes }" var="oc" varStatus="n">
				<c:choose>
				<c:when test="${n.index==0 }">
				<input type="button" class="layui-btn mybtn" value="${oc }">
				</c:when>
				<c:otherwise>
				<input type="button" class="layui-btn layui-btn-warm mybtn" value="${oc }">
				</c:otherwise>
				</c:choose>
				</c:forEach>
			</div>
		</div>
	</form>
	<table id="commonList" ></table>
	<script src="${ctx }/resources/layui/layui.js" charset="utf-8"></script>
	<script>
		layui.use([ 'form' , 'jquery','layer' ,'table'],function() {
							var form = layui.form, $ = layui.jquery,table=layui.table;
							var layer = parent.layer === undefined ? layui.layer : parent.layer;
							$(".mybtn").on('click',function(){
								var outcom=this.value;
								var taskId='${workFlowVo.taskId}';
								var comment=$('#comment').val();
								var id='${leaveBill.id}';
								$.post("${ctx}/workFlow/completeTask.action",
										{taskId:taskId,outcom:outcom,comment:comment,id:id},
										function(data){
									layer.msg(data.msg);
									var index=parent.layer.getFrameIndex(window.name);
									parent.layer.close(index);
									parent.tableIns.reload();
								},'json')
							})
							//加载批注信息
							 var tableIns = table.render({
						            elem: '#commonList',
						            url : '${ctx }/workFlow/queryCommonsByTaskId.action?taskId=${workFlowVo.taskId}',
						            cellMinWidth : 95,
						            toolbar: 'true',
						            height : "full-220",
						            defaultToolbar: ['filter'],
						            id : "commonListTable",
						            cols : [[
						                {field: 'time', title: '批注时间', minWidth:100, align:"center"},
						                {field: 'userId', title: '批注人', minWidth:100, align:"center"},
						                {field: 'message', title: '批注内容', minWidth:100, align:"center"}
						            ]]
						        });
						});
	</script>
</body>
</html>