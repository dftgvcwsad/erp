<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改权限</title>
<link rel="stylesheet" href="${ctx }/resources/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/zTree/css/metroStyle/metroStyle.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/plugin/css/index.css">
    <script type="text/javascript" src="${ctx }/resources/zTree/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="${ctx }/resources/zTree/js/jquery.ztree.all.js"></script>
    <script type="text/javascript" src="${ctx }/resources/plugin/js/selectTree.js"></script>
</head>
</head>
<body>
	<form id="layuiFm" class="layui-form" action="#" method="post" 
		lay-filter="doUpdatePermission">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">父级权限</label>
				<div class="layui-input-inline">
					<div id="pid" name="pid" class="select-tree layui-form-select"></div>
				</div>
				</div>
				<div class="layui-inline">
				<label class="layui-form-label">排序码</label>
				<div class="layui-input-inline">
				<input type="hidden" name="id" value="${permission.id}">
					<input type="text" name="ordernum" id="ordernum" lay-verify="number"
						autocomplete="off" placeholder="排序码"  class="layui-input" value="${permission.ordernum }">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
				<div class="layui-inline">
				<label class="layui-form-label">权限名称</label>
				<div class="layui-input-inline">
					<input type="text" name="name" id="name" lay-verify="required"  value="${permission.name }"
						autocomplete="off" placeholder="请输入权限名称"  class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">权限编码</label>
				<div class="layui-input-inline">
					<input type="text" name="percode" id="percode" lay-verify="required"  value="${permission.percode }"
						autocomplete="off" placeholder="请输入权限编码"  class="layui-input">
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
								$.post("${ctx}/permission/updatePermission.action?"+params,function(obj){
									layer.msg(obj.msg);//弹出修改成功或失败
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
		       initDeptTree();
		    });

				function initDeptTree() {
			 $.post("${ctx}/permission/loadPermissionTree.action?available=1",function(zNodes){
				 initSelectTree("pid",zNodes, false);
				 var treeObj = $.fn.zTree.getZTreeObj("pidTree");
				 var pid =${permission.pid};
				 var node = treeObj.getNodeByParam("id", pid);
				 treeObj.selectNode(node);
				//渲染
	     		 onClick(event,"pidTree",node);
			        $(".layui-nav-item a").bind("click", function () {
			            if (!$(this).parent().hasClass("layui-nav-itemed") && !$(this).parent().parent().hasClass("layui-nav-child")) {
			                $(".layui-nav-tree").find(".layui-nav-itemed").removeClass("layui-nav-itemed")
			            }
			        })
			 });
	    }
	</script>
</body>
</html>