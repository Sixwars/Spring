<%--
  Created by IntelliJ IDEA.
  User: 吴鹏
  Date: 2019/7/19
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/common.jsp"%>
<html>
<head>
    <title>AJAX</title>
</head>
<body>
<H2>TEST AJAX</H2>
<div id="msg" style="width: 300px;height: 300px;border: 1px solid green;"></div>
<button onclick="executeAjax()">写入</button>
<SCRIPT src="${root}/plugins/jquery/1.9.1/jquery.min.js"></SCRIPT>
<script>
    function executeAjax(){
    $.ajax({
        type:'post',
        url:'${root}/jsonTest',
        data:{id:1,name:'admins'},
        success:function (json) {
            console.log(json);
            alert('success');
            $('#msg').text(json.data);
        },
        error:function () {
            alert('fail');
        }
    })
    }
</script>
</body>
</html>
