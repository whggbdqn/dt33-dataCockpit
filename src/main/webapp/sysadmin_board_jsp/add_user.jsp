<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://shiro.apache.org/tags"  prefix="shiro"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>新增用户</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/iconfont.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/skins/_all-skins.min.css">

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
        $("#add_user").validate({
            debug:false, //调试模式，即使验证成功也不会跳转到目标页面
            rules:{     //配置验证规则，key就是被验证的dom对象，value就是调用验证的方法(也是json格式)
            	corpname:{
                	required:true
                },
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
				password:{
					required:true,
					rangelength:[8,16],
                	alnum:true
				}
            },
            messages:{
            	corpname:{
                	required:"请填写企业名称"
                },
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
            	password:{
					required:"请输入默认密码",
					rangelength:"请输入8到16位的密码",
                	alnum:"请输入英文数字密码"
				}
            }, 
            submitHandler: function (form) {
                    if (confirm("您确定要添加该用户吗?")) 
                    {   
						alert("添加用户成功！");
                        form.submit();
                     }
                }, 
            
        });
        
        //手机号验证
       
		$("#phone").keyup(function(){
			//var newPhone = $("#phone").val();
			var lg = $("#phone").val().length;
			if(lg==11){
			$.ajax({
				type:'post',
				dataType:'text',
				data:{phone:$("#phone").val()},
				url:'${pageContext.request.contextPath}/companyInfo/checkCompanyAccount.action',
				success:function(result){
					var ok = (result.length==4);
					//alert(ok);
					 if(result.length==5){
						 $("#result").html(" &nbsp;  ");
						//$("#btn").attr("disabled",false);
						$('#btn').removeAttr("disabled");
						
					}else{
						$("#result").text("此电话已经被注册");
						$("#result").attr("visibility","visible");
						$('#btn').attr("disabled",true);
					} 
					
				}
			});
				
			}
			else{
				$("#result").html(" &nbsp; ");
				$("#btn").attr("disabled",false);
			}
			
		})
        
        
        
        
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
            <li><a href="${pageContext.request.contextPath }/checkCompanyInfo/userinfoShowe.action">待审核用户列表</a></li>
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
            <li class="active"><a href="">企业用户管理
              <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
              <ul class="treeview-menu">
                <li><a href="${pageContext.request.contextPath }/userlist.action">查看企业用户信息</a></li>
                <li class="active"><a href="${pageContext.request.contextPath }/sysadmin_board_jsp/add_user.jsp">新增企业用户</a></li>
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
      <h1>
       新增用户
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath }/checkSignup.action"><i class="fa fa-dashboard"></i>管理员界面</a></li>
        <li><a href="${pageContext.request.contextPath }/userlist.action">企业用户管理</a></li>
        <li class="active">新增用户</li>
      </ol>
    </section>
    <section class="content">
<div class="register-box">
  <div class="register-box-body">

    <form id="add_user" action="${pageContext.request.contextPath}/companyInfo/addUser.action" method="post">
		<div style="color:red;" id="result" style="height:40px;"> &nbsp;</div>
      <div class="form-group has-feedback" style="height:45px;">
        <span class="glyphicon glyphicon-home form-control-feedback"></span>
        <input  name="corpname" type="text" class="form-control" placeholder="企业名称" onkeyup="this.value=this.value.replace(/\s+/g,'')">
      </div>
      <div class="form-group has-feedback" style="height:45px;">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
        <input name="name" type="text" class="form-control" placeholder="联系人姓名" onkeyup="this.value=this.value.replace(/\s+/g,'')">
      </div>
      <div class="form-group has-feedback" style="height:45px;">
        <span class="glyphicon glyphicon-briefcase form-control-feedback"></span>
        <input name="job" type="text" class="form-control" placeholder="联系人职务" onkeyup="this.value=this.value.replace(/\s+/g,'')">
      </div>
      <div class="form-group has-feedback" style="height:45px;">
        <span class="glyphicon glyphicon-phone-alt form-control-feedback"></span>
        <input id="phone" name="phone" type="tel" class="form-control" placeholder="手机号码" onkeyup="this.value=this.value.replace(/\s+/g,'')">
      </div>
      <div class="form-group has-feedback" style="height:45px;">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
        <input name="email" type="email" class="form-control" placeholder="邮箱地址" onkeyup="this.value=this.value.replace(/\s+/g,'')">
      </div>
      <div class="form-group has-feedback" style="height:45px;">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        <input name="password" type="password" class="form-control" placeholder="默认密码" onkeyup="this.value=this.value.replace(/\s+/g,'')">
        <input name="approval" type="hidden" value="0" class="form-control" placeholder="审批状态">
      </div>
      <div class="row">
     
       
        <div class="col-xs-12">
          <input id="btn" type="submit"  class="btn btn-primary btn-block btn-flat" vlaue="立即开通"></input>
        </div>
        <!-- /.col --> 
      </div>
    </form>
  </div>
  <!-- /.form-box -->
</div>
<!-- /.register-box -->
 <!-- /.content -->
  </section></div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.3.8
    </div>
    <strong>Copyright &copy; 2017 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights
    reserved.
  </footer>


  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->


<script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${pageContext.request.contextPath}/dist/js/demo.js"></script>

</body>
</html>
