<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改客户</title>
<link rel="stylesheet" href="${ctx }/resources/layui/css/layui.css" media="all">
</head>
<body>
	<form id="layuiFm" class="layui-form" action="#" method="post" 
		lay-filter="doUpdateCustomer">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">客户名称</label>
				<div class="layui-input-inline">
				<input type="hidden" name="id" value="${customer.id }">
					<input type="text" value="${customer.customername }" name="customername" id="customername" lay-verify="required"
						autocomplete="off"  class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">公司电话</label>
				<div class="layui-input-inline">
					<input type="text" value="${customer.telephone }"  name="telephone" id="telephone" lay-verify="number"
						autocomplete="off" placeholder="公司电话" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">邮编</label>
				<div class="layui-input-inline">
					<input type="text" value="${customer.zip }"   name="zip" id="zip"  
						autocomplete="off" placeholder="邮编" class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-block">
				<label class="layui-form-label">公司地址</label>
				<div class="layui-input-block">
					<input type="text"  value="${customer.address }"  name="address" id="address" lay-verify="required"
						autocomplete="off" placeholder="公司地址" class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">联系人</label>
				<div class="layui-input-inline">
					<input type="text"  value="${customer.connectionperson }"  name="connectionperson" id="connectionperson" lay-verify="required"
						autocomplete="off"  class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">联系人电话</label>
				<div class="layui-input-inline">
					<input type="text"  value="${customer.phone }"  name="phone" id="phone" lay-verify="number"
						autocomplete="off"  class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">联系人邮编</label>
				<div class="layui-input-inline">
					<input type="text"  value="${customer.email }"  name="email" id="email" 
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
			<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">开户银行</label>
				<div class="layui-input-inline">
					<input type="text"  value="${customer.bank }"  name="bank" id="bank" lay-verify="required"
						autocomplete="off"  class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">帐号</label>
				<div class="layui-input-inline">
					<input type="text"  value="${customer.account }"  name="account" id="account" lay-verify="number"
						autocomplete="off"  class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">传真</label>
				<div class="layui-input-inline">
					<input type="text"  value="${customer.fax }"  name="fax" id="fax" 
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">是否有效</label>
					<div class="layui-input-inline">
						<input type="radio" name="available " value="1" title="是" ${customer.available==1?'checked':'' }>
						<input type="radio" name="available " value="0" title="否" ${customer.available==0?'checked':'' }>
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
								$.post("${ctx}/customer/updateCustomer.action?"+params,function(obj){
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