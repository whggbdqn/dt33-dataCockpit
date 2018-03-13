package com.airintelli.ssm.dao;

import java.util.List;

import com.airintelli.ssm.pojo.Inform;
import com.airintelli.ssm.pojo.PageBean;

public interface InformMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Inform record);

    int insertSelective(Inform record);

    Inform selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Inform record);

    int updateByPrimaryKey(Inform record);
    List<Inform>  getpage(PageBean pagebean);
    Integer     pagecount(PageBean pagebean);
}