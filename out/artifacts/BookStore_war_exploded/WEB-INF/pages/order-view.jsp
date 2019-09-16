<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Sen
  Date: 2019/7/11
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>我的订单</title>
    <link rel="stylesheet" type="text/css" href="<%=path%>/assets/amazeui/css/amazeui.min.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/assets/layer/skin/layer.css">
    <script type="text/javascript" src="<%=path%>/assets/libs/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="<%=path%>/assets/amazeui/js/amazeui.min.js"></script>
    <script type="text/javascript" src="<%=path%>/assets/layer/layer.js"></script>
    <%--  分页插件  --%>
    <link rel="stylesheet" type="text/css" href="<%=path%>/assets/laypage/skin/laypage.css">
    <script type="text/javascript" src="<%=path%>/assets/laypage/laypage.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<table class="am-table am-table-bordered">
    <thead>
    <tr>
        <th>序号</th>
        <th>订单编号</th>
        <th>订单金额</th>
        <th>订单状态</th>
        <th>付款方式</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${requestScope.OrdersData.list}" var="ord" varStatus="st">
        <tr>
            <td>${st.index + 1}</td>
            <td>${ord.code }</td>
            <td>
                <fmt:formatNumber type="number" value="${ord.price }" pattern="0.00" maxFractionDigits="2"/>
            </td>
            <td>
                <c:choose>
                    <c:when test="${ord.state == 0}">未付款</c:when>
                    <c:when test="${ord.state == 1}">已付款</c:when>
                    <c:when test="${ord.state == 2}">已发货</c:when>
                    <c:when test="${ord.state == 3}">已签收</c:when>
                    <c:when test="${ord.state == 4}">已取消</c:when>
                </c:choose>
            </td>
            <td>
                <c:choose>
                    <c:when test="${ord.payments == 1}">余额支付</c:when>
                    <c:when test="${ord.payments == 2}">网银支付</c:when>
                    <c:when test="${ord.payments == 3}">汇款</c:when>
                    <c:when test="${ord.payments == 4}">货到付款</c:when>
                </c:choose>
            </td>
            <td>
                <a href="<%=path%>/order!detail.html?id=${ord.id}">
                    <button>明细</button>
                </a>
                <c:if test="${ord.state < 2 }">
                <button onclick="cancel(${ord.id})">取消订单</button>
                </c:if>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
提示：如果当前订单已经发货，将不支持退退款操作，如有疑问请与官方客服联系。
<script type="text/javascript">
    function cancel(id) {
        layer.confirm('您真的要取消订单吗？', {
            btn: ['我意已决','我再想想'] //按钮
        }, function(){
            window.location.href="${pageContext.request.contextPath}/user/order/order!cancel.html?id="+id;
        }, function(){

        });
    }
</script>
</body>
</html>
