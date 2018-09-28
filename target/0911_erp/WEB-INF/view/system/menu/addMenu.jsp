<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加菜单</title>
<link rel="stylesheet" href="${ctx }/resources/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/zTree/css/metroStyle/metroStyle.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/plugin/css/index.css">
    <script type="text/javascript" src="${ctx }/resources/zTree/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="${ctx }/resources/zTree/js/jquery.ztree.all.js"></script>
    <script type="text/javascript" src="${ctx }/resources/plugin/js/selectTree.js"></script>
</head>
<body>
	<form id="layuiFm" class="layui-form" action="#" method="post" 
		lay-filter="doAddMenu">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">父级菜单</label>
				<div class="layui-input-inline">
					<div id="pid" name="pid" class="select-tree layui-form-select"></div>
				</div>
				</div>
				<div class="layui-inline">
				<label class="layui-form-label">排序码</label>
				<div class="layui-input-inline">
					<input type="text" name="ordernum" id="ordernum" lay-verify="number"
						autocomplete="off" placeholder="排序码"  class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
				<label class="layui-form-label">菜单名称</label>
				<div class="layui-input-block">
					<input type="text" name="name" id="name" lay-verify="required" autocomplete="off"
						placeholder="请输入菜单名称" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">菜单地址</label>
				<div class="layui-input-block">
					<input type="text" name="href" id="href" lay-verify="required" autocomplete="off"
						placeholder="请输入菜单地址" class="layui-input">
				</div>
			</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">菜单图标</label>
				<div class="layui-input-inline">
					<input type="text" name="icon" id="icon" lay-verify="required"
						autocomplete="off" placeholder="请输入菜单图标"  class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">TARGET</label>
				<div class="layui-input-inline">
					<input type="text" name="target" id="target" 
						autocomplete="off" placeholder="TARGET" class="layui-input">
				</div>
			</div>
			</div>
		<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">是否展开</label>
					<div class="layui-input-inline">
						<input type="radio" name="open" value="1" title="是" >
						<input type="radio" name="open" value="0" title="否" checked="">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">是否父节点</label>
					<div class="layui-input-inline">
						<input type="radio" name="parent" value="1" lay-filter="parent" title="是" > 
							<input type="radio" name="parent"
							value="0" lay-filter="parent" title="否" checked="">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">是否可用</label>
					<div class="layui-input-inline">
						<input type="radio" name="available" value="1" title="是"
							checked=""> <input type="radio" name="available"
							value="0" title="否">
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
								$.post("${ctx}/menu/addMenu.action?"+params,function(obj){
									layer.msg(obj.msg);//弹出添加成功或失败
									parent.tableIns.reload();//刷新表格
									parent.parent.left.initTree();//刷新左边的树
									//关闭窗口
									var index=layer.getFrameIndex(window.name);
									layer.close(index);
								})
								return false;
							});
						});
		$(document).ready(function () {
			 $.post("${ctx}/menu/loadMenuTree.action?available=1",function(zNodes){
				 initSelectTree("pid",zNodes, false);
			        $(".layui-nav-item a").bind("click", function () {
			            if (!$(this).parent().hasClass("layui-nav-itemed") && !$(this).parent().parent().hasClass("layui-nav-child")) {
			                $(".layui-nav-tree").find(".layui-nav-itemed").removeClass("layui-nav-itemed")
			            }
			        })
			 });
	    });
	</script>
</body>
</html>