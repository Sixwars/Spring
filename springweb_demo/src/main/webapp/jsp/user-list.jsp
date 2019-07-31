<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 吴鹏
  Date: 2019/7/18
  Time: 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/common.jsp"%>
<SCRIPT src="${root}/plugins/jquery/1.9.1/jquery.min.js"></SCRIPT>
<html>
<head>
    <title>用户管理页面</title>
</head>
<body>
<a href="${root}/toAdd">添加</a>
<a href="javascript:void(0)" onclick="delUsersByIds()">批量删除</a>
<table>
<thead>
<tr>
    <td><input type="checkbox"></td>
    <th>id</th>
    <th>用户名</th>
    <th>密码</th>
    <th>操作</th>
</tr>
</thead>
<tbody>
<c:forEach items="${userList}" var="user">
    <tr>
        <td><input type="checkbox"value="${user.id}"></td>
        <td>${user.id}</td>
        <td>${user.username}</td>
        <td>${user.password}</td>
        <td>
            <a href="${root}/toUpdate">编辑</a>
            <a href="javascript:void(0)"onclick="deleteInfo(${user.id})">删除</a>

        </td>
    </tr>
</c:forEach>
</tbody>
</table>
<script>
    function deleteInfo(id) {
        alert("delete");
        $.ajax({
            url : "${root}/delete",
            async : true,
            type : "POST",
            data : {
                id:id
            },
            success : function(data) {
                alert("success");
                // 删除成功后刷新页面
                window.location.reload();
                //$(tag).parents('tr').remove();
            },
            error : function() {
                alert("请求失败");
            }
        });
    }
</script>
<script>
        function delUsersByIds() {
            ids=new Array();
            inputs=$('tbody input:checkbox:checked')
            for(var i=0;i<inputs.length;i++)
            {
                ids.push(inputs[i].value);

            }
            $.ajax({
                url:'${root}/delUsersByIds',
                type:'post',
                data:{
                    ids:ids
                },
                success:function (jsonData) {
                    console.log(jsonData);
                    if (jsonData.code==0)
                    {
                        inputs.parents('tr').remove();
                    }

                },
                error:function () {
                    alert("error")
                }


            })
        }


</script>
</body>
</html>
