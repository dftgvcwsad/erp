<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>流程图</title>
<style type="text/css">
.mydiv{
	border:2px solid red;
	margin: 3px;
	border-radius: 5px;
}
</style>
</head>
<body>

	<img alt="流程图"  style="position: absolute;" src="${ctx }/workFlow/viewProcessImge.action?deploymentId=${workFlowVo.deploymentId}">

</body>
</html>