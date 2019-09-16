<%--
  Created by IntelliJ IDEA.
  User: Sen
  Date: 2019/6/28
  Time: 23:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>华夏书城</title>

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
</head>
<body>
<jsp:include page="/WEB-INF/pages/header.jsp" ></jsp:include>
<table id="pros" class="am-table">
    <thead>
        <tr>
            <th>商品名称</th>
            <th>价格</th>
            <th>专柜价格</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody>
        <tr style="display: none">
            <td>name</td>
            <td>price</td>
            <td>mallprice</td>
            <td>
                <button type="button" class="am-btn am-btn-success">加入购物车</button>
            </td>
        </tr>
    </tbody>
</table>
<div id="page1"></div>
<script type="text/javascript">
    $(function () {//文档就绪函事件
        function refresh(p) {
            $.getJSON("<%=path%>/show!show.html",{
                page:p,rows:2
            },function (data) {
                var tb = $("#pros tbody");
                var tr0 = tb.find("tr:eq(0)");
                tb.find("tr").not("tr:hidden").remove();
                $.each(data.list,function (n,obj) {
                    var ntr = tr0.clone().show().appendTo(tb);
                    ntr.find("td:eq(0)").html(obj.name);
                    ntr.find("td:eq(1)").html(obj.price);
                    ntr.find("td:eq(2)").html(obj.mallPrice);
                    ntr.find("td:eq(3)").find('button').click(function () {//在加载时给加入购物车按钮注册一个事件
                        $.post(
                            '<%=path%>/shop!add.html',
                            {id:obj.id},function (data) {
                                if (data == 'success') {
                                    layer.msg('添加成功');
                                }
                            }

                        )
                    });
                })
                //显示分页
                laypage({
                    cont: 'page1', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：<div id="page1"></div>
                    pages: data.totalPage, //通过后台拿到的总页数
                    curr: data.now, //当前页
                    jump: function(obj, first){ //触发分页后的回调
                        if(!first){ //点击跳页触发函数自身，并传递当前页：obj.curr
                            refresh(obj.curr);
                        }
                    }
                });
            });
        }

        refresh(1);
    });
</script>
</body>
</html>
