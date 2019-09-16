<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<script type="text/javascript" src="assets/libs/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="assets/cityloader/jquery.cityloader.static.cn.min.js"></script>
<style>
hr{
margin-top:20px;
margin-bottom:20px;
}
</style>
  </head>
  
  <body>
  <h2>代码中用到动态加载技术，需要在http协议下才能正常工作</h2>
  <hr>
  <h3>属性标记：</h3>
  cityloader-prov：省份<br>
  cityloader-city：城市<br>
  cityloader-dist：地区<br>
  在select元素中加入对应属性，在组件初始化时会自动加载
  
  <hr>
  <h3>初始化参数：</h3>
  <table border="1" width="100%">
  <tr>
  	<td>JS参数</td>
  	<td>数据类型</td>
  	<td>属性参数</td>
  	<td>描述</td>
  </tr>
  <tr>
  	<td>url</td>
  	<td>string</td>
  	<td>cityloader-url(写在父元素中)</td>
  	<td>地区数据文件，默认是jquery.cityloader.js文件旁边的data.cn.json</td>
  </tr>
  <tr>
  	<td>prov</td>
  	<td>string</td>
  	<td rowspan="3">cityloader-value(写在select元素中)</td>
  	<td>默认省份</td>
  </tr>
  <tr>
  	<td>city</td>
  	<td>string</td>
  	<td>默认城市</td>
  </tr>
  <tr>
  	<td>dist</td>
  	<td>string</td>
  	
  	<td>默认地区</td>
  </tr>
  <tr>
  	<td>nodata</td>
  	<td>string</td>
  	<td >cityloader-nodata(写在父元素中)</td>
  	<td>没有数据时的处理('none':不显示，'hidden':不显示但占用原位置)</td>
  </tr>
  </table>

  <hr>
  <h3>：</h3>
  url:数据文件，默认当前js文件旁边的data.cn.json<br>
  prov:默认省份<br>
  city:默认城市<br>
  dist:默认地区<br>
  nodata:没有数据时的处理('none':不显示，'hidden':不显示但占用原位置)<br>
  
  <hr>
<h3>使用js初始化组件</h3>
$("#box").cityloader({prov:"吉林省",city:"长春市",dist:"德惠市",nodata:'none'});<br><br>
<div id="box" >
<select cityloader-prov></select>1
<select cityloader-city></select>2
<select cityloader-dist></select>3
</div>

<%------------------------------- --%>
<hr>
<h3>使用属性标记初始化组件</h3>
为一个元素添加cityloader属性后，会自动寻找属性标记进行初始化。<br>
仅仅在文档就绪时执行一次<br>
cityloader-nodata="hidden"，当没有数据时隐藏<br>
cityloader-url="assets/cityloader/world.json"，使用世界城市数据<br><br>
<div cityloader cityloader-nodata="hidden" cityloader-url="assets/cityloader/world.json">
<select cityloader-prov cityloader-value="中国"></select>1
<select cityloader-city cityloader-value="北京"></select>2
<select cityloader-dist cityloader-value="朝阳区"></select>3
</div>

<%------------------------------- --%>
<hr>
<h3>优先级</h3>
标记方式启动时优先使用属性参数，JS启动时优先使用JS参数
<br><br>
<div id="jsyx" cityloader>
<select cityloader-prov cityloader-value="吉林省"></select>1
<select cityloader-city></select>2
<select cityloader-dist></select>3
</div>
<script type="text/javascript">
$(function(){
	$("#jsyx").cityloader({
		prov:"北京市"
	});
});
</script>

<%------------------------------- --%>
<hr>
<h3>自定义数据</h3>

<div id="box2">
<select cityloader-prov cityloader-value="中国"></select>1
<select cityloader-city cityloader-value="北京"></select>2
<select cityloader-dist cityloader-value="朝阳区"></select>3
</div>
<script type="text/javascript">
$(function(){
	$("#box2").cityloader({
		url:{
			"p":["小说散文","计算机","人文社科"],
			"0":["四大名著","武侠仙侠"],
			"0_0":["西游记","三国演义","红楼梦","水浒传"],
			"0_1":["星辰变","神墓","诛仙","盗墓笔记","神雕侠侣","笑傲江湖"],
			"1":["软件开发","硬件网络","前端设计师"],
			"1_0":["Java编程基础","C语言入门宝典","疯狂PHP"],
			"1_1":["网络工程师宝典","硬件发展史","黑客攻防实战","Linux系统全解"],
			"1_2":["HTML5精讲","CSS3","JavaScript","UI设计导论"],
			"2":["社会科学","心理学"]
		},
		prov:"小说散文",
		city:"武侠仙侠",
		dist:"盗墓笔记"
	});
});
</script>

<%------------------------------- --%>
<hr>
<h3>自定义数据</h3>
<div cityloader cityloader-url='{"p":["青春","生活"],"0":["动漫","文学"],"0_0":["大陆","日韩"]}'>
<select cityloader-prov cityloader-value="中国"></select>1
<select cityloader-city cityloader-value="北京"></select>2
<select cityloader-dist cityloader-value="朝阳区"></select>3
</div>

<%------------------------------- --%>
<hr>
当select元素没有使用标记时，<br>
会自动选中前三个select元素进行初始化。
<div cityloader>
<select></select>
<select></select>
<select></select>
</div>

<hr>
当select元素标记不全时，例如只标记了cityloader-city<br>
会把第一个无标记的select作为省份，第二个无标记的作为地区。
<div cityloader>
<select></select>
<select cityloader-city></select>
<select></select>
</div>

<hr>
当cityloader中没有select元素时，会自动追加select，确保至少有3个元素
<div cityloader></div>

<hr>

<script>
$(function(){

	$("#box").cityloader({
		url:'assets/cityloader/data.cn.json',
		prov:"吉林省",
		city:"长春市",
		dist:"德惠市",
		nodata:'none'
	});

});

</script>

  </body>
</html>
