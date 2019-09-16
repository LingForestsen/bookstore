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
<table id="dg-product" title="商品管理" style="width: 100%;height: 100%"></table><div id="dd">Dialog Content.</div>
<div id="dlg-saveproduct" title="添加商品" style="width:600px;height:450px;padding:10px">
    <form id="ff-saveproduct" method="post">
        <table class="am-table am-table-bordered">
            <tbody>
            <tr>
                <td>所属类别</td>
                <td><input name="sort.id"></td>
            </tr>
            <tr>
                <td>商品名称</td>
                <td><input name="name"></td></td>
            </tr>
            <tr>
                <td>宣传语</td>
                <td><input name="title"></td></td>
            </tr>
            <tr>
                <td>单价</td>
                <td><input name="price"></td>
            </tr>
            <tr>
                <td>专柜价格</td>
                <td><input name="mallPrice"></td>
            </tr>
            <tr>
                <td>库存</td>
                <td><input name="stock"></td>
            </tr>
            <tr>
                <td>详细介绍</td>
                <td><input name="details"></td>
            </tr>
            <tr>
                <td>总销量</td>
                <td><input name="sales"></td>
            </tr>

            </tbody>
        </table>
    </form>
</div>
<%-- 修改用户信息--%>
    <div id="dlg-updateproduct" title="修改商品" style="width:600px;height:450px;padding:10px">
        <form id="ff-updateproduct" method="post">
            <table class="am-table am-table-bordered">
                <tbody>
                <tr>
                    <td >编号</td>
                    <td><input  name="id" type="text" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>所属类别</td>
                    <td>
                        <input class="easyui-combobox" data-options="
                            valueField: 'id',
                            textField: 'text',
                            url: 'get_data1.php',
                            onSelect: function(rec){
                             console.log('hello');
                            }" />

                    </td>
                </tr>
                <tr>
                    <td>商品名称</td>
                    <td><input name="name"></td></td>
                </tr>
                <tr>
                    <td>宣传语</td>
                    <td><input name="title"></td></td>
                </tr>
                <tr>
                    <td>单价</td>
                    <td><input name="price"></td>
                </tr>
                <tr>
                    <td>专柜价格</td>
                    <td><input name="mallPrice"></td>
                </tr>
                <tr>
                    <td>库存</td>
                    <td><input name="stock"></td>
                </tr>
                <tr>
                    <td>详细介绍</td>
                    <td><input name="details"></td>
                </tr>
                <tr>
                    <td>总销量</td>
                    <td><input name="sales"></td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
<script>

    $("#dg-product").datagrid({
        rownumbers:true,
        singleSelect:true,
        pagination:true,
        url:'<%=path%>/manager/getproductjson.html',
        method:'post',
        columns:[[
            {field:'id',title:'ID',width:100,hidden:true},
            {field:'name',title:'商品名称',width:100,align:'center'},
            {field:'sort',title:'类别',width:100
                ,formatter: function(value,row,index){
                    return value.name;
                }
            },
            {field:'title',title:'副标题',width:150,align:'left',sortable:true},
            {field:'price',title:'单价',width:100,align:'center'},
            {field:'mallPrice',title:'专柜价格',width:100,align:'center'},
            {field:'stock',title:'库存',width:100,align:'center'},
            {field:'details',title:'详细介绍',width:100,align:'center'},
            {field:'sales',title:'销量',width:100,align:'center'}
        ]],
        toolbar: [{
            text:"增加商品",
            iconCls: 'icon-add',
            handler: function(){
                $("#ff-saveproduct").find('[name="sort.id"]').combobox({
                    url:'<%=path%>/manager/getproductsort.html?page=1&rows=99',
                    valueField:'id',
                    textField:'name'
                });
                $('#dlg-saveproduct').dialog("open")}
        },'-',{
            text:"修改商品",
            iconCls: 'icon-edit',
            handler: function(){
                var row = $("#dg-product").datagrid("getSelected");<%--获取datagrid的一行数据 --%>
                if (row) {
                    $("#ff-updateproduct").form("load", row);//让form表单加载row的数
                    $('#dlg-updateproduct').dialog("open");
                }else{
                    layer.msg('请选择一条记录', {icon: 5});
                }
            }
        },'-',{
            text:"删除商品",
            iconCls: 'icon-cancel',
            handler: function(){
                var row = $("#dg-product").datagrid("getSelected");
                if (row) {
                    layer.confirm('确定删除吗？', {
                        btn: ['确定删除','取消'] //按钮
                    }, function(){
                        $.post("<%=path%>/del.html",{"id":row.id},function (data) {
                            if (data == "success") {
                                layer.msg('删除成功', {icon: 1});
                                $("#dg-product").datagrid("reload");
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
    var pager = $("#dg-product").datagrid().datagrid("getPager");
    pager.pagination({
        beforePageText:"第",
        afterPageText:"页，共{pages}",
        displayMsg:"商品信息 {from} 到 {to} 共 {total} 条信息"
    })
    $('#dlg-saveproduct').dialog({
        title:"添加商品",
        closed:true,
        modal:true,
        iconCls: 'icon-save',
        buttons: [{
            text:'确定',
            iconCls:'icon-ok',
            handler:function(){
                $('#ff-saveproduct').submit();
            }
        },{
            text:'取消',
            handler:function(){
               $('#dlg-saveproduct').dialog('close') ;
            }
        }]
    });
    $('#dlg-updateproduct').dialog({
        closed:true,
        modal:true,
        iconCls: 'icon-edit',
        buttons: [{
            text:'确定',
            iconCls:'icon-ok',
            handler:function(){
                $('#ff-updateproduct').submit();
            }
        },{
            text:'取消',
            handler:function(){
                $('#dlg-updateproduct').dialog('close') ;
            }
        }]
    });

    $("#ssq1").cityloader({});
    $("#ssq2").cityloader({});
    //异步提交表单
    $('#ff-saveproduct').form({
        url:"<%=path%>/manager/addProduct.html",
        onSubmit: function(){
            return $('#ff-saveproduct').form("validate");//在提叫表单的是后调动validbox插件进行验证
        },
        success:function(data){
            if (data == "success") {
                layer.msg('添加用户成功');
                $("#dlg-saveproduct").dialog("close");
                $("#dg-product").datagrid("reload");
            }else{
                layer.msg('修改失败，发生异常', {icon: 5});
            }
        }
    });
    $('#ff-updateproduct').form({
        url:"<%=path%>//manager/sortupdate.html",
        onSubmit: function(){
            return $('#ff-updateproduct').form("validate");//在提叫表单的是后调动validbox插件进行验证
        },
        success:function(data){
            if (data == "success") {
                layer.msg('修改成功');
                $("#dlg-updateproduct").dialog("close");
                $("#dg-product").datagrid("reload");
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

</script>
</div>