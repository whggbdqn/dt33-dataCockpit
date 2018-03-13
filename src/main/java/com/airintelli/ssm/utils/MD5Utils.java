package com.airintelli.ssm.utils;

import org.apache.shiro.crypto.hash.Md5Hash;
/*
 * 密码加密工具
 */
public class MD5Utils {
	
	public String  MD5(String password){
		
		String newpassword=new Md5Hash(password, "eteokues",1).toString();
		
		return newpassword;
	}

}
