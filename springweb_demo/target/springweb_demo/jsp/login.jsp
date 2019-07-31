<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 吴鹏
  Date: 2019/7/15
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/common.jsp"%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/login.css"/>
    <title>登录界面</title>
    <style type="text/css">
        .LoginForm {
            width: 800px;
            margin: 20px auto 40px;
            padding: 49px 49px 29px;
            border: 1px solid #dfdfdf;
            border-radius: 8px;
            background-color: #fff;
        }

        .c-pageTitle {
            margin: 45px auto 20px;
            font-size: 28px;
            font-weight: normal;
            line-height: 1.2;
            text-align: center;
            letter-spacing: 0.5px;
        }
        .Container_main {
            width: 640px;
            margin: 0 auto;
        }
        .LoginForm_body {
            width: 500px;
            margin: 20px auto 40px;
            padding: 49px 49px 29px;
            border: 1px solid #dfdfdf;
            border-radius: 8px;
            background-color: #fff;
        }

        #username {
            min-height: 50px;
            min-width: 100px;
            padding: 12px 14px;
            border-width: 3px;
        }

        #password {
            min-height: 50px;
            padding: 12px 14px;
            border-width: 3px;
        }
    </style>
</head>
<body style="margin-bottom: 103px; zoom: 1;">
<div class="LoginForm" >
    <div class="Container_main">
        <h1 class="c-pageTitle">WELCOME</h1>
        <section class ="LoginForm_body">
            <c:set var="root" value="${pageContext.request.contextPath}"/>
            <form action="${root}/login" method="post" id="loginForm">
                <p style="color: red;">${msg}</p>
                <input type="text" id="username" name="username"><br>
                <input type="password" id="password" name="password"><br>
                <input type="submit" id="buttons_submit" name="提交">
                <input type="reset" id ="buttons_reset" name="重置">
            </form>
        </section>
    </div>
</div>


<script src="${root}/plugins/jquery/1.9.1/jquery.min.js"></script>
<script>
    <%--JQuery--%>
    $(function () {
        function checkUsername(){
            var name =$('#username').val();
            var reg_name =/^\w{6,10}$/
            return reg_name.test(name);
        }
        function checkPassword(){
            var password =$("#password").val();
            var reg_password =/^\w{6,10}$/
            return reg_password.test(password);
        }
        $('#username').blur(function () {
            if(!checkUsername()){
                $(this).css('border',"1px solid red");
            }else{
                $(this).css('border',"");
            }
        })
        $('#password').blur(function () {
            if(!checkPassword()){
                $(this).css('border',"1px solid red");
            }else{
                $(this).css('border',"");
            }
        })
        $('#loginForm').submit(function () {
            if(!checkUsername()||!checkPassword()){
                return false;
            }
            return true;
        })

    })

</script>

</body>
</html>
