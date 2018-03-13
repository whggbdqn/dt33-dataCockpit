package com.airintelli.ssm.dao;

import java.util.List;

import com.airintelli.ssm.pojo.AnalysisTasks;
import com.airintelli.ssm.pojo.PageBean;
import com.airintelli.ssm.pojo.QueryCondition;

public interface AnalysisTasksMapper {
	 int deleteByPrimaryKey(Integer id);

	    int insert(AnalysisTasks record);

	    int insertSelective(AnalysisTasks record);

	    AnalysisTasks selectByPrimaryKey(Integer id);

	    int updateByPrimaryKeySelective(AnalysisTasks record);

	    int updateByPrimaryKey(AnalysisTasks record);
	    //通过用户编号查询分析任务
	    List<AnalysisTasks>   selectByCid(Integer cid);
	    //通过数据关系查询分析任务
	    List<AnalysisTasks>  selectByDid(Integer did);
	    //查询企业分析任务筛选
	    List<AnalysisTasks>  getPage(PageBean pagebean);
	    Integer  getCount(PageBean pagebean);

}
