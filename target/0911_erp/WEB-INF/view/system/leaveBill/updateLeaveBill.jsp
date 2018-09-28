<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改请假单</title>
<link rel="stylesheet" href="${ctx }/resources/layui/css/layui.css" media="all">
</head>
<body>
	<form id="layuiFm" class="layui-form" action="#" method="post" 
		lay-filter="doUpdateLeaveBill">
		<div class="layui-form-item">
			<div class="layui-block">
				<label class="layui-form-label">标题</label>
				<div class="layui-input-block">
					<input type="text" name="title" id="title" readonly="readonly"  lay-verify="required" value="【${loginUser.name}】的请假单"
						autocomplete="off" placeholder="请输入标题" class="layui-input">
						<input type="hidden" name="userid" value="${leaveBill.userid }">
						<input type="hidden" name="state" value="${leaveBill.state }">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
		<div class="layui-inline">
				<label class="layui-form-label">请假天数</label>
				<div class="layui-input-inline">
					<input type="text" name="days" id="days"  lay-verify="number" autocomplete="off"
						placeholder="请输入请假天数" class="layui-input"  value="${leaveBill.days }">
				</div>
				 </div>
				<div class="layui-inline">
						<label class="layui-form-label">开始时间</label>
						<div class="layui-input-inline">
							<input type="text" name="leavetime" id="leavetime"  placeholder="yyyy-MM-dd HH:mm:ss"
								 autocomplete="off" class="layui-input "  value="<fmt:formatDate value="${leaveBill.leavetime }" pattern="yyyy-MM-dd HH:mm:ss"/>">
						</div>
					</div>
			</div>
		<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">请假单详情</label>
				<div class="layui-input-block">
					<textarea placeholder="请输入内容" name="content"  id="content"  class="layui-textarea" >${leaveBill.content }</textarea>
				</div>
			</div>
		<div class="layui-form-item" align="center">
			<div>
				<button class="layui-btn" lay-submit="" lay-filter="doUpdate">提交</button>
				<button type="reset" class="layui-btn layui-btn-warm" >重置</button>
			</div>
		</div>
	</form>
	<script src="${ctx }/resources/layui/layui.js" charset="utf-8"></script>
	<script>
		layui.use([ 'form',  'laydate' , 'jquery','layer' ],function() {
							var form = layui.form, $ = layui.jquery,laydate = layui.laydate;
							var layer = parent.layer === undefined ? layui.layer : parent.layer;
							 //日期
						    laydate.render({
						      elem: '#leavetime'
						    	  ,type: 'datetime'
						    });
							//监听提交
							form.on('submit(doUpdate)', function(data) {
								var params=$("#layuiFm").serialize();
								$.post("${ctx}/leaveBill/updateLeaveBill.action?"+params,function(obj){
									layer.msg(obj.msg);//弹出修改成功或失败
									parent.tableIns.reload();//刷新表格
									//关闭窗口
									var index=layer.getFrameIndex(window.name);
									layer.close(index);
								})
								return false;
							});
						});
	</script>
</body>
</html>