<%--
  Created by IntelliJ IDEA.
  User: Sen
  Date: 2019/6/29
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>

    <title style="margin-left:auto;margin-right:auto">用户注册</title>

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
    <script type="text/javascript" src="<%=path%>/assets/cityloader/jquery.cityloader.static.cn.js"></script>
</head>
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
<body>
<jsp:include page="/WEB-INF/pages/header.jsp" ></jsp:include>
<div class="container">
    <form action="<%=path%>/user/register.action" method="post" data-am-validator class="am-form">
        <div class="am-input-group">
		  <span class="am-input-group-label">
		  	<i class="am-icon-user am-icon-fw"></i>
		  	账号
		  </span>
            <input name="user.username" type="text" class="am-form-field" placeholder="请输入用户名" required>
        </div>
        <div class="am-input-group">
		  <span class="am-input-group-label">
		  	<i class="am-icon-user am-icon-fw"></i>
		  	邮箱
		  </span>
            <input name="user.email" type="text" class="am-form-field" placeholder="请输邮箱地址" required>
        </div>
        <div id="box" class="am-input-group">
		  <span class="am-input-group-label">
		  	<i class="am-icon-user am-icon-fw"></i>
		  	密码
		  </span>
            <input name="user.password" type="password" class="am-form-field" placeholder="请输入密码" required>
        </div>
        <div class="am-input-group" cityloader>
		  	<span class="am-input-group-label">
		  		<i class="am-icon-user am-icon-fw"></i>
		  		省/市/区
		  	</span>
            <select  name="user.provice"></select>
            <select  name="user.city"></select>
            <select  name="user.area"></select>
        </div>

        <div class="am-input-group">
		  <span class="am-input-group-label">
		  	<i class="am-icon-user am-icon-fw"></i>
		  	地址
		  </span>
            <input name="user.addr" type="text" class="am-form-field" placeholder="请输入用户名" required>
        </div>
        <div class="am-input-group">
		  <span class="am-input-group-label">
		  	<i class="am-icon-user am-icon-fw"></i>
		  	真实姓名
		  </span>
            <input name="user.realname" type="text" class="am-form-field" placeholder="请输入用户名" required>
        </div>
        <div class="am-input-group">
		  <span class="am-input-group-label">
		  	<i class="am-icon-user am-icon-fw"></i>
		  	联系电话
		  </span>
            <input name="user.phone" type="text" class="am-form-field" placeholder="请输入用户名" required>
        </div>
        <button type="submit" class="am-btn am-btn-primary">提交注册</button>
    </form>
</div>
    <script type="text/javascript">
        $(function(){

        });
    </script>
</body>
</html>
