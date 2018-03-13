package com.airintelli.ssm.pojo;
/*
 * 动态生成表，命令的动态对象
 */
public class Sql {
	private String tableName;
	private String columnName;
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public String getColumnName() {
		return columnName;
	}
	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

}
