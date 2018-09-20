<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加供应商</title>
<link rel="stylesheet" href="${ctx }/resources/layui/css/layui.css" media="all">
</head>
<body>
	<form id="layuiFm" class="layui-form" action="#" method="post" 
		lay-filter="doAddProvider">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">供应商名称</label>
				<div class="layui-input-inline">
					<input type="text" name="providername" id="providername" lay-verify="required"
						autocomplete="off"  class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">公司电话</label>
				<div class="layui-input-inline">
					<input type="text" name="telephone" id="telephone" lay-verify="number"
						autocomplete="off" placeholder="公司电话" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">邮编</label>
				<div class="layui-input-inline">
					<input type="text" name="zip" id="zip" 
						autocomplete="off" placeholder="邮编" class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-block">
				<label class="layui-form-label">公司地址</label>
				<div class="layui-input-block">
					<input type="text" name="address" id="address" lay-verify="required"
						autocomplete="off" placeholder="公司地址" class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">联系人</label>
				<div class="layui-input-inline">
					<input type="text" name="connectionperson" id="connectionperson" lay-verify="required"
						autocomplete="off"  class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">联系人电话</label>
				<div class="layui-input-inline">
					<input type="text" name="phone" id="phone" lay-verify="number"
						autocomplete="off"  class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">联系人邮编</label>
				<div class="layui-input-inline">
					<input type="text" name="email" id="email" 
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
			<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">开户银行</label>
				<div class="layui-input-inline">
					<input type="text" name="bank" id="bank" lay-verify="required"
						autocomplete="off"  class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">帐号</label>
				<div class="layui-input-inline">
					<input type="text" name="account" id="account" lay-verify="number"
						autocomplete="off"  class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">传真</label>
				<div class="layui-input-inline">
					<input type="text" name="fax" id="fax" 
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">是否有效</label>
					<div class="layui-input-inline">
						<input type="radio" name="available" value="1" title="是"  checked="">
						<input type="radio" name="available" value="0" title="否" >
					</div>
				</div>
				</div>
		<div class="layui-form-item" align="center">
			<div>
				<button class="layui-btn" lay-submit="" lay-filter="doAdd">提交</button>
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
							form.on('submit(doAdd)', function(data) {
								var params=$("#layuiFm").serialize();
								$.post("${ctx}/provider/addProvider.action?"+params,function(obj){
									layer.msg(obj.msg);//弹出添加成功或失败
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