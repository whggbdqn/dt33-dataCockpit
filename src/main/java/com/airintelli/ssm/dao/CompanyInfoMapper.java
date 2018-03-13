package com.airintelli.ssm.dao;

import java.util.List;

import com.airintelli.ssm.pojo.CompanyInfo;
import com.airintelli.ssm.pojo.PageBean;


public interface CompanyInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CompanyInfo record);

    int insertSelective(CompanyInfo record);

    CompanyInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CompanyInfo record);

    int updateByPrimaryKey(CompanyInfo record);
    //分页查询(按条件)
    List<CompanyInfo>  getPage(PageBean pagebean);
    //总记录数
    Integer  pageCount(PageBean pagebean);
    //登录
    CompanyInfo  CompanyInfoLogin(CompanyInfo ui);
    //用户名获得用户对象
    CompanyInfo  selectByPhone(String phone);
    // 通过企业名称获得用户对象
    CompanyInfo selectByCorpName(String corpName);
    
}