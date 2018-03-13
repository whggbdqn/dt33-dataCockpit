package com.airintelli.ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.airintelli.ssm.pojo.CompanyInfo;
import com.airintelli.ssm.pojo.UserInfo;
import com.airintelli.ssm.service.CompanyInfoService;
import com.airintelli.ssm.utils.MD5Utils;

@Controller
public class ChangePwdController {
	@Autowired
	private CompanyInfoService companyInfoService;
	
	//修改密码
		 @RequestMapping("updatePassword")
		 public @ResponseBody String  updatePassword(@RequestBody CompanyInfo ci ,String newPassword){
			 MD5Utils  md5=new MD5Utils();
			 CompanyInfo cid = companyInfoService.selectById(ci.getId());
			 //数据中原密码
		String password=cid.getPassword();
		//用户输入原密码
		String password1=md5.MD5(ci.getPassword());
		String newpassword=md5.MD5(newPassword);
		if(password.equals(password1)){
			cid.setPassword(newpassword);
			companyInfoService.updateCompanyInfoApproval(cid);
			
			return "ok";
		}
		else{
			
			return "failed";
		} 

		 }
	}
	

