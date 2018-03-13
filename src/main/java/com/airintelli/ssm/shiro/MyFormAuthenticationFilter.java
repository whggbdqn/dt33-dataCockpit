package com.airintelli.ssm.shiro;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;

import com.airintelli.ssm.pojo.ActiveUser;

public class MyFormAuthenticationFilter extends FormAuthenticationFilter {

	/**
	 * shiro拒绝访问后处理方法
	 */
	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
		HttpServletRequest req = (HttpServletRequest) request;
	/*	String type = req.getParameter("userType");
		if (type != null) {
			if (type.equals("企业用户")) {
				this.setLoginUrl("/jsp/login/customerLogin.jsp");
			} else if (type.equals("管理员")) {
				this.setLoginUrl("/jsp/login/managerMain.jsp");
			}
		} else {*/
		/*String requestURI = req.getRequestURI();
		if(requestURI.indexOf("/login/loginHandler.action")>0){
			this.setLoginUrl("/login/loginHandler.action");
			return super.onAccessDenied(request, response);
		}else if(requestURI.indexOf("/login/managerHandler.action")>0){
			this.setLoginUrl("/login/managerHandler.action");
			return super.onAccessDenied(request, response);
		}else{
			req.getRequestDispatcher("/index.jsp").forward(req, response);
			return false;
		}*/
		// 校验验证码
		// 从session获取正确的验证码
		HttpSession session=req.getSession();
		
		String validateCode = (String) session.getAttribute("validateCode");
		//页面输入的验证码
		String randomcode = request.getParameter("randomcode");
		if (randomcode!=null && validateCode!=null) {
			if (!randomcode.equalsIgnoreCase(validateCode)) {
				// randomCodeError表示验证码错误 
				request.setAttribute("shiroLoginFailure", "randomCodeError");
				//拒绝访问，不再校验账号和密码 
				return true; 
			}
		}
		return super.onAccessDenied(request, response);
	}

	/**
	 * 用来清除登录成功后，指定跳转的页面
	 */
	@Override
	protected boolean onLoginSuccess(AuthenticationToken token, Subject subject, ServletRequest request,
			ServletResponse response) throws Exception {
		//获得用户登录身份信息
		ActiveUser activeUser = (ActiveUser) subject.getPrincipal();
		if (activeUser != null) {
			if (activeUser.getRoleName().equals("userinfo")) {
			//	this.setSuccessUrl("/sysadmin_board_jsp/admin_index.jsp");
				this.setSuccessUrl("/checkCompanyInfo/userinfoShowe.action");
			} else if (activeUser.getRoleName().equals("companyinfo")) {
			//	this.setSuccessUrl("/sysboard_jsp/index.jsp");
				this.setSuccessUrl("/Info/infolist.action");
			}
		}
		// 设置登录成功后跳转到指定页面
		WebUtils.issueRedirect(request, response, getSuccessUrl());
		return false;
	//	return super.onLoginSuccess(token, subject, request, response);
	}

}
