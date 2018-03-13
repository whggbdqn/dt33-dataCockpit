<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>通知列表</title>
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

<link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/skins/_all-skins.min.css">

</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- Main Header -->
		<header class="main-header">
			<!-- Logo -->
			<a href="${pageContext.request.contextPath }/checkSignup.action"
				class="logo"> <!-- mini logo for sidebar mini 50x50 pixels --> <span
				class="logo-mini"><b>A</b>LT</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>数据驾驶舱平台</b></span>
			</a>
			<!-- Header Navbar -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span>
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
							<a href="${pageContext.request.contextPath }/logout.action"> <i class="fa fa-power-off">&nbsp;</i>退出登录
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
						<p>王健林</p>
						<p>董事长</p>
						<p>万达集团</p>
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
					<li class="treeview active"><a href="#"><i
							class="fa fa-link"></i> <span>管理员界面</span> <span
							class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span> </a>
						<ul class="treeview-menu">
							<li><a
								href="${pageContext.request.contextPath }/checkSignup.action">待审核用户列表</a></li>
							<li class="active"><a href="">通知管理 <span
									class="pull-right-container"> <i
										class="fa fa-angle-left pull-right"></i>
								</span>
							</a>
								<ul class="treeview-menu">
									<li class="active"><a
										href="${pageContext.request.contextPath }/noticeList.action">通知中心</a></li>
									<li><a
										href="${pageContext.request.contextPath }/sysadmin_board_jsp/new_notice.jsp">添加通知</a></li>
								</ul></li>
							<li><a href="">用户管理 <span class="pull-right-container">
										<i class="fa fa-angle-left pull-right"></i>
								</span>
							</a>
								<ul class="treeview-menu">
									<li><a
										href="${pageContext.request.contextPath }/userlist.action">查看用户</a></li>
									<li><a
										href="${pageContext.request.contextPath }/sysadmin_board_jsp/add_user.jsp">新增用户</a></li>
								</ul></li>
							<li><a href="">数据表管理 <span class="pull-right-container">
										<i class="fa fa-angle-left pull-right"></i>
								</span>
							</a>
								<ul class="treeview-menu">
									<li><a href="${pageContext.request.contextPath }/dataTable.action">数据表管理</a></li>
									<li><a href="${pageContext.request.contextPath }/dataShow.action">数据列表</a></li>
									<li><a href="${pageContext.request.contextPath }/dataRelationManage.action">数据关系管理</a></li>
									<li><a href="${pageContext.request.contextPath }/dataAnalysisManage.action">分析任务管理</a></li>
								</ul></li>
							<li><a href="">后台账号管理 <span class="pull-right-container">
										<i class="fa fa-angle-left pull-right"></i>
								</span>
							</a>
								<ul class="treeview-menu">
									<li><a href="${pageContext.request.contextPath}/adminList.action">后台账号列表</a></li>
									<li><a href="${pageContext.request.contextPath }/sysadmin_board_jsp/add_admin.jsp">新增账号</a></li>
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
				<h1>武汉汇创科技有限公司(公司名)</h1>
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
								<table id="example" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>编号</th>
											<th>数据表名</th>
											<th>最近数据更新时间</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<%-- <c:forEach items="${page.list}" var="noticeInfo">
											<tr>
												<td>${noticeInfo.id}</td>
												<td>${noticeInfo.physicaltablename}<i id="New" style="color: red; display: none">New!!</i></a></td>
												<td>${noticeInfo.updatetime}</td>
												<td><a class="col-xs-3" href="${pageContext.request.contextPath}/noticeInfo/editNoticeShow.action?id=${noticeInfo.id}">上传数据</a><a href="${pageContext.request.contextPath}/noticeInfo/delNotice.action?id=${noticeInfo.id}">查看数据</a></td>
											</tr>
										</c:forEach> --%>
									</tbody>
								</table>
								<%-- <a href="${pageContext.request.contextPath }/noticeInfo/page.action?index=1&firstcondition=${page.querycondition.firstcondition}&pageSize=${page.pageSize}&secondcondition=${page.querycondition.secondcondition}">首页</a>
								<c:if test="${page.index==1}"> 上一页 </c:if>
								<c:if test="${page.index  >1}">
									<a href="${pageContext.request.contextPath }/noticeInfo/page.action?index=${page.index-1}&firstcondition=${page.querycondition.firstcondition}&pageSize=${page.pageSize}&secondcondition=${page.querycondition.secondcondition}">上一页</a>
								</c:if>
								<c:if test="${page.index < page.totalPage}">
									<a href="${pageContext.request.contextPath }/noticeInfo/page.action?index=${page.index+1}&firstcondition=${page.querycondition.firstcondition}&pageSize=${page.pageSize}&secondcondition=${page.querycondition.secondcondition}">下一页</a>
								</c:if>
								<c:if test="${page.index == page.totalPage}"/>
								<a href="${pageContext.request.contextPath }/noticeInfo/page.action?index=${page.totalPage}&firstcondition=${page.querycondition.firstcondition}&pageSize=${page.pageSize}&secondcondition=${page.querycondition.secondcondition}">末页</a> 
								当前页码：第${page.index}页，共${page.totalPage}页 --%>
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
<script>
   $(function () {
	   $("#example").DataTable({
    	// "pagingType": "simple_numbers",设置分页控件的模式
    	ordering:true,
         searching: true,//屏蔽datatales的查询框
         //aLengthMenu:[10],//设置一页展示10条记录
		  /* 	"bSort":true,
		  	"hover":true,
		  	"stripe":true,  */
         "bLengthChange": true,//屏蔽tables的一页展示多少条记录的下拉列表
         "aLengthMenu" : [10,20, 40, 60,100],   //有效
    	"processing": true, //打开数据加载时的等待效果
        "serverSide": true,//打开后台分页
       /*  "bServerSide" : true, // 配置使用服务器端处理的DataTable，注意sAjaxSource参数必须指定，以便给DataTable一个获取每行数据的数据源
        "sAjaxDataProp" : 'data',  
        "sAjaxSource" : 'bwrcTwo/search', */
      ajax:"${pageContext.request.contextPath}/tableInfo/page.action",
      "columns":[
          {"data":"id"},
          {"data":"name"},
          {"data":"updatetime"},
          {"data":""}
          
      ],
      
      "oLanguage": {  //对表格国际化 
          "sLengthMenu": "每页显示 _MENU_条",  
          "sZeroRecords": "没有找到符合条件的数据",  
      //  "sProcessing": "&lt;img src=’./loading.gif’ /&gt;",  
          "sInfo": "当前第 _START_ - _END_ 条　共计 _TOTAL_ 条",  
          "sInfoEmpty": "木有记录",  
           "sInfoFiltered": " ",  
          "sSearch": "搜索：",  
          "oPaginate": {  
          "sFirst": "首页",  
          "sPrevious": "前一页",  
          "sNext": "后一页",  
          "sLast": "尾页"  

          } ,
  	},
  	 
/*   	"columnDefs" : [ {
  	// 定义操作列,######以下是重点########
  	"targets" : 6,//操作按钮目标列
  	"data" : null,
  	"render" : function(data, type,row) {
  	var id = '"' + row.id + '"';
  	var html = "<a href='${pageContext.request.contextPath}/checkCompanyInfo/updateCompangInfoApproval.action?id="+row.id+"&approval=1'>通过</a>";
  	html +=	 "&nbsp;&nbsp;&nbsp;<a href='${pageContext.request.contextPath}/checkCompanyInfo/updateCompangInfoApprovalandDelete.action?id="+row.id+"'>不通过</a>";

  		
  		return html;
  	}
  	} ], */
  	
	} ); 
	  
	   
  });
</script>
</body>
</html>