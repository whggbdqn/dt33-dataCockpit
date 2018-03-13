/**
 * 
 */
package com.airintelli.ssm.pojo;

/**
 * 此实体类用于关联两表查询：分析任务表和数据关系表
 * 
 * @author xp
 *
 */
public class AnalysisTasksDataRelationVo extends AnalysisTasks {
	// 数据分析任务表1条数据对应中的数据关系表一条数据
	private DataRelation dataRelationList;

	/**
	 * @return the dataRelationList
	 */
	public DataRelation getDataRelationList() {
		return dataRelationList;
	}

	/**
	 * @param dataRelationList
	 *            the dataRelationList to set
	 */
	public void setDataRelationList(DataRelation dataRelationList) {
		this.dataRelationList = dataRelationList;
	}

}
