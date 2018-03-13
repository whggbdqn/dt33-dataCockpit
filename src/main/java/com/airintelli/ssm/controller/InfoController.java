package com.airintelli.ssm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.airintelli.ssm.pojo.ActiveUser;
import com.airintelli.ssm.pojo.CompanyInfo;
import com.airintelli.ssm.pojo.Inform;
import com.airintelli.ssm.pojo.PageBean;
import com.airintelli.ssm.pojo.QueryCondition;
import com.airintelli.ssm.service.CompanyInfoService;
import com.airintelli.ssm.service.InformService;
/*import com.google.gson.Gson;*/

/**
 * 页面通知中心Controller
 * @author YangZexin
 *
 */

@Controller
@RequestMapping(value="/Info")
public class InfoController {
	@Autowired
	private InformService informServiceImpl;
	
	@Autowired
	private  CompanyInfoService  companyInfoService;
	
	@RequestMapping(value="infolist")
	public String infolist(HttpServletRequest req,PageBean pagebean,QueryCondition qc){
		Subject subject=SecurityUtils.getSubject();
		ActiveUser activeUser=(ActiveUser) subject.getPrincipal();
		String  phone=	activeUser.getPhone();
	    CompanyInfo   companyInfo=  	companyInfoService.selectByPhone(phone);
		req.getSession().setAttribute("companyInfomation", companyInfo);
		
		
		pagebean.setQuerycondition(qc);
		Integer  pagesize=10;
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
  	pagebean.setTotalCount(informServiceImpl.getCount(pagebean)); 
  	Integer  totalCount=pagebean.getTotalCount(); 
  	   double tc=totalCount;
 		Double num=Math.ceil(tc/pagebean.getPageSize());
 		pagebean.setTotalPage(num.intValue());
 	 List<Inform> list=informServiceImpl.showInform(pagebean);
 	 pagebean.setList(list);
 	 req.getSession().setAttribute("page", pagebean);
 	 
		return "/sysboard_jsp/index";
	}
	
	

	//获取点击编辑对象的值,将值传入model中
	  @RequestMapping("/showNotice")
	  public String  showNotice(Inform inform,Model model){
		  Inform noticeInfo = informServiceImpl.selectById(inform.getId());
		  model.addAttribute("noticeInfo", noticeInfo);
		  return "/sysboard_jsp/show_notice";
	  }
}
