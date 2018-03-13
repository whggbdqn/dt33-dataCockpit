<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>数据表管理</title>
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
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
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
       <li class="treeview active"><a href="#"><i
							class="fa fa-link"></i> <span>数据仓驾驶平台</span> <span
							class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span> </a>
						<ul class="treeview-menu">
							<li><a
								href="${pageContext.request.contextPath}/Info/infolist.action">通知中心</a></li>
							<li><a href="#">个人中心 <span class="pull-right-container">
										<i class="fa fa-angle-left pull-right"></i>
								</span>
							</a>
								<ul class="treeview-menu">
									<li><a
										href="${pageContext.request.contextPath}/company/changeInfoPage.action?phone=${companyInfomation.phone}">修改资料</a></li>
									<li><a
										href="${pageContext.request.contextPath}/sysboard_jsp/change_pwd.jsp">修改密码</a></li>
								</ul></li>
							<li class="active"><a href="#">数据管理 <span
									class="pull-right-container"> <i
										class="fa fa-angle-left pull-right"></i>
								</span>
							</a>
								<ul class="treeview-menu">
									<li><a href="${pageContext.request.contextPath}/cid_dataRelation.action?cid=${companyInfomation.id}">数据关系图</a></li>
									<li class="active"><a href="${pageContext.request.contextPath}/pages.action?cid=${companyInfomation.id}">数据表管理</a></li>
									<li><a href="${pageContext.request.contextPath}/analysisTasks/queryShow.action?firstcondition=${companyInfomation.id}&id=1">数据分析任务</a></li>
								</ul></li>
						</ul></li>



      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>${companyInfomation.corpname }</h1>
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath }/checkSignup.action"></i>管理员界面</a></li>
					<li><a href="${pageContext.request.contextPath }/noticeList.action">数据表管理</a></li>
					<li class="active">数据表管理</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">

						<!-- /.box -->

						<div class="box">
							<div class="box-header">
								<h1>数据表管理</h1>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table id="example2" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>编号</th>
											<th>数据表名</th>
											<th>最近数据更新时间</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${pages.list}" var="noticeInfo">
											<tr>
												<td>${noticeInfo.id}</td>
												<td>${noticeInfo.physicaltablename}</td>
												<td>${noticeInfo.updatetime.toLocaleString()}</td>
												<td><a class="col-xs-5" href="${pageContext.request.contextPath}/noticeInfo/editNoticeShow.action?id=${noticeInfo.id}">上传数据</a><a href="${pageContext.request.contextPath}/noticeInfo/delNotice.action?id=${noticeInfo.id}">查看数据</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<a href="${pageContext.request.contextPath }/pages.action?index=1&firstcondition=${pages.querycondition.firstcondition}&pageSize=${pages.pageSize}&secondcondition=${pages.querycondition.secondcondition}">首页</a>
								<c:if test="${pages.index==1}"> 上一页 </c:if>
								<c:if test="${pages.index  >1}">
									<a href="${pageContext.request.contextPath }/pages.action?index=${pages.index-1}&firstcondition=${pages.querycondition.firstcondition}&pageSize=${pages.pageSize}&secondcondition=${pages.querycondition.secondcondition}">上一页</a>
								</c:if>
								<c:if test="${pages.index < pages.totalPage}">
									<a href="${pageContext.request.contextPath }/pages.action?index=${pages.index+1}&firstcondition=${pages.querycondition.firstcondition}&pageSize=${pages.pageSize}&secondcondition=${pages.querycondition.secondcondition}">下一页</a>
								</c:if>
								<c:if test="${pages.index == pages.totalPage}"/>
								<a href="${pageContext.request.contextPath }/pages.action?index=${pages.totalPage}&firstcondition=${pages.querycondition.firstcondition}&pageSize=${pages.pageSize}&secondcondition=${pages.querycondition.secondcondition}">末页</a> 
								当前页码：第${pages.index}页，共${pages.totalPage}页
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
						<!-- /.box -->
					</div>
					<!-- /.col -->
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
			<strong>Copyright &copy; 2017 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.
			</strong> All rights reserved.
		</footer>


		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<!-- jQuery 2.2.3 -->
	<script src="${pageContext.request.contextPath }/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
	<!-- DataTables -->
	<script src="${pageContext.request.contextPath }/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath }/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<!-- SlimScroll -->
	<script src="${pageContext.request.contextPath }/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="${pageContext.request.contextPath }/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="${pageContext.request.contextPath }/dist/js/app.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="${pageContext.request.contextPath }/dist/js/demo.js"></script>
	<!-- page script -->
	<script>
		$(function() {
			$("#example1").DataTable();
			$('#example2').DataTable({
				"paging" : false,
				"lengthChange" : false,
				"searching" : false,
				"ordering" : false,
				"info" : false,
				"autoWidth" : false
			});
		});
	</script>
</body>
</html>
