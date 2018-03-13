package com.airintelli.ssm.service;

import java.util.List;

import com.airintelli.ssm.pojo.Inform;
import com.airintelli.ssm.pojo.PageBean;

/*
 * ͨ通知Service
 */
public interface InformService {
    //分页显示通知(倒序)
	List<Inform>  showInform(PageBean pagebean);
	//添加通知֪
	void   addInform(Inform  info);
	//删除通知֪
	void   deleteInform(Inform info);
	//修改通知֪
	void   updateInform(Inform info);   
	//根据主键查询通知
	Inform  selectById(Integer id);
	//查询总记录数
	Integer  getCount(PageBean pagebean);
}
