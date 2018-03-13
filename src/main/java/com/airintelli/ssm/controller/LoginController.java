package com.airintelli.ssm.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
/**
 * 用于登录验证的控制器
 * @author chengxiaopeng
 *
 */
import org.springframework.web.bind.annotation.RequestMapping;

import com.airintelli.ssm.pojo.ActiveUser;

@Controller
@RequestMapping(value = "/login")
public class LoginController {

	@RequestMapping(value = "/loginHandler")
	public String loginHandler(HttpServletRequest request) {
		Subject subject = SecurityUtils.getSubject();
		if (subject.isAuthenticated()) {
			return "redirect:/login/confirmMainPage.action";
		} else {
			// 如果登陆失败从request中获取认证异常信息，shiroLoginFailure就是shiro异常类的全限定名
			String exceptionClassName = (String) request.getAttribute("shiroLoginFailure");
			// 根据shiro返回的异常类路径判断，抛出指定异常信息
			if (exceptionClassName != null) {
				if (UnknownAccountException.class.getName().equals(exceptionClassName)) {
					// 最终会抛给异常处理器
					// throw new CustomException("账号不存在");
					request.setAttribute("msg", "对不起，您的账号不存在");
				} else if (IncorrectCredentialsException.class.getName().equals(exceptionClassName)) {
					// throw new CustomException("密码错误");
					request.setAttribute("msg", "对不起，您的密码错误");
				} else if ("randomCodeError".equals(exceptionClassName)) {
					// throw new CustomException("验证码错误 ");
					request.setAttribute("msg", "对不起，您的验证码错误");
				} else if (DisabledAccountException.class.getName().equals(exceptionClassName)) {
					// throw new CustomException("账号被禁用 ");
					request.setAttribute("msg", "对不起，您的账号被禁用");
				} else {
					// throw new Exception();// 最终在异常处理器生成未知错误
					request.setAttribute("msg", "对不起，登录失败，请重新登录");
				}
			}
		}
		return "/sysadmin_board_jsp/admin_login";
	}

	@RequestMapping(value = "/confirmMainPage")
	public String confirmMainPage() {
		Subject subject = SecurityUtils.getSubject();
		// 获得用户登录身份信息
		ActiveUser activeUser = (ActiveUser) subject.getPrincipal();
		if (activeUser != null) {
			if (activeUser.getRoleName().equals("userinfo")) {
				return "redirect:/checkCompanyInfo/userinfoShowe.action";
			} else if (activeUser.getRoleName().equals("companyinfo")) {
				return "redirect:/Info/infolist.action";
			}
		}
		return "/sysadmin_board_jsp/admin_login";
	}
	
	@RequestMapping(value = "/checkCode")
	public String checkCode(HttpServletRequest request){
		String randomcode = request.getParameter("randomcode");
		return randomcode;
	}
}
