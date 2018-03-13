package com.airintelli.ssm.dao;

import java.util.List;

import com.airintelli.ssm.pojo.Sql;
import com.airintelli.ssm.pojo.TableColumnInfo;


public interface TableColumninfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TableColumnInfo record);

    int insertSelective(TableColumnInfo record);

    TableColumnInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TableColumnInfo record);

    int updateByPrimaryKey(TableColumnInfo record);
    //通过表信息标的ID查询他所对应的列属性
    List<TableColumnInfo>  selectColumnNames(Integer tid);
    //动态创建物理表
    void createNewTable(Sql sql);
}