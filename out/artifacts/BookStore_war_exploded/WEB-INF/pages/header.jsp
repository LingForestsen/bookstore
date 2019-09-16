<%--
  Created by IntelliJ IDEA.
  User: Sen
  Date: 2019/6/30
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%-- 导航条-Begin --%>
<header class="am-topbar">
    <h1 class="am-topbar-brand">
        <a href="<%=path%>/index.html"> 华夏书城 </a>
    </h1>

    <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#doc-topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

    <div class="am-collapse am-topbar-collapse" id="doc-topbar-collapse">
        <ul class="am-nav am-nav-pills am-topbar-nav">
            <li><a href="<%=path%>/index.html">首页</a></li>
            <li><a href="<%=path%>/ShopCart.html">购物车</a></li>
            <li><a href="<%=path%>/order!view.html">我的订单</a></li>

        </ul>
        <c:if test="${sessionScope.Login_Info != null}">
        <div class="am-topbar-right">
            <div class="am-dropdown" data-am-dropdown="{boundary: '.am-topbar'}">
                <button class="am-btn am-btn-secondary am-topbar-btn am-btn-sm am-dropdown-toggle" data-am-dropdown-toggle>
                    ${sessionScope.Login_Info.username} <span class="am-icon-caret-down"></span>
                </button>
                <ul class="am-dropdown-content">
                    <li><a href="#">个人中心</a></li>
                    <c:if test="${sessionScope.Login_Info.isAdmin == 1}">
                    <li><a href="<%=path%>/user/manager.html">进入后台（管理员）</a></li>
                    </c:if>
                    <li class="am-divider"></li>
                    <li><a href="<%=path%>/login!exit.html">退出登录</a></li>
                </ul>
            </div>
        </div>
        </c:if>
        <c:if test="${sessionScope.Login_Info == null}">
        <div class="am-topbar-right">
            <a href="<%=path%>/user/showlogin.html">
                <button class="am-btn am-btn-primary am-topbar-btn am-btn-sm">登录</button>
            </a>
            <a href="<%=path%>/user/showregister.html">
                <button class="am-btn am-btn-primary am-topbar-btn am-btn-sm">注册</button>
            </a>
        </div>
        </c:if>
    </div>
</header>
<%-- 导航条-End --%>
