/**
 * 
 */
package com.airintelli.ssm.pojo;

import java.util.List;

/**
 * 用来封装登录用户的身份信息
 * @author xp
 *
 */
public class ActiveUser {
	// 用户的id
	private Integer uid;
	// 用户登录手机号
	private String phone;
	// 用户密码
	private String password;
	// 角色名，用来判断是企业用户还是管理员
	private String roleName;

	/**
	 * @return the uid
	 */
	public Integer getUid() {
		return uid;
	}

	/**
	 * @param uid
	 *            the uid to set
	 */
	public void setUid(Integer uid) {
		this.uid = uid;
	}

	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * @param phone
	 *            the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password
	 *            the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the roleName
	 */
	public String getRoleName() {
		return roleName;
	}

	/**
	 * @param roleName
	 *            the roleName to set
	 */
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

}
