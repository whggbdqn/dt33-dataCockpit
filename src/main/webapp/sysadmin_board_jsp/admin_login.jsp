<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>登陆</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/iconfont.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/plugins/iCheck/square/blue.css">

  <script type="text/javascript">
     function randomImage(){
    	 var image=document.getElementById("validateCode");
    	 image.src="${pageContext.request.contextPath }/validatecode2.jsp?rand="+new Date();
     }
     
     function clearMsg(){
    	 var spanMsg=document.getElementById("spanMsg");
    	 spanMsg.innerHTML="";
     }
  </script>
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <b>账号登陆</b>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <form action="${pageContext.request.contextPath }/login/loginHandler.action" method="post">
      <div class="form-group has-feedback">
        <input type="tel" class="form-control" name="username1" placeholder="手机号码" onfocus="clearMsg();">
        <span class="glyphicon glyphicon-phone-alt form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" name="password1" placeholder="密码" onfocus="clearMsg();">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
      <div class="col-xs-6 form-group has-feedback "  style="border:0px red solid;width:170px;">
        <input type="text" class="form-control" name="randomcode" placeholder="请输入验证码">
       
      </div> 
      <div >
           <img src="${pageContext.request.contextPath }/validatecode2.jsp" id="validateCode" 
           alt="图片丢失了" style="width:120px;height:32px;" onclick="randomImage();"/> &nbsp;&nbsp;&nbsp;
           <a href="javascript:randomImage();"></a>
      </div>
     <!--  <div class="col-xs-2 form-group has-feedback">
      	<span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div> -->
      </div>
      <button type="submit" class="btn btn-primary btn-sm form-control">登陆</button>	
      
       <div class="row" style="border:0px red solid;">
        <div class="col-xs-12" style="text-align:center;margin-top:10px">
          <a href="${pageContext.request.contextPath}/sysboard_jsp/signup.jsp">申请合作</a><br>
          <span style="margin-left:20px;color:red;" id="spanMsg">${msg }</span>
      </div>
      </div>
    </form>

   
  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<script src="${pageContext.request.contextPath }/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="${pageContext.request.contextPath }/plugins/iCheck/icheck.min.js"></script>
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
