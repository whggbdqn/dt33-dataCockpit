<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>查看数据</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect.
  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/dist/css/skins/skin-blue.min.css">

	<script
		src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script
		src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${pageContext.request.contextPath}/dist/js/app.min.js"></script>

<style>
#div1 {
	display: none;
	position: absolute;
	left: 30%;
	top: 40%;
	width: 350px;
	height: 200px;
	background-color: white;
	border: 1px solid #3c8dbc;
	border-radius:10px;
}

#div2 {
	display: none;
	position: absolute;
	left: 30%;
	top: 40%;
	width: 350px;
	height: 200px;
	background-color: white;
	border: 1px solid #3c8dbc;
	border-radius:10px;
}
.startNew{background-color:#3c8dbc;color: white; border: 0px;height:30px;}
</style>
<script type="text/javascript">
	function OpenDiv(a) {
		$("#cdrid").attr("value", a);
		document.getElementById("div1").style.display = "block";
		document.getElementById("open").style.display = "none";
	}
	
	function OpenDiv2() {
		document.getElementById("div2").style.display = "block";
		document.getElementById("open").style.display = "none";
	}
	
	/* 给div层中的关闭添加onclick事件： */
	function CloseDiv() {
		document.getElementById("div1").style.display = "none";
		document.getElementById("open").style.display = "block";
	}
	
	function CloseDiv2() {
		document.getElementById("div2").style.display = "none";
		document.getElementById("open").style.display = "block";
	}

	function Clear() {
		$("#tips").text("");
	}
</script>

<script type="text/javascript">
	function Validate() {
		var form = document.forms[0];
		var size = $("#myfile")[0].files[0].size;
		var file = $("#myfile").val();
		var extStart = file.lastIndexOf(".");
		var ext = file.substring(extStart, file.length).toUpperCase();
		form.onsubmit = function() {
			if (size > 2097152) {
				$("#tips").text("文件超过2M，请重新上传");
				return false;
			}
			if (ext != ".CSV" && ext != ".XLS") {
				$("#tips").text("请上传规范类型文件");
				return false;
			}
		}
	}
</script>


</head>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
		<header class="main-header">

			<!-- Logo -->
			<a href="${pageContext.request.contextPath}/Info/infolist.action"
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
							<!-- Menu toggle button --> <a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="fa fa-cog">&nbsp;修改密码</i>
						</a>

						</li>
						<!-- Tasks Menu -->
						<li class="dropdown tasks-menu">
							<!-- Menu Toggle Button --> <a
							href="${pageContext.request.contextPath}/logout.action"> <i
								class="fa fa-power-off">&nbsp;</i>退出登录
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
						<img src="${pageContext.request.contextPath }/dist/img/user.png"
							class="img-circle" alt="User Image">
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
									<li><a
										href="${pageContext.request.contextPath}/cid_dataRelation.action?cid=${companyInfomation.id}">数据关系图</a></li>
									<li class="active"><a
										href="${pageContext.request.contextPath}/pages.action?cid=${companyInfomation.id}">数据表管理</a></li>
									<li><a
										href="${pageContext.request.contextPath}/analysisTasks/queryShow.action?firstcondition=${companyInfomation.id}&id=1">数据分析任务</a></li>
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
					<li><a href="#"><i class="fa fa-dashboard"></i> 数据仓驾驶平台</a></li>
					<li><a href="#">数据管理</a></li>
					<li class="active">数据列表</li>
				</ol>
			</section>



			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">数据表管理</h3>
								<input type="button" value="上传新数据" class="startNew"
									onclick="javascript:var a = ${tid} ;OpenDiv(a);"> <input
									type="button" value="导出数据" onclick="OpenDiv2()" class="startNew">
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table id="example2" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th class="col-lg-1">编号</th>
											<c:forEach var="cname" items="${tableColumnName}">
												<th class="col-lg-2">${cname.columnName}</th>
											</c:forEach>
										</tr>
									</thead>
									<tbody id="domId">
									</tbody>
								</table>
								<a href="${pageContext.request.contextPath}/showdata.action?pageNow=1&id=${id}">首页</a>
								<c:if test="${data.pageNow==1}"> 上一页 </c:if>
								<c:if test="${data.pageNow>1}">
									<a href="${pageContext.request.contextPath }/showdata.action?id=${id}&pageNow=${data.pageNow-1}">上一页</a>
								</c:if>
								<c:if test="${data.pageNow < data.pageCount}">
									<a href="${pageContext.request.contextPath }/showdata.action?id=${id}&pageNow=${data.pageNow+1}">下一页</a>
								</c:if>
								<c:if test="${data.pageNow == data.pageCount}"/>
								<a href="${pageContext.request.contextPath }/showdata.action?id=${id}&pageNow=${data.totalCount}">末页</a> 
								当前页码：第${data.pageNow}页，共${data.pageCount}页
							
								<!-- 上传窗体 -->
								<div id="div1">
									<center>
										<h3>正在上传新数据表文件</h3>
									</center>
									<form
										action="${pageContext.request.contextPath}/uploadexcel.action"
										method="post" enctype="multipart/form-data">
										<table style="margin-left: 50px">
											<tr>
												<td>文件上传:</td>
												<td><input type="file" name="myfile" id="myfile"
													onclick="javascript:Clear();"></td>
											</tr>
											<tr>
												<td colspan="3" style="color: blue">当前仅支持上传CSV和XLS格式的文件，且
												</td>
											</tr>
											<tr>
												<td colspan="3" style="color: blue">文件大小不超过2MB</td>
											</tr>

											<tr>
												<td colspan="3">&nbsp;<input type="hidden" value="${tid}"
													name="cdr_id"> <span id="tips" style="color: red"></span></td>
											</tr>

											<tr>
												<td><input type="submit" value="确定上传" class="startNew"
													onclick="javascript:Validate();"></td>
												<td><input style="margin-left: 100px" type="button" class="startNew"
													onclick="javascript:CloseDiv();" value="取消操作">
											</tr>
										</table>
									</form>
								</div>
								<!-- 数据导出 -->
								<div id="div2">
									<center>
										<h2>导出数据</h2>
									</center>
									<form
										action="${pageContext.request.contextPath}/download.action"
										method="post">
										<center>
										<input type="hidden" value="${tid}" name="tid">
										<input type="radio" value="xls" name="fileType"/>excel
										<input type="radio" value="csv" name="fileType"/>csv
										<br/><br/>
										<input  type="submit" value="导出数据" class="startNew">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input  type="button" value="取消操作" class="startNew" onclick="javascript:CloseDiv2();">		
										</center>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>



		</div>




		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<footer class="main-footer">

			<!-- Default to the left -->
			<strong>Copyright &copy; 2017 <a href="#">Company</a>.
			</strong> All rights reserved.
		</footer>

		<!-- Control Sidebar -->

		<!-- /.rol-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED JS SCRIPTS -->



	<script type="text/javascript">
	window.onload=function (){
		var str = ${jsonStr};
		var pnm = ${p_colName};
		var html="";
		var i=${(data.pageNow-1)*data.pageSize+1};
		var s=str.length+1;
	 	 for( i ;i <s;i++){
	    	html+="<tr><td>"+i+"</td>";
	    	for(j=0;j<pnm.length;j++){
				var coln = pnm[j].physicalColumnName;
	    		html+="<td>"+str[i][coln]+"</td>";
				}
			html+="</tr>";
	 	 };  
		document.getElementById("domId").innerHTML=html;
	}
</script>

</body>
</html>





