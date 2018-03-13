package com.airintelli.ssm.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.airintelli.ssm.dao.DataRelationMapper;
import com.airintelli.ssm.dao.TableColumninfoMapper;
import com.airintelli.ssm.dao.TableInfoMapper;
import com.airintelli.ssm.pojo.DataRelation;
import com.airintelli.ssm.pojo.TableInfo;
import com.airintelli.ssm.pojo.TableRelationColumn;
import com.airintelli.ssm.service.DataRelationService;

@Service
@Transactional
public class DataRelationServiceImpl implements DataRelationService
{
    @Autowired
    // 注入操作数据关系的Mapper
    private DataRelationMapper dataRelationMapper;
    
    @Autowired
    // 注入操作数据关系的Mapper
    private TableInfoMapper tableInfoMapper;
    
    @Autowired
    private TableColumninfoMapper tableColumnInfoMapper;
    
    // 添加数据表关系
    @Override
    public void addDataRelation(DataRelation dataRelation)
    {
        dataRelationMapper.insertSelective(dataRelation);
        
    }
    
    // 通过用户编号查询所拥有的数据关系
    @Override
    public List<TableRelationColumn> selectByCid(Integer cid)
    {
        List<TableRelationColumn> trcs = new ArrayList<TableRelationColumn>();
        
        List<DataRelation> datas = dataRelationMapper.selectByCid(cid);
        for (Integer i = 0; i < datas.size(); i++)
        {
            TableRelationColumn trc = new TableRelationColumn();
            trc.setTableInfo1(tableInfoMapper.selectByPrimaryKey(datas.get(i).getTid1()));
            trc.setTableInfo2(tableInfoMapper.selectByPrimaryKey(datas.get(i).getTid2()));
            trc.setTableColumnInfo1(tableColumnInfoMapper.selectByPrimaryKey(datas.get(i).getCol1()));
            trc.setTableColumnInfo2(tableColumnInfoMapper.selectByPrimaryKey(datas.get(i).getCol2()));
            trc.setDataRelation(datas.get(i));
            trcs.add(trc);
            
        }
        return trcs;
    }
    
    // 通过表编号查询与之有关系的表
    @Override
    public List<TableInfo> selectByTid(Integer tid)
    {
        List<DataRelation> dataRelations = dataRelationMapper.selectByTid(tid);
        List<TableInfo> tableInfos = new ArrayList<TableInfo>();
        tableInfos.add(tableInfoMapper.selectByPrimaryKey(tid));
        for (Integer i = 0; i < dataRelations.size(); i++)
        {
            if (dataRelations.get(i).getTid1() != tid)
            {
                tableInfos.add(tableInfoMapper.selectByPrimaryKey(dataRelations.get(i).getTid1()));
            }
            if (dataRelations.get(i).getTid2() != tid)
            {
                tableInfos.add(tableInfoMapper.selectByPrimaryKey(dataRelations.get(i).getTid2()));
            }
            
        }
        
        return tableInfos;
    }
    
    // 修改数据表关系的使用状态
    @Override
    public void updateDataRelation(DataRelation dataRelation)
    {
        dataRelationMapper.updateByPrimaryKeySelective(dataRelation);
        
    }
    
    // 通过用户编号查询状态为启用的数据关系记录
    @Override
    public List<DataRelation> selectByCidState(DataRelation dataRelation)
    {
        
        return dataRelationMapper.selectByCidState(dataRelation);
    }
    
    // 通过主键查询
    /*
     * (non-Javadoc)
     * 
     * @see com.airintelli.ssm.service.DataRelationService#selectById(java.lang.Integer)
     */
    @Override
    public DataRelation selectById(Integer id)
    {
        
        return dataRelationMapper.selectByPrimaryKey(id);
    }
    
    /*
     * (non-Javadoc) 通过两表的编号查询之间存在关系记录
     * 
     * @see com.airintelli.ssm.service.DataRelationService#DataRelation(com.airintelli.ssm.pojo.DataRelation)
     */
    @Override
    public DataRelation DataRelation(DataRelation record)
    {
        
        return dataRelationMapper.selectByTidState(record);
    }
    
    /*
     * (non-Javadoc) 通过关联关系名查询用户下的关联关系
     * 
     * @see com.airintelli.ssm.service.DataRelationService#selectByName(com.airintelli.ssm.pojo.DataRelation)
     */
    @Override
    public DataRelation selectByName(DataRelation record)
    {
        
        return dataRelationMapper.selectByName(record);
    }
}
