package com.airintelli.ssm.vo;
/**
 * 响应ajax请求的数据模型（针对DataTable的请求）
 * 
 * @author thinkpad
 * @date 2017-7-24
 */
public class JsonTableResult<T> extends JsonDataResult<T>{
	private int draw;
	private int recordsTotal;
	private int recordsFiltered;
	
	public JsonTableResult() {
		super();
	}
	
	public int getDraw() {
		return draw;
	}
	public void setDraw(int draw) {
		this.draw = draw;
	}
	public int getRecordsTotal() {
		return recordsTotal;
	}
	public void setRecordsTotal(int recordsTotal) {
		this.recordsTotal = recordsTotal;
	}
	public int getRecordsFiltered() {
		return recordsFiltered;
	}
	public void setRecordsFiltered(int recordsFiltered) {
		this.recordsFiltered = recordsFiltered;
	}

}
