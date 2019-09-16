<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'UserManager.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=path%>/assets/jquery-easyui-1.5/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/assets/jquery-easyui-1.5/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/assets/jquery-easyui-1.5/demo/demo.css">
	<script type="text/javascript" src="<%=path%>/assets/libs/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="<%=path%>/assets/jquery-easyui-1.5/jquery.easyui.min.js"></script>
  </head>
  
  <body>
    用户管理器. <br>
    
    <table id="dg" title="用户管理" style="width:100%;height:450px"></table>
    <script type="text/javascript">
		$(function(){
			
			var stateFormatter = function(value,row,index){
				switch(value){
				case 0:return '未激活';
				case 1:return '已激活';
				case 2:return '被屏蔽';
				}
			}
			
			$("#dg").datagrid({
				rownumbers:true,
				singleSelect:true,
				pagination:true,
				url:'<%=path%>/ajax/user/find.do',
				method:'post',
				columns:[[    
				          {field:'id',title:'ID',width:100},    
				          {field:'usrname',title:'账号',width:100},    
				          {field:'createTime',title:'创建时间',width:200,align:'left',sortable:true},    
				          {field:'code',title:'账号激活码',width:100,align:'center'},
				          {field:'state',title:'状态',width:100,align:'center',formatter: stateFormatter}  
				      ]]
			});
			
			
			
			var pager = $('#dg').datagrid().datagrid('getPager');	// get the pager of datagrid
			pager.pagination({
				beforePageText:'第',
				afterPageText:'页，共{pages}页',
				displayMsg:'当前从 {from} 到 {to} ，共 {total} 条'
			});			
		})
	</script>
  </body>
</html>
