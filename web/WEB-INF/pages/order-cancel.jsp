<%--
  Created by IntelliJ IDEA.
  User: Sen
  Date: 2019/7/11
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>取消订单</title>
    <link rel="stylesheet" type="text/css" href="<%=path%>/assets/amazeui/css/amazeui.min.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/assets/layer/skin/layer.css">
    <script type="text/javascript" src="<%=path%>/assets/libs/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="<%=path%>/assets/amazeui/js/amazeui.min.js"></script>
    <script type="text/javascript" src="<%=path%>/assets/layer/layer.js"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/pages/header.jsp"></jsp:include>
    取消订单成功！
</body>
</html>
