package com.airintelli.ssm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.airintelli.ssm.pojo.ActiveUser;
import com.airintelli.ssm.pojo.CompanyInfo;
import com.airintelli.ssm.pojo.PageBean;
import com.airintelli.ssm.pojo.QueryCondition;
import com.airintelli.ssm.pojo.UserInfo;
import com.airintelli.ssm.service.CompanyInfoService;
import com.airintelli.ssm.service.UserInfoService;
import com.airintelli.ssm.service.impl.UserInfoServiceImpl;
import com.airintelli.ssm.vo.JsonTableResult;
import com.airintelli.ssm.vo.datatable.DataTableParams;

@Controller
@RequestMapping("/checkCompanyInfo")
public class adminIndexController {
	@Resource
	private CompanyInfoService companyInfoServiceImpl;
	@Resource
	private UserInfoService UserInfoServiceImpl;

	@RequestMapping("/userinfoShowe")
	public String userinfoShow(Model model, PageBean pagebean,QueryCondition querycondition,HttpSession session) {

		// 设置每页显示的记录数
		pagebean.setPageSize(10);
		pagebean.setQuerycondition(querycondition);
		// 类似于 request.getParameter("pageIndex") href="xxx.jsp?pageIndex=8"
		if (pagebean.getIndex() == null) {
			pagebean.setIndex(1);
			// 首次加载页面
			pagebean.setPageRowes(0);// 千万别设置为1，否则会漏掉第一条记录
		} else {
			// 条件查询，性别已经注入pageInfo参数
			// getPageIndex()：获取的是页码，
			// setPageIndex(XX)：XX代表的是当前新页码所对应的行索引
			pagebean.setPageRowes((pagebean.getIndex() - 1) * pagebean.getPageSize());
		}

		Integer count = companyInfoServiceImpl.pageCount(pagebean); // 计算总记录数
		pagebean.setTotalCount(count); // 设置总记录数数
		Integer  totalCount=pagebean.getTotalCount(); 
	  	   double tc=totalCount;
	 		Double num=Math.ceil(tc/pagebean.getPageSize());
	 		pagebean.setTotalPage(num.intValue());
		List<CompanyInfo> cilist = new ArrayList<CompanyInfo>();
		cilist = companyInfoServiceImpl.show(pagebean);
        // 计算当前页码
		Integer pageIndex = pagebean.getPageRowes() / pagebean.getPageSize() + 1;
		Integer pageCount = pagebean.getTotalCount();
		List<CompanyInfo> list = new ArrayList<CompanyInfo>();
		model.addAttribute("page",pagebean);
		model.addAttribute("cilist", cilist);
		for (CompanyInfo companyInfo : cilist) {
			if(companyInfo.getApproval()==null || companyInfo.getApproval()!=1){
				list.add(companyInfo);
			}
		}
		model.addAttribute("list", list);
		Subject subject = SecurityUtils.getSubject();
		ActiveUser activeUser = (ActiveUser) subject.getPrincipal();
		if (activeUser.getRoleName().equals("userinfo")) {
			UserInfo user= UserInfoServiceImpl.getUserInfo(activeUser.getPhone());
			session.setAttribute("user", user);
		}
		return "/sysadmin_board_jsp/admin_index";
		
		
	}
	
	@RequestMapping("/userinfoList")
	@ResponseBody
	public JsonTableResult<List<CompanyInfo>> userinfoList(
			DataTableParams dtp, PageBean pagebean,QueryCondition querycondition){
		querycondition.setThirdcondition("0");
		
		//每一页显示多少条数据
		pagebean.setPageSize(dtp.getLength());
		pagebean.setQuerycondition(querycondition);
		
		 
		pagebean.setPageRowes(dtp.getStart());
		Integer count = companyInfoServiceImpl.pageCount(pagebean); // 计算总记录数
		pagebean.setTotalCount(count); // 设置总记录数数
		Integer  totalCount=pagebean.getTotalCount(); 
	  	   double tc=totalCount;
	 		Double num=Math.ceil(tc/pagebean.getPageSize());
	 		pagebean.setTotalPage(num.intValue());
		List<CompanyInfo> cilist = new ArrayList<CompanyInfo>();
		cilist = companyInfoServiceImpl.show(pagebean);
        // 计算当前页码
		Integer pageIndex = pagebean.getPageRowes() / pagebean.getPageSize() + 1;
		Integer pageCount = pagebean.getTotalCount();
		
		JsonTableResult<List<CompanyInfo>> result = new JsonTableResult<>();
		result.setRecordsFiltered(count);
		//result.setRecordsTotal(45);
		result.setData(cilist);
		return result;
		
	}
	
	
	
	
	 //待审核用户列表 通过
	@RequestMapping("/updateCompangInfoApproval")
	public String updateCompangInfoApproval(CompanyInfo ci){
		companyInfoServiceImpl.updateCompanyInfoApproval(ci);
		return "redirect:/checkCompanyInfo/userinfoShowe.action";
		}
	//待审核用户列表 不通过
	@RequestMapping("/updateCompangInfoApprovalandDelete")
	public String updateCompangInfoApprovalandDelete(CompanyInfo ci){
		companyInfoServiceImpl.deleteById(ci.getId());
		return "redirect:/checkCompanyInfo/userinfoShowe.action";
	}
	

}
