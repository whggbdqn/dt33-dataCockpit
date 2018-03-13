package com.airintelli.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.airintelli.ssm.dao.UserInfoMapper;
import com.airintelli.ssm.pojo.PageBean;
import com.airintelli.ssm.pojo.UserInfo;
import com.airintelli.ssm.service.UserInfoService;
@Service
@Transactional
public class UserInfoServiceImpl implements UserInfoService {
   @Autowired 
   private UserInfoMapper userInfoMapper;
   
   //添加管理员
	@Override
	public void addUserInfo(UserInfo ui) {
		userInfoMapper.insert(ui);
		
	}
	//删除管理员
	@Override
	public void deleteUserInfo(UserInfo ui) {
		userInfoMapper.deleteByPrimaryKey(ui.getId());
		
	}
	//管理员登录
	@Override
	public UserInfo login(UserInfo ui) {
	UserInfo uif=userInfoMapper.login(ui);
		
		return uif;
	}
	//分页显示管理员信息
	@Override
	public List<UserInfo> show(PageBean pagebean) {
		List<UserInfo>  userlist=userInfoMapper.getPage(pagebean);
		
		return userlist;
	}@Override
	public void updateUserInfo(UserInfo ui) {
		
		userInfoMapper.updateByPrimaryKey(ui);
	}
	//获得总记录数
	@Override
		public Integer pageCount(PageBean pagebean) {
			
			return userInfoMapper.pageCount(pagebean);
		}
	//通过phone获得管理员用户
	@Override
		public UserInfo getUserInfo(String phone) {
			
			return userInfoMapper.selectByPhone(phone);
		}
    //通过主键查询管理员
	@Override
		public UserInfo selectUserInfoBy(Integer id) {
			
			return userInfoMapper.selectByPrimaryKey(id);
		}
}
