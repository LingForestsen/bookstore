<%--
  Created by IntelliJ IDEA.
  User: Sen
  Date: 2019/6/28
  Time: 23:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>购物车</title>

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
    <%--  分页插件  --%>
    <link rel="stylesheet" type="text/css" href="<%=path%>/assets/laypage/skin/laypage.css">
    <script type="text/javascript" src="<%=path%>/assets/laypage/laypage.js"></script>
<style type="text/css">
    .container{
        width:700px;margin-left:auto;margin-right:auto;
    }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/pages/header.jsp" ></jsp:include>
<div class="container">
    <table id="pros" class="am-table am-table-bordered">
        <thead>
        <tr>
            <th>商品</th>
            <th style="width: 70px">单价</th>
            <th style="width: 150px">数量</th>
            <th style="width: 80px">小计</th>
            <th style="width: 100px">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${sessionScope.ShopCart.itemList}" var="ci">
        <tr>
            <td>${ci.product.name}</td>
            <td style="width: 100px">${ci.product.price}</td>
            <td style="width: 150px">
                <div class="am-input-group" style="width:150px;">
				  <span class="am-input-group-btn">
			        <button class="am-btn am-btn-default" type="button" onclick="setNumber(${ci.product.id},${ci.number<2? 1:ci.number-1})">
						<i class="am-icon-minus"></i>
					</button>
			      </span>
                    <input type="text" class="am-form-field" value="${ci.number}" onchange="setNumber(${ci.product.id},${ci.number})">
                  <span class="am-input-group-btn">
			        <button class="am-btn am-btn-default" type="button" onclick="setNumber(${ci.product.id},${ci.number + 1})">
						<i class="am-icon-plus"></i>
					</button>
			      </span>
                </div>
            </td>
            <td>
                <fmt:formatNumber type="number" pattern="0.00" value="${ci.totalPrice}" maxFractionDigits="2"></fmt:formatNumber>
            </td>
            <td>
                <button type="button" class="am-btn am-btn-danger" onclick="location.href='<%=path%>/shop!remove.html?id='+${ci.product.id}">移除</button>
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
    <div>
        <td>
            <a href="<%=path%>\user\order\confirm.html">
            <button type="button" class="am-btn am-btn-danger">结算</button>
            </a>
        </td>
    </div>
    总价格：<fmt:formatNumber type="number" pattern="0.00" value="${sessionScope.ShopCart.totalPrice}" maxFractionDigits="2"></fmt:formatNumber>

</div>
<script type="text/javascript">
function setNumber(productId,num) {
    window.location.href = "<%=path%>/shop!setNum.html?id="+productId+"&rows="+num;
}
</script>
</body>
</html>
