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

    <title>确认订单</title>

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

    <form action="<%=path%>/order!save.html" method="post" class="am-form" id="f1">
        <input name="address" type="hidden" >
        <%-- 收件人信息面板-Begin --%>
        <div class="am-panel am-panel-success">
            <div class="am-panel-hd">收件人信息</div>
            <div class="am-panel-bd">

                <div class="am-input-group" id="ssq">
  <span class="am-input-group-label">
  <i class="am-icon-user am-icon-fw"></i>地区
  </span>
                    <select addr></select>
                    <span class="am-input-group-label"></span>
                    <select addr></select>
                    <span class="am-input-group-label"></span>
                    <select addr></select>
                </div>
                <div class="am-input-group">
  <span class="am-input-group-label">
  <i class="am-icon-user am-icon-fw"></i>姓名
  </span>
                    <input name="name" value="${sessionScope.Login_Info.realname }" type="text" class="am-form-field" placeholder="收件人姓名">
                </div>
                <div class="am-input-group">
  <span class="am-input-group-label">
  <i class="am-icon-user am-icon-fw"></i>电话
  </span>
                    <input name="phone" value="${sessionScope.Login_Info.phone }" type="text" class="am-form-field" placeholder="收件人电话">
                </div>

                <div class="am-input-group">
  <span class="am-input-group-label">
  <i class="am-icon-user am-icon-fw"></i>地址
  </span>
                    <input addr type="text" value="${sessionScope.Login_Info.adddr }" class="am-form-field" placeholder="收货地址">
                </div>
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
                    <c:forEach items="${sessionScope.ShopCart.itemList }" var="ci">
                        <tr>
                            <td>${ci.product.name }</td>
                            <td>${ci.product.price }</td>
                            <td>${ci.number }</td>
                            <td>
                                <fmt:formatNumber type="number" value="${ci.totalPrice }" pattern="0.00" maxFractionDigits="2"/>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <%-- 购物清单面板-End --%>
        总价格：<fmt:formatNumber type="number" pattern="0.00" value="${sessionScope.ShopCart.totalPrice }" maxFractionDigits="2"></fmt:formatNumber><br>
        <button type="submit" class="am-btn am-btn-danger">提交订单</button>
    </form>
</div>
<script type="text/javascript">
    $(function(){
        $("#ssq").cityloader({
            prov:"${sessionScope.Login_Info.provice}",
            city:"${sessionScope.Login_Info.city}",
            dist:"${sessionScope.Login_Info.area}"
        });
        $("#f1").submit(function(){
            var address = "";
            $('[addr]').each(function (n,el) {
                address += $(el).val();
            })
            $('[name="address"]').val(address);
        });
    });
</script>
</body>
</html>

