package com.airintelli.ssm.service;

import java.util.List;

import com.airintelli.ssm.pojo.AnalysisTasks;
import com.airintelli.ssm.pojo.AnalysisTasksDataRelationVo;
import com.airintelli.ssm.pojo.PageBean;
import com.airintelli.ssm.pojo.QueryCondition;

public interface AnalysisTasksService {
	// 通过企业编号查询分析任务
	List<AnalysisTasks> selectByCid(Integer cid);

	// 通过关联关系编号查询分析任务
	List<AnalysisTasks> selectByDid(Integer did);

	// 修改分析任务
	Integer update(AnalysisTasks at);

	// 增加分析任务
	Integer add(AnalysisTasks at);

	// 通过主键查询分析任务
	AnalysisTasks selectById(Integer id);

	// 通过用户编号筛选
	PageBean selectpage(PageBean pagebean, QueryCondition query);

	// 根据企业客户id得到对应的所有数据关系表的分析任务列表
	public PageBean<AnalysisTasksDataRelationVo> getAnalysisTasksDataRelationVo(
			PageBean<AnalysisTasksDataRelationVo> pageBean, QueryCondition query);

	// 根据企业客户id得到对应的所有数据关系表的分析任务列表数据总数
	public Integer getAnalysisTasksDataRelationVoCount(PageBean<AnalysisTasksDataRelationVo> pageBean);

	// 添加数据分析任务时，检查关联表、算法、算法规则，是否已经存在
	public boolean checkAnalysisTasks(AnalysisTasks analysisTasks);
}
