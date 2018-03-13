package com.airintelli.ssm.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.airintelli.ssm.dao.TableColumninfoMapper;
import com.airintelli.ssm.dao.TableInfoMapper;
import com.airintelli.ssm.dao.TempTableDao;
import com.airintelli.ssm.pojo.PageBean;
import com.airintelli.ssm.pojo.Sql;
import com.airintelli.ssm.pojo.TableColumnInfo;
import com.airintelli.ssm.pojo.TableInfo;
import com.airintelli.ssm.pojo.TempTablePagingData;
import com.airintelli.ssm.service.TableInfoService;
import com.airintelli.ssm.utils.ChineseToPinYin;
import com.airintelli.ssm.utils.ColumnContentCheckUtils;
import com.airintelli.ssm.utils.ReadExcelAndCSVUtils;
import com.airintelli.ssm.utils.WriteExcetlAndCSVUtils;

@Service
@Transactional
/**
 * 
 * @author chengyan
 * @Time：2017年7月30日 上午8:58:50
 * @version 1.0 Function: TODO
 */
public class TableInfoServiceImpl implements TableInfoService
{
    java.util.Map.Entry entry;
    
    @Autowired
    // 注入操作表信息mapper
    private TableInfoMapper tableInfoMapper;
    
    @Autowired
    // 注入操作表列信息mapper;
    private TableColumninfoMapper tableColumnInfoMapper;
    
    /*
     * 注入TempTableDao
     */
    @Autowired
    private TempTableDao temptableDao;
    
    // 通过企业用户编号查询表信息启用
    @Override
    public List<TableInfo> selectByCid(TableInfo ti)
    {
        
        return tableInfoMapper.selectByCid(ti.getCid());
    }
    
    /*
     * (non-Javadoc) 通过企业用户编号查询表信息
     * 
     * @see com.airintelli.ssm.service.TableInfoService#selectByCids(com.airintelli.ssm.pojo.TableInfo)
     */
    @Override
    public List<TableInfo> selectByCids(TableInfo ti)
    {
        // TODO Auto-generated method stub
        return tableInfoMapper.selectByCids(ti.getCid());
    }
    
    // 通过表信息id查询表信息
    @Override
    public TableInfo selectById(TableInfo ti)
    {
        
        return tableInfoMapper.selectByPrimaryKey(ti.getId());
    }
    
    // 修改表信息(是否禁用)
    @Override
    public void updateTableInfo(TableInfo ti)
    {
        tableInfoMapper.updateByPrimaryKeySelective(ti);
        
    }
    
    // 添加表信息
    @Override
    public void addTableInfo(TableInfo ti, String columnName[], String columnType[])
    {
        String sql = "";
        // 汉字转拼音类
        ChineseToPinYin hanyu = new ChineseToPinYin();
        // 动态sql语句对象
        Sql sl = new Sql();
        // 生成物理表名
        String cid = ti.getCid().toString();
        String tname = hanyu.getStringPinYin(ti.getName());
        String physicalTableName = cid + tname;
        // 设置动态创建数据表的表名
        sl.setTableName(physicalTableName);
        // 设置表信息对象的物理表名属性
        ti.setPhysicaltablename(physicalTableName);
        // 插入表信息
        tableInfoMapper.insertSelective(ti);
        // 获得插入的物理表名的tid
        Integer tid = tableInfoMapper.selectByTableName(physicalTableName);
        // 将传来的参数进行处理
        String[] columnName1 = columnName;
        String[] columnType1 = columnType;
        List<String> columnNamelist = new ArrayList<String>();
        List<String> columnTypelist = new ArrayList<String>();
        // 创建一个表列名对象用于储存列名和列数值类型
        TableColumnInfo tci = new TableColumnInfo();
        // 设置插入表列信息的tid 关联到指定表
        tci.setTid(tid);
        for (Integer i = 0; i < columnName.length; i++)
        {
            // 将列名放入表列信息对象中
            tci.setColumnName(columnName[i]);
            // 形成物理列名并存入对象(输入汉字的拼音加序号组成物理列名)
            tci.setPhysicalColumnName(hanyu.getStringPinYin(columnName[i]) + i.toString());
            columnNamelist.add((columnName[i]));
            // 取出列属性
            columnTypelist.add((columnType[i]));
            // 将列属性放入表列信息对象中
            tci.setColumnType(columnType[i]);
            // 将表列信息对象加入数据表中
            tableColumnInfoMapper.insertSelective(tci);
        }
        // 判断输入的数据类型并拼接成sql语句
        for (Integer i = 0; i < columnTypelist.size(); i++)
        {
            if (columnTypelist.get(i).equals("整数"))
            {
                // 输入汉字的拼音加序号组成物理列名
                sql += hanyu.getStringPinYin((String)columnNamelist.get(i)) + i.toString() + " int ,";
                
            }
            if (columnTypelist.get(i).equals("文本"))
            {
                sql += hanyu.getStringPinYin((String)columnNamelist.get(i)) + i.toString() + " varchar(200),";
                
            }
            if (columnTypelist.get(i).equals("浮点数"))
            {
                
                sql += hanyu.getStringPinYin((String)columnNamelist.get(i)) + i.toString() + " float ,";
            }
            
        }
        sql = sql.substring(0, sql.length() - 1);
        // 设置动态sql语句对象的属性
        sl.setColumnName(sql);
        // 创建对应的物理表(存放EXCLEde数据)
        tableColumnInfoMapper.createNewTable(sl);
    }
    
    // 通过表名查找表编号
    @Override
    public Integer selectByName(String name)
    {
        
        return tableInfoMapper.selectByTableName(name);
    }
    
    // 通过用户编号和表名查询(用于唯一表名验证)
    @Override
    public boolean selectByTnameAndCid(TableInfo ti)
    {
        // 根据信息查找表信息对象
        TableInfo tin = tableInfoMapper.selectByTNameandCid(ti);
        // 不存在返回TRUE
        if (tin == null)
        {
            return true;
        }
        // 存在返回FALSE
        else
        {
            return false;
        }
    }
    
    // 上传Excle数据导数据库
    @Override
    public void upload(String fileName, Integer tid)
        throws Exception
    {
        // ReadExcelAndCSVUtils read = new ReadExcelAndCSVUtils();
        // 获得EXCLE中的内容
        List<String[]> list = ReadExcelAndCSVUtils.getUploadFileContent(fileName);
        // 获得EXClE的标题
        String[] excleColumn = ReadExcelAndCSVUtils.getUploadFileTitle(fileName);
        
        // 获得 此表编号的物理表名
        String physicalTableName = tableInfoMapper.selectByPrimaryKey(tid).getPhysicaltablename();
        // 获得此编号表列信息的对象集合
        List<TableColumnInfo> tcis = tableColumnInfoMapper.selectColumnNames(tid);
        // 对字段进行校对和调整
        List<String[]> newContent = ColumnContentCheckUtils.ColumnContentCheck(tcis, excleColumn, list);
        // 用TempTableDao实现操作
        
        temptableDao.insert(newContent, physicalTableName, tcis);
    }
    
    // 查询对应物理表名中的信息
    @Override
    public TempTablePagingData getTempTablePagingData(TempTablePagingData data, Integer tid)
        throws Exception
    {
        if (data.getPageNow() == null)
        {
            data.setPageNow(1);
        }
        // 获得 此表编号的物理表名
        String physicalTableName = tableInfoMapper.selectByPrimaryKey(tid).getPhysicaltablename();
        // 将物理表名加入到TempTablePagingData对象中
        data.setTableName(physicalTableName);
        // 获得此编号表列信息的对象集合
        List<TableColumnInfo> tcis = tableColumnInfoMapper.selectColumnNames(tid);
        // 获得对应的数据
        // 用TempTableDao实现操作
        temptableDao.findByPage(data, tcis);
        data.setTotalCount(temptableDao.getRecordCount(physicalTableName));
        long totalCount = data.getTotalCount();
        if (totalCount % data.getPageSize() == 0)
        {
            
            data.setPageCount((int)totalCount / data.getPageSize());
            
        }
        
        if (totalCount % data.getPageSize() != 0)
        {
            data.setPageCount((int)totalCount / data.getPageSize() + 1);
        }
        if (totalCount == 0)
        {
            data.setPageCount(0);
        }
        
        // TempTableUtils.findByPage(data, tcis);
        // 返回包含结果信息的实体类
        return data;
    }
    
    // 导出物理表信息
    /*
     * (non-Javadoc)
     * 
     * @see com.airintelli.ssm.service.TableInfoService#download(java.lang.String, java.lang.String, java.lang.String,
     * java.lang.Integer)
     */
    @Override
    public void download(String fileType, String fileName, String tableName, Integer tid)
        throws Exception
    {
        // 获得 此表编号的物理表名
        String physicalTableName = tableInfoMapper.selectByPrimaryKey(tid).getPhysicaltablename();
        // 将物理表名加入到TempTablePagingData对象中
        // 获得此编号表列信息的对象集合
        List<TableColumnInfo> tcis = tableColumnInfoMapper.selectColumnNames(tid);
        String[] title = new String[tcis.size()];
        for (Integer i = 0; i < tcis.size(); i++)
        {
            title[i] = tcis.get(i).getColumnName();
        }
        // 获得对应的数据
        // 用TempTableDao实现操作
        List<Map<String, Object>> result = temptableDao.findAll(physicalTableName);
        List<String[]> contents = new ArrayList<String[]>();
        contents.add(title);
        for (Map map : result)
        {
            String[] content = new String[map.size()];
            Integer i = 0;
            for (Iterator iterator = map.entrySet().iterator(); iterator.hasNext();)
            {
                entry = (java.util.Map.Entry)iterator.next();
                
                content[i] = entry.getValue().toString();
                i++;
            }
            contents.add(content);
        }
        WriteExcetlAndCSVUtils.exportDataFile(fileType, fileName, contents, physicalTableName);
        
    }
    
    // 分页显示表信息表(用户编号 ,表装态,表名)
    @Override
    public List<TableInfo> getPage(PageBean pagebean)
    {
        
        return tableInfoMapper.getPage(pagebean);
    }
    
    // 获得分页表信息表总记录数(用户编号 ,表装态,表名)
    @Override
    public Integer getPageCount(PageBean pagebean)
    {
        
        return tableInfoMapper.pageCount(pagebean);
    }
    
}
