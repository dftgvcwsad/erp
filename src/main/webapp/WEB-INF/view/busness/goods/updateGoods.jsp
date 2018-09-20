<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加商品</title>
<link rel="stylesheet" href="${ctx }/resources/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/zTree/css/metroStyle/metroStyle.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/plugin/css/index.css">
    <script type="text/javascript" src="${ctx }/resources/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="${ctx }/resources/zTree/js/jquery.ztree.all.js"></script>
    <script type="text/javascript" src="${ctx }/resources/plugin/js/selectTree.js"></script>
</head>
<body>
	<form id="layuiFm" class="layui-form" action="#" method="post" 
		lay-filter="doUpdateGoods">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">供应商编号</label>
				<div class="layui-input-inline">
				<select id="providerid" name="providerid" >
					<c:forEach var="pro" items="${providerList }">
					<option value="${pro.id }"  ${goods.providerid eq pro.id ?'selected':'' }>${pro.providername }</option>
					</c:forEach>
					</select>
				</div>
				</div>
				</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">商品名称</label>
				<div class="layui-input-inline">
				<input type="hidden" name="id" value="${goods.id }">
					<input type="text" name="goodsname" id="goodsname" lay-verify="required" value="${goods.goodsname }"
						autocomplete="off"  class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">产地</label>
				<div class="layui-input-inline">
					<input type="text" name="produceplace" id="produceplace" lay-verify="required" value="${goods.produceplace }"
						autocomplete="off" placeholder="产地" class="layui-input">
				</div>
			</div>
			</div>
			<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">规格</label>
				<div class="layui-input-inline">
					<input type="text" name="size" id="size"  lay-verify="required"  value="${goods.size }"
						autocomplete="off" placeholder="规格" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">包装</label>
				<div class="layui-input-inline">
					<input type="text" name="goodspackage" id="goodspackage"  lay-verify="required"   value="${goods.goodspackage }"
						autocomplete="off" placeholder="包装" class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">生产批号</label>
				<div class="layui-input-inline">
					<input type="text" name="productcode" id="productcode" lay-verify="required" value="${goods.productcode }"
						autocomplete="off" placeholder="生产批号" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">批准文号</label>
				<div class="layui-input-inline">
					<input type="text" name="promitcode" id="promitcode" lay-verify="required" value="${goods.promitcode }"
						autocomplete="off" placeholder="批准文号"  class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">销售参考价格</label>
				<div class="layui-input-inline"> 
					<input type="text" name="price" id="price" lay-verify="number" value="${goods.price }"
						autocomplete="off" placeholder="销售参考价格"  class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
					<label class="layui-form-label">是否有效</label>
					<div class="layui-input-inline">
						<input type="radio" name="available" value="1" title="是"   ${goods.available==1?'checked':'' }>
						<input type="radio" name="available" value="0" title="否"  ${goods.available==0?'checked':'' }>
					</div>
				</div>
		</div>
			<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">库存数量</label>
				<div class="layui-input-inline">
					<input type="text" name="number" id="number" lay-verify="number" value="${goods.number }"
						autocomplete="off"  class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">预警库存</label>
				<div class="layui-input-inline">
					<input type="text" name="dangernum" id="dangernum" lay-verify="number" value="${goods.dangernum }"
						autocomplete="off"  class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">描述</label>
				<div class="layui-input-block">
					<textarea placeholder="请输入内容" name="description"  id="description"  class="layui-textarea">${goods.description }</textarea>
				</div>
			</div>
		<div class="layui-upload">
			<button type="button" class="layui-btn" id="test1">上传图片</button>
			<div class="layui-upload-list">
				<img class="layui-upload-img" id="demo1" width="150" height="150" src="${ctx}/${goods.goodsimg }">
				<input type="hidden" id="goodsimg" name="goodsimg" value="${goods.goodsimg }">
				<p id="demoText"></p>
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
	var goodsImgPath='';
		layui.use([ 'form', 'layedit',  'jquery','layer','upload' ],function() {
							var form = layui.form, $ = layui.jquery, layedit = layui.layedit;
							var upload = layui.upload;
							var layer = parent.layer === undefined ? layui.layer : parent.layer;
							 //普通图片上传
							  var uploadInst = upload.render({
							    elem: '#test1'
							    ,field:"fm"
							    ,url: '${ctx}/goods/updateGoodsImg.action?'
							    ,before: function(obj){
							      //预读本地文件示例，不支持ie8
							      obj.preview(function(index, file, result){
							        $('#demo1').attr('src', result); //图片链接（base64）
							      });
							    }
							    ,done: function(map){
							      if(map.code===0){
							    	  //上传成功在页面保存方便下次删除上次的图片
							    	  deleteOldGoodsImg(JSON.stringify(goodsImgPath));
							    	  goodsImgPath=map.path;
							    	  $('#goodsimg').val(goodsImgPath);
							      }else{
							    	  //如果上传失败
							    	  return layer.msg('上传失败');
							      }
							     
							    }
							    ,error: function(){
							      //演示失败状态，并实现重传
							      var demoText = $('#demoText');
							      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
							      demoText.find('.demo-reload').on('click', function(){
							        uploadInst.upload();
							      });
							    }
							  });
							 function deleteOldGoodsImg(ImgPath) {
								$.post('${ctx}/goods/deleteOldGoodsImg.action',{goodsimg:ImgPath},function(){
								});
							}
							//监听提交
							form.on('submit(doUpdate)', function(data) {
								var params=$("#layuiFm").serialize();
							 	$.post("${ctx}/goods/updateGoods.action?"+params,function(obj){
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