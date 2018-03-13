/**
 * 
 */
package com.airintelli.ssm.dao;

import java.util.List;

import com.airintelli.ssm.pojo.AnalysisTasks;
import com.airintelli.ssm.pojo.AnalysisTasksDataRelationVo;
import com.airintelli.ssm.pojo.PageBean;

/**
 * @author xp
 *
 */
public interface AnalysisTasksDataRelationVoMapper {
	// 根据企业客户id得到对应的所有数据关系表的分析任务列表
	public List<AnalysisTasksDataRelationVo> getAnalysisTasksDataRelationVo(
			PageBean<AnalysisTasksDataRelationVo> pageBean);
	
	//根据企业客户id得到对应的所有数据关系表的分析任务列表数据总数
	public Integer getAnalysisTasksDataRelationVoCount
	(PageBean<AnalysisTasksDataRelationVo> pageBean);
	
	//添加数据分析任务时，检查关联表、算法、算法规则，是否已经存在
	public AnalysisTasks checkAnalysisTasks(AnalysisTasks analysisTasks);
}
