<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
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
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  
  <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/iconfont.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/skins/skin-blue.min.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dist/js/app.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/jQuery/messages_zh.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/jQuery/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/jQuery/additional-methods.js"></script>

<style type="text/css">
.error{
    color:red;
}

</style>
  	<script type="text/javascript">
  	 $(function(){
  		$("#newPassword").keyup(function(){
  			var pw = $("#newPassword").val();
  	    	//alert(pw);
  	    	var reg = new RegExp(/[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/);
  	    	//alert("验证结果" +reg.test(pw))
  	    	if(pw.length>7 && pw.length<17){
  	        if (reg.test(pw)) {
  	        	$("#toPw").html(" &nbsp; ");
  				$('#sbt').removeAttr("disabled");
  	        }else{
  				$("#toPw").text("请输入数字英文组合密码");
  				$("#toPw").attr("visibility","visible");
  				$('#sbt').attr("disabled",true);
  			} 
  	    		
  	    	}else{
  	    		$("#toPw").html(" &nbsp; ");
  				$('#sbt').attr("disabled",true);
  	    	}
  	    	
  		})
  		 
  		 
  		 
        $("#changePassword").validate({
            debug:false, //调试模式，即使验证成功也不会跳转到目标页面
            rules:{     //配置验证规则，key就是被验证的dom对象，value就是调用验证的方法(也是json格式)
            	password:{
					required:true
				},
				newPassword:{
					required:true,
					rangelength:[8,16],
                	//alnum:true
				},
                rePassword:{
                    required:true,
                    rangelength:[8,16],
                    equalTo:"#newPassword"
                	}
                
            },
            messages:{
            	password:{
                	required:"请输入原密码",
                },
				newPassword:{
                	required:"请输入新密码",
                	rangelength:"请输入8到16位的密码",
                	//alnum:"请输入英文数字密码"
                },
                rePassword:{
                    required:"请确认新密码",
                    rangelength:"请输入8到16位的密码",
                    equalTo:"请输入相同的密码"
                	}
            	
            },
            
            submitHandler:function(form) {
            	$.ajax({
  	  				type:'post',
  	  				dataType:'json',
  	  				data:{'oldPassword':$('#password').val(),'newPassword':$('#newPassword').val()},
  	  				url:'${pageContext.request.contextPath}/userInfo/UpdatePassword.action',
  	  				success:function(result){
  	  					if(result.trim()=="yes"){
  	  						
  	  					if (confirm("您确定要修改密码吗?")) 
  	                    {   alert("恭喜!修改成功,请重新登录");
  	  						location="${pageContext.request.contextPath }/logout.action";
  	                     }
  	  					}else{
  	  						//$("#spOldPassword").html("原密码错误,请重新输入").css({'color':'red'});
  	  						alert("原密码错误,请重新输入");
  	  						//$("#sbt").attr("disabled",true); 
  	  						$("#rePassword").val("");
  	  					}
  	  				}
  	  			})
  				
  			}
        });
    });
  	
  	</script>
  

</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="${pageContext.request.contextPath }/checkCompanyInfo/userinfoShowe.action" class="logo">
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
            <a href="${pageContext.request.contextPath}/sysadmin_board_jsp/change_pwd.jsp">
              <i class="fa fa-cog">&nbsp;修改密码</i>
            </a>

          </li>
          <!-- Tasks Menu -->
          <li class="dropdown tasks-menu">
            <!-- Menu Toggle Button -->
            <a href="${pageContext.request.contextPath }/logout.action">
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
          <p>${user.name}</p>
          <p>${user.job}</p>
          <p>${user.phone}</p>
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
        <li class="treeview active">
          <a href="#"><i class="fa fa-link"></i> <span>平台管理后台</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="${pageContext.request.contextPath }/checkSignup.action">待审核用户列表</a></li>
            <li><a href="">通知管理
              <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
              <ul class="treeview-menu">
                <li><a href="${pageContext.request.contextPath }/noticeList.action">通知中心</a></li>
                <li><a href="${pageContext.request.contextPath }/sysadmin_board_jsp/new_notice.jsp">添加通知</a></li>
              </ul>
            </li>
            <li><a href="">企业用户管理
              <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
              <ul class="treeview-menu">
                <li><a href="${pageContext.request.contextPath }/userlist.action">查看企业用户信息</a></li>
                <li><a href="${pageContext.request.contextPath }/sysadmin_board_jsp/add_user.jsp">新增企业用户</a></li>
              </ul>
            </li>
            <li><a href="">数据表管理
              <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
              <ul class="treeview-menu">
                <li><a href="${pageContext.request.contextPath }/dataTable.action">数据表管理</a></li>
                    <li><a href="${pageContext.request.contextPath }/dataRelationManage.action">数据关系管理</a></li>
                    <li><a href="${pageContext.request.contextPath }/dataAnalysisManage.action">分析任务管理</a></li>
              </ul>
            </li>
			<shiro:hasRole name="admin">
            <li><a href="">后台账号管理
              <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
              <ul class="treeview-menu">
                <li><a href="${pageContext.request.contextPath}/adminList.action">后台账号列表</a></li>
                <li><a href="${pageContext.request.contextPath }/sysadmin_board_jsp/add_admin.jsp">新增账号</a></li>
              </ul>
            </li>
			</shiro:hasRole>
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
      <div class="box-header">

      </div>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath }/checkSignup.action"><i class="fa fa-dashboard"></i>管理员界面</a></li>
        <li class="active">修改密码</li>
      </ol>
    </section>


    <!-- Main content -->
      <div class="register-box">
        <center><h3>修改密码</h3></center>
        <div class="register-box-body">
        <form action="${pageContext.request.contextPath }/logout.action" method="post" id="changePassword">
          <!-- <div class="form-group has-feedback">
	          <div class="row" style="height:40px;">
		        <div class="col-md-3">原密码： </div>
		        <div class="col-md-8" style="padding:0px;" style="height:104px;">
		          <input type="password" name="password" id="password"  onkeyup="this.value=this.value.replace(/\s+/g,'')"></div>
		      	</div>
          </div>   -->
          <div class="form-group has-feedback" style="height:48px;">
	        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
	        <input onkeyup="this.value=this.value.replace(/\s+/g,'')" name="password" id="password"  type="password" class="form-control" placeholder="原密码">
	      </div>
          <!-- <div class="form-group has-feedback">
	          <div class="row" style="height:40px;">
		        <div class="col-md-3">新密码：</div>
		        <div class="col-md-8" style="padding:0px;" style="height:44px;">
		        <input type="password"  name="newPassword" id="newPassword" onkeyup="this.value=this.value.replace(/\s+/g,'')">
		       <p style="visibility:visible;color:red;font-weight:bold;" id="toPw">&nbsp;</p>
		       </div>
		      </div>
          </div> -->
          <div class="form-group has-feedback" style="height:48px;">
	        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
	        <input onkeyup="this.value=this.value.replace(/\s+/g,'')" name="newPassword" id="newPassword" type="password" class="form-control" placeholder="新密码">
	        <div style="visibility:visible;color:red;height:25px;font-weight:bold;" id="toPw">&nbsp;</div>
	      </div> 
          <div class="form-group has-feedback" style="height:48px;">
	        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
	        <input onkeyup="this.value=this.value.replace(/\s+/g,'')"  name="rePassword" id="rePassword" type="password" class="form-control" placeholder="确认密码">
	      </div> 
        <!--   <div class="form-group has-feedback">
	          <div class="row" style="height:40px;">
		        <div class="col-md-3" style="padding:0px;"> 确认密码：</div>
		        <div class="col-md-8" style="padding:0px;"  style="height:74px;"> 
		        <input type="password"  name="rePassword" id="rePassword" onkeyup="this.value=this.value.replace(/\s+/g,'')"></div>
		      </div>
          </div> -->
           

          <div class="row">
            <!-- /.col -->
            <div class="col-xs-10">
              <input type="submit" id="sbt" class="btn btn-primary btn-block btn-flat" value="确认保存"></input>
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
    <!-- /.content -->
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

</body>
</html>
