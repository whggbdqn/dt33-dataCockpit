/**
 * 
 */
package com.airintelli.ssm.service;

import com.airintelli.ssm.pojo.UserInfoVo;

/**
 * @author xp
 *
 */
public interface IUserInfoService {
	// 用于登录认证
	UserInfoVo getUserInfoByName(String phone);

	// 用于授权
	String getRoleNameByUserInfo(Integer uid);
}
