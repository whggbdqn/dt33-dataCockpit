package com.airintelli.ssm.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.ResultMap;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.airintelli.ssm.pojo.ActiveUser;
import com.airintelli.ssm.pojo.CompanyInfo;
import com.airintelli.ssm.pojo.PageBean;
import com.airintelli.ssm.pojo.QueryCondition;
import com.airintelli.ssm.pojo.UserInfo;
import com.airintelli.ssm.service.UserInfoService;
import com.airintelli.ssm.utils.MD5Utils;

@Controller
@RequestMapping("/userInfo")
public class UserInfoController {
	@Resource
	private UserInfoService userinfoServiceImpl;
	
	@RequestMapping("/userInfoLogin")
	//管理员登录
	public String  userInfoLogin(UserInfo ui,Model model){
		UserInfo uif=userinfoServiceImpl.login(ui);
		model.addAttribute("user", uif);
		return "admin_list";
	}
	 @RequestMapping("page")
	    public String  page (PageBean pagebean,QueryCondition querycondition,HttpServletRequest req) throws Exception{
	      	Integer  pagesize=10;
	      	
	      	pagebean.setQuerycondition(querycondition);
	      	if(pagebean.getPageSize()!=null)
	      	{
	      	
	      	}
	      	else{
	      		pagebean.setPageSize(pagesize);
	      		
	      	}
	    	if(pagebean.getIndex()==null){
	    		pagebean.setIndex(1);
	    		pagebean.setPageRowes(0);
	    	}
	    	else{
	    		
	    		pagebean.setPageRowes((pagebean.getIndex()-1)*pagebean.getPageSize());
	    		
	    	}
	    	pagebean.setTotalCount(userinfoServiceImpl.pageCount(pagebean)); 
	    	Integer  totalCount=pagebean.getTotalCount(); 
	    	
	    	   double tc=totalCount;
	   		Double num=Math.ceil(tc/pagebean.getPageSize());
	   		pagebean.setTotalPage(num.intValue());
	   	 List<UserInfo> list=userinfoServiceImpl.show(pagebean);
	   	 pagebean.setList(list);
	   	 req.getSession().setAttribute("page", pagebean);
	   	 
	   	 //选择每页显示数
	   	 /*Integer[] size={1,5,10};
	      req.getSession().setAttribute("size",size );	*/
	    	
	    	
	    	return "/sysadmin_board_jsp/admin_list";
	    }
	 //获取管理员要修改的账号信息
	 @RequestMapping("selectByPrimaryKey")
	 public String selectByPrimaryKey(Integer id, Model model){
		 UserInfo adminInfo= userinfoServiceImpl.selectUserInfoBy(id);
		 model.addAttribute("adminInfo",adminInfo);
		 return "/sysadmin_board_jsp/edit_admin_info";
	 }
	 
	 //修改管理员信息
	 @RequestMapping("updateAdmin")
	 public String updateAdmin(UserInfo ui){
		 userinfoServiceImpl.updateUserInfo(ui);
		 return "redirect:/userInfo/page.action";
	 }
	 
	// 验证原密码+修改
		@RequestMapping(value="UpdatePassword")
		public   @ResponseBody    String  validateOlaPasssword(HttpServletRequest  req){
			String  oldPassword=req.getParameter("oldPassword");
			String  newPassword=req.getParameter("newPassword");
			MD5Utils  md=new  MD5Utils();
			String  MD5oldPassword=	md.MD5(oldPassword);
			Subject subject=SecurityUtils.getSubject();
			ActiveUser activeUser=(ActiveUser) subject.getPrincipal();
			String  phone=	activeUser.getPhone();
		    UserInfo   userInfo=  userinfoServiceImpl.getUserInfo(phone);
		    
			if(MD5oldPassword.equals(userInfo.getPassword())){
				userInfo.setPassword(md.MD5(newPassword));
				userinfoServiceImpl.updateUserInfo(userInfo);
					return  "yes";
			}else{
					return "no";
			}
			
			
		}
	 
	 
	 
	//修改密码
		 @RequestMapping("updatePassword")
		 public @ResponseBody String  updatePassword(@RequestBody UserInfo ui,String newPassword){
			 MD5Utils  md5=new MD5Utils();
			 UserInfo uif=userinfoServiceImpl.selectUserInfoBy(ui.getId());
			 //数据中原密码
		String password=uif.getPassword();
		//用户输入原密码
		String password1=md5.MD5(ui.getPassword());
		String newpassword=md5.MD5(newPassword);
		if(password.equals(password1)){
			uif.setPassword(newpassword);
			userinfoServiceImpl.updateUserInfo(uif);
			
			return "ok";
		}
		else{
			
			return "failed";
		} 

		 }
		 //验证账号唯一
		 @RequestMapping("checkAccount")
		 public @ResponseBody  String  checkAccount( String phone){
			 UserInfo ui= userinfoServiceImpl.getUserInfo(phone);
			 if(ui==null){
				 return "Yes";
			 }
			 else{
			 return "No";
			 }
		 }
		 //新增管理员
		 @RequestMapping("addAdmin")
		 public String  addUserInfo(UserInfo ui){
			 MD5Utils md5=new MD5Utils();
			 String password=md5.MD5(ui.getPassword());
			 ui.setPassword(password);
			 userinfoServiceImpl.addUserInfo(ui); 
			 
		 return "redirect:/userInfo/page.action";
	}
		//删除管理员
		 @RequestMapping("deleteAdmin")
		 public String  deleteAdmin(UserInfo ui){
			
			 userinfoServiceImpl.deleteUserInfo(ui);
			 
		 return "redirect:/userInfo/page.action";
	}
}
