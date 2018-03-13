package com.airintelli.ssm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.airintelli.ssm.pojo.AnalysisTasks;
import com.airintelli.ssm.pojo.AnalysisTasksDataRelationVo;
import com.airintelli.ssm.pojo.CompanyInfo;
import com.airintelli.ssm.pojo.DataRelation;
import com.airintelli.ssm.pojo.PageBean;
import com.airintelli.ssm.pojo.QueryCondition;
import com.airintelli.ssm.pojo.TableColumnInfo;
import com.airintelli.ssm.pojo.TableInfo;
import com.airintelli.ssm.pojo.TableRelationColumn;
import com.airintelli.ssm.pojo.TempTablePagingData;
import com.airintelli.ssm.service.AnalysisTasksService;
import com.airintelli.ssm.service.DataRelationService;
import com.airintelli.ssm.service.TableColumnInfoService;
import com.airintelli.ssm.service.TableInfoService;
import com.airintelli.ssm.service.UserInfoService;
import com.airintelli.ssm.service.impl.UserInfoServiceImpl;
import com.google.gson.Gson;

/**
 * 导航栏Cotroller
 * 
 * @author yanjun
 */
@Controller
public class NavigationController {
	@Autowired
	private TableInfoService tableInfoServiceImpl;
	@Autowired
	private DataRelationService dataRelationService;
	@Autowired
	private AnalysisTasksService analysisTasksService;
	@Autowired
	private TableColumnInfoService tableColumnInfoService;

	// 审核列表
	@RequestMapping("checkSignup")
	public String checkSignup() {
		return "/sysadmin_board_jsp/admin_index";
	}

	// 通知中心，通知列表
	@RequestMapping("noticeList")
	public String noticeList() {

		return "redirect:noticeInfo/page.action";
	}

	// 用户管理，用户列表
	@RequestMapping("userlist")
	public String userlist() {
		return "redirect:companyInfo/page.action?thirdcondition=1";
	}

	// 编辑用户
	@RequestMapping("editUser")
	public String editUser() {
		return "redirect:companyInfo/updateUser.action";
	}

	// 编辑通知
	@RequestMapping("editNotice")
	public String editNotice() {
		return "/sysadmin_board_jsp/edit_notice";
	}

	// 后台账号管理，后台账号列表
	@RequestMapping("adminList")
	public String adminList() {
		return "redirect:/userInfo/page.action";
	}

	// 修改管理员账号信息
	@RequestMapping("editAdmin")
	public String editAdmin() {

		return "redirect:/userInfo/updateAdmin.action";
	}

	// 数据表管理，数据表展示
	@RequestMapping("dataTable")
	public String dateTable(HttpServletRequest request) {
		// 保存管理员点击的页面，方便返回到管理员上一次的操作页面
		request.getSession().setAttribute("savePrevAction", "dataTable.action");
		CompanyInfo companyInfo = (CompanyInfo) request.getSession().getAttribute("company");
		if (companyInfo == null) {
			return "redirect:/companyInfo/toUserCompanyChooseJsp.action";
		}
		TableInfo ti = new TableInfo();
		ti.setCid(companyInfo.getId());
		List<TableInfo> ctilist = tableInfoServiceImpl.selectByCid(ti);
		request.setAttribute("ctilist", ctilist);
		return "/sysadmin_board_jsp/data_table";
	}

	// 数据表管理，数据列表
	@RequestMapping("dataShow")
	public String dataShow(HttpServletRequest request) {

		return "redirect:/tableInfo/tableshow.action";
	}

	// 数据关系管理
	@RequestMapping("dataRelationManage")
	public String dataRelationManage(HttpServletRequest request) {
		// 保存管理员点击的页面，方便返回到管理员上一次的操作页面
		request.getSession().setAttribute("savePrevAction", "dataRelationManage.action");
		CompanyInfo companyInfo = (CompanyInfo) request.getSession().getAttribute("company");
		if (companyInfo == null) {
			return "redirect:/companyInfo/toUserCompanyChooseJsp.action";
		}
		return "/sysadmin_board_jsp/data_relation_manage";
	}

	// 分析任务管理
	@RequestMapping("dataAnalysisManage")
	public String dataAnalysisManage(HttpServletRequest request, PageBean pagebean, QueryCondition query) {
		// 保存管理员点击的页面，方便返回到管理员上一次的操作页面
		request.getSession().setAttribute("savePrevAction", "dataAnalysisManage.action");
		CompanyInfo companyInfo = (CompanyInfo) request.getSession().getAttribute("company");
		if (companyInfo == null) {
			return "redirect:/companyInfo/toUserCompanyChooseJsp.action";
		}
		// 查询指定公司的关系表名称
		DataRelation dataRelation = new DataRelation();
		dataRelation.setCid(companyInfo.getId());
		dataRelation.setState(1);
		List<DataRelation> dataRelation_list = dataRelationService.selectByCidState(dataRelation);
		request.setAttribute("dataRelation_list", dataRelation_list);

		// 查询分析任务表
		query.setFirstcondition(companyInfo.getId().toString());
		//获取指定企业客户的数据关联关系表
		PageBean<AnalysisTasksDataRelationVo>  pageBean= analysisTasksService
				.getAnalysisTasksDataRelationVo(pagebean,query);
		Integer count=analysisTasksService.getAnalysisTasksDataRelationVoCount(pagebean);
		request.setAttribute("pages_analysisTask", pagebean);
		return "/sysadmin_board_jsp/data_Analysis_manage";
	}

	// 分析任务列表
	@RequestMapping("dataAnalysisList")
	public String dataAnalysisList(Integer did,HttpServletRequest request) {
		//根据数据关系表的id（即分析任务表的did）获得分析任务表集合
		List<AnalysisTasks> tasksList=analysisTasksService.selectByDid(did);
		request.setAttribute("tasksList", tasksList);
		
	//	return "redirect:/tableInfo/tableAnalysisList.action";
		return "/sysadmin_board_jsp/data_Analysis_list";
	}
	
	//查看数据
		@RequestMapping("showdata_manage")
		public String showData(TempTablePagingData data,Integer id,Model model,HttpServletRequest request) throws Exception{
			data.setPageNow(1);
			data.setPageSize(10);
			TempTablePagingData tempTablePagingData = tableInfoServiceImpl.getTempTablePagingData(data, id);
			List<TableColumnInfo> list = tableColumnInfoService.selectTableColumnInfo(id);
			Gson gson = new Gson();
			String jsonStr = gson.toJson(tempTablePagingData.getResult());
			String colName = gson.toJson(list);
			
			request.setAttribute("tid", id);
			request.setAttribute("tableColumnName", list);
			request.setAttribute("p_colName", colName);
			request.setAttribute("jsonStr", jsonStr);
			return "/sysadmin_board_jsp/data_show";
		}
	//分析任务列表页面处理ajax请求所要的企业数据列表
/*	@RequestMapping(value="/getDataRelationByCid")
	public @ResponseBody List<TableRelationColumn> getDataRelationByCid(Integer cid){
		
		List<TableRelationColumn> list=dataRelationService.selectByCid(cid);
		 
		return list;
	}*/
}
