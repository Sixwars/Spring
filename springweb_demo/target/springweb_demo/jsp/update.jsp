<%--
  Created by IntelliJ IDEA.
  User: 吴鹏
  Date: 2019/7/17
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/common.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${root}/update" method="get" id="updateForm">
    <span style="color: red;">${msg}</span><br>

    id：<input type="text" name="id" ><br>
    账号：<input type="text" name="username" ><br/>
    密码：<input type="password" name="password" ><br/>
    <input type="submit" value="提交更新">
    <input type="reset" value="重置表单">
</form>

</body>
</html>
