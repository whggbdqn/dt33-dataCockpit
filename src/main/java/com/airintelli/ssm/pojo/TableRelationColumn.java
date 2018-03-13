package com.airintelli.ssm.pojo;

public class TableRelationColumn {
	//表信息1
	private  TableInfo  tableInfo1;
	//表信息2
	private  TableInfo  tableInfo2;
	//列信息1
	private  TableColumnInfo  tableColumnInfo1;
	//列信息2
	private  TableColumnInfo  tableColumnInfo2;
	//关系信息
	private  DataRelation  dataRelation;
	public TableInfo getTableInfo1() {
		return tableInfo1;
	}
	public void setTableInfo1(TableInfo tableInfo1) {
		this.tableInfo1 = tableInfo1;
	}
	public TableInfo getTableInfo2() {
		return tableInfo2;
	}
	public void setTableInfo2(TableInfo tableInfo2) {
		this.tableInfo2 = tableInfo2;
	}
	public TableColumnInfo getTableColumnInfo1() {
		return tableColumnInfo1;
	}
	public void setTableColumnInfo1(TableColumnInfo tableColumnInfo1) {
		this.tableColumnInfo1 = tableColumnInfo1;
	}
	public TableColumnInfo getTableColumnInfo2() {
		return tableColumnInfo2;
	}
	public void setTableColumnInfo2(TableColumnInfo tableColumnInfo2) {
		this.tableColumnInfo2 = tableColumnInfo2;
	}
	public DataRelation getDataRelation() {
		return dataRelation;
	}
	public void setDataRelation(DataRelation dataRelation) {
		this.dataRelation = dataRelation;
	}
	

}
