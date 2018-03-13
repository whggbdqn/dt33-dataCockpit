package com.airintelli.ssm.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.airintelli.ssm.pojo.ActiveUser;
import com.airintelli.ssm.pojo.CompanyInfo;
import com.airintelli.ssm.service.CompanyInfoService;
import com.airintelli.ssm.utils.MD5Utils;


@Controller
@RequestMapping(value="company")
public class CompanyController {
	@Autowired
	private CompanyInfoService companyInfoService;

	// 验证原密码+修改
	@RequestMapping(value="validateOldPassword")
	public   @ResponseBody    String  validateOlaPasssword(HttpServletRequest  req){
		String  oldPassword=req.getParameter("oldPassword");
		String  newPassword=req.getParameter("newPassword");
		MD5Utils  md=new  MD5Utils();
		String  MD5oldPassword=	md.MD5(oldPassword);
		System.out.println(newPassword);
		System.out.println(MD5oldPassword);
	
		Subject subject=SecurityUtils.getSubject();
		ActiveUser activeUser=(ActiveUser) subject.getPrincipal();
		String  phone=	activeUser.getPhone();
	    CompanyInfo   companyInfo=  	companyInfoService.selectByPhone(phone);
	    
	    
		if(MD5oldPassword.equals(companyInfo.getPassword())){
			System.out.println("123");
				companyInfo.setPassword(md.MD5(newPassword));
				companyInfoService.updateCompanyInfoApproval(companyInfo);
				return  "yes";
		}else{
				return "no";
		}
		
		
	}
	
	// 修改密码
/*	@RequestMapping(value = "changePwd")
	public String changePwd(String newPassword) {
		Subject subject=SecurityUtils.getSubject();
		ActiveUser activeUser=(ActiveUser) subject.getPrincipal();
		String  phone=activeUser.getPhone();
		
	    CompanyInfo   companyInfo=  	companyInfoService.selectByPhone(phone);
	    
	    companyInfoService.updateCompanyInfoApproval(companyInfo);
		return "/sysboard_jsp/login";
	}
*/
	// 跳转修改页面
	@RequestMapping(value = "/changeInfoPage")
	public String changeInfoPage(Model model, CompanyInfo companyInfo) {
		System.out.println(companyInfo.getPhone());
		CompanyInfo info = companyInfoService.selectByPhone(companyInfo.getPhone());
		model.addAttribute("info", info);
		return "/sysboard_jsp/change_info";
	}

	// 修改完成
	@RequestMapping(value = "/changeInfo")
	public String changeInfo(CompanyInfo companyInfo) {
		System.out.println(123);
		companyInfoService.updateCompanyInfoApproval(companyInfo);
		return "/sysboard_jsp/index";
	}

	// 申请合作
	@RequestMapping(value = "/signUp")
	public String signUp(CompanyInfo companyInfo) {
		companyInfo.setState(1);
		companyInfoService.addCompanyInfo(companyInfo);
		return "redirect:/logout.action";
	}
}
