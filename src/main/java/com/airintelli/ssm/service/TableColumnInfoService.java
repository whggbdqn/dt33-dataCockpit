package com.airintelli.ssm.service;

import java.util.List;

import com.airintelli.ssm.pojo.TableColumnInfo;

/*
 * 表列信息Service
 */
public interface TableColumnInfoService {
	//增加列信息
	void  addTableColumnInfo(TableColumnInfo tci);
	
	//查询列信息
	List<TableColumnInfo>  selectTableColumnInfo(Integer tid);
	
	//修改表列信息
	void  updateTableColumnInfo(String columnName,String tcid);
	
	
        
}