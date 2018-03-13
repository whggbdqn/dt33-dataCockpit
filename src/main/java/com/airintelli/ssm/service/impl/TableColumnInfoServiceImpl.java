package com.airintelli.ssm.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.airintelli.ssm.dao.TableColumninfoMapper;
import com.airintelli.ssm.pojo.TableColumnInfo;
import com.airintelli.ssm.service.TableColumnInfoService;

@Service
@Transactional
public class TableColumnInfoServiceImpl implements TableColumnInfoService {
	@Autowired
	// 注入操作表列信息mapper;
	private TableColumninfoMapper tableColumninfoMapper;

	// 添加表头信息
	@Override
	public void addTableColumnInfo(TableColumnInfo tci) {

		tableColumninfoMapper.insertSelective(tci);
	}

	// 通过表信息id查询列信息
	@Override
	public List<TableColumnInfo> selectTableColumnInfo(Integer tid) {

		return tableColumninfoMapper.selectColumnNames(tid);
	}

	// 修改列信息中的列名(列名 ,列信息编号)
	@Override
	public void updateTableColumnInfo(String columnName, String tcid) {
		TableColumnInfo tci = new TableColumnInfo();
		// 将传来的参数进行处理
		String[] columnName1 = columnName.split(",");
		String[] tcid1 = tcid.split(",");
		// 取值并赋值给对象
		for (int i = 0; i < columnName1.length; i++) {
			// 将列名放入表列信息对象中
			tci.setColumnName(columnName1[i]);
			// 设置要修改列信息的编号 修改指定的列信息
			tci.setId(Integer.valueOf(tcid1[i]));
			// 将表列信息对象修改数据表中
			tableColumninfoMapper.updateByPrimaryKeySelective(tci);
		}

	}

}
