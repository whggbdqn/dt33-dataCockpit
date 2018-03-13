<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/* String roleName = request.getParameter("roleName");
	if (roleName.equals("企业用户")) {
		response.sendRedirect("/jsp/login/customerMain.jsp");
	} else if (roleName.equals("管理员")) {
		response.sendRedirect("/jsp/manager/managerMain.jsp");
	} */

//	 response.sendRedirect("checkCompanyInfo/userinfoShowe.action"); 
	 //response.sendRedirect("login/loginHandler.action"); 
	 request.getRequestDispatcher("login/loginHandler.action").forward(request, response);
%>