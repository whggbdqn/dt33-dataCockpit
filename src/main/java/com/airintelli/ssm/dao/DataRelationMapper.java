package com.airintelli.ssm.dao;

import java.util.List;

import com.airintelli.ssm.pojo.DataRelation;

public interface DataRelationMapper
{
    int deleteByPrimaryKey(Integer id);
    
    int insert(DataRelation record);
    
    int insertSelective(DataRelation record);
    
    DataRelation selectByPrimaryKey(Integer id);
    
    int updateByPrimaryKeySelective(DataRelation record);
    
    int updateByPrimaryKey(DataRelation record);
    
    // 通过表编号获得数据关系
    List<DataRelation> selectByTid(Integer tid);
    
    // 通过用户编号获得数据关系
    List<DataRelation> selectByCid(Integer cid);
    
    // 通过用户编号查询状态为启用的数据关系表
    List<DataRelation> selectByCidState(DataRelation record);
    
    // 通过两边编号查询是否有状态为启用的关系
    DataRelation selectByTidState(DataRelation record);
    
    // 通过关联关系名企业下的关联关系
    DataRelation selectByName(DataRelation record);
}