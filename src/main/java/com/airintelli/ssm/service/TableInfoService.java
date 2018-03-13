package com.airintelli.ssm.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.airintelli.ssm.pojo.PageBean;
import com.airintelli.ssm.pojo.TableInfo;
import com.airintelli.ssm.pojo.TempTablePagingData;

public interface TableInfoService  {
	
	//修改表信息
	void  updateTableInfo(TableInfo ti);
	
	//通过主键查询表信息
	
	TableInfo  selectById(TableInfo ti);
	
	//通过cid查询企业账号的所有表信息
	List<TableInfo> selectByCid(TableInfo ti);
	//通过cid查询企业账号的所有表信息
	List<TableInfo> selectByCids(TableInfo ti);
	
	//添加表信息
	void addTableInfo(TableInfo ti,String columnName[],String columnType[]);
	
	//通过表名获得表编号
	Integer selectByName(String name);
	//通过用户编号和表名查询(用于唯一表名验证)
	boolean  selectByTnameAndCid(TableInfo ti);
	//上传Excle数据至数据库(解析后数据 和  表 编号)
	void  upload(String flieName,Integer tid )throws Exception;
	//查询对应物理表名中的信息
	TempTablePagingData  getTempTablePagingData(TempTablePagingData data,Integer tid)throws Exception;
	 // 导出物理表信息
    void download(String fileType, String fileName, String tableName, Integer tid)
        throws Exception;
	//分页显示表信息表(用户编号 ,表装态,表名)
	List<TableInfo> getPage(PageBean pagebean);
	//获得分页表信息表总记录数(用户编号 ,表装态,表名)
	Integer   getPageCount(PageBean pagebean);
}
