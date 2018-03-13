<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://shiro.apache.org/tags"  prefix="shiro"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>分析任务管理</title>
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
  <script type="text/javascript" src="${pageContext.request.contextPath }/plugins/jQuery/jquery-1.9.1.min.js"></script>
	<style type="text/css">
		thead tr th{
			background-color: #DEE5F7;
			text-align: center;
		}
		tbody tr td{
			text-align: center;
		}
	</style>
	
	<script type="text/javascript">
	     $(function(){
	    	 $("#btn_save").click(function(){
	    	//	 $("#form_createTask").submit();
	    	var arithmeticid=document.getElementById("arithmeticid").value.trim();//$.trim($("#arithmeticid").val());
	    	var rule=$.trim($("#rule").val());
	    	var did=$.trim($("#did").val());
	    	if(arithmeticid.length==0){
	    		 $("#span_msg1").html("对不起，算法编号不能为空!");
	    		 return false;
	    	}
	    	if(did.length==0){
	    		 $("#span_msg1").html("对不起，数据关系不能为空!");
	    		 return false;
	    	}
	    	if(rule.length==0){
	    		 $("#span_msg1").html("对不起，算法附加规则不能为空!");
	    		 return false;
	    	}
	    	     var objJson={
	    	    	 "arithmeticid":arithmeticid,
	    	    	 "rule":rule,
	    	    	 "cid":$.trim($("#hidd_cid").val()),
	    	    	 "did":did
	    	     };
	    	    
	    	     $.ajax({
	    	    	 type:'post',
	    	    	 dataType:'json',
	    	    	 data:objJson,
	    	    	 url:'${pageContext.request.contextPath }/analysisTasks/createAnalysistasks.action',
	    	    	 success:function(result){
	    	    		 if(result.info=='success'){
	    	    			 window.parent.location.href="${pageContext.request.contextPath }/dataAnalysisManage.action";
	    	    		 }else if(result.info=='exist'){
	    	    			// alert(result.info);
	    	    			 $("#span_msg1").html("对不起，该数据分析任务已经存在!");
	    	    		 }else if(result.info=='faild'){
	    	    			// alert(result.info);
	    	    			 $("#span_msg1").html("对不起，数据分析任务添加失败，请您重试!");
	    	    		 }
	    	    	 }
	    	     });
	    	 });
	    	 
	    	 $("#did").focus(function(){
	    		 $("#span_msg1").html("");
	    	 });
	    	 $("#arithmeticid").focus(function(){
	    		 $("#span_msg1").html("");
	    	 });
	    	 $("#rule").focus(function(){
	    		 $("#span_msg1").html("");
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
        <li class="active">分析任务管理</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content"  style="border:0px red solid;height:510px;">
      <div class="row" style="border:0px black solid;">
        <div class="col-xs-12">

          <!-- /.box -->

          <div class="box" >
            <div class="box-header">
              <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
              <span class="glyphicon glyphicon-plus"></span>新增数据分析任务</a>
            </div>
            
               <!-- 模态框（Modal） -->
<div class="modal fade" id="myModal"   
tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

<form action="${pageContext.request.contextPath }/analysisTasks/createAnalysistasks.action" 
method="post" id="form_createTask">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel" style="font-weight:bold;">新增数据分析任务</h4>
            </div>
            <!-- <div class="modal-body">在这里添加一些文本</div> -->
            <input type="hidden" value="${sessionScope.company.id }" id="hidd_cid" name="cid"/>
            <div style="margin-bottom:15px;margin-left:80px;margin-top:20px;">
                <span style="margin-right:20px;">选择数据关系:</span>
                <select style="width:150px;" name="did" id="did">
                
                    <c:forEach items="${dataRelation_list }" var="dataRelation">
                        <option value="${dataRelation.id }">${dataRelation.name }</option>
                    </c:forEach>
               
                </select>
            </div>
            <div style="margin-bottom:15px;margin-left:80px;">
                <span style="margin-right:20px;">选择算法编号:</span>
                <select style="width:150px;" name="arithmeticid" id="arithmeticid">
                   <option>1</option> 
                   <option>2</option> 
                </select>
            </div>
            <div>
                <div  style="margin-left:80px;margin-bottom:10px;"><span style="margin-right:20px;">附加规则:</span></div>
                <div class="form-group">
		      <!--     <label for="name">附加规则:</label> -->
		         <textarea rows="3" cols="60" style="margin-left:80px;" name="rule" id="rule"></textarea>
		         <div  style="border:0px solid red;">
		           <span style="margin-left:170px;color:red;font-size:12px;" id="span_msg1"></span>
		         </div>
	           </div>
	           
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="btn_save">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
   </form>
   
</div>
            
            <!-- /.box-header -->
            <div class="box-body" style="margin-top:-15px;border:0px red solid;">

      <!-- Your Page Content Here -->
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th style="width: 70px;">编号</th>
                  <th style="width: 250px;">数据关系名称</th>
                  <th style="width: 240px;">算法设定</th>
                  <th style="width: 250px;">操作</th>
                  <th>附加算法规则</th>
                </tr>
                </thead>
                
                <tbody>
                <c:forEach items="${pages_analysisTask.list }" var="task" varStatus="status">
                <tr>
                  <td>${status.index+1 }</td>
                  <td>${task.dataRelationList.name }</td>
                  <td>${task.arithmeticid }</td>
                  <td><a href="${pageContext.request.contextPath}/dataAnalysisList.action?did=${task.did }">查看任务运行情况</a></td>
                  <td>${task.rule }</td>
                </tr>
                </c:forEach>
                </tbody>
                
              </table>
              
            </div>
            <div  style="border:0px red solid;height:39px;margin-top:-10px;">
               <ul class="pagination" style="border:0px black solid;
               margin-top:5px;padding-right:10px;">
	              <li><a href="${pageContext.request.contextPath }/dataAnalysisManage.action?index=1">首页</a></li>
	              <li>
	               <c:choose>
	                  <c:when test="${(pages_analysisTask.index <= 1)}">
	                     <a href="javascript:;" onmouseover="this.style.cursor='not-allowed';"> 上一页</a>
	                  </c:when>
	                  <c:otherwise>
	                      <a href="${pageContext.request.contextPath }/dataAnalysisManage.action?index=${(pages_analysisTask.index > 1)?(pages_analysisTask.index-1):(1)}" >上一页</a>
	                  </c:otherwise>
	               </c:choose>
	              </li>
	              <c:choose>
	                 <c:when test="${pages_analysisTask.totalPage <= 10 }">
	                    <c:set var="begin" value="1"/>
	                    <c:set var="end" value="${pages_analysisTask.totalPage }"/>
	                 </c:when>
	                 <c:otherwise>
	                    <c:set var="begin" value="${pages_analysisTask.totalPage-5 }"/>
	                    <c:set var="end" value="${pages_analysisTask.totalPage+4 }"/>
	                    <c:if test="${begin<1 }">
	                        <c:set var="begin" value="1"/>
	                        <c:set var="end" value="10"/>
	                    </c:if>
	                    
	                    <c:if test="${end > (pages_analysisTask.totalPage) }">
	                         <c:set var="begin" value="${pages_analysisTask.totalPage-9 }"/>
	                        <c:set var="end" value="${pages_analysisTask.totalPage }"/>
	                    </c:if>
	                 </c:otherwise>
	              </c:choose>
	              <c:forEach begin="${begin }" end="${end }" var="b">
	                 <li>
	                 <a href="${pageContext.request.contextPath }/dataAnalysisManage.action?index=${b }">
	                 ${b }</a>
	                 </li>
	              </c:forEach>
	              <li>
	                <c:choose>
	                  <c:when test="${(pages_analysisTask.index >= pages_analysisTask.totalPage)}">
	                     <a href="javascript:;" onmouseover="this.style.cursor='not-allowed';"> 上一页</a>
	                  </c:when>
	                  <c:otherwise>
	                       <a href="${pageContext.request.contextPath }/dataAnalysisManage.action?index=${(pages_analysisTask.index < pages_analysisTask.totalPage)?(pages_analysisTask.index+1):(pages_analysisTask.totalPage)}">下一页</a>
	                  </c:otherwise>
	               </c:choose>
	             
	              </li>
                  <li><a href="${pageContext.request.contextPath }/dataAnalysisManage.action?index=${pages_analysisTask.totalPage}">尾页</a></li>
               </ul>
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
    <div class="pull-right hidden-xs">
      Anything you want
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2017 <a href="#">Company</a>.</strong> All rights reserved.
  </footer>
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
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
  $(function () {

  });
</script>
</body>
</html>

