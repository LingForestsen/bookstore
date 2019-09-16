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
<table id="dg-saveuser" title="用户管理" style="width: 100%;height: 100%"></table><div id="dd">Dialog Content.</div>
<div id="dlg-saveuser" title="添加用户" style="width:600px;height:500px;padding:10px">
    <form id="ff-saveuser" method="post">
        <table class="am-table am-table-bordered">
            <tbody>
            <tr>
                <td>账号</td>
                <td><input  name="username"></td>
            </tr>
            <tr>
                <td>密码</td>
                <td><input  name="password"></td>
            </tr>
            <tr>
                <td>邮箱</td>
                <td><input  name="email"></td>
            </tr>
            <tr>
                <td>余额</td>
                <td><input  name="money"></td>
            </tr>
            <tr>
                <td>真实姓名</td>
                <td><input  name="realname"></td>
            </tr>
            <tr>
                <td>区域</td>
                <td id="ssq1">
                    <select name="provice"></select>
                    <select name="city"></select>
                    <select name="area"></select>
                </td>
            </tr>
            <tr>
                <td>详细地址</td>
                <td><input  name="adddr"></td>
            </tr>
            <tr>
                <td>手机号码</td>
                <td><input  name="phone"></td>
            </tr>
            <tr>
                <td>用户状态</td>
                <td>
                    <select name="state">
                        <option value="0">未激活</option>
                        <option value="1">正常</option>
                        <option value="2">异常</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>管理员权限</td>
                <td>
                    是：<input type="radio" name="isAdmin" value="1">
                    否：<input type="radio" name="isAdmin" value="1" checked>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</div>
<%-- 修改用户信息--%>
    <div id="dlg-updateuser" title="修改用户" style="width:600px;height:500px;padding:10px">
        <form id="ff-updateuser" method="post">
            <table class="am-table am-table-bordered">
                <tbody>
                <tr>
                    <td>用户ID</td>
                    <td><input  name="id" type="text" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>账号</td>
                    <td><input  name="username"></td>
                </tr>
                <tr>
                    <td>密码</td>
                    <td><input  name="password">不修改默认为空</td>
                </tr>
                <tr>
                    <td>邮箱</td>
                    <td><input  name="email"></td>
                </tr>
                <tr>
                    <td>余额</td>
                    <td><input  name="money"></td>
                </tr>
                <tr>
                    <td>真实姓名</td>
                    <td><input  name="realname"></td>
                </tr>
                <tr>
                    <td>区域</td>
                    <td id="ssq2">
                        <select name="provice"></select>
                        <select name="city"></select>
                        <select name="area"></select>
                    </td>
                </tr>
                <tr>
                    <td>详细地址</td>
                    <td><input  name="adddr"></td>
                </tr>
                <tr>
                    <td>手机号码</td>
                    <td><input  name="phone"></td>
                </tr>
                <tr>
                    <td>用户状态</td>
                    <td>
                        <select name="state">
                            <option value="0">未激活</option>
                            <option value="1">正常</option>
                            <option value="2">异常</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>管理员权限</td>
                    <td>
                        是：<input type="radio" name="isAdmin" value="1">
                        否：<input type="radio" name="isAdmin" value="1" checked>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
<script>

    $("#dg-saveuser").datagrid({
        rownumbers:true,
        singleSelect:true,
        pagination:true,
        url:'<%=path%>/json.html',
        method:'post',
        columns:[[
            {field:'id',title:'ID',width:100,hidden:true},
            {field:'username',title:'账号',width:100},
            {field:'email',title:'邮箱',width:150,align:'left',sortable:true},
            {field:'money',title:'余额',width:100,align:'center'},
            {field:'realname',title:'真实姓名',width:100,align:'center'},
            {field:'phone',title:'联系电话',width:100,align:'center'},
            {field:'state',title:'状态',width:100,align:'center', formatter:function (value, row, index) {
                    if(row.state==0) return '未激活';
                    if(row.state==1) return '正常';
                    if(row.state==2) return '异常';
                }}
        ]],
        toolbar: [{
            text:"增加用户",
            iconCls: 'icon-add',
            handler: function(){
                $('#dlg-saveuser').dialog("open")}
        },'-',{
            text:"修改用户",
            iconCls: 'icon-edit',
            handler: function(){
                var row = $("#dg-saveuser").datagrid("getSelected");<%--获取datagrid的一行数据 --%>
                if (row) {
                    $("#ff-updateuser").form("load", row);//让form表单加载row的数
                    $("#ff-updateuser").find("[name='password']").val("");
                    $('#dlg-updateuser').dialog("open");
                }else{
                    layer.msg('请选择一条记录', {icon: 5});
                }
            }
        },'-',{
            text:"删除用户",
            iconCls: 'icon-cancel',
            handler: function(){
                var row = $("#dg-saveuser").datagrid("getSelected");
                if (row) {
                    layer.confirm('确定删除吗？', {
                        btn: ['确定删除','取消'] //按钮
                    }, function(){
                        $.post("<%=path%>/del.html",{"id":row.id},function (data) {
                            if (data == "success") {
                                layer.msg('删除成功', {icon: 1});
                                $("#dg-saveuser").datagrid("reload");
                            } else {
                                layer.msg('删除失败，未知异常', {icon: 1});
                            }
                        })
                    });
                } else {
                    layer.msg('请选择一条记录', {icon: 5});
                }
            }
        },'-',{
            text:"批量导入",
            iconCls: 'icon-save',
            handler: function(){alert('编辑按钮')}
        }]
    });
    var pager = $("#dg-saveuser").datagrid().datagrid("getPager");
    pager.pagination({
        beforePageText:"第",
        afterPageText:"页，共{pages}",
        displayMsg:"用户信息 {from} 到 {to} 共 {total} 条信息"
    })
    $('#dlg-saveuser').dialog({
        closed:true,
        modal:true,
        iconCls: 'icon-save',
        buttons: [{
            text:'确定',
            iconCls:'icon-ok',
            handler:function(){
                $('#ff-saveuser').submit();
            }
        },{
            text:'取消',
            handler:function(){
               $('#dlg-saveuser').dialog('close') ;
            }
        }]
    });
    $('#dlg-updateuser').dialog({
        closed:true,
        modal:true,
        iconCls: 'icon-edit',
        buttons: [{
            text:'确定',
            iconCls:'icon-ok',
            handler:function(){
                $('#ff-updateuser').submit();
            }
        },{
            text:'取消',
            handler:function(){
                $('#dlg-updateuser').dialog('close') ;
            }
        }]
    });

    $("#ssq1").cityloader({});
    $("#ssq2").cityloader({});
    //异步提交表单
    $('#ff-saveuser').form({
        url:"<%=path%>/save.html",
        onSubmit: function(){
            return $('#ff-saveuser').form("validate");//在提叫表单的是后调动validbox插件进行验证
        },
        success:function(data){
            if (data == "success") {
                layer.msg('添加用户成功');
                $("#dlg-saveuser").dialog("close");
                $("#dg-saveuser").datagrid("reload");
            }else{
                layer.msg('修改失败，发生异常', {icon: 5});
            }
        }
    });
    $('#ff-updateuser').form({
        url:"<%=path%>/update.html",
        onSubmit: function(){
            return $('#ff-updateuser').form("validate");//在提叫表单的是后调动validbox插件进行验证
        },
        success:function(data){
            if (data == "success") {
                layer.msg('修改成功');
                $("#dlg-updateuser").dialog("close");
                $("#dg-saveuser").datagrid("reload");
            }else{
                layer.msg('修改失败，发生异常', {icon: 5});
            }
        }
    });
    // 账号验证器
    $.extend($.fn.validatebox.defaults.rules, {//继承validatebox的验证规则
        username: {
            validator: function(value,param){
                var min = param[0];
                var max = param[1];
                return value.match("^[0-9a-zA-Z]{"+min +","+max+"}$");
            },
            message: '账号只能填数值与字母，长度在{0}-{1}之间'
        }
    });
    $.extend($.fn.validatebox.defaults.rules, {//继承validatebox的验证规则
        password: {
            validator: function(value,param){
                var min = param[0];
                var max = param[1];
                return value.match("^[0-9a-zA-Z]{"+min +","+max+"}$");
            },
            message: '密码只能填数值与字母，长度在{0}-{1}之间'
        }
    });
    //验证密码是否可用
    $.extend($.fn.validatebox.defaults.rules, {//继承validatebox的验证规则
        checkname: {
            validator : $.fn.validatebox.defaults.rules.remote.validator,
            message:"用户名已存在"
           }
    });
    $('#ff-saveuser').find("[name='username']").validatebox({
        required:true,
        validType:["username[3,20]","checkname['<%=path%>/checkname.html','username']"],
        missingMessage: "账号不能为空"
    });
    $('#ff-updateuser').find("[name='username']").validatebox({
        required:true,
        validType:["username[3,20]"],
        missingMessage: "账号不能为空"
    });
    $("#ff-saveuser").find("[name='password']").validatebox({
        required:true,
        validType:"password[5,20]",
        missingMessage:"密码不能为空"
    });
    $("#ff-saveuser,#ff-updateuser").find("[name='email']").validatebox({
        required:true,
        validType:'email',
        missingMessage: "邮箱不能为空",
        invalidMessage:"邮箱格式不正确"
    });
    $("#ff-saveuser,#ff-updateuser").find("[name='money']").numberbox({
        required:true,
        min:0,max:999999999,
        precision:3,
        editable:true,
        missingMessage:"余额不能为空",
    });
    $("#ff-updateuser").find("[name='password']").validatebox({
        validType:"password[5,20]",
    });
</script>
</div>