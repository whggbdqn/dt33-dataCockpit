package com.airintelli.ssm.service;

import java.util.List;

import com.airintelli.ssm.pojo.DataRelation;
import com.airintelli.ssm.pojo.TableInfo;
import com.airintelli.ssm.pojo.TableRelationColumn;

/*
 * 数据表关系Service
 */
public interface DataRelationService
{
    // 新建数据表关系
    void addDataRelation(DataRelation dataRelation);
    
    // 修改数据关系
    void updateDataRelation(DataRelation dataRelation);
    
    // 通过表id获得关系
    List<TableInfo> selectByTid(Integer tid);
    
    // 通过用户编号获得数据表关系
    List<TableRelationColumn> selectByCid(Integer cid);
    
    // 通过用户编号获得状态未启用的数据表关系
    List<DataRelation> selectByCidState(DataRelation dataRelation);
    
    // 通过主键查询
    DataRelation selectById(Integer id);
    
    // 通过两边编号查询是否有状态为启用的关系
    DataRelation DataRelation(DataRelation record);
    
    // 通过关联关系名企业下的关联关系
    DataRelation selectByName(DataRelation record);
}
