<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>${pd.SYSNAME}</title>
  <link href="${css_imagedomain}/login/css/reset.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/login/css/commen.css" rel="stylesheet" type="text/css" />
  <link href="${css_imagedomain}/login/css/login.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="${css_imagedomain}/js/jquery-1.5.1.min.js"></script>
  <script src="${css_imagedomain}/login/js/login.js"></script>
  <script>

  </script>
</head>

<body>

<!--登陆页主体-->
<div class="land">
  <div class="landCont">
    <form  action="" method="post" name="loginForm" id="landForm">
      <div class="headH clear">
        <h2 class="fz18 lineH48 fl">华金所</h2>
        <h3 class="fz14 lineH30 fl" style="[*+><]margin-top: 16px">后台登录</h3>
      </div>
      <div class="nameDiv">
        <i></i>
        <input type="text"name="loginname"id="loginname" value="" placeholder="用户名" />
        <p>请输入用户名</p>
      </div>
      <div class="passDiv">
        <i></i>
        <input type="password"name="password" id="password" value="" placeholder="密码" />
        <!--<div>此处留作验证填写内容</div>-->
        <p>请输入用户名</p>
      </div>
      <div class="yanzheng">
        <span class="fz14 fzw">验证码</span>
        <input type="text" name="code" id="code"  value="" class="yzInput" />
        <img src="images/Logo.png"id="codeImg" width="68" height="30" alt="验证" />
        <a id="recode">换一张</a>
      </div>
      <input type="submit" value="登录" class="logoSub" onclick="severCheck();"id="to-recover"/>
    </form>
  </div>
</div>
<!--登陆页主体 End-->
<div class="footer">
  <p>深圳前海华企融信金融服务有限公司<span>客服电话：400-826-5000</span></p>
</div>

<script type="text/javascript">

  //服务器校验
  function severCheck(){
    if(check()){
      var loginname = $("#loginname").val();
      var password = $("#password").val();
      var code = loginname+",fh,"+password+",fh,"+$("#code").val();
      $.ajax({
        type: "POST",
        url: 'login_login',
        data: {KEYDATA:code,tm:new Date().getTime()},
        dataType:'json',
        cache: false,
        success: function(data){
          if("success" == data.result){
            saveCookie();
            window.location.href="main/index";
          }else if("usererror" == data.result){
            $("#loginname").tips({
              side : 1,
              msg : "用户名或密码有误",
              bg : '#FF5080',
              time : 15
            });
            $("#loginname").focus();
          }else if("codeerror" == data.result){
            $("#code").tips({
              side : 1,
              msg : "验证码输入有误",
              bg : '#FF5080',
              time : 15
            });
            $("#code").focus();
          }else{
            $("#loginname").tips({
              side : 1,
              msg : "缺少参数",
              bg : '#FF5080',
              time : 15
            });
            $("#loginname").focus();
          }
        }
      });
    }
  }

  $(document).ready(function() {
    changeCode();
    $("#recode").bind("click", changeCode);
  });

  $(document).keyup(function(event) {
    if (event.keyCode == 13) {
      $("#to-recover").trigger("click");
    }
  });

  function genTimestamp() {
    var time = new Date();
    return time.getTime();
  }

  function changeCode() {
    $("#codeImg").attr("src", "code.do?t=" + genTimestamp());
  }

  //客户端校验
  function check() {

    if ($("#loginname").val() == "") {

      $("#loginname").tips({
        side : 2,
        msg : '用户名不得为空',
        bg : '#AE81FF',
        time : 3
      });

      $("#loginname").focus();
      return false;
    } else {
      $("#loginname").val(jQuery.trim($('#loginname').val()));
    }

    if ($("#password").val() == "") {

      $("#password").tips({
        side : 2,
        msg : '密码不得为空',
        bg : '#AE81FF',
        time : 3
      });

      $("#password").focus();
      return false;
    }
    if ($("#code").val() == "") {

      $("#code").tips({
        side : 1,
        msg : '验证码不得为空',
        bg : '#AE81FF',
        time : 3
      });

      $("#code").focus();
      return false;
    }

    $("#loginbox").tips({
      side : 1,
      msg : '正在登录 , 请稍后 ...',
      bg : '#68B500',
      time : 10
    });

    return true;
  }

  function savePaw() {
    if (!$("#saveid").attr("checked")) {
      $.cookie('loginname', '', {
        expires : -1
      });
      $.cookie('password', '', {
        expires : -1
      });
      $("#loginname").val('');
      $("#password").val('');
    }
  }

  function saveCookie() {
    if ($("#saveid").attr("checked")) {
      $.cookie('loginname', $("#loginname").val(), {
        expires : 7
      });
      $.cookie('password', $("#password").val(), {
        expires : 7
      });
    }
  }
  function quxiao() {
    $("#loginname").val('');
    $("#password").val('');
  }

  jQuery(function() {
    var loginname = $.cookie('loginname');
    var password = $.cookie('password');
    if (typeof(loginname) != "undefined"
            && typeof(password) != "undefined") {
      $("#loginname").val(loginname);
      $("#password").val(password);
      $("#saveid").attr("checked", true);
      $("#code").focus();
    }
  });
</script>
<script>
  //TOCMAT重启之后 点击左侧列表跳转登录首页
  if (window != top) {
    top.location.href = location.href;
  }
</script>

<script src="${css_imagedomain}/js/bootstrap.min.js"></script>
<script src="${css_imagedomain}/js/jquery-1.7.2.js"></script>
<script src="${css_imagedomain}/login/js/jquery.easing.1.3.js"></script>
<script src="${css_imagedomain}/login/js/jquery.mobile.customized.min.js"></script>
<script src="${css_imagedomain}/login/js/camera.min.js"></script>
<script src="${css_imagedomain}/login/js/templatemo_script.js"></script>
<script type="text/javascript" src="${css_imagedomain}/js/jquery.tips.js"></script>
<script type="text/javascript" src="${css_imagedomain}/js/jquery.cookie.js"></script>
</body>
</html>
