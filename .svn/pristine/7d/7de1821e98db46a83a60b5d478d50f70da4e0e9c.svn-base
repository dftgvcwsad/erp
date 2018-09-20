<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改公告</title>
<link rel="stylesheet" href="${ctx }/resources/layui/css/layui.css" media="all">
</head>
<body>
	<form id="layuiFm" class="layui-form" action="#" method="post" 
		lay-filter="doUpdateNotice">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">标题</label>
				<div class="layui-input-inline">
				<input type="hidden" name="id" value="${notice.id}">
					<input type="text" name="title" id="title" lay-verify="required"
						autocomplete="off" value="${notice.title}" placeholder="请输入标题" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">公告内容</label>
				<div class="layui-input-block">
					<textarea class="layui-textarea layui-hide" name="content"  lay-verify="content" id="LAY_demo_editor"></textarea>
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
							//创建一个编辑器
							var editIndex = layedit.build('LAY_demo_editor');
							//监听提交
							form.on('submit(doUpdate)', function(data) {
								layedit.sync(editIndex);
								var params=$("#layuiFm").serialize();
								$.post("${ctx}/notice/updateNotice.action?"+params,function(obj){
									layer.msg(obj.msg);//弹出修改成功或失败
									parent.tableIns.reload();//刷新表格
									//关闭窗口
									var index=layer.getFrameIndex(window.name);
									layer.close(index);
								})
								return false;
							});
							layedit.setContent(editIndex,'${notice.content }');
							 form.render();
						});
	</script>
</body>
</html>