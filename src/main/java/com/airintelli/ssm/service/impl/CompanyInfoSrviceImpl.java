package com.airintelli.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.airintelli.ssm.dao.CompanyInfoMapper;
import com.airintelli.ssm.pojo.CompanyInfo;
import com.airintelli.ssm.pojo.PageBean;
import com.airintelli.ssm.service.CompanyInfoService;

@Service
@Transactional
public class CompanyInfoSrviceImpl implements CompanyInfoService
{
    @Autowired
    private CompanyInfoMapper companyInfoMapper;
    
    // 添加企业用户
    @Override
    public void addCompanyInfo(CompanyInfo ci)
    {
        
        companyInfoMapper.insertSelective(ci);
    }
    
    // 企业用户登录
    @Override
    public CompanyInfo CompanyInfoLogin(CompanyInfo ci)
    {
        
        return companyInfoMapper.CompanyInfoLogin(ci);
    }
    
    // 分页查询结果
    @Override
    public List<CompanyInfo> show(PageBean pagebean)
    {
        
        return companyInfoMapper.getPage(pagebean);
    }
    
    // 修改企业用户
    @Override
    public Integer updateCompanyInfoApproval(CompanyInfo ci)
    {
        Integer i = companyInfoMapper.updateByPrimaryKeySelective(ci);
        return i;
    }
    
    // 查询总记录数
    @Override
    public Integer pageCount(PageBean pagebean)
    {
        
        return companyInfoMapper.pageCount(pagebean);
    }
    
    // 通过phone查询企业用户
    @Override
    public CompanyInfo selectByPhone(String phone)
    {
        
        return companyInfoMapper.selectByPhone(phone);
    }
    
    // 通过主键查询
    @Override
    public CompanyInfo selectById(Integer id)
    {
        
        return companyInfoMapper.selectByPrimaryKey(id);
    }
    
    // 通过主键删除
    @Override
    public void deleteById(Integer id)
    {
        companyInfoMapper.deleteByPrimaryKey(id);
        
    }
    
    /*
     * (non-Javadoc) 通过企业名查找对象 返回个数
     * 
     * @see com.airintelli.ssm.service.CompanyInfoService#selectByCname(java.lang.String)
     */
    @Override
    public Integer selectByCname(String Cname)
    {
        CompanyInfo info = companyInfoMapper.selectByCorpName(Cname);
        if (info != null)
        {
            return 1;
        }
        else
        {
            return 0;
        }
    }
    
}