<%--
  Created by IntelliJ IDEA.
  User: Sen
  Date: 2019/6/30
  Time: 17:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" src="<%=path%>/assets/libs/jquery-1.10.1.min.js"></script>
<html>
<head>
    <title>自适应子元素高度</title>
</head>
<body>
    <iframe id="box" style="border:1px solid red;" width="50%" height="" src="" scrolling="no"></iframe>
</body>
<script type="text/javascript">
    $(function () {
        $("#box").load(function () {
            var h = $(this).contents().height();
            $(this).height(h);
        });
        $("#box").attr("src","<%=path%>/user/showregister.html");
    });

</script>
</html>
