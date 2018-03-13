<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://shiro.apache.org/tags"  prefix="shiro"%>
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
  <title>数据表管理</title>
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
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect.
  -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/skins/skin-blue.min.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/dist/js/app.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/jQuery/messages_zh.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/jQuery/jquery.validate.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/jQuery/additional-methods.js"></script>

  
   <script type="text/javascript">
   var i = 1;
   function myfunction( strid, obj){
	
       location="${pageContext.request.contextPath }/tableInfo/tableInfoStateChange.action?id="+strid+"&state="+obj.value;
   }	
   
   function newTable(){
	   document.getElementById("newTableDiv").style.display="block";
   }
   //点击保存后新增表的div消失
/*    function noshowAdd(){
	   document.getElementById("newTableDiv").style.display="none";
   } */
   
   /* 点击表头数据div消失 */
   function noshow(){
	   document.getElementById("showTableDiv").style.display="none";
   }
   
   function dataRalation(cid){
	   location="${pageContext.request.contextPath }/tableInfo/showTableRelation.action?cid="+cid;
   }
   function addrow(){
	   
	   i=i+1;
	   var k1 = "this.value=this.value.replace(/\\s+/g,'')";	
		
		var k2 = "onkeyup="+k1;
	    //document.getElementById("addtableRow").innerHTML(<tr><td>+"编号"+</td><td>+"表头显示名称"+</td><td>+"字段属性"+</td></tr>)
	   $("#addtableRow").append($("<tr><td>"+i+"</td><td><input type='text' name='columnName' class='form-control' required='required' "+k2+" ></td><td><select name='columnType' class='selectpicker' data-style='btn-primary' style='width: 100px;'><option value='文本'>文本</option><option value='整数'>整数</option><option value='浮点'>浮点</option></select></td></tr>"));
		
	}

 
   function remove(cid){
	   i = 1;
	   document.getElementById("newTableDiv").style.display="none";
	   /* var dt = document.getElementById("addtableRow");
	   dt.removeChild(dt.childNodes)[1]; 
	     div.removeChild(div.firstChild);
	   dt.remove(dt.childNodes);
	    $("#addtableRow").children().remove(); */
	    location="${pageContext.request.contextPath }/tableInfo/showCompanyTable.action?cid="+cid;
	}
   
  
	$(function(){
		//验证新增加表的名字是否有重复 
		$("#addTableName").keyup(function(){
			$.ajax({
				url:"${pageContext.request.contextPath }/tableInfo/checkAddTableName.action",
				type:"post",
				data:{name:$("#addTableName").val(),cid:$("#tableInfoCid").val()},
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
		
		$(".tid").each(function(){
			$(this).click(function(){
				$.ajax({
					url:"${pageContext.request.contextPath }/tableInfo/showEditTableHeader.action",
					type:"post",
					data:{"did":$(this).attr("tableId")},
					dataType:"json",
					success:function(result){
						JSON.stringify(result);
						$("#columnCell").empty();
						var a =1;
						if(result.length > 0){
								$("#columnCell").append("<tr><td>编号</td><td>显示名称</td><td>字段属性</td></tr>");
							for ( var i = 0; i < result.length; i++) {
								var tableColumn = result[i];	
								//  onkeyup="this.value=this.value.replace(/\s+/g,'')"
								
								var k1 = "this.value=this.value.replace(/\\s+/g,'')";	
								
								var k2 = "onkeyup="+k1;
								//var kgzr = onkeyup='this.value=this.value.replace(/\s+/g,'')';
								$("#columnCell").append("<tr><td>"+(a++)+"</td><td><input name='tcid' style='display:none' value='"+tableColumn.id+"'  /><input name='columnName' required='required' value='"+tableColumn.columnName+"' "+k2+" /></td><td>"+tableColumn.columnType+"</td></tr>");
							}
						} 
						$("#showTableDiv").show();
					}
				});
		})
		});
	});
	
	function newTableRelation(cid){
		location="${pageContext.request.contextPath }/tableInfo/showTableRelation.action?cid="+cid;
	}

</script>
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
                <li class="active"><a href="${pageContext.request.contextPath }/tableInfo/showCompanyTable.action?cid=${companyInfo.id}">数据表管理</a></li>
                    <li><a href="${pageContext.request.contextPath }/tableInfo/showTableRelation.action?cid=${company.id}">数据关系管理</a></li>
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
       	${company.corpname}
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath }/checkSignup.action"><i class="fa fa-dashboard"></i>管理员界面</a></li>
        <li><a href="${pageContext.request.contextPath }/dataTable.action">数据表管理</a></li>
        <li class="active">数据表管理</li>
      </ol>
    </section>

       <!--  隐藏的添加表单 ------------------------------------------------------------------------>
          
      <div  class="register-box-body" id="newTableDiv" style="border:2px solid #3c8dbc; z-index:2;display:none;position:absolute; left: 17%;top: 17%;background-color:white;width:700px" >
		<form id="register-form" role="form" class="form-horizontal" method="post" action="${pageContext.request.contextPath }/tableInfo/addTableAndCell.action">
		<input name="cid"  id="tableInfoCid" value="${company.id}" style="display:none" />
		<input name="state" value="1" style="display:none" />
		  <!-- <input name="columnName" value="项目"/>  -->
		<div class="form-group">
			<label class="col-sm-3 control-label" for="firstname"><h5>新增的数据表名：</h5></label>
			<div class="col-sm-4">
				<input class="form-control" name="name" type="text" id="addTableName" required="required" onkeyup="this.value=this.value.replace(/\s+/g,'')"/>
				<span id="msg" style="color:red;"> 
			</div>
		</div>

		<div class="form-group">
			<label class="radio-inline col-sm-3" >
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" value="折线图" name="showtype" required="required"/>折线图
			</label>
			<label class="radio-inline col-sm-3" >
				<input type="radio" value="柱状图" name="showtype" required="required"/>柱状图
			</label>
		</div>
		
		<div class="form-group">
	    <table class="col-sm-12 table table-bordered" id="addtableRow">
		<tr>
			<td>编号</td>
			<td>表头显示名称</td>
			<td>字段属性</td>
		</tr>
		<tr>
			<td class="col-sm-2">1</td>
			<td class="col-sm-5"><input class="form-control" name="columnName" type="text" required="required" onkeyup="this.value=this.value.replace(/\s+/g,'')"/></td>
		    <td><select name="columnType" class="selectpicker" data-style="btn-primary" style="width: 100px;">
    			<option value="文本">文本</option>
    			<option value="整数">整数</option>
    			<option value="浮点">浮点</option>
    			</select>
    		</td>
    	</tr> 
	   </table>
	   
	   </div>
	   <div class="col-sm-3">
	   <button type="button" class="btn btn-primary btn-block btn-flat" id="addhang" onclick="addrow();">添加一行</button>
	   </div>
	   <div class="form-group">
       <div class="row">
       <div class="col-xs-3">
       <button type="submit" class="btn btn-primary btn-block btn-flat" id="baocun">保存</button>
       </div>
       <div class="col-xs-3">
       <button type="button" class="btn btn-primary btn-block btn-flat" id="quxiao" onclick="remove(${company.id});">取消</button>
       </div>
       </div>
    </div> 
</form> 
   </div> 
   
  <!--  隐藏显示表头表单 -------------------------------------------------------------------------------------------->
  		<div class="register-box-body" id="showTableDiv" style="border:2px solid #3c8dbc; z-index:3;display:none;position:absolute; left: 35%;top: 35%;background-color:white;width:700px">
	<form method="post" action="${pageContext.request.contextPath }/tableInfo/changeTableColumn.action?cid=${company.id}">
	
	<table class="col-sm-12 table table-bordered" id="columnCell">

	</table>
	<div class="row">
       <div class="col-xs-3">
       <button type="submit" class="btn btn-primary btn-block btn-flat" id="baocunn" >保存</button>
       </div>
       <div class="col-xs-3">
       <button type="button" class="btn btn-primary btn-block btn-flat" id="quxiao" onclick="noshow();">取消</button>
       </div>
       </div>
	</form>
   </div>
             

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">

            <div class="box-header">
              <input type="button" value="新增数据表" id="newTable" onclick="newTable();">
              
              <input type="button" value="数据关系管理" id="newTableRelation" onclick="newTableRelation(${company.id});">
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            
    
            
            
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th class="col-lg-1">编号</th>
                  <th class="col-lg-2">数据表名</th>
                  <th class="col-lg-2">最近数据更新时间</th>
                  <th class="col-lg-2">编辑表</th>
                  <th class="col-lg-2">查看表数据</th>
                  <th class="col-lg-1">操作</th>



   <!--  <script type="text/javascript">
    $(function(){
    	$("#editTableHeader").click(function(){
    		alert($("#tableInfoId").val());
    	})
    })
    
    </script> -->
  


                </tr>
                </thead>
                <tbody>
                <c:forEach items="${ctilist}" var="tableInfo">
                <tr>
                <td id="tableInfoId">${tableInfo.id}</td>
                <td>${tableInfo.name}</td>
                <td>${tableInfo.updatetime}</td>
                <td><input type="button" value="编辑表头信息" id="editTableHeader" name="tid" tableId="${tableInfo.id}" class="tid"></td>
                <td><a href="${pageContext.request.contextPath }/tableInfo/showTableCompanyInfo.action?id=${tableInfo.id}">查看数据</a></td>
                <td>
                <select name ="state" class="form-control" id="statechange" onchange="myfunction(${tableInfo.id},this);"> 
                  	<c:choose>
	                  	<c:when test="${(tableInfo.state==0)}">
	                  		<option selected="selected" value="0" >已禁用</option> 
	                  	</c:when>
	                  	<c:otherwise>
	                  		<option value="0">已禁用</option> 
	                  	</c:otherwise>
	                </c:choose>
	                 <c:choose>
	                  	<c:when test="${(tableInfo.state==1)}">
	                  		<option selected="selected" value="1" >已启用</option> 
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
               <a href="${pageContext.request.contextPath }/companyInfo/page.action?index=1&firstcondition=${page.querycondition.firstcondition}&pageSize=${page.pageSize}&secondcondition=${page.querycondition.secondcondition}" >首页</a>
                <c:if test="${page.index==1}">
			       上一页
			  </c:if>
			    <c:if test="${page.index  >1}">
			     <a href="${pageContext.request.contextPath }/companyInfo/page.action?index=${page.index-1}&firstcondition=${page.querycondition.firstcondition}&pageSize=${page.pageSize}&secondcondition=${page.querycondition.secondcondition}" >上一页</a>
			  </c:if>
			     <c:if test="${page.index < page.totalPage}">
			      <a href="${pageContext.request.contextPath }/companyInfo/page.action?index=${page.index+1}&firstcondition=${page.querycondition.firstcondition}&pageSize=${page.pageSize}&secondcondition=${page.querycondition.secondcondition}" >下一页</a>
			  </c:if>
			 <c:if test="${page.index == page.totalPage}">
			       下一页
			  </c:if>
			    <a href="${pageContext.request.contextPath }/companyInfo/page.action?index=${page.totalPage}&firstcondition=${page.querycondition.firstcondition}&pageSize=${page.pageSize}&secondcondition=${page.querycondition.secondcondition}" >末页</a>
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
<!-- Bootstrap 3.3.6 -->
<script src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath }/dist/js/app.min.js"></script>

<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. Slimscroll is required when using the
     fixed layout. -->
</body>
</html>
