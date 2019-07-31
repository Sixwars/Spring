<%--
  Created by IntelliJ IDEA.
  User: 吴鹏
  Date: 2019/7/15
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/common.jsp"%>
<html>
<head>
    <title>用户管理系统首页</title>
</head>
<body>
<h2>WELCOME:${user.username}</h2>
<a href="${root}/toUpdate">根据ID更新用户信息</a>
<a href="${root}/toAdd">添加用户</a>
<a href="${root}/toDelete">删除用户</a>
<a href="${root}/toQuery">根据ID查询用户</a>
<a href="${root}/list">用户管理</a>


</body>
</html>
