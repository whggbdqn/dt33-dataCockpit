package com.airintelli.ssm.pojo;

import java.util.List;

public class PageBean<T> {
	 private   Integer  pageSize;          //每页显示数
     private   Integer  index;             //页码
     private   Integer  totalPage;         //总页数
     private   Integer  totalCount;        //总记录数
     private   QueryCondition querycondition;   //查询条件类
	 private  List<T>  list;               //返回结果集
	 private   Integer  pageRowes;         //当前页的第一条信息的记录数
	 
	 
	 
	public QueryCondition getQuerycondition() {
		return querycondition;
	}
	public void setQuerycondition(QueryCondition querycondition) {
		this.querycondition = querycondition;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getIndex() {
		return index;
	}
	public void setIndex(Integer index) {
		this.index = index;
	}
	public Integer getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	public Integer getPageRowes() {
		return pageRowes;
	}
	public void setPageRowes(Integer pageRowes) {
		this.pageRowes = pageRowes;
	}
     
     
     
}
