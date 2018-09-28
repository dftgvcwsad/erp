<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改角色</title>
<link rel="stylesheet" href="${ctx }/resources/layui/css/layui.css" media="all">
</head>
<body>
	<form id="layuiFm" class="layui-form" action="#" method="post" 
		lay-filter="doUpdateRole">
		<div class="layui-form-item">
				<label class="layui-form-label">角色名称</label>
				<div class="layui-input-block">
				<input type="hidden" name="id" value="${role.id}">
					<input type="text" name="name" id="name"  lay-verify="required" autocomplete="off"
						placeholder="请输入角色名称" class="layui-input" value="${role.name }">
				</div>
			</div>
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">角色备注</label>
				<div class="layui-input-block">
					<textarea placeholder="请输入内容" name="remark"  id="remark"  class="layui-textarea">${role.remark }</textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">是否可用</label>
					<div class="layui-input-inline">
						<input type="radio" name="available" value="1" title="是"  ${role.available==1?'checked':'' }> 
						<input type="radio" name="available" value="0" title="否" ${role.available==0?'checked':'' }>
					</div>
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
		layui.use([ 'form', 'layedit',  'jquery','layer' ],function() {
							var form = layui.form, $ = layui.jquery, layedit = layui.layedit;
							var layer = parent.layer === undefined ? layui.layer : parent.layer;
							//监听提交
							form.on('submit(doUpdate)', function(data) {
								var params=$("#layuiFm").serialize();
								$.post("${ctx}/role/updateRole.action?"+params,function(obj){
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