package com.airintelli.ssm.service;

import java.util.List;

import com.airintelli.ssm.pojo.CompanyInfo;
import com.airintelli.ssm.pojo.PageBean;

/*
 * 企业用户Service
 */
public interface CompanyInfoService
{
    // 企业用户登录
    CompanyInfo CompanyInfoLogin(CompanyInfo ci);
    
    // 添加企业用户
    void addCompanyInfo(CompanyInfo ci);
    
    // 修改用户信息״̬
    Integer updateCompanyInfoApproval(CompanyInfo ci);
    
    // 分页查询多条件
    List<CompanyInfo> show(PageBean pagebean);
    
    // 总记录数
    Integer pageCount(PageBean pagebean);
    
    // 通过phone获得用户对象
    CompanyInfo selectByPhone(String phone);
    
    // 通过主键获得企业用户对象
    CompanyInfo selectById(Integer id);
    
    // 通过主键删除
    void deleteById(Integer id);
    
    // 通过企业名称查找企业对象
    Integer selectByCname(String Cname);
}
