<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://shiro.apache.org/tags"  prefix="shiro"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>数据分析任务列表</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
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
  <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/skins/skin-blue.min.css">
<style type="text/css">
		thead tr th{
			background-color: #DEE5F7;
			text-align: center;
		}
		tbody tr td{
			text-align: center;
		}
	div.error{
	width: 200px;height: 200px;
	border: 1px solid black;
	position:absolute;
	top:110px;
	left:350px;
	background-color: #CCCCCC;
	display: none;  
	line-height: 200px;
	}

	div.result{
	width:600px;
	height:300px;
	border:1px solid black ;
	background-color: #CCCCCC;
	position:absolute;
	top:90px;
	left:170px;
	display:none;
	/*style="border:1px red solid;position:relative;top:-190px;left:50px;"  */
	
	}
	
	table.t_a{
	background-color:white;
	border: 1px solid black;
	width: 400px;
	height: 100px;
	margin-left:100px;
	margin-top:50px;
	text-align: center;
	}
	tr.tr1{
	border: 1px solid black;
	}
	td.td1{
	border: 1px solid black;
	}
	thead tr th{background-color:#DEE5F7;}
	th,td{text-align:center;}
</style>
<script type="text/javascript" 
src="${pageContext.request.contextPath }/plugins/jQuery/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
    $(function(){
    	
    	//进入页面加载该企业用户的所有关联数据表
    /* 	$.ajax({
    		dataType:'json',
    		type:'post',
    		url:'${pageContext.request.contextPath }/getDataRelationByCid.action',
    		data:{'cid':${sessionScope.company.id}},
    		success:function(result){
    			var opt="";
    			$.each(result,function(i,da){
    		//		alert(da.dataRelation.name);
    				opt+="<option value='"+da.dataRelation.id+"'>"+da.dataRelation.name+"</option>";
    			});
    			$("#select_datarelation").html(opt);
    		}
    	});
    	 */
    });
</script>

</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
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
            <li class="active"><a href="">数据表管理
              <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
              <ul class="treeview-menu">
                <li><a href="${pageContext.request.contextPath }/dataTable.action">数据表管理</a></li>
                    <li><a href="${pageContext.request.contextPath }/dataRelationManage.action">数据关系管理</a></li>
                    <li class="active"><a href="${pageContext.request.contextPath }/dataAnalysisManage.action">分析任务管理</a></li>
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
        ${company.corpname}
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath }/checkSignup.action"><i class="fa fa-dashboard"></i>管理员界面</a></li>
        <li><a href="${pageContext.request.contextPath }/dataTable.action">数据表管理</a></li>
        <li class="active">数据分析任务列表</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
<div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <div class="dropdown">
                <div>
                	<!-- <select class="form-control" style="width:140px;" name="" id="select_datarelation">
                		<option>销售到访关联</option>
                		
                	</select> -->
                </div>
              </div>
<!-- 
              <table class="col-md-12" style="background-color: #CBD6E8;border: solid 2px #F4F4F4; ">
                	<tr>
                		<td>关联的数据表：销售数据表、到访数据表 </td>
                		<td>统一的维度属性：销售数据表.销售日期、到访数据表.到访日期</td>
                	</tr>
              </table > -->

           <div class="col-md-12" style="margin-top:10px;margin-bottom:-5px;">
                 <span style="font-weight:bold;font-size:18px;">数据分析任务列表</span>
                  <!--   <input type="button" value="启动新任务"/> -->
              </div>
            </div>
            
            <!-- /.box-header -->
            <div class="box-body" style="border:0px red solid;">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th style="width: 50px;">编号</th>
                  <th>任务开始时间</th>
                  <th>任务结束时间</th>
                  <th>任务状态</th>
                  <th>任务反馈</th>
                </tr>
                </thead>
                
                <tbody>
               <!--  <tr>
                  <td>1</td>
                  <td>2017-06-01 12:12:22</td>
                  <td>2017-06-01 15:12:22</td>
                  <td>任务完成</td>
                  <td><span onclick="table();"><a href="javascript:void(0);" id="result_a" >查看结果</a></span></td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>2017-06-01 12:12:22</td>
                  <td>2017-06-01 15:12:22</td>
                  <td>任务完成</td>
                  <td><span onclick="show();" ><a href="##">查看出错信息</a></span></td>
                </tr>
                <tr>
                  <td>3</td>
                  <td>2017-06-01 12:12:22</td>
                  <td>2017-06-01 15:12:22</td>
                  <td>任务进行中</td>
                  <td></td>
                </tr> -->
              <c:forEach items="${tasksList }" var="tasks" varStatus="status">
              <c:choose>
                 <c:when test="${tasks.taskStatus == -2 }">
                     
                 </c:when>
                 <c:otherwise>
                      <tr>
                  <td>${status.index+1 }</td>
                  <td>${tasks.startTime }</td>
                  <td>${tasks.endTime }</td>
                  <td>
                      <c:if test="${tasks.taskStatus==0 }">
                         任务已经添加
                      </c:if>
                      <c:if test="${tasks.taskStatus==1 }">
                         任务进行中
                      </c:if>
                      <c:if test="${tasks.taskStatus==2 }">
                         任务完成
                      </c:if>
                      <c:if test="${tasks.taskStatus==-1 }">
                         任务失败
                      </c:if>
                  </td>
                  <td>
                      <c:if test="${tasks.taskStatus==2 }">
                        <span onclick="table();"><a href="javascript:void(0);" id="result_a" >查看结果</a></span>
                      </c:if>
                      <c:if test="${tasks.taskStatus==-1 }">
                        <span onclick="show();" ><a href="##">查看出错信息</a></span>
                      </c:if>
                      <c:if test="${tasks.taskStatus==0 }">
                       
                      </c:if>
                      <c:if test="${tasks.taskStatus==1 }">
                       
                      </c:if>
                  </td>
                </tr>
                 </c:otherwise>
              </c:choose>
              </c:forEach>
                </tbody>
              </table>
              
              
             	<div class="result" id="result_id" >
                    <span id="tables" onclick="table();">
                  	  <img src="${pageContext.request.contextPath }/dist/img/closed.png" 
                	   style="width:30px;height:20px;border:1px black solid;margin-top:-5px;">
                	</span>
             		<table class="t_a">
             			<tr class="tr1">
             				<td class="td1">编号</td>
             				<td class="td1">推理规则</td>
             				<td class="td1">结论</td>
             			</tr>
             			<tr class="tr1">
             				<td class="td1">1</td>
             				<td class="td1">2</td>
             				<td class="td1">3</td>
             			</tr>
             			<tr class="tr1">
             				<td class="td1">1</td>
             				<td class="td1">2</td>
             				<td class="td1">3</td>
             			</tr>
             		</table>
             	</div>
      		
               <div class="error" id="error_id">
                	<div style="text-align:center;">
                		<span style="position:absolute; margin-top: -95px;margin-left: -36px" id="strong" onclick="show();">
                		<img src="${pageContext.request.contextPath }/dist/img/closed.png"
                		style="width:25px;height:16px;border:1px black solid;margin-top:0px;"></span>
                		<span style="color:red ">错误消息:xxxxxxxxxxx</span>
                	</div>
               </div>
                
                
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

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="pull-right hidden-xs">
      Anything you want
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2017 <a href="#">Company</a>.</strong> All rights reserved.
  </footer>

</div>

<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

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
<script type="text/javascript">

	 function table(){
		 var result_id=document.getElementById("result_id");
		 var result_image=document.getElementById("tables");
		 
		if(window.getComputedStyle(result_id).display=="none"){ 
			result_id.style.display="block";
		}
		else
		{
			result_id.style.display="none";
		}
	
	 	if(result_image.style.display=="block")
		{
	 		result_image.style.display="hidden";
		} 
		
	} 

	function show(){
		var error_id=document.getElementById("error_id");
		if(window.getComputedStyle(error_id).display=="none"){ 
			error_id.style.display="block";
		}
		else
		{
			error_id.style.display="none";
		}
		
		 if(document.getElementById("strong").style.display=="block"){
			
			document.getElementById("strong").style.display="none";
		} 
		}
</script>

</body>
</html>

