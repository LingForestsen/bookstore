<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <title>用户登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="<%=path%>/assets/amazeui/css/amazeui.min.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/assets/layer/skin/layer.css">
	<script type="text/javascript" src="<%=path%>/assets/libs/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="<%=path%>/assets/amazeui/js/amazeui.min.js"></script>
	<script type="text/javascript" src="<%=path%>/assets/layer/layer.js"></script>
<style type="text/css">
.container{
  	width:700px;margin-left:auto;margin-right:auto;
}
.am-input-group{
	width:100%;
	margin-bottom: 5px;
}
.am-input-group > .am-input-group-label{
	width: 150px;
	text-align: left;
}
</style>
  </head>
  
  <body>

  <jsp:include page="/WEB-INF/pages/header.jsp" ></jsp:include>
    
<div class="container">

    <form action="<%=path%>/login!exe.html" method="post" data-am-validator class="am-form" >
    	<div class="am-input-group">
		  <span class="am-input-group-label">
		  	<i class="am-icon-user am-icon-fw"></i>
		  	账号
		  </span>
		  <input type="text" name="username" class="am-form-field" placeholder="请输入用户名" required>
		</div>
    	<div class="am-input-group">
		  <span class="am-input-group-label">
		  	<i class="am-icon-user am-icon-fw"></i>
		  	密码
		  </span>
		  <input type="password" name="password" class="am-form-field" placeholder="请输入密码">
		</div>
		
		<input type="checkbox" name="remember" value="yes">
		记住我7天<br>
		<button type="submit" class="am-btn am-btn-primary">登录</button>
    	
    </form>
</div>
    
  </body>
</html>
