package com.airintelli.ssm.controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.type.IntegerTypeHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.airintelli.ssm.pojo.AnalysisTasks;
import com.airintelli.ssm.pojo.CompanyInfo;
import com.airintelli.ssm.pojo.DataRelation;
import com.airintelli.ssm.pojo.PageBean;
import com.airintelli.ssm.pojo.QueryCondition;
import com.airintelli.ssm.pojo.TableColumnInfo;
import com.airintelli.ssm.pojo.TableRelationColumn;
import com.airintelli.ssm.service.AnalysisTasksService;
import com.airintelli.ssm.service.DataRelationService;
import com.alibaba.druid.pool.vendor.SybaseExceptionSorter;

@Controller
@RequestMapping(value = "analysisTasks")
public class AnalysisTasksController {


			@Autowired
			private  AnalysisTasksService  analysisTasksService;
			@Autowired
			private  DataRelationService  dataRelationService;
			
			@RequestMapping(value="/queryShow")
			public  String  queryShow(PageBean  pagebean,QueryCondition  query,Model  model,HttpSession  session,Integer  id){
				if(id==null){
					id=1;
				}
				DataRelation  dataRelation=dataRelationService.selectById(id);
			CompanyInfo   info=(CompanyInfo) session.getAttribute("companyInfomation");
			Integer  cid=	info.getId();
			PageBean     pb= 	analysisTasksService.selectpage(pagebean, query);
			List<AnalysisTasks> list=pb.getList();
			List<TableRelationColumn>	listT=	dataRelationService.selectByCid(cid);
			List<DataRelation>  listD=new  ArrayList<DataRelation>();
				 for(int i =0;i<listT.size();i++){
					listD.add(listT.get(i).getDataRelation());
				 }
				 TableRelationColumn  trc=new  TableRelationColumn();
				 trc=listT.get(id-1);
				 session.setAttribute("dataR", dataRelation);
				 
				model.addAttribute("list", list);
				model.addAttribute("page", pb);
				model.addAttribute("listD", listD);
				model.addAttribute("Trc", trc);
				return  "/sysboard_jsp/data_analyze";

			}
			//修改分析任务状态
			@RequestMapping(value="/startTasks")
			public  String  startTasks(Integer[]   ckbId){
			AnalysisTasks  analysisTasks=new  AnalysisTasks();
				for(Integer  i=0;i<ckbId.length;i++){
					analysisTasks.setId(1);
					analysisTasks.setId(ckbId[i]);
					analysisTasksService.update(analysisTasks);
				}
				
				return  "";
			}
			
			@RequestMapping(value="/addTask")
			public  String  addTask(AnalysisTasks  analysisTasks){
				analysisTasks.setStartTime(new  Date());
				analysisTasksService.add(analysisTasks);
				return  "/sysboard_jsp/data_analyze";
			}
			
	@RequestMapping(value = "/taskFeedBack")
	public @ResponseBody AnalysisTasks taskFeedBack(Integer id, Model model) {
		System.out.println(id);
		
		AnalysisTasks at = analysisTasksService.selectById(id);

		return at;
	}

	/**
	 * 创建分析任务
	 * 
	 * @param cxp
	 * @return
	 */
	@RequestMapping(value = "/createAnalysistasks")
	public @ResponseBody Map<String,String> createAnalysistasks(AnalysisTasks analysisTasks){
		Map<String,String> map=new HashMap<String,String>();
		//检查数据分析任务是否已经存在
		boolean existAnalysisTasks = analysisTasksService.checkAnalysisTasks(analysisTasks);
		if(existAnalysisTasks){
			//如果存在
			map.put("info", "exist");
		}else{
		   //如果不存在，就添加
			analysisTasks.setTaskStatus(-2);
			Integer i=analysisTasksService.add(analysisTasks);
			if(i>0){
				map.put("info", "success");
			}else{
				map.put("info", "faild");
			}
		}
		return map;
	}
}
