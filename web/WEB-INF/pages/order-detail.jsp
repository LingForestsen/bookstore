<%--
  Created by IntelliJ IDEA.
  User: Sen
  Date: 2019/7/10
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:if test="${sessionScope.Login_Info == null}">
    <c:redirect url="/user/showlogin.html"></c:redirect>
</c:if>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>订单详情</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <%-- 基础环境 --%>
    <script type="text/javascript" src="<%=path%>/assets/libs/jquery-1.10.1.min.js"></script>
    <%-- 妹子UI --%>
    <script src="<%=path%>/assets/amazeui/js/amazeui.min.js"></script>
    <link rel="stylesheet" href="<%=path %>/assets/amazeui/css/amazeui.min.css"/>
    <link rel="stylesheet" href="<%=path %>/assets/amazeui/css/admin.css">
    <%-- Others --%>
    <script type="text/javascript" src="<%=path%>/assets/cityloader/jquery.cityloader.static.cn.min.js"></script>
    <style type="text/css">
        .container{
            width:700px;margin-left:auto;margin-right:auto;
        }

    </style>
</head>

<body>
<jsp:include page="/WEB-INF/pages/header.jsp"></jsp:include>

<div class="container">
        <%-- 收件人信息面板-Begin --%>
        <div class="am-panel am-panel-success">
            <div class="am-panel-hd">收件人信息</div>
            <div class="am-panel-bd">
                <table class="am-table am-table-bordered">
                    <tbody>
                            <tr>
                                <td>姓名</td>
                                <td>${requestScope.Orders.name}</td>
                            </tr>
                            <tr>
                                <td>电话</td>
                                <td>${requestScope.Orders.phone}</td>
                            </tr>
                            <tr>
                                <td>地址</td>
                                <td>${requestScope.Orders.address}</td>
                            </tr>
                    </tbody>
                </table>

            </div>
        </div>
        <%-- 收件人信息面板-End --%>

        <%-- 购物清单面板-Begin --%>
        <div class="am-panel am-panel-warning">
            <div class="am-panel-hd">购物清单</div>
            <div class="am-panel-bd">
                <table class="am-table am-table-bordered">
                    <thead>
                    <tr>
                        <th >商品</th>
                        <th style="width:70px;">单价</th>
                        <th style="width:150px;">数量</th>
                        <th style="width:80px;">小计</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${requestScope.List}" var="list">
                        <tr>
                            <td>${list.product.name }</td>
                            <td>${list.price }</td>
                            <td>${list.quantity }</td>
                            <td>
                                <fmt:formatNumber type="number" value="${list.price*list.quantity }" pattern="0.00" maxFractionDigits="2"/>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                订单总价：<span style="color:#FF6600;font-size:30px;text-align:left;">￥${requestScope.Orders.price}</span>
                <hr>
                订单状态：
                <c:set var="ord" value="${requestScope.Orders}"></c:set>
                <c:choose>
                    <c:when test="${ord.state == 0}">未付款</c:when>
                    <c:when test="${ord.state == 1}">已付款</c:when>
                    <c:when test="${ord.state == 2}">已发货</c:when>
                    <c:when test="${ord.state == 3}">已签收</c:when>
                    <c:when test="${ord.state == 4}">已取消</c:when>
                </c:choose>
            </div>
        </div>
        <%-- 购物清单面板-End --%>

</div>
<script type="text/javascript">
    $(function(){

    });
</script>
</body>
</html>

