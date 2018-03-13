<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"   prefix="fmt" %>

<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Starter</title>
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


  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
<style type="text/css">
	div.error{
	width: 200px;height: 200px;
	border: 1px solid black;
	position: absolute; 
	left: 480px; top: 250px;
	background-color: #CCCCCC;
	display: none;  
	line-height: 200px;
	}

	div.result{
	width:600px;
	height:400px;
	border:1px solid black ;
	background-color: #CCCCCC;
	margin-left:20px;
	margin-left:150px;
	/* visibility:hidden;  */
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
	#relationtable{border: 1px solid black;margin-top: 20px}
	#relationtable td{border: 1px solid black;text-align: center;width: 200px;height: 50px}
	#newTask{background-color:white;display: none;border:1px solid #3c8dbc;z-index:100;position: fixed;top:300px;left:700px;
	width: 300px;height: 300px;border-radius:10px
	 }

	 #newTask div{margin-left: 50px;margin-top: 20px;}
	 #newTasksbt{background-color:#3c8dbc;color: white;border: 0px ;height:30px;margin-left: 30px}
	 #closeTasksbt{background-color:#3c8dbc;color: white; border: 0px;height:30px;margin-left: 50px}
	 .resultScan{background-color:#3c8dbc;color: white; border: 0px;height:30px;}
	 	 #startNew{background-color:#3c8dbc;color: white; border: 0px;height:30px;}
</style>
<script type="text/javascript"   src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script type="text/javascript">
		/* 	$(function(){
				$("#startNew").click(function(){
						$("#newTask").css("display","block")
				})
				
			})
			
			$(function(){
				$("#closeTasksbt").click(function(){
					$("#newTask").css("display","none")
				})
			}) */
	
	
			
			function checkResult(id){
	
				$.ajax({
					type:'post',
					dataType:'json',
					data:{'id':id},
					url:'${pageContext.request.contextPath}/analysisTasks/taskFeedBack.action',
					success:function(result){
					
						$("#id").html(
									"<table  class='t_a'>"
			              			+"<tr class='tr1'>"
			              				+"<td  class='td1'>编号</td>"
			              				+"<td   class='td1'>推理规则</td>"
			              				+"<td   class='td1'>结论</td>"
			              			+"</tr>"
			              			
			              				+"<tr  class='tr1'>"
			              					+"<td    class='td1' >"+result.did+"</td>"
			              					+"<td    class='td1'>"+result.rule+"</td>"
			              					+"<td    class='td1'>"+result.feedBack+"</td>"
			              				+"</tr>"
			              		
			              		+"</table> "
			              		)
					}
				})

			}		
	function  startNew(){
				alert("111");
			 /* 	var  ckbid=document.getElementById("ckbId");  */
			 	var  ckbid=$("#ckbId");
			  	var  id=new Array();
			
			 	for(var i=0;i<ckbid.length;i++){
			 		  if( ckbid[i].checked == true){ 
			            id.push(ckbId[i].value); 
			 		/* 	id[i]=ckbid[i].value */
			 			 alert(id[i]);
			         } 
			 	
			 	} 
			 	
			 	
		
		}
			
			
			  function valueChange(){
			        var sel1 = document.getElementById("sel1");		
			        var  val=sel1.value;
			        location="${pageContext.request.contextPath }/analysisTasks/queryShow.action?secondcondition="+val+"&id="+val;
			        
			       }
 	 		window.onload=function(){
				var   name=${dataR.id};
				document.getElementById("sel1").value=name;
			 }   
				
</script>

<!-- <script type="text/javascript">
	function table(){
	/* 	alert(123) */
		if(document.getElementById("result_id").style.visibility=="hidden"){ 
			document.getElementById("result_id").style.visibility="visible";
		
		}
		else
		{
			document.getElementById("result_id").style.visibility="hidden";
		}i
	
		if(document.getElementById("tables").style.visibility=="visible")
		{
			document.getElementById("tables").style.visibility="hidden";
		}
		
	}

	function show(){
		/* alert(456)  */
	
		if(document.getElementById("error_id").style.display=="none"){ 
			document.getElementById("error_id").style.display="block";
		
		}
		else
		{
			document.getElementById("error_id").style.display="none";
		}
		
		 if(document.getElementById("strong").style.display=="block"){
			
			document.getElementById("strong").style.display="none";
		} 
	
		
		
		}
</script> -->
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="${pageContext.request.contextPath}/sysboard_jsp/index.jsp" class="logo">
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
            <a href="#">
              <i class="fa fa-cog">&nbsp;修改密码</i>
            </a>

          </li>
          <!-- Tasks Menu -->
          <li class="dropdown tasks-menu">
            <!-- Menu Toggle Button -->
            <a href="${pageContext.request.contextPath}/sysboard_jsp/login.jsp">
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
        <li class="treeview active">
          <a href="#"><i class="fa fa-link"></i> <span>数据仓驾驶平台</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="${pageContext.request.contextPath}/sysboard_jsp/index.jsp">通知中心</a></li>
            <li><a href="#">个人中心
              <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
              <ul class="treeview-menu">
                <li><a href="${pageContext.request.contextPath}/sysboard_jsp/change_info.jsp">修改资料</a></li>
                <li><a href="${pageContext.request.contextPath}/sysboard_jsp/change_pwd.jsp">修改密码</a></li>
              </ul>
            </li>
            <li class="active"><a href="#">数据管理
              <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
              <ul class="treeview-menu">
                <li><a href="${pageContext.request.contextPath}/cid_dataRelation.action?cid=${companyInfomation.id}">数据关系图</a></li>
                <li><a href="${pageContext.request.contextPath}/pages.action?cid=${companyInfomation.id}">数据表管理</a></li>

                <li class="active"><a href="${pageContext.request.contextPath}/analysisTasks/queryShow.action?firstcondition=${companyInfomation.id}&id=1">数据分析任务</a></li>
              </ul>
            </li>
          </ul>
        </li>



      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->


  <div class="content-wrapper">

    <section class="content-header">
      <h1>
        ${companyInfomation.corpname }
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 数据仓驾驶平台</a></li>
        <li><a href="#">数据管理</a></li>
        <li class="active">数据分析任务</li>
      </ol>
    </section>
    <!-- Content Header (Page header) -->


    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">数据分析任务</h3>

              <!-- <div class="dropdown">
                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                  销售到访关联
                  <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                  <li><a href="#">销售到访关联</a></li>
                  <li><a href="#">销售认筹关联</a></li>
                  <li><a href="#">到访认筹关联</a></li>
                  <li><a href="#">到访与媒体渠道关联</a></li>
                   <li role="separator" class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                </ul>
              </div> -->
              <div>
             		<!-- <input     id="hid1"    type="hidden"    value="1"  /> -->
              	 <select     id="sel1"      onchange="valueChange();"   aria-labelledby="dropdownMenu1">
              	 		<!-- 	<option   value=""  >全部关联数据表</option> -->
              			<c:forEach  items="${listD}"  var="dataRelation">
              				<option   value="${dataRelation.id }"  >${dataRelation.name}</option>
              			</c:forEach>
              
              	</select>
              	
              </div>
             
              
         <%--      <div class="dropdown">
                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                <c:choose>
                <c:when test="${page.querycondition.secondcondition !=null}">${dataR.name }</c:when>
                <c:when test="${page.querycondition.secondcondition ==null}">全部关联数据表</c:when>
                <c:when test="${page.querycondition.secondcondition ==''}">全部关联数据表</c:when>
                 	<c:otherwise>全部关联数据表</c:otherwise> 
                </c:choose>
               	
               	 
                  <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                		<li><a  href="${pageContext.request.contextPath}/analysisTasks/queryShow.action?">全部关联数据表</a></li>
                	<c:forEach  items="${listD }"   var="dataRelation">
                		<li><a  href="${pageContext.request.contextPath}/analysisTasks/queryShow.action?secondcondition=${dataRelation.id}&id=${dataRelation.id}">${dataRelation.name }</a></li>
                	</c:forEach>             	
                </ul>
              </div> --%>
              
              

              <div class="col-md-12">
                <!-- <span style="font-size: 20px; background-color: #CCCCCC;">关联的数据表：销售数据表、到访数据表        统一的维度属性：销售数据表.销售日期、到访数据表.到访日期</span> -->
                <table   id="relationtable">
                	<tr>
                		<td>关联的数据表</td>
                		<td>统一的维度属性</td>
                	</tr>
                	
                	<tr>
                		<td>${Trc.tableInfo1.name }</td>
                		<td>${Trc.tableColumnInfo1.columnName }</td>
                	</tr>
                	<tr>
                		<td>${Trc.tableInfo2.name  }</td>
                		<td>${Trc.tableColumnInfo2.columnName }</td>
                	</tr>
                	
                	
                </table>
              </div >
              
              <%-- <div    id="newTask">
              		<form action="${pageContext.request.contextPath}/analysisTasks/addTask.action"   method="post">
              		<!-- 	<div><input   type="hidden"  name="startTime"   ></div> -->
              		<div><h4>启动新任务</h4></div>
              			<div>关联数据表:
              				<select    name="did">
              					<c:forEach  items="${listD}"  var="dataRelation">
              				<option   value="${dataRelation.id }"  >${dataRelation.name}</option>
              					</c:forEach>
              				</select>	
              			</div>
              			<div><input  type="hidden"   name="taskStatus"  value="0"></div>
              			<div>规则:<input  type="text"   name="rule"></div>
              			<!-- <div><input  type="text"   name="feedBack"></div> -->
              			<div>算法:<input  type="text"   name="arithmeticid"></div>
              			<div>
              				<input  type="submit"   value="提交"  id="newTasksbt">
              				<input  type="button"   value="关闭"   id="closeTasksbt">
              			</div>
              		</form>
              </div> --%>

              <div class="col-md-12"  style="margin-top: 20px">
                <div >
                  <div >
                    <span style="font-size: 20px; margin-right: 50px;">数据分析任务列表</span>
                    <input type="button" value="启动新任务"  id="startNew"     onclick="startNew();"  />
                  </div>
                </div>

              </div>
              


            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>编号</th>
                  <th></th>
                  <th>任务开始时间</th>
                  <th>任务结束时间</th>
                  <th>任务状态</th>
                  <th>任务反馈</th>
                </tr>
                </thead>
                <tbody>
                
                <c:forEach  items="${page.list}"   var="analysis"  varStatus="count" >
                <tr>
                	<td>${count.count+(page.index-1)*page.pageSize}</td>
                <%--   <td    style="display: none" id="" >${analysis.id }</td> --%>
                	<td><input  type="checkbox"   value="${analysis.id}"   name="ckbId"   id="ckbId"></td>
                  <td><fmt:formatDate value="${analysis.startTime }"    pattern="yyyy-MM-dd"/></td>
                  <td><fmt:formatDate value="${analysis.endTime }"    pattern="yyyy-MM-dd"/></td>
                  <c:if test="${analysis.taskStatus==0 }">
                  <td>任务已添加</td>
                  </c:if>
                  <c:if test="${analysis.taskStatus==1 }">
                  <td>任务进行中</td>
                  </c:if>
                  <c:if test="${analysis.taskStatus==2 }">
                  <td>任务完成</td>
                  </c:if>
                  <c:if test="${analysis.taskStatus==-1 }">
                  <td>任务失败</td>
                  </c:if>
                  <!-- onclick="table();" -->
                   <td><button    onclick="checkResult(${analysis.id});"     id="resultScan"  class="resultScan">查看结果</button></td>
                  <!-- <td><a href="#">查看结果</a></td> -->
                </tr>
                </c:forEach>
                
                
                

                </tbody>
              </table>
              <div>
              		<a href="${pageContext.request.contextPath }/analysisTasks/queryShow.action?index=1&firstcondition=${page.querycondition.firstcondition}&pageSize=${page.pageSize}&secondcondition=${page.querycondition.secondcondition}&id=${dataR.id}">首页</a>
								<c:if test="${page.index==1}"> 上一页 </c:if>
								<c:if test="${page.index  >1}">
									<a href="${pageContext.request.contextPath }/analysisTasks/queryShow.action?index=${page.index-1}&firstcondition=${page.querycondition.firstcondition}&pageSize=${page.pageSize}&secondcondition=${page.querycondition.secondcondition}&id=${dataR.id}">上一页</a>
								</c:if>
								<c:if test="${page.index < page.totalPage}">
									<a href="${pageContext.request.contextPath }/analysisTasks/queryShow.action?index=${page.index+1}&firstcondition=${page.querycondition.firstcondition}&pageSize=${page.pageSize}&secondcondition=${page.querycondition.secondcondition}&id=${dataR.id}">下一页</a>
								</c:if>
								<c:if test="${page.index == page.totalPage}">  下一页 </c:if>
								<a href="${pageContext.request.contextPath }/analysisTasks/queryShow.action?index=${page.totalPage}&firstcondition=${page.querycondition.firstcondition}&pageSize=${page.pageSize}&secondcondition=${page.querycondition.secondcondition}&id=${dataR.id}">末页</a> 
								当前页码：第${page.index}页，共${page.totalPage}页
              </div>
              	
              <div       id="id"><!-- class="result"  -->
              		<!-- <span style="position:relative; margin-top: 50px;margin-left: 0px" id="tables"  onclick="table()" id="table"> -->
                	<%-- <img src="${pageContext.request.contextPath }/dist/img/closed.png"></span> --%>
              </div>
              
         <%--     	<div class="result" id="result_id">
                	<span style="position:relative; margin-top: 50px;margin-left: 0px" id="tables"  onclick="table()" id="table">
                	<img src="${pageContext.request.contextPath }/dist/img/xxxx.jpg"></span>
             		<table class="t_a">
             			<tr class="tr1">
             				<td class="td1">编号</td>
             				<td class="td1">推理规则</td>
             				<td class="td1">结论</td>
             			</tr>
             			<tr class="tr1">
             				<td class="td1">${www }</td>
             				<td class="td1">${at.rule }</td>
             				<td class="td1">${at.feedBack }</td>
             			</tr>
             	  		<tr class="tr1">
             				<td class="td1">1</td>
             				<td class="td1">2</td>
             				<td class="td1">3</td>
             			</tr>
             		</table>
             	</div> --%>
             	
             	
             		
               <div class="error" id="error_id">
                	<div style="text-align:center;">
                		<span style="position:absolute; margin-top: -95px;margin-left: -36px" id="strong" onclick="show();">
                		<img src="${pageContext.request.contextPath }/dist/img/xxxx.jpg"></span>
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

<!-- jQuery 2.2.3 -->
<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/dist/js/app.min.js"></script>

<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. Slimscroll is required when using the
     fixed layout. -->
</body>
</html>
