<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/12/4
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <script src="/static/front/js/jquery-1.9.1.min.js" type="text/javascript"></script>
  <script src="/static/front/js/creat.js" type="text/javascript"></script>
  <script>
    function aaa(){
      alert("ttt");
      $("#code").qrcode({
        render: "canvas",
        width: 500,
        height:500,
        text: "http://www.baidu.com/"
      });
    }

  </script>
</head>
<body>
<div id="code"></div>
<a onclick="aaa();">ttttttttttttttttttt</a>
</body>
</html>
