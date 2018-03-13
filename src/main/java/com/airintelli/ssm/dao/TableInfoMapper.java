package com.airintelli.ssm.dao;

import java.util.List;

import com.airintelli.ssm.pojo.PageBean;
import com.airintelli.ssm.pojo.TableInfo;

public interface TableInfoMapper
{
    int deleteByPrimaryKey(Integer id);
    
    int insert(TableInfo record);
    
    int insertSelective(TableInfo record);
    
    TableInfo selectByPrimaryKey(Integer id);
    
    int updateByPrimaryKeySelective(TableInfo record);
    
    int updateByPrimaryKey(TableInfo record);
    
    // 通过cid 查询一个企业的所有表数据启用
    List<TableInfo> selectByCid(Integer cid);
    
    // 通过cid 查询一个企业的所有表数据
    List<TableInfo> selectByCids(Integer cid);
    
    // 通过物理表名查询表信息编号
    Integer selectByTableName(String tableName);
    
    // 通过用户编号和表名查询(用于唯一表名验证)
    TableInfo selectByTNameandCid(TableInfo record);
    
    // 分页显示表信息表(用户编号 ,表装态,表名)
    List<TableInfo> getPage(PageBean pagebean);
    
    // 获得分页表信息表总记录数(用户编号 ,表装态,表名)
    Integer pageCount(PageBean pagebean);
}