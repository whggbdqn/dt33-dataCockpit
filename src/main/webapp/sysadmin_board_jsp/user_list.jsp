<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://shiro.apache.org/tags"  prefix="shiro"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>用户列表</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css">
   <!-- Font Awesome -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/iconfont.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/plugins/datatables/dataTables.bootstrap.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/skins/_all-skins.min.css">
	<style type="text/css">
		thead tr th{
			background-color: #DEE5F7;
			text-align: center;
		}
		tbody tr td{
			text-align: center;
		}
	</style>

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
                <li class="active"><a href="${pageContext.request.contextPath }/userlist.action">查看企业用户信息</a></li>
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
                <form action="${pageContext.request.contextPath}/companyInfo/page.action?thirdcondition=1" method="post">
                	
                	请输入企业名称：<input type="text" name="firstcondition" value="${page.querycondition.firstcondition}"/>
                	<input value="查询" type="submit" />
          		</form>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath }/checkSignup.action"><i class="fa fa-dashboard"></i>管理员界面</a></li>
                <li><a href="${pageContext.request.contextPath }/userlist.action">企业用户管理</a></li>
                <li class="active">查看用户</li>
            </ol>
        </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
              <div class="box-header">
                  <a href="${pageContext.request.contextPath }/sysadmin_board_jsp/add_user.jsp"><span class="glyphicon glyphicon-plus"></span>新增用户</a>
              </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th style="width: 30px;">编号</th>
                  <th>用户账号</th>
                  <th>所属企业</th>
                  <th>联系人姓名</th>
                  <th>联系人职务</th>
                  <th>联系人电话</th>
                  <th>状态</th>
                  <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${page.list}" var="companyInfo" varStatus="count">
                  <tr>
                  
                  	<td><input type="hidden" value="${companyInfo.id}" name="id"/>${count.count+(page.index-1)*page.pageSize}</td>
                  	<td>${companyInfo.email}</td>
                  	<td><a href="${pageContext.request.contextPath }/tableInfo/showCompanyTable.action?cid=${companyInfo.id}">${companyInfo.corpname}</a></td>
                  	<td>${companyInfo.name}</td>
                  	<td>${companyInfo.job}</td>
                  	<td>${companyInfo.phone}</td>
                  	<td><select name ="state" >
                  	<c:choose>
	                  	<c:when test="${(companyInfo.state==0)}">
	                  		<option selected="selected" value="0" >已禁用</option> 
	                  	</c:when>
	                  	<c:otherwise>
	                  		<option value="0">已禁用</option> 
	                  	</c:otherwise>
	                </c:choose>
	                 <c:choose>
	                  	<c:when test="${(companyInfo.state==1)}">
	                  		<option selected="selected" value="1" >已启用</option> 
	                  	</c:when>
	                  	<c:otherwise>
	                  		<option value="1">已启用</option> 
	                  	</c:otherwise>
                  	</c:choose>

                        </select>
                  	</td>
                  	<td>
                  	<a href="${pageContext.request.contextPath}/companyInfo/selectByPrimaryKey.action?id=${companyInfo.id}">编辑</a></td>
                  </tr>
                  </c:forEach>
                </tbody>
              </table>
                <a href="${pageContext.request.contextPath }/companyInfo/page.action?thirdcondition=1&index=1&firstcondition=${page.querycondition.firstcondition}&pageSize=${page.pageSize}&secondcondition=${page.querycondition.secondcondition}" >首页</a>
                <c:if test="${page.index==1}">
			       上一页
			  </c:if>
			    <c:if test="${page.index  >1}">
			     <a href="${pageContext.request.contextPath }/companyInfo/page.action?thirdcondition=1&index=${page.index-1}&firstcondition=${page.querycondition.firstcondition}&pageSize=${page.pageSize}&secondcondition=${page.querycondition.secondcondition}" >上一页</a>
			  </c:if>
			     <c:if test="${page.index < page.totalPage}">
			      <a href="${pageContext.request.contextPath }/companyInfo/page.action?thirdcondition=1&index=${page.index+1}&firstcondition=${page.querycondition.firstcondition}&pageSize=${page.pageSize}&secondcondition=${page.querycondition.secondcondition}" >下一页</a>
			  </c:if>
			 <c:if test="${page.index == page.totalPage}">
			       下一页
			  </c:if>
			    <a href="${pageContext.request.contextPath }/companyInfo/page.action?thirdcondition=1&index=${page.totalPage}&firstcondition=${page.querycondition.firstcondition}&pageSize=${page.pageSize}&secondcondition=${page.querycondition.secondcondition}" >末页</a>
			    当前页码：第${page.index}页，共${page.totalPage}页
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
    <strong>Copyright &copy; 2017 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights
    reserved.
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
  $(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": false,
      "lengthChange": false,
      "searching": false,
      "ordering": false,
      "info": false,
      "autoWidth": false
    });
  });
</script>
<script type="text/javascript">
	$(function(){
		
		 $("select[name=state]").each(function(){
			$(this).change(function(){
				alert($(this).val())
				alert($(this).parent().parent().children().first().children().val())
			    var objJson=JSON.stringify({
			    	'state':$(this).val(),
			    	'id':$(this).parent().parent().children().first().text()
			    });
			//	alert($(this).parent().parent().children().first().text());
		 		
			 /* 	$.post('${pageContext.request.contextPath }/companyInfo/CompanyInfoStateChange.action',
			 			{'state':$(this).val(),'id':$(this).parent().parent().children().first().text()},
			    	function(result){alert(result)}); */
				
				  $.ajax({
					type:'post',
					dataType:'text',
					data:{'state':$(this).val(),'id':$(this).parent().parent().children().first().children().val()},
					url:'${pageContext.request.contextPath }/companyInfo/CompanyInfoStateChange.action?thirdcondition=1',
					success:function(result){
						if(result=='no'){
							
						}
					} 
				}) ; 
			});
	  })
	});
</script>
</body>
</html>
