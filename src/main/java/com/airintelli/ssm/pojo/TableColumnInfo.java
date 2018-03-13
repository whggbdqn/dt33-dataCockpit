package com.airintelli.ssm.pojo;

/**
 * tableColumnInfo对应tableColumnInfo数据表
 * 
 * @author zengjia
 *
 */
public class TableColumnInfo {
	private Integer id;
	private Integer tid;
	private String columnName;
	private String columnType;
	private String physicalColumnName;
	private Integer cid;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public String getColumnName() {
		return columnName;
	}
	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}
	
	
	public String getColumnType() {
		return columnType;
	}
	public void setColumnType(String columnType) {
		this.columnType = columnType;
	}
	public String getPhysicalColumnName() {
		return physicalColumnName;
	}
	public void setPhysicalColumnName(String physicalColumnName) {
		this.physicalColumnName = physicalColumnName;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public TableColumnInfo() {
		super();
	}
	public TableColumnInfo(Integer id, Integer tid, String columnName, String columnType, String physicalColumnName,
			Integer cid) {
		super();
		this.id = id;
		this.tid = tid;
		this.columnName = columnName;
		this.columnType = columnType;
		this.physicalColumnName = physicalColumnName;
		this.cid = cid;
	}
	

	
	
}
