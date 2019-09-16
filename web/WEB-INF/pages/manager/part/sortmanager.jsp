<%--
  Created by IntelliJ IDEA.
  User: Sen
  Date: 2019/7/1
  Time: 12:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String path = request.getContextPath();
%>
<div style="width: 100%;height: 100%;">
<table id="dg-sort" title="类别管理" style="width: 100%;height: 100%"></table><div id="dd">Dialog Content.</div>
<div id="dlg-savesort" title="添加类别" style="width:600px;height:300px;padding:10px">
    <form id="ff-savesort" method="post">
        <table class="am-table am-table-bordered">
            <tbody>
            <tr>
                <td style="width: 100px;align:'center'">类别</td>
                <td><input  name="name" style="width: 400px;align:'center'"></td>
            </tr>
            <tr>
                <td>描述</td>
                <td><input  name="text" style="width: 400px;align:'center'"></td>
            </tr>

            </tbody>
        </table>
    </form>
</div>
<%-- 修改用户信息--%>
    <div id="dlg-updatesort" title="修改类别" style="width:600px;height:300px;padding:10px">
        <form id="ff-updatesort" method="post">
            <table class="am-table am-table-bordered">
                <tbody>
                <tr>
                    <td>类别</td>
                    <td><input  name="id" type="text" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>类别</td>
                    <td><input  name="name" ></td>
                </tr>
                <tr>
                    <td>描述</td>
                    <td><input  name="text" style="width: 400px"></td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
<script>

    $("#dg-sort").datagrid({
        rownumbers:true,
        singleSelect:true,
        pagination:true,
        url:'<%=path%>/manager/sortjson.html',
        method:'post',
        columns:[[
            {field:'id',title:'ID',width:200,hidden:true},
            {field:'name',title:'类别名称',width:200,align:'center'},
            {field:'text',title:'类别描述',width:250,align:'center',sortable:true}
        ]],
        toolbar: [{
            text:"增加类别",
            iconCls: 'icon-add',
            handler: function(){
                $('#dlg-savesort').dialog("open")}
        },'-',{
            text:"修改类被",
            iconCls: 'icon-edit',
            handler: function(){
                var row = $("#dg-sort").datagrid("getSelected");<%--获取datagrid的一行数据 --%>
                if (row) {
                    $("#ff-updatesort").form("load", row);//让form表单加载row的数
                    $('#dlg-updatesort').dialog("open");
                }else{
                    layer.msg('请选择一条记录', {icon: 5});
                }
            }
        },'-',{
            text:"删除类别",
            iconCls: 'icon-cancel',
            handler: function(){
                var row = $("#dg-sort").datagrid("getSelected");
                if (row) {
                    layer.confirm('确定删除吗？', {
                        btn: ['确定删除','取消'] //按钮
                    }, function(){
                        $.post("<%=path%>/del.html",{"id":row.id},function (data) {
                            if (data == "success") {
                                layer.msg('删除成功', {icon: 1});
                                $("#dg-sort").datagrid("reload");
                            } else {
                                layer.msg('删除失败，未知异常', {icon: 1});
                            }
                        })
                    });
                } else {
                    layer.msg('请选择一条记录', {icon: 5});
                }
            }
        }]
    });
    var pager = $("#dg-sort").datagrid().datagrid("getPager");
    pager.pagination({
        beforePageText:"第",
        afterPageText:"页，共{pages}",
        displayMsg:"商品类别信息 {from} 到 {to} 共 {total} 条信息"
    })
    $('#dlg-savesort').dialog({
        closed:true,
        modal:true,
        iconCls: 'icon-save',
        buttons: [{
            text:'确定',
            iconCls:'icon-ok',
            handler:function(){
                $('#ff-savesort').submit();
            }
        },{
            text:'取消',
            handler:function(){
               $('#dlg-savesort').dialog('close') ;
            }
        }]
    });
    $('#dlg-updatesort').dialog({
        closed:true,
        modal:true,
        iconCls: 'icon-edit',
        buttons: [{
            text:'确定',
            iconCls:'icon-ok',
            handler:function(){
                $('#ff-updatesort').submit();
            }
        },{
            text:'取消',
            handler:function(){
                $('#dlg-updatesort').dialog('close') ;
            }
        }]
    });

    $("#ssq1").cityloader({});
    $("#ssq2").cityloader({});
    //异步提交表单
    $('#ff-savesort').form({
        url:"<%=path%>/manager/sortadd.html",
        onSubmit: function(){
            return $('#ff-savesort').form("validate");//在提叫表单的是后调动validbox插件进行验证
        },
        success:function(data){
            if (data == "success") {
                layer.msg('添加用户成功');
                $("#dlg-savesort").dialog("close");
                $("#dg-sort").datagrid("reload");
            }else{
                layer.msg('修改失败，发生异常', {icon: 5});
            }
        }
    });
    $('#ff-updatesort').form({
        url:"<%=path%>//manager/sortupdate.html",
        onSubmit: function(){
            return $('#ff-updatesort').form("validate");//在提叫表单的是后调动validbox插件进行验证
        },
        success:function(data){
            if (data == "success") {
                layer.msg('修改成功');
                $("#dlg-updatesort").dialog("close");
                $("#dg-sort").datagrid("reload");
            }else{
                layer.msg('修改失败，发生异常', {icon: 5});
            }
        }
    });
    <%--// 账号验证器--%>
    <%--$.extend($.fn.validatebox.defaults.rules, {//继承validatebox的验证规则--%>
    <%--    username: {--%>
    <%--        validator: function(value,param){--%>
    <%--            var min = param[0];--%>
    <%--            var max = param[1];--%>
    <%--            return value.match("^[0-9a-zA-Z]{"+min +","+max+"}$");--%>
    <%--        },--%>
    <%--        message: '账号只能填数值与字母，长度在{0}-{1}之间'--%>
    <%--    }--%>
    <%--});--%>
    <%--$.extend($.fn.validatebox.defaults.rules, {//继承validatebox的验证规则--%>
    <%--    password: {--%>
    <%--        validator: function(value,param){--%>
    <%--            var min = param[0];--%>
    <%--            var max = param[1];--%>
    <%--            return value.match("^[0-9a-zA-Z]{"+min +","+max+"}$");--%>
    <%--        },--%>
    <%--        message: '密码只能填数值与字母，长度在{0}-{1}之间'--%>
    <%--    }--%>
    <%--});--%>
    <%--//验证密码是否可用--%>
    <%--$.extend($.fn.validatebox.defaults.rules, {//继承validatebox的验证规则--%>
    <%--    checkname: {--%>
    <%--        validator : $.fn.validatebox.defaults.rules.remote.validator,--%>
    <%--        message:"用户名已存在"--%>
    <%--       }--%>
    <%--});--%>
    <%--$('#ff-savesort').find("[name='username']").validatebox({--%>
    <%--    required:true,--%>
    <%--    validType:["username[3,20]","checkname['<%=path%>/checkname.html','username']"],--%>
    <%--    missingMessage: "账号不能为空"--%>
    <%--});--%>
    <%--$('#ff-updatesort').find("[name='username']").validatebox({--%>
    <%--    required:true,--%>
    <%--    validType:["username[3,20]"],--%>
    <%--    missingMessage: "账号不能为空"--%>
    <%--});--%>
    <%--$("#ff-savesort").find("[name='password']").validatebox({--%>
    <%--    required:true,--%>
    <%--    validType:"password[5,20]",--%>
    <%--    missingMessage:"密码不能为空"--%>
    <%--});--%>
    <%--$("#ff-savesort,#ff-updatesort").find("[name='email']").validatebox({--%>
    <%--    required:true,--%>
    <%--    validType:'email',--%>
    <%--    missingMessage: "邮箱不能为空",--%>
    <%--    invalidMessage:"邮箱格式不正确"--%>
    <%--});--%>
    <%--$("#ff-savesort,#ff-updatesort").find("[name='money']").numberbox({--%>
    <%--    required:true,--%>
    <%--    min:0,max:999999999,--%>
    <%--    precision:3,--%>
    <%--    editable:true,--%>
    <%--    missingMessage:"余额不能为空",--%>
    <%--});--%>
    <%--$("#ff-updatesort").find("[name='password']").validatebox({--%>
    <%--    validType:"password[5,20]",--%>
    <%--});--%>
</script>
</div>