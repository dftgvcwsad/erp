<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改用户</title>
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
		lay-filter="doUpdateUser">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">所在部门</label>
				<div class="layui-input-inline">
					<div id="deptid" name="deptid" class="select-tree layui-form-select"></div>
				</div>
				</div>
				<div class="layui-inline">
				<label class="layui-form-label">排序码</label>
				<div class="layui-input-inline">
				<input name="id" type="hidden" value="${user.id }">
					<input type="text" name="ordernum" id="ordernum" lay-verify="number" value="${user.ordernum }"
						autocomplete="off" placeholder="请输入排序码" class="layui-input">
				</div>
			</div>
			</div>
			<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">领导部门</label>
				<div class="layui-input-inline">
					<div id="leaderdeptid" name="leaderdeptid" class="select-tree layui-form-select"></div>
				</div>
				</div>
				<div class="layui-inline">
				<label class="layui-form-label">领导名称</label>
				<div class="layui-input-inline">
					<select id="mgr" name="mgr" class="layui-form-select">
					</select>
				</div>
				</div>
			</div>
			<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">用户姓名</label>
				<div class="layui-input-inline">
					<input type="text" name="name" id="name"  lay-verify="required" autocomplete="off"
						placeholder="请输入用户姓名" class="layui-input" value="${user.name }">
				</div>
				 </div>
				 <div class="layui-inline">
				<label class="layui-form-label">登录名</label>
				<div class="layui-input-inline">
					<input type="text" name="loginname" id="loginname"  value="${user.loginname}" lay-verify="required" autocomplete="off" class="layui-input">
				</div>
				 </div>
			</div>
			<div class="layui-form-item">
				<div class="layui-block">
				<label class="layui-form-label">用户地址</label>
				<div class="layui-input-block">
				<input type="text" name="address" id="address"  value="${user.address }" autocomplete="off" class="layui-input">
				</div>
				</div>
				</div>
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">用户备注</label>
				<div class="layui-input-block">
					<textarea placeholder="请输入内容" name="remark"  id="remark"  class="layui-textarea">${user.remark }</textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">性别</label>
					<div class="layui-input-inline">
						<input type="radio" name="sex" value="1" title="男"  ${user.sex==1?'checked':'' }>
						<input type="radio" name="sex" value="0" title="女"  ${user.sex==0?'checked':'' }>
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
			<div class="layui-form-item">
				<div class="layui-inline">
						<label class="layui-form-label">入职日期</label>
						<div class="layui-input-inline">
							<input type="text" name="hiredate" id="hiredate"  placeholder="yyyy-MM-dd HH:mm:ss"
								 autocomplete="off" class="layui-input " value="<fmt:formatDate value="${user.hiredate }" pattern="yyyy-MM-dd HH:mm:ss"/>">
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
	 //根据部门id查询部门下面的所有员工
	 function getUserBydeptId(deptid) {
		$.post("${ctx}/user/getUserBydeptId.action",{deptid:deptid},function(data){
			var html="";
			var leaderId=${user.mgr};
			if(data.length>0){
				for(var i=0;i<data.length;i++){
					if(leaderId===data[i].id){
						html+="<option selected  value="+data[i].id+">"+data[i].name+"</option>"
					}else{
						html+="<option value="+data[i].id+">"+data[i].name+"</option>"
					}
				}
				$("#mgr").html(html);
			}else{
				$("#mgr").html(html);
			}
			layui.use(['form'],function(){
				var form = layui.form;
				form.render("select");//重新渲染
			})
		},'json');
	}
		layui.use([ 'form', 'layedit', 'laydate', 'jquery','layer' ],function() {
			var form = layui.form;
			  var layer = parent.layer === undefined ? layui.layer : top.layer,
		        $ = layui.jquery,
		        laydate = layui.laydate,
		        laytpl = layui.laytpl,
		        table = layui.table;
			  //日期
			    laydate.render({
			      elem: '#hiredate'
			    	  ,type: 'datetime'
			    });
							//监听提交
							form.on('submit(doUpdate)', function(data) {
								var params=$("#layuiFm").serialize();
								$.post("${ctx}/user/updateUser.action?"+params,function(obj){
									layer.msg(obj.msg);//弹出修改成功或失败
									parent.tableIns.reload();//刷新表格
									//关闭窗口
									 var index = parent.layer.getFrameIndex(window.name);
						             parent.layer.close(index);
								}) 
								return false;
							});
							 $("#name").on("blur",function(){
								 var name=$('#name').val();
								 $.post("${ctx}/user/getLoginnamePinyinByName.action",{name:name},function(data){
									$('#loginname').val(data);
								 })
							 })
							 
						});
		$(document).ready(function () {
			 $.post("${ctx}/dept/loadDeptTree.action?available=1",function(zNodes){
				 initSelectTree("deptid",zNodes, false);
				 initSelectTree("leaderdeptid",zNodes, false);
				 //回显选中部门
				 var userDeptId='${user.deptid}';
				 var treeObj = $.fn.zTree.getZTreeObj("deptidTree");
				 var node = treeObj.getNodeByParam("id", userDeptId);
				 treeObj.selectNode(node);
				//渲染
	     		 onClick(event,"deptidTree",node);
				 //回显选中领导部门
				 var leaderId=${user.mgr};
				 if(leaderId!==-1){
					 $.post('${ctx}/user/queryUserById.action',{id:leaderId},function(data){
							var leaderDeptId=data.deptid;
							 var treeObj = $.fn.zTree.getZTreeObj("leaderdeptidTree");
							 var leaderNode = treeObj.getNodeByParam("id", leaderDeptId);
							 treeObj.selectNode(leaderNode);
							//渲染
				     		 onClick(event,"leaderdeptidTree",leaderNode);
						 })
				 }
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