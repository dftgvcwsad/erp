<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改进货单</title>
<link rel="stylesheet" href="${ctx }/resources/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/zTree/css/metroStyle/metroStyle.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/plugin/css/index.css">
    <script type="text/javascript" src="${ctx }/resources/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="${ctx }/resources/zTree/js/jquery.ztree.all.js"></script>
    <script type="text/javascript" src="${ctx }/resources/plugin/js/selectTree.js"></script>
</head>
<body>
	<form id="layuiFm" class="layui-form" action="#" method="post" 
		lay-filter="doUpdateInport">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">供应商</label>
				<div class="layui-input-inline">
					<div id="providerid" name="providerid" class="select-tree layui-form-select"></div>
				</div>
				</div>
				<div class="layui-inline">
				<label class="layui-form-label">商品</label>
				<div class="layui-input-inline">
					<select id="goodsid" name="goodsid" class="layui-form-select">
					</select>
				</div>
				</div>
			</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">进货数量</label>
				<div class="layui-input-inline">
				<input type="hidden" name="id"   value="${inport.id }">
				<input type="hidden" name="oldumber"   value="${inport.number }">
					<input type="text" name="number" id="number" lay-verify="number" value="${inport.number }"
						autocomplete="off"  class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">进货价格</label>
				<div class="layui-input-inline">
					<input type="text" name="inportprice" id="inportprice" lay-verify="number" value="${inport.inportprice }"
						autocomplete="off"   class="layui-input">
				</div>
			</div>
			</div>
			<div class="layui-form-item">
			<div class="layui-inline">
					<label class="layui-form-label">支付类型</label>
					<div class="layui-input-inline" id="paytype">
						<input type="radio" name="paytype" value="微信" title="微信"  >
						<input type="radio" name="paytype" value="支付宝" title="支付宝" >
						<input type="radio" name="paytype" value="银联" title="银联"  >
					</div>
				</div>
		</div>
		<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">描述</label>
				<div class="layui-input-block">
					<textarea placeholder="请输入内容" name="remark"  id="remark"  class="layui-textarea">${inport.remark }</textarea>
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
	var from;
				$('#paytype>input[value=${inport.paytype}]').prop('checked',true);
		layui.use([ 'form', 'layedit',  'jquery','layer' ],function() {
					form = layui.form;
							var  $ = layui.jquery, layedit = layui.layedit;
							var layer = parent.layer === undefined ? layui.layer : parent.layer;
							//监听提交
							form.on('submit(doUpdate)', function(data) {
								var params=$("#layuiFm").serialize();
							 	$.post("${ctx}/inport/updateInport.action?"+params,function(obj){
									layer.msg(obj.msg);//弹出修改成功或失败
									parent.tableIns.reload();//刷新表格
									//关闭窗口
									var index=layer.getFrameIndex(window.name);
									layer.close(index);
								}) 
								return false;
							});
						});
		$(document).ready(function () {
			 $.post("${ctx}/provider/loadAllProviderAvailableTree.action?available=1",function(zNodes){
				 initSelectTree("providerid",zNodes, false);
				 //回显选中供应商
				  var providerId=${inport.providerid};
					var treeObj = $.fn.zTree.getZTreeObj("provideridTree");
					var providerNode = treeObj.getNodeByParam("id", providerId);
					treeObj.selectNode(providerNode);
					//渲染
					onClick(event,"provideridTree",providerNode);
			        $(".layui-nav-item a").bind("click", function () {
			            if (!$(this).parent().hasClass("layui-nav-itemed") && !$(this).parent().parent().hasClass("layui-nav-child")) {
			                $(".layui-nav-tree").find(".layui-nav-itemed").removeClass("layui-nav-itemed")
			            }
			        })
			 });
	    });
		 //根据部门id查询部门下面的所有员工
		 function getGoodsByProviderId(providerid) {
			$.post("${ctx}/goods/getGoodsByProviderId.action",{providerid:providerid},function(data){
				var html="";
				var goodsId=${inport.goodsid};
				if(data.length>0){
					for(var i=0;i<data.length;i++){
						if(goodsId===data[i].id){
							html+="<option selected  value="+data[i].id+">"+data[i].goodsname+"</option>"
						}else{
							html+="<option value="+data[i].id+">"+data[i].goodsname+"</option>"
						}
					}
					$("#goodsid").html(html);
				}else{
					$("#goodsid").html(html);
				}
				layui.use(['form'],function(){
					var form = layui.form;
					form.render("select");//重新渲染
				})
			},'json');
		}
	</script>
</body>
</html>