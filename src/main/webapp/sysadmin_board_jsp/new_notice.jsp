<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://shiro.apache.org/tags"  prefix="shiro"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>添加通知</title>
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
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
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
            <li class="active"><a href="">通知管理
              <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
              <ul class="treeview-menu">
                <li><a href="${pageContext.request.contextPath }/noticeList.action">通知中心</a></li>
                <li class="active"><a href="${pageContext.request.contextPath }/sysadmin_board_jsp/new_notice.jsp">添加通知</a></li>
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
      <h1>
        武汉汇创科技有限公司(公司名)
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath }/checkSignup.action"><i class="fa fa-dashboard"></i>管理员界面</a></li>
        <li><a href="${pageContext.request.contextPath }/noticeList.action">通知管理</a></li>
        <li class="active">添加通知</a></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- left column -->
        <div class="col-md-12">
		<form action="${pageContext.request.contextPath}/noticeInfo/addNotice.action" method="post">	
          <!-- general form elements disabled -->
          <div class="box box-warning"  style="margin-left:150px ;border: solid  #D2D6DE 3px;width: 700px">
            <div class="box-header with-border">
              	<div style="font-size: 14px">添加新公告
              		<input type="submit" value="发布" id="sub" style="margin-left:490px;width:100px">
            	</div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <!-- text input -->
                <div class="form-group">
                  <label>公告标题</label>
                  <input name="title" type="text" id="title" class="form-control" placeholder="Enter ..." required="required"><br>
                  <span id="titleinfo" style="display:none">输入不合法不能只输空格</span>
                </div>
                <div class="form-group">
                  <label>公告作者</label>
                  <input name="publisher"  id="publisher" type="text" class="form-control" placeholder="Enter ..." required="required"><br>
                  <span id="publisherinfo" style="display:none">输入不合法不能只输空格</span>
                </div>

                <!-- textarea -->
                <div class="form-group">
                  <label>正文</label>
                  <textarea name="details" id="details" class="form-control" rows="10" placeholder="Enter ..." required="required"></textarea><br>
                  <span id="detailsinfo" style="display:none">输入不合法不能只输空格</span>
                </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
          </form>
        </div>
        <!--/.col (right) -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.3.8
    </div>
    <strong>Copyright &copy; 2017 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights
    reserved.
  </footer>

  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
<script type="text/javascript">
$(function(){
   $("#title").bulr(function(){
	  if($(this).val().replace(/^(\s|\u00A0)+/,'').replace(/(\s|\u00A0)+$/,'').length>0){
		 $("#sub").attr("disable",false);
		 $("#titleinfo").attr("display","none");
	  }
	  else{
		  $("#titleinfo").attr("display","block")
		  $("#sub").attr("disable",true); 
		  
	  }
   })
    $("#publisher").bulr(function(){
	  if($(this).val().replace(/^(\s|\u00A0)+/,'').replace(/(\s|\u00A0)+$/,'').length>0){
		  $("publisherinfo").attr("display","none");
		 $("#sub").attr("disable",false);
	  }
	  else{
		  $("publisherinfo").attr("display","block");
		  $("#sub").attr("disable",true); 
		  
	  }
   })
    $("#details").bulr(function(){
	  if($(this).val().replace(/^(\s|\u00A0)+/,'').replace(/(\s|\u00A0)+$/,'').length>0){
		  $("detailsinfo").attr("display","none");
		 $("#sub").attr("disable",false);
	  }
	  else{
		  $("detailsinfo").attr("display","block");
		  $("#sub").attr("disable",true); 
		  
	  }
   })
})
</script>
<!-- jQuery 2.2.3 -->
<script src="${pageContext.request.contextPath }/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="${pageContext.request.contextPath }/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath }/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${pageContext.request.contextPath }/dist/js/demo.js"></script>
</body>
</html>
