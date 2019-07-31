<%--
  Created by IntelliJ IDEA.
  User: 吴鹏
  Date: 2019/7/18
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/common.jsp"%>
<SCRIPT src="${root}/plugins/jquery/1.9.1/jquery.min.js"></SCRIPT>
<html>
<head>
    <title>add</title>
</head>
<body>
<form action="${root}/add" method="post">
    用户姓名：<input type="text" name="username" id="un"><br><br><br>
    用户密码：<input type="text" name="password" id ="up"><br><br><br>
    <input type="submit"  name="提交">
</form>
</body>
</html>
