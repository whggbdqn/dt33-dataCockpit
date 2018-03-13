package com.airintelli.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.airintelli.ssm.dao.AnalysisTasksDataRelationVoMapper;
import com.airintelli.ssm.dao.AnalysisTasksMapper;
import com.airintelli.ssm.pojo.AnalysisTasks;
import com.airintelli.ssm.pojo.AnalysisTasksDataRelationVo;
import com.airintelli.ssm.pojo.CompanyInfo;
import com.airintelli.ssm.pojo.PageBean;
import com.airintelli.ssm.pojo.QueryCondition;
import com.airintelli.ssm.service.AnalysisTasksService;

@Service
@Transactional
public class AnalysisTasksServiceImpl implements AnalysisTasksService {

	@Autowired
	private AnalysisTasksMapper analysisTasksMapper;
	@Autowired
	private AnalysisTasksDataRelationVoMapper analysisTasksDataRelationVoMapper;

	// 添加分析任务(AnalysisTasks对象)
	@Override
	public Integer add(AnalysisTasks at) {
		Integer i = analysisTasksMapper.insertSelective(at);
		return i;
	}

	// 通过用户编号查询
	@Override
	public List<AnalysisTasks> selectByCid(Integer cid) {

		return analysisTasksMapper.selectByCid(cid);
	}

	// 通过关系编号查询(数据关系表编号)
	@Override
	public List<AnalysisTasks> selectByDid(Integer did) {

		return analysisTasksMapper.selectByDid(did);
	}

	// 通过主键查询
	@Override
	public AnalysisTasks selectById(Integer id) {

		return analysisTasksMapper.selectByPrimaryKey(id);
	}

	// 分页显示分析任务(PageBean对象,QueryCondition对象)
	@Override
	public PageBean selectpage(PageBean pagebean, QueryCondition query) {
		Integer pagesize = 5;

		pagebean.setQuerycondition(query);
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
		pagebean.setTotalCount(analysisTasksMapper.getCount(pagebean));
		Integer totalCount = pagebean.getTotalCount();
		double tc = totalCount;
		Double num = Math.ceil(tc / pagebean.getPageSize());
		pagebean.setTotalPage(num.intValue());
		List<AnalysisTasks> list = analysisTasksMapper.getPage(pagebean);
		pagebean.setList(list);
		return pagebean;
	}
	// 修改分析任务(AnalysisTasks对象)

	@Override
	public Integer update(AnalysisTasks at) {
		Integer i = analysisTasksMapper.updateByPrimaryKey(at);
		return i;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.airintelli.ssm.service.AnalysisTasksService#
	 * getAnalysisTasksDataRelationVo(com.airintelli.ssm.pojo.PageBean)
	 */
	@Override
	public PageBean<AnalysisTasksDataRelationVo> getAnalysisTasksDataRelationVo(
			PageBean<AnalysisTasksDataRelationVo> pagebean, QueryCondition query) {
		Integer pagesize = 10;
		pagebean.setQuerycondition(query);
		if (pagebean.getPageSize() == null) {
			pagebean.setPageSize(pagesize);
		}
		if (pagebean.getIndex() == null) {
			pagebean.setIndex(1);
			pagebean.setPageRowes(0);
		} else {
			pagebean.setPageRowes((pagebean.getIndex() - 1) * pagebean.getPageSize());
		}

		List<AnalysisTasksDataRelationVo> analysisTasksDataRelationVoList = analysisTasksDataRelationVoMapper
				.getAnalysisTasksDataRelationVo(pagebean);
		Integer totalCount = getAnalysisTasksDataRelationVoCount(pagebean);
		pagebean.setTotalCount(totalCount);
		double tc = totalCount;
		Double num = Math.ceil(tc / pagebean.getPageSize());
		pagebean.setTotalPage(num.intValue());
		pagebean.setList(analysisTasksDataRelationVoList);
		return pagebean;
	}

	/*
	 * 根据企业客户id得到对应的所有数据关系表的分析任务列表数据总数
	 */
	@Override
	public Integer getAnalysisTasksDataRelationVoCount(PageBean<AnalysisTasksDataRelationVo> pageBean) {
		Integer count = analysisTasksDataRelationVoMapper.getAnalysisTasksDataRelationVoCount(pageBean);
		return count;
	}

	/*
	 * 添加数据分析任务时，检查关联表、算法、算法规则，是否已经存在
	 */
	@Override
	public boolean checkAnalysisTasks(AnalysisTasks analysisTasks) {
		AnalysisTasks analysisTasks2=analysisTasksDataRelationVoMapper.checkAnalysisTasks(analysisTasks);
		if(analysisTasks2 != null){
			return true;
		}
		return false;
	}

}
