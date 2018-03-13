package com.airintelli.ssm.vo.datatable;

public class Order {

	public final static String ASC = "asc";
	public final static String DESC = "desc";

	private int column;
	private String dir;

	public int getColumn() {
		return column;
	}

	public void setColumn(int column) {
		this.column = column;
	}

	public String getDir() {
		return dir;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}

}
