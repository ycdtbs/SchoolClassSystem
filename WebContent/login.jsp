<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>欢迎使用自动选课系统</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="assets/styles.css" rel="stylesheet" media="screen">
     <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script src="js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
  </head>
  <body id="login">
    <div class="container">

      <form class="form-signin" action="login" method="post">
        <h2 class="form-signin-heading">登录</h2>
        <input type="text" class="input-block-level" placeholder="用户名" name="id">
        <input type="password" class="input-block-level" placeholder="密码" name="pwd">
        <label class="checkbox">
          <input type="checkbox" value="remember-me"> 记住密码
          <%
          String a=(String)request.getAttribute("key");
          System.out.println(a);
          if(a!=null){
        	  %><font color="red">账户名或密码错误</font><% 
          }
          %>
        </label>
        <button class="btn btn-large btn-primary" type="submit">登录</button>
      </form>

    </div> <!-- /container -->
    <script src="vendors/jquery-1.9.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>