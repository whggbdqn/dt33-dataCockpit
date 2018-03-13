package com.airintelli.ssm.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.airintelli.ssm.pojo.CompanyInfo;
import com.airintelli.ssm.pojo.PageBean;
import com.airintelli.ssm.pojo.QueryCondition;
import com.airintelli.ssm.service.CompanyInfoService;
import com.airintelli.ssm.utils.MD5Utils;

@Controller
@RequestMapping("/companyInfo")
public class CompanyInfoController {
	@Resource
	private CompanyInfoService companyInfoServiceImpl;
/*	@Autowired
	private TableInfoServiceImpl tableInfoServiceImpl;*/
	// 普通用户登录
	@RequestMapping("/companyInfo")
	public String companyInfoLogin(CompanyInfo ci, Model model) {
		CompanyInfo com = companyInfoServiceImpl.CompanyInfoLogin(ci);
		model.addAttribute("company", com);

		return "index";
	}

	// 分页查询
	@RequestMapping("page")
	public String page(PageBean pagebean, QueryCondition querycondition, HttpServletRequest req) throws Exception {
		Integer pagesize = 10;
		pagebean.setQuerycondition(querycondition);
		if (pagebean.getPageSize() != null) {

		} else {
			pagebean.setPageSize(pagesize);

		}
		if (pagebean.getIndex() == null) {
			pagebean.setIndex(1);
			pagebean.setPageRowes(0);
		} else {

			pagebean.setPageRowes((pagebean.getIndex() - 1) * pagebean.getPageSize());

		}
		pagebean.setTotalCount(companyInfoServiceImpl.pageCount(pagebean));
		Integer totalCount = pagebean.getTotalCount();
		double tc = totalCount;
		Double num = Math.ceil(tc / pagebean.getPageSize());
		pagebean.setTotalPage(num.intValue());
		List<CompanyInfo> list = companyInfoServiceImpl.show(pagebean);
		pagebean.setList(list);
		req.getSession().setAttribute("page", pagebean);

		// 回显记录数
		Integer[] size = { 1, 5, 10 };
		req.getSession().setAttribute("size", size);

		return "/sysadmin_board_jsp/user_list";
	}

	// 修改用户
	@RequestMapping("updateUser")
	public String updateUser(CompanyInfo ci) {

		return "/sysadmin_board_jsp/edit_user";
	}

	// 新增用户
	@RequestMapping("addUser")
	public String addUser(CompanyInfo ci) {
		MD5Utils md5 = new MD5Utils();
		String password = md5.MD5(ci.getPassword());
		ci.setPassword(password);
		ci.setState(1);
		ci.setApproval(1);
		companyInfoServiceImpl.addCompanyInfo(ci);
		return "redirect:/companyInfo/page.action";
	}

	// 验证账号唯一
	@RequestMapping("checkCompanyAccount")
	public @ResponseBody String checkAccount(String phone) {
		CompanyInfo ci = companyInfoServiceImpl.selectByPhone(phone);
		if (ci == null) {
			return "Yes";
		} else {
			return "No";
		}
	}

	// 用户管理_user_list_ 已启用和已禁用的改变
	@RequestMapping("/CompanyInfoStateChange")
	public @ResponseBody String CompanyInfoStateChange(Integer state,
			Integer id)/* (@RequestBody CompanyInfo ci) */ {
		CompanyInfo companyInfo = new CompanyInfo();
		companyInfo.setState(state);
		companyInfo.setId(id);
		Integer count = companyInfoServiceImpl.updateCompanyInfoApproval(companyInfo);
		// return"redirect:/companyInfo/page.action?thirdcondition=1";

		if (count > 0) {
			return "yes";
		} else {
			return "no";
		}
	}

	// 编辑修改用户的显示
	@RequestMapping("selectByPrimaryKey")
	public String selectByPrimaryKey(CompanyInfo ci, Model model) {
		CompanyInfo seci = companyInfoServiceImpl.selectById(ci.getId());
		model.addAttribute("seci", seci);
		return "/sysadmin_board_jsp/edit_user";
	}

	// 修改用户信息 密码留空即不修改
	@RequestMapping("updateCompanyInfo")
	public String updateCompanyInfo(CompanyInfo ci) {
		Integer id = ci.getId();
		CompanyInfo ciold = companyInfoServiceImpl.selectById(id);
		String passwordold = ciold.getPassword();
		if (ci.getPassword().equals("") || ci.getPassword() == null) {
			ci.setPassword(passwordold);
			companyInfoServiceImpl.updateCompanyInfoApproval(ci);
		} else {
			companyInfoServiceImpl.updateCompanyInfoApproval(ci);
		}
		return "redirect:/userlist.action";
	}

	/**
	 * 管理员登录后，必需选择公司，方可查看对应公司的数据表模块
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/toUserCompanyChooseJsp")
	public String toUserCompanyChooseJsp(PageBean pagebean, QueryCondition querycondition, HttpServletRequest req) {
		Integer pagesize = 10;
		pagebean.setQuerycondition(querycondition);
		if (pagebean.getPageSize() != null) {

		} else {
			pagebean.setPageSize(pagesize);

		}
		if (pagebean.getIndex() == null) {
			pagebean.setIndex(1);
			pagebean.setPageRowes(0);
		} else {

			pagebean.setPageRowes((pagebean.getIndex() - 1) * pagebean.getPageSize());

		}
		pagebean.setTotalCount(companyInfoServiceImpl.pageCount(pagebean));
		Integer totalCount = pagebean.getTotalCount();
		double tc = totalCount;
		Double num = Math.ceil(tc / pagebean.getPageSize());
		pagebean.setTotalPage(num.intValue());
		List<CompanyInfo> list = companyInfoServiceImpl.show(pagebean);
		pagebean.setList(list);
		req.getSession().setAttribute("page", pagebean);

		// 回显记录数
		Integer[] size = { 1, 5, 10 };
		req.getSession().setAttribute("size", size);

		return "sysadmin_board_jsp/user_company_choose";
	}

	/**
	 * 根据企业用户信息页面，由管理员点击要查看的用户
	 * 
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/saveCompany")
	public String saveCompany(Integer id, HttpServletRequest request) {
		CompanyInfo company = companyInfoServiceImpl.selectById(id);
/*		TableInfo ti=new TableInfo();
		ti.setCid(id);
		List<TableInfo> list=tableInfoServiceImpl.selectByCid(ti);
		request.setAttribute("ctilist", list);*/
		request.getSession().setAttribute("company", company);

		String prevUrl = (String) request.getSession().getAttribute("savePrevAction");
		return "redirect:/" + prevUrl;
	}

}
