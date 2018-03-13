package com.airintelli.ssm.service;

import java.util.List;

import com.airintelli.ssm.pojo.PageBean;
import com.airintelli.ssm.pojo.UserInfo;

/*
 * 管理员Service
 */
public interface UserInfoService {
	//管理员登录
	UserInfo   login(UserInfo ui);
	//分页多条件查询
	List<UserInfo> show(PageBean pagebean); 
	//添加管理员
	void    addUserInfo(UserInfo ui);
	//删除管理员
	void    deleteUserInfo(UserInfo ui);
	//修改管理员信息
	void    updateUserInfo(UserInfo ui);
	//获得查询记录数
	Integer  pageCount(PageBean pagebean);
	//通过phone查询
	UserInfo  getUserInfo(String phone);
    //通过主键查询管理员
	UserInfo  selectUserInfoBy(Integer id);

}
