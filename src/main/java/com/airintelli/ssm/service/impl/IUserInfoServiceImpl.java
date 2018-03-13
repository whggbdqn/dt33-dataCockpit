/**
 * 
 */
package com.airintelli.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airintelli.ssm.dao.UserInfoVoMapper;
import com.airintelli.ssm.pojo.UserInfoVo;
import com.airintelli.ssm.service.IUserInfoService;

/**
 * @author xp
 *
 */
@Service
public class IUserInfoServiceImpl implements IUserInfoService {
	@Autowired
	private UserInfoVoMapper userInfoVoMapper;

	@Override
	public UserInfoVo getUserInfoByName(String phone) {

		return userInfoVoMapper.getUserInfoByName(phone);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see  用户表和角色表查询获得该用户的的权限 
	 * com.airintelli.ssm.service.IUserInfoService#getRoleNameByUserInfo(java.
	 * lang.Integer)
	 */
	@Override
	public String getRoleNameByUserInfo(Integer uid) {
		return userInfoVoMapper.getRoleNameByUserInfo(uid);
	}

}
