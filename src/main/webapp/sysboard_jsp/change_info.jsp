<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>修改资料</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/iconfont.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect.
  -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/skins/skin-blue.min.css">

	<!-- jQuery 2.2.3 -->
<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/dist/js/app.min.js"></script>


  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  	
  	<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
	
	
	
  	<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/jQuery/jquery.validate.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/jQuery/additional-mothods.js"></script>
  	<script type="text/javascript">
  		$(function(){
  	  		
  	        $("#ff").validate({
  	            debug:false, //调试模式，即使验证成功也不会跳转到目标页面
  	            rules:{     //配置验证规则，key就是被验证的dom对象，value就是调用验证的方法(也是json格式)
  					name:{
  	                	required:true
  	                },
  					job:{
  	                	required:true
  	                },
  	                email:{
  	                    required:true,
  	                    email:true
  	                	},
  					phone:{
  	                	required:true,
  	                	rangelength:[11,11],
  	                	digits:true
  						},	
  	                code:{
  	                	required:true,
  	                	rangelength:[4,4]
  	                }
  	                
  	            },
  	            messages:{
  					name:{
  	                	required:"请填写联系人姓名"
  	                },
  					job:{
  	            		required:"请填写联系人职位"
  	            	},
  	                email:{
  	                    required:"请填写邮件",
  	                    email:"邮箱格式不正确"
  	                	},
  					phone:{
  	            		required:"请填写联系方式",
  	            		rangelength:"请输入11位手机号",
  	            		digits:"请输入正确的号码"
  	            	},
  	            	code:{
  	            		required:"请填写验证码",
  	            		rangelength:"请输入4位验证码"
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

</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="${pageContext.request.contextPath}/Info/infolist.action" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>A</b>LT</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>数据驾驶舱平台</b></span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->



      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Notifications Menu -->
          <li class="dropdown notifications-menu">
            <!-- Menu toggle button -->
            <a href="${pageContext.request.contextPath}/sysboard_jsp/change_pwd.jsp">
              <i class="fa fa-cog">&nbsp;修改密码</i>
            </a>

          </li>
          <!-- Tasks Menu -->
          <li class="dropdown tasks-menu">
            <!-- Menu Toggle Button -->
             <a href="${pageContext.request.contextPath}/logout.action">
              <i class="fa fa-power-off">&nbsp;</i>退出登录
            </a>
          </li>
          <!-- User Account Menu -->

          <!-- Control Sidebar Toggle Button -->
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel" style="margin-top: 10px">
        <div class="pull-left image">
         <img src="${pageContext.request.contextPath }/dist/img/user.png" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info" style="margin-left: 30px">
          <p>${companyInfomation.name }</p>
          <p>${companyInfomation.job }</p>
          <p>${companyInfomation.corpname }</p>
          <!-- Status -->
         <!-- <i href="#"><i class="fa fa-circle text-success"></i>online</i></a>-->
        </div>
      </div>

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" style="margin-top: 20px">

        <!-- Optionally, you can add icons to the links -->
       <!-- <li class="active"><a href="#"><i class="fa fa-link"></i> <span>Link</span></a></li>
        <li><a href="#"><i class="fa fa-link"></i> <span>Another Link</span></a></li>
-->
        <li class="treeview active">
          <a href="#"><i class="fa fa-link"></i> <span>数据仓驾驶平台</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="${pageContext.request.contextPath}/Info/infolist.action">通知中心</a></li>
            <li class="active"><a href="#">个人中心
              <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
              <ul class="treeview-menu">
                <li class="active"><a href="${pageContext.request.contextPath}/company/changeInfoPage.action?phone=${companyInfomation.phone}">修改资料</a></li>
                <li><a href="${pageContext.request.contextPath}/sysboard_jsp/change_pwd.jsp">修改密码</a></li>
              </ul>
            </li>
            <li><a href="#">数据管理
              <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
              <ul class="treeview-menu">

                <li><a href="${pageContext.request.contextPath}/cid_dataRelation.action?cid=${companyInfomation.id}">数据关系图</a></li>
                <li><a href="${pageContext.request.contextPath}/pages.action?cid=${companyInfomation.id}">数据表管理</a></li>
                <li><a href="${pageContext.request.contextPath}/analysisTasks/queryShow.action?firstcondition=${companyInfomation.id}&id=1">数据分析任务</a></li>
              </ul>
            </li>
          </ul>
        </li>



      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->

  <div class="content-wrapper">
    <!-- Content Header (Page header) -->

    <section class="content-header">
      <h1>
        ${companyInfomation.corpname }
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 数据仓驾驶平台</a></li>
        <li><a href="#">个人中心</a></li>
        <li class="active">资料修改</li>
      </ol>
    </section>


    <section class="content">
    <!-- Main content -->
    <div class="register-box">
      <div class="register-logo">
        <center><h3>修改资料</h3></center>
      </div>

      <div class="register-box-body">

	<!-- 跳转修改资料Controller -->
        <form action="${pageContext.request.contextPath}/company/changeInfo.action" method="post" id="ff">
          <div class="form-group has-feedback">
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
            <input name="corpname" type="text" class="form-control" placeholder="企业名称" value="${info.corpname}" readonly="readonly">
          </div>
          <div class="form-group has-feedback">
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
            <input name="name" id="name" type="text" class="form-control" placeholder="联系人姓名" value="${info.name}" datatype="s2-5" errormsg="昵称至少5个字符,最多16个字符！" >
          </div>
          <div class="form-group has-feedback">
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
            <input name="job" type="text" class="form-control" placeholder="联系人职务" value="${info.job}">
          </div>
         
         <div class="form-group has-feedback">
            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            <input name="email" required="required" type="email" class="form-control" placeholder="邮箱地址" value="${info.email}">
          </div>
         
          <div class="form-group has-feedback">
            <span class="glyphicon glyphicon-phone form-control-feedback"></span>
            <input name="phone" type="text" class="form-control" placeholder="联系方式" value="${info.phone}">
          </div>
          
          <div class="form-group has-feedback">
          <div class="row">
	        <div class="col-xs-8"><input name="code" id="code" type="text" class="form-control" placeholder="验证码"> </div>
	        <div class="col-xs-4"><span class="wordp lf"><img src="${pageContext.request.contextPath}/validatecode.jsp" width="96" height="30" alt="" id="img"/></span>   </div>
	      </div>
          <span id="msg"></span>
          </div>
          <input type="hidden" name="id" value="${info.id}">
          <div class="row">
            <div class="col-xs-12">
              <input id="btn" type="submit" class="btn btn-primary btn-block btn-flat" value="修改资料">
            </div>
            <!-- /.col -->
          </div>
        </form>

      </div>
      <!-- /.form-box -->
    </div>

    <!-- /.content -->
  </section></div>

  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <footer class="main-footer">

    <!-- Default to the left -->
    <strong>Copyright &copy; 2017 <a href="#">Company</a>.</strong> All rights reserved.
  </footer>

  <!-- Control Sidebar -->

  <!-- /.rol-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>

<script type="text/javascript">
var randomcode =${validateCode11};
		$(function(){
			alert(123);
			$("#btn").attr("disabled","disabled");
			$("#code").blur(function(){
				alert(123);
				$.post('${pageContext.request.contextPath}/login/checkCode.action',
						{'code':$("#code").val()},function(){});
			});
			/* $("#code").keyup(function(){
				
				var code = $("#code").val();
				alert(code);
				alert(randomcode);
				//如果输入的验证码不是4位，直接返回不执行ajax
				if(code.length != 4){
					$("#btn").attr("disabled","disabled");
					$("#msg").html("验证码输入错误");
					return;
				} */
				//判断验证码是否正确
				
				
				
				//alert($("#code").val());
				/* $.ajax({
					url:"login/checkCode.action",
					type:"post",
					data:{code:$("#code").val()},
					dataType:"json",
					success:function(result){
						if(result == true){
							//输入正确
							$("#btn").removeAttr("disabled");
							$("#msg").html("验证码输入正确");
						} else {
							$("#btn").attr("disabled","disabled");
							$("#msg").html("验证码输入错误");
						}
					}
				}); */
			
		});
	</script>

<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->



<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. Slimscroll is required when using the
     fixed layout. -->
</body>
</html>
