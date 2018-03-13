<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>修改密码</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect.
  -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/skins/skin-blue.min.css">

  <!-- Ajax验证密码 -->
  <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
  <script type="text/javascript">
	
  $(function(){
		$("#sbt").attr("disabled",true); 
	  $("#newPassword2").keyup(function(){
		  	
			var  password1=$("#newPassword1").val();
			var  password2=$("#newPassword2").val();
			 var reg1 =new  RegExp(/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/);
			/*  var reg2=new  RegExp(/^[0-9]+$/); */
			if(password1=="" || password2==""){
				$("#spOldPassword").html("新密码不能为空").css({'color':'red'});
				$("#sbt").attr("disabled",true); 
			}else  if(password1 !=password2){
				$("#spOldPassword").html("两个新密码不一致").css({'color':'red'});
				$("#sbt").attr("disabled",true); 
			}else  if(password2.length<8){
					$("#spOldPassword").html("密码长度不能小于8").css({'color':'red'});
					$("#sbt").attr("disabled",true); 
			}else if(!reg1.test(password2)){
				$("#spOldPassword").html("新密码中必须包含字母和数字").css({'color':'red'});
				$("#sbt").attr("disabled",true); 
			}/* else if(!reg2.test(password2)){
				$("#spOldPassword").html("新密码中必须包含数字").css({'color':'red'});
				$("#sbt").attr("disabled",true); 
			} */else{
				$("#spOldPassword").html("可以使用").css({'color':'green'});
				$("#sbt").attr("disabled",false); 
			}
		})
		 $("#newPassword1").keyup(function(){
		  	
			var  password1=$("#newPassword1").val();
			var  password2=$("#newPassword2").val();
			 var reg1 =new  RegExp(/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/);
		/* 	 var reg2=new  RegExp(/^[0-9]+$/); */
			if(password1=="" || password2==""){
				$("#spOldPassword").html("新密码不能为空").css({'color':'red'});
				$("#sbt").attr("disabled",true); 
			}else  if(password1 !=password2){
				$("#spOldPassword").html("两个新密码不一致").css({'color':'red'});
				$("#sbt").attr("disabled",true); 
			}else  if(password1.length<8){
					$("#spOldPassword").html("密码长度不能小于8").css({'color':'red'});
					$("#sbt").attr("disabled",true); 
			}else if(!reg1.test(password1)){
				$("#spOldPassword").html("新密码中必须包含字母和数字").css({'color':'red'});
				$("#sbt").attr("disabled",true); 
			}else{
				$("#spOldPassword").html("可以使用").css({'color':'green'});
				$("#sbt").attr("disabled",false); 
			}
		})
  })
  
  	$(function(){
  		$("#sbt").attr("disabled",true); 
  		$("#sbt").click(function(){
  			
  			$.ajax({
  				type:'post',
  				dataType:'json',
  				data:{'oldPassword':$('#oldPassword').val(),'newPassword':$('#newPassword1').val()},
  				url:'${pageContext.request.contextPath}/company/validateOldPassword.action',
  				success:function(result){
  					if(result.trim()=="yes"){
  						alert("恭喜!修改成功,请重新登录")
  						location="${pageContext.request.contextPath }/logout.action";
  					}else{
  						$("#spOldPassword").html("原密码错误,请重新输入").css({'color':'red'});
  						$("#sbt").attr("disabled",true); 
  						$("#newPassword2").val("");
  					}
  				}
  			})
  		})
  	});
  </script>	
	
	
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>

<body class="hold-transition skin-blue sidebar-mini">
<section class="wrapper">

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
         <img src="${pageContext.request.contextPath}/dist/img/user.png" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info" style="margin-left: 30px">
          <p>${companyInfomation.name }</p>
          <p>${companyInfomation.job }</p>
          <p>${companyInfomation.corpname }</p>
          <!-- Status -->
         <!-- <i href="#"><i class="fa fa-circle text-success"></i>online</i></a>-->
        </div>
      </div>

      <!-- search form (Optional) 搜索功能 -->
      <!--<form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>-->
      <!-- /.search form -->

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
                <li><a href="${pageContext.request.contextPath}/company/changeInfoPage.action?phone=${companyInfomation.phone}">修改资料</a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/sysboard_jsp/change_pwd.jsp">修改密码</a></li>
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
        <li class="active">修改密码</li>
      </ol>
    </section>

    <section class="content">
    <!-- Main content -->
    <div class="register-box">

        <center><h3>修改密码</h3></center>

		
      <div class="register-box-body">
	

        <form action="${pageContext.request.contextPath}/company/changePwd.action" method="post">
          <div class="form-group has-feedback">
          	
            <input  id="oldPassword"    name="oldPassword"  type="password" class="form-control" placeholder="原密码">
            <span  class="glyphicon glyphicon-user form-control-feedback"></span>
            	
          </div>
          <div class="form-group has-feedback">
            <input   id="newPassword1"     name="newPassword"  type="password" class="form-control" placeholder="新密码">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input   id="newPassword2"     name="newPassword"  type="password" class="form-control" placeholder="确认新密码">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
           
          </div>

          <div class="row">
 				
            <!-- /.col -->
            <div class="col-xs-12">
              <button type="button" class="btn btn-primary btn-block btn-flat"  id="sbt">修改密码</button>
            </div>
            <span  id="spOldPassword"   style="margin-left: 12px;margin-top: 20px">        </span>
            <!-- /.col -->
          </div>
        </form>


      </div>
      <!-- /.form-box -->
    </div>


</section>
  </div>

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
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 2.2.3 -->
<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/dist/js/app.min.js"></script>

<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. Slimscroll is required when using the
     fixed layout. -->
</body>
</html>
