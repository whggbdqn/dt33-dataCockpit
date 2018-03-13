package com.airintelli.ssm.dao;

import java.util.List;

import com.airintelli.ssm.pojo.PageBean;
import com.airintelli.ssm.pojo.UserInfo;

public interface UserInfoMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(UserInfo record);

    int insertSelective(UserInfo record);

    UserInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);
    
    UserInfo  login(UserInfo record);
    
    List<UserInfo>  getPage(PageBean pagebean);
    
    Integer  pageCount(PageBean pagebean);
    
    UserInfo  selectByPhone(String phone);
}