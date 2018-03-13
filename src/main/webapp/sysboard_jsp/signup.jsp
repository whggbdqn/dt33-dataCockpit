<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>申请合作</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect.
  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/css/skins/skin-blue.min.css">

<!-- jQuery 2.2.3 -->
<script
	src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script
	src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script
	src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>

<script type="text/javascript">
	function randomImage() {
		var image = document.getElementById("validateCode");
		image.src = "${pageContext.request.contextPath }/validatecode.jsp?rand="
				+ new Date();
	}
</script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/plugins/jQuery/jquery.validate.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/plugins/jQuery/additional-mothods.js"></script>
<script type="text/javascript">
	$(function() {
		$("#ff").validate({
			debug : false, //调试模式，即使验证成功也不会跳转到目标页面
			rules : { //配置验证规则，key就是被验证的dom对象，value就是调用验证的方法(也是json格式)
				corpname : {
					required : true
				},
				name : {
					required : true
				},
				job : {
					required : true
				},
				email : {
					required : true,
					email : true
				},
				phone : {
					required : true,
					rangelength : [ 11, 11 ],
					digits : true
				},
				code : {
					required : true,
					rangelength : [ 4, 4 ]
				}

			},
			messages : {
				corpname : {
					required : "请填写企业名称"
				},
				name : {
					required : "请填写联系人姓名"
				},
				job : {
					required : "请填写联系人职位"
				},
				email : {
					required : "请填写邮件",
					email : "邮箱格式不正确"
				},
				phone : {
					required : "请填写联系方式",
					rangelength : "请输入11位手机号",
					digits : "请输入正确的号码"
				},
				code : {
					required : "请填写验证码",
					rangelength : "请输入4位验证码"
				}

			}
		});
	});
</script>


  	<style>
  	body{
    font-family: Microsoft Yahei;
    font-size: 15px;
}
#ff div{
	height:54px;
}

fieldset{    width: 650px;    }

legend{    
    text-align: center;
    font-size: 20px;
}

.item{
    height: 56px;
    line-height: 30px;
    margin: 10px;
}

.item .item-label{
    float: left;
    width: 80px;
    text-align: right;
}

.item-text{
    float: left;
    width: 240px;
    height: 30px;
    padding: 9px 25px 9px 5px;
    margin-left: 10px;
    border: 1px solid #ccc;
    overflow: hidden;
}

.item-select{
    float: left;
    height: 30px;
    border: 1px solid #ccc;
    margin-left: 10px;
    font-size: 14px;
    padding: 6px 0px;
}

.item-file{
    float: left;
    height: 30px;
    margin-left: 10px;
    font-size: 14px;
    padding: 6px 0px;
}

.item-submit{
    float: left;
    height: 30px;
    width: 50px;
    margin-left: 90px;
    font-size: 14px;
}

input.error{
    border: 1px solid #E6594E;
}

input.highlight{
    border: 1px solid #7abd54;
}

label.error{
    float: left;
    height: 30px;
    line-height: 30px;
    font-size: 14px;
    text-align: left;
   /*  margin-left: 5px; */
    /* padding-left: 35px; */
    color: red;
    background: url('${pageContext.request.contextPath}dist/img/error.png') no-repeat left center;
}

label.tip{
    float: left;
    height: 30px;
    line-height: 30px;
    font-size: 14px;
    text-align: left;
    margin-left: 5px;
    padding-left: 35px;
    color: #aaa;
    background: url('${pageContext.request.contextPath}dist/img/tip.png') no-repeat left center;
    padding-left: 35px;
}

label.valid{
    background: url('${pageContext.request.contextPath}dist/img/valid.png') no-repeat left center;
}
</style>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition register-page">
	<div class="register-box">
		<div class="register-logo">
			<center>
				<h3>申请合作</h3>
			</center>
		</div>

		<div class="register-box-body">

			<form
				action="${pageContext.request.contextPath}/company/signUp.action"
				method="post" id="ff">
				<div class="form-group has-feedback">
					<span class="glyphicon glyphicon-user form-control-feedback"></span>
					<input name="corpname" type="text" class="form-control" placeholder="企业名称"> 
				</div>
				<div class="form-group has-feedback">
					<span class="glyphicon glyphicon-user form-control-feedback"></span>
					<input name="name" type="text" class="form-control" placeholder="联系人姓名"> 
				</div>
				<div class="form-group has-feedback">
					<span class="glyphicon glyphicon-user form-control-feedback"></span>
					<input name="job" type="text" class="form-control" placeholder="联系人职务"> 
				</div>
				<div class="form-group has-feedback">
					<span class="glyphicon glyphicon-phone form-control-feedback"></span>
					<input name="phone" type="text" class="form-control" placeholder="手机号码"> 
				</div>
				<div class="form-group has-feedback">
					<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
					<input name="email" type="email" class="form-control" placeholder="邮箱地址">
				</div>
				<div class="row">
					<div class="col-xs-6 form-group has-feedback " style="border: 0px red solid; width: 180px;">
						<input type="text" class="form-control" name="code"
							placeholder="请输入验证码">
					</div>
					<div>
						<img src="${pageContext.request.contextPath }/validatecode.jsp"
							id="validateCode" alt="图片丢失了" style="width: 90px; height: 32px;"
							onclick="randomImage();" /> &nbsp;&nbsp;&nbsp; <a
							href="javascript:randomImage();">看不清</a>
					</div>
					<input type="hidden" name="approval" value="0">
					<div class="row">

						<!-- /.col -->
						<div class="col-xs-12">
							<button type="submit" class="btn btn-primary btn-block btn-flat">申请合作</button>
						</div>
						<!-- /.col -->
					</div>
			</form>

		</div>
		<!-- /.form-box -->
	</div>
	<!-- /.register-box -->


	<script>
		$(function() {
			$('input').iCheck({
				checkboxClass : 'icheckbox_square-blue',
				radioClass : 'iradio_square-blue',
				increaseArea : '20%' // optional
			});
		});
	</script>
</body>
</html>
