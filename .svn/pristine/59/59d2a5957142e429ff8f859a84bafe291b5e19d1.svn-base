<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改部门</title>
<link rel="stylesheet" href="${ctx }/resources/layui/css/layui.css"
	media="all">
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/zTree/css/metroStyle/metroStyle.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/plugin/css/index.css">
    <script type="text/javascript" src="${ctx }/resources/zTree/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="${ctx }/resources/zTree/js/jquery.ztree.all.js"></script>
    <script type="text/javascript" src="${ctx }/resources/plugin/js/selectTree.js"></script>
</head>
<body>
	<form id="layuiFm" class="layui-form" action="#" method="post" 
		lay-filter="doUpdateDept">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">父级部门</label>
				<div class="layui-input-inline">
					<div id="pid" name="pid" class="select-tree layui-form-select"></div>
				</div>
				<label class="layui-form-label">排序码</label>
				<div class="layui-input-inline">
				<input type="hidden" name="id" value="${dept.id}">
					<input type="text" name="ordernum" id="ordernum" value="${dept.ordernum }" lay-verify="number"
						autocomplete="off" placeholder="请输入排序码" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">部门名称</label>
				<div class="layui-input-block">
					<input type="text" name="name" id="name" value="${dept.name }" lay-verify="required" autocomplete="off"
						placeholder="请输入部门名称" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">部门地址</label>
				<div class="layui-input-block">
					<input type="text" name="loc" id="loc" value="${dept.loc }"  lay-verify="required" autocomplete="off"
						placeholder="请输入部门地址" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">部门备注</label>
				<div class="layui-input-block">
					<textarea placeholder="请输入内容" name="remark"   id="remark"  class="layui-textarea">${dept.remark}</textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">是否展开</label>
					<div class="layui-input-inline" id="open">
						<input type="radio" name="open" value="1" title="是" ${dept.open==1?'checked':'' }>
						<input type="radio" name="open" value="0" title="否" ${dept.open==0?'checked':'' }>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">是否父节点</label>
					<div class="layui-input-inline">
						<input type="radio" name="parent" value="1" lay-filter="parent" title="是" ${dept.parent==1?'checked':'' }> 
							<input type="radio" name="parent" value="0" lay-filter="parent" title="否" ${dept.parent==0?'checked':'' }>
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">是否可用</label>
					<div class="layui-input-inline">
						<input type="radio" name="available" value="1" title="是" ${dept.available==1?'checked':'' }> 
							<input type="radio" name="available" value="0" title="否"  ${dept.available==0?'checked':'' }>
					</div>
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
							//$('#open>input[value=${dept.open}]').prop('checked',true);
							//监听提交
							form.on('submit(doUpdate)', function(data) {
								var params=$("#layuiFm").serialize();
								$.post("${ctx}/dept/updateDept.action?"+params,function(obj){
									layer.msg(obj.msg);//弹出添加成功或失败
									parent.tableIns.reload();//刷新表格
									parent.parent.left.initTree();//刷新左边的树
									//关闭窗口
									var index=layer.getFrameIndex(window.name);
									layer.close(index);
								}) 
							});
						});
		
		 $(document).ready(function () {
		       initDeptTree();
		    });

				function initDeptTree() {
			 $.post("${ctx}/dept/loadDeptTree.action?available=1",function(zNodes){
				 initSelectTree("pid",zNodes, false);
				 var treeObj = $.fn.zTree.getZTreeObj("pidTree");
				 var pid =${dept.pid};
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