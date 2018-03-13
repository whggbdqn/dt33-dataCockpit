package com.airintelli.ssm.pojo;

import java.util.List;
import java.util.Map;

/**
 * 临时表分页数据类
 * @author zengjia
 *
 */
public class TempTablePagingData {

	//当前页，输入数据
	private Integer pageNow;
	
	//查询的物理表名，输入数据
	private String tableName;

	//页面显示的记录数，输入数据
	private Integer pageSize;
	
	//分页的页数，输出数据
	private Integer pageCount;
	
	//总记录数，输出数据
	private Long totalCount;
	
	//查询的数据，输出数据
	private List<Map<String,Object>> result;

	public Integer getPageNow() {
		return pageNow;
	}

	public void setPageNow(Integer pageNow) {
		this.pageNow = pageNow;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getPageCount() {
		return pageCount;
	}

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}

	public Long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Long totalCount) {
		this.totalCount = totalCount;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public List<Map<String,Object>> getResult() {
		return result;
	}

	public void setResult(List<Map<String,Object>> result) {
		this.result = result;
	}
	
}
