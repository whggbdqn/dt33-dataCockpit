<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://shiro.apache.org/tags"  prefix="shiro"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>修改信息</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/iconfont.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/iCheck/square/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <!--<div class="register-lomingcgo">
    <a href="index2.html"><b><h3 >申请合作</h3></b></a>
  </div>-->

  <div class="register-box-body">
    <p class="login-box-msg">资料修改</p>

    <form action="index.html" method="post">
      <div class="form-group has-feedback">
      											<!--class="form-control"-->
        企业名称：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" >
      <!--  <span class="glyphicon glyphicon-user form-control-feedback"></span>-->
      </div>
      <div class="form-group has-feedback">
       联系人姓名： <input type="email" >
        <!--<span class="glyphicon glyphicon-envelope form-control-feedback"></span>-->
      </div>
      <div class="form-group has-feedback">
       联系人职务： <input type="password"  >
        <!--<span class="glyphicon glyphicon-lock form-control-feedback"></span>-->
      </div>
        <div class="form-group has-feedback">
       手机号码： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"  >
       <!-- <span class="glyphicon glyphicon-lock form-control-feedback"></span>-->
      </div>
        <div class="form-group has-feedback">
       邮箱地址： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"  >
       <!-- <span class="glyphicon glyphicon-lock form-control-feedback"></span>-->
      </div>
      
        <div class="form-group has-feedback">
        	<span class="col-md-4">验证码：</span>
        	<input type="text"  style="width: 50px;" class="col-md-6"/>
        	<span class="col-md-2"><img src="AdminLTE-2.3.11/dist/img/credit/paypal2.png" /></span>
       <!-- <span class="glyphicon glyphicon-lock form-control-feedback"></span>-->
      </div>
      
     
      <div class="row">
        <!-- /.col -->
        <div class="col-xs-12">
          <button type="submit" class="btn btn-primary btn-block btn-flat">申请</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

   <!-- <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign up using
        Facebook</a>
      <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign up using
        Google+</a>
    </div>-->
	
    <!--<a href="login.html" class="text-center">I already have a membership</a>-->
  </div>
  <!-- /.form-box -->
</div>
<!-- /.register-box -->

<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>
</body>
</html>
