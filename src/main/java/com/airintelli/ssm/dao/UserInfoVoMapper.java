package com.airintelli.ssm.dao;

import com.airintelli.ssm.pojo.UserInfoVo;

public interface UserInfoVoMapper {
	// 用于登录认证
	UserInfoVo getUserInfoByName(String phone);
	
	//用于授权
	String getRoleNameByUserInfo(Integer uid);
}