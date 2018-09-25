<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加部署</title>
<link rel="stylesheet" href="${ctx }/resources/layui/css/layui.css" media="all">
</head>
<body>
	<form id="layuiFm" class="layui-form" action="#" method="post" 
		lay-filter="doAddRole">
		<div class="layui-form-item">
				<label class="layui-form-label">部署名称</label>
				<div class="layui-input-block">
					<input type="text" name="deploymentName" id="deploymentName"  lay-verify="required" autocomplete="off"
						placeholder="请输入部署名称" class="layui-input">
				</div>
			</div>
		<div class="layui-form-item">
			<label class="layui-form-label">选择流程图</label>
			<div class="layui-input-block">
				<div class="layui-upload">
					<button type="button" class="layui-btn layui-btn-normal"
						id="chouseZip">选择文件</button>
				</div>
			</div>
		</div>
		<div class="layui-form-item" align="center">
			<div>
				<button type="button"  class="layui-btn"  id="doAdd">提交</button>
				<button type="reset" class="layui-btn layui-btn-warm" >重置</button>
			</div>
		</div>
	</form>
	<script type="text/javascript" src="${ctx }/resources/layui/layui.js" ></script>
	</body>
	<script type="text/javascript">
		layui.use([ 'form','upload',  'jquery','layer' ],function() {
							var form = layui.form, $ = layui.jquery, upload=layui.upload;
							var layer = parent.layer === undefined ? layui.layer : parent.layer;
								//选完文件后不自动上传
								  upload.render({
								    elem: '#chouseZip'
								    ,url: '${ctx}/workFlow/addProcessDeployment.action'
								    ,auto: false
								    ,exts:'zip'//只允许上传压缩文件  帮我们在提交之前去验文件的后缀名
								    ,acceptMime:'application/zip'//设置默认选择的文件类型
								    ,field:'mf'
								     ,data: {
								           deploymentName: function(){
								    return $('#deploymentName').val();
								          }
								      }
								    ,bindAction: '#doAdd'
								    ,done: function(obj){
										//关闭窗口
										var index=parent.layer.getFrameIndex(window.name);
										 window.parent.layer.close(index);
										 layer.msg(obj.msg);//弹出添加成功或失败
										//刷新父页面的table
							                window.parent.tableInDeploy.reload();
							                window.parent.tableInProcessDef.reload();
								    }
								  });
						});
	</script>
</html>