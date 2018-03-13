<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
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
<title>数据关系管理</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/dist/css/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/dist/css/ionicons.min.css">
<!-- DataTables -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/plugins/datatables/dataTables.bootstrap.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/dist/css/AdminLTE.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/dist/css/skins/skin-blue.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/plugins/jQuery/jquery-2.2.3.min.js"></script>


<script type="text/javascript">
  	$(function(){
  		 $("#newRelationTable").click(function(){
  			$("#newAddTableDiv").show();
  		});
  		$("#quxiao").click(function(){
  			$("#newAddTableDiv").hide();
  		});
  		/* $("#baocun").click(function(){
  			$("#newAddTableDiv").hide();
  		}) */
  	})
    </script>

<script type="text/javascript">
  	$(function(){
			 $("#tableIn").change(function(){
				//alert($(this).val());
				$.ajax({
					url:"${pageContext.request.contextPath }/tableInfo/getColumnByid.action",
					type:"post",
					data:{"did":$(this).val()},
					dataType:"json",
					success:function(result){
						//JSON.stringify(result);
						$("#tableCol").empty();
						if(result.length > 0){
							for ( var i = 0; i < result.length; i++) {
								var tableCol = result[i];	//取出对象
								//添加到tableCol中
								$("#tableCol").append("<option value='"+tableCol.id+"'>"+tableCol.columnName+"</option>");
							}
						} else {
							$("#tableCol").append("<option value='-1'>--请选择表中字段名称--</option>");
						} 
						
					}
				});
				//创建表关系的保存点击事件
				$("#baocun").click(function(){
					var selectone = $("#tableIn").val();
					var selecttwo = $("#tableInf").val();
					var newTableRe = $("#newTableRe").val();
					var selectColumnOne = $("#tableCol option:selected").text();
					var selectColumnTwo = $("#tableColl option:selected").text();
/* 					alert(selectColumnOne);
					alert(selectColumnTwo); */
					
					if(newTableRe==null||newTableRe==""){
						alert("关联关系名称不能为空");
						return false;
					}else if(selectone==selecttwo){
						alert("不能选择同一个表");
						return false;
					}else if(selectColumnOne!=selectColumnTwo){	
						alert("请选择两个表中相同的字段名称");
						return false;	
					}else{
						alert("保存成功！");
						$("#register-form").submit();
					}
					
				});
			});
			
			 
			 //新建表关系中根据数据表名显示字段
			 $("#tableInf").change(function(){
					//alert($(this).val());
					$.ajax({
						url:"${pageContext.request.contextPath }/tableInfo/getColumnByid.action",
						type:"post",
						data:{"did":$(this).val()},
						dataType:"json",
						success:function(result){
							//JSON.stringify(result);
							$("#tableColl").empty();
							if(result.length > 0){
								for ( var i = 0; i < result.length; i++) {
									var tableColl = result[i];	//取出对象
									//添加到tableColl中
									$("#tableColl").append("<option value='"+tableColl.id+"'>"+tableColl.columnName+"</option>");
								}
							}else {
								$("#tableColl").append("<option value='-1'>--请选择表中字段名称--</option>");
							}
							
						}
					});
				});
			 
			 
			//验证新增加表关系的名字是否有重复 
				$("#newTableRe").keyup(function(){
					$.ajax({
						url:"${pageContext.request.contextPath }/tableInfo/checkTableReName.action",
						type:"post",
						data:{name:$("#newTableRe").val(),cid:$("#tableInfoCid").val()},
						dataType:"json",
						success:function(result){
							JSON.stringify(result);
							if(result == true){
								$("#baocun").removeAttr("disabled");
								$("#msg").html("此表名可用");
							} else {
								$("#baocun").attr("disabled","disabled");
								$("#msg").html("此表名名已经存在不能使用");
							}
						}
					});
				});
		});
  	
  	function myfunctionRe(tbrid,cid,obj){
  		 location="${pageContext.request.contextPath }/tableInfo/dataRelationStateChange.action?id="+tbrid+"&cid="+cid+"&state="+obj.value;
  	}
  </script>
<style type="text/css">
thead tr th {
	background-color: #DEE5F7;
	text-align: center;
}

tbody tr td {
	text-align: center;
}
</style>
</head>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- Main Header -->
		<header class="main-header">

			<!-- Logo -->
			<a
				href="${pageContext.request.contextPath }/checkCompanyInfo/userinfoShowe.action"
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
							<!-- Menu toggle button --> <a
							href="${pageContext.request.contextPath}/sysadmin_board_jsp/change_pwd.jsp">
								<i class="fa fa-cog">&nbsp;修改密码</i>
						</a>

						</li>
						<!-- Tasks Menu -->
						<li class="dropdown tasks-menu">
							<!-- Menu Toggle Button --> <a
							href="${pageContext.request.contextPath }/logout.action"> <i
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
					<li class="treeview active"><a href="#"><i
							class="fa fa-link"></i> <span>平台管理后台</span> <span
							class="pull-right-container"> <i
								class="fa fa-angle-left pull-right"></i>
						</span> </a>
						<ul class="treeview-menu">
							<li><a
								href="${pageContext.request.contextPath }/checkCompanyInfo/userinfoShowe.action">待审核用户列表</a></li>
							<li><a href="">通知管理 <span class="pull-right-container">
										<i class="fa fa-angle-left pull-right"></i>
								</span>
							</a>
								<ul class="treeview-menu">
									<li><a
										href="${pageContext.request.contextPath }/noticeList.action">通知中心</a></li>
									<li><a
										href="${pageContext.request.contextPath }/sysadmin_board_jsp/new_notice.jsp">添加通知</a></li>
								</ul></li>
							<li><a href="">企业用户管理 <span class="pull-right-container">
										<i class="fa fa-angle-left pull-right"></i>
								</span>
							</a>
								<ul class="treeview-menu">
									<li><a
										href="${pageContext.request.contextPath }/userlist.action">查看企业用户信息</a></li>
									<li><a
										href="${pageContext.request.contextPath }/sysadmin_board_jsp/add_user.jsp">新增企业用户</a></li>
								</ul></li>
							<li class="active"><a href="">数据表管理 <span
									class="pull-right-container"> <i
										class="fa fa-angle-left pull-right"></i>
								</span>
							</a>
								<ul class="treeview-menu">
									<li><a
										href="${pageContext.request.contextPath }/tableInfo/showCompanyTable.action?cid=${tableInfo.cid}">数据表管理</a></li>
									<li class="active"><a
										href="${pageContext.request.contextPath }/tableInfo/showTableRelation.action?cid=${tableInfo.cid}">数据关系管理</a></li>
									<li><a
										href="${pageContext.request.contextPath }/dataAnalysisManage.action">分析任务管理</a></li>
								</ul></li>
							<shiro:hasRole name="admin">
								<li><a href="">后台账号管理 <span
										class="pull-right-container"> <i
											class="fa fa-angle-left pull-right"></i>
									</span>
								</a>
									<ul class="treeview-menu">
										<li><a
											href="${pageContext.request.contextPath}/adminList.action">后台账号列表</a></li>
										<li><a
											href="${pageContext.request.contextPath }/sysadmin_board_jsp/add_admin.jsp">新增账号</a></li>
									</ul></li>
							</shiro:hasRole>
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
				<h1>${company.corpname}</h1>
				<ol class="breadcrumb">
					<li><a
						href="${pageContext.request.contextPath }/checkSignup.action"><i
							class="fa fa-dashboard"></i>管理员界面</a></li>
					<li><a
						href="${pageContext.request.contextPath }/dataTable.action">数据表管理</a></li>
					<li class="active">数据关系管理</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">

						<!-- /.box -->

						<div class="box">
							<div class="box-header">
								<input type="button" id="newRelationTable" value="新增数据关系" />
							</div>
							<!-- /.box-header -->

<!--  隐藏表单 ---------------------------------------------------------------------------->

							<div class="register-box-body" id="newAddTableDiv"
								style=" border:2px solid #3c8dbc; z-index: 2; display: none; position: absolute;left: 17%;top: 17%; background-color: white; width: 700px">
								<form id="register-form" role="form" class="form-horizontal"
									method="post"
									action="${pageContext.request.contextPath }/tableInfo/bluidNewTableRelation.action?cid=${tableInfo.cid}">

									<div class="form-group">
										<label class="col-sm-3 control-label" for="firstname"><h5>关联关系名称：</h5></label>
										<div class="col-sm-4">
										    <input name="cid"  id="tableInfoCid" value="${tableInfo.cid}" style="display:none" />
											<input class="form-control" name="name" type="text" required="required" id="newTableRe" onkeyup="this.value=this.value.replace(/\s+/g,'')"/>
											<span id="msg" style="color:red;"> 
											<input class="form-control" name="state" value="0" style="display: none" />
										</div>
									</div>

									<div class="form-group">
										<table class="col-sm-12 table table-bordered">
											<tr>
												<td>数据表A：</td>
												<td><select name="tid1" id="tableIn" style="width:170px;">
														<option value='-1'>--请选择表--</option>
														<c:forEach items="${tinfoCidlist}" var="tableInfo" >
															<option value="${tableInfo.id}">${tableInfo.name}</option>
														</c:forEach>
												</select></td>
												<td>统一的维度列：</td>
												<td><select name="col1" id="tableCol" style="width:170px;">
														<option>--请选择表中字段名称--</option>
												</select></td>
											</tr>
											<tr>
												<td>数据表B：</td>
												<td><select name="tid2" id="tableInf" style="width:170px;">
														<option value='-1'>--请选择表--</option>
														<c:forEach items="${tinfoCidlist}" var="tableInfo">
															<option value="${tableInfo.id}">${tableInfo.name}</option>
														</c:forEach>
												</select></td>
												<td>统一的维度列：</td>
												<td><select name="col2" id="tableColl" style="width:170px;">
														<option>--请选择表中字段名称--</option>
												</select></td>

											</tr>
										</table>
										<div class="row">
											<div class="col-xs-3">
												<button type="button"
													class="btn btn-primary btn-block btn-flat" id="baocun">保存</button>
											</div>
											<div class="col-xs-3">
												<button type="button"
													class="btn btn-primary btn-block btn-flat" id="quxiao">取消</button>
											</div>
										</div>
									</div>
								</form>
							</div>






							<div class="box-body">

								<!-- Your Page Content Here -->
								<table id="example2" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th class="col-lg-2" style="width: 80px;">编号</th>
											<th class="col-lg-2" style="width: 260px;">数据关系名称</th>
											<th class="col-lg-2" style="width: 260px;">关联表名</th>
											<th class="col-lg-2" style="width: 260px;">统一维度列</th>
											<th class="col-lg-2">操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${tableRelationColumnlist}"
											var="tableRelation">
											<tr>
												<td>${tableRelation.dataRelation.id}</td>
												<td>${tableRelation.dataRelation.name}</td>
												<td>${tableRelation.tableInfo1.name},${tableRelation.tableInfo2.name}</td>
												<td>${tableRelation.tableInfo1.name}.${tableRelation.tableColumnInfo1.columnName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${tableRelation.tableInfo2.name}.${tableRelation.tableColumnInfo2.columnName}</td>
                        						<td><select name="state" class="form-control" id="statechange" onchange="myfunctionRe(${tableRelation.dataRelation.id},${tableRelation.dataRelation.cid},this);">
														<c:choose>
															<c:when test="${(tableRelation.dataRelation.state==0)}">
																<option selected="selected" value="0">已禁用</option>
															</c:when>
															<c:otherwise>
																<option value="0">已禁用</option>
															</c:otherwise>
														</c:choose>
														<c:choose>
															<c:when test="${(tableRelation.dataRelation.state==1)}">
																<option selected="selected" value="1">已启用</option>
															</c:when>
															<c:otherwise>
																<option value="1">已启用</option>
															</c:otherwise>
														</c:choose>

												</select>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<footer class="main-footer">
			<!-- To the right -->
			<div class="pull-right hidden-xs">Anything you want</div>
			<!-- Default to the left -->
			<strong>Copyright &copy; 2017 <a href="#">Company</a>.
			</strong> All rights reserved.
		</footer>


		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED JS SCRIPTS -->

	<!-- jQuery 2.2.3 -->
	<!-- Bootstrap 3.3.6 -->
	<script
		src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
	<!-- DataTables -->
	<script
		src="${pageContext.request.contextPath }/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<!-- SlimScroll -->
	<script
		src="${pageContext.request.contextPath }/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script
		src="${pageContext.request.contextPath }/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="${pageContext.request.contextPath }/dist/js/app.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="${pageContext.request.contextPath }/dist/js/demo.js"></script>
	<!-- page script -->
	<script>
  $(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      
    });
  });
</script>
</body>
</html>

