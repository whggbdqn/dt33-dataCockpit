package com.airintelli.ssm.dao;

import com.airintelli.ssm.pojo.PowerAssets;

public interface PowerAssetsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(PowerAssets record);

    int insertSelective(PowerAssets record);

    PowerAssets selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PowerAssets record);

    int updateByPrimaryKey(PowerAssets record);
}